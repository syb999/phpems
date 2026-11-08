#!/usr/bin/env python3
"""phpems 模板 PHP8 兼容转换流水线（只动确定的形态，指令标签绝不包裹）"""
import glob, re, os, sys

ROOT = '/home/oem/888/phpems'
UP = '/tmp/up/phpems-master'

# ---------- 1) 先恢复上游原始模板 ----------
n_restore = 0
for src in glob.glob(UP + '/app/*/tpls/**/*.tpl', recursive=True):
    rel = src[len(UP) + 1:]
    dst = os.path.join(ROOT, rel)
    os.makedirs(os.path.dirname(dst), exist_ok=True)
    open(dst, 'w', encoding='utf-8').write(open(src, encoding='utf-8', errors='replace').read())
    n_restore += 1
print("恢复上游模板:", n_restore)

DIRECTIVES = ('if:', 'elseif:', 'tree:', 'loop:', 'date:', 'include:', 'block:',
              'eval:', 'sql:', 'realhtml:', 'substring:', 'realsubstring:', 'c:')

def split_brackets(expr):
    """把 $a['b'][$c['d']] 切成 ['$a', "['b']", "[$c['d']]"]，bracket 平衡"""
    base = re.match(r'^(?:\$|v:)[A-Za-z_]\w*', expr)
    if not base:
        return None
    parts = [base.group(0)]
    i = base.end()
    while i < len(expr) and expr[i] == '[':
        depth, j = 0, i
        while j < len(expr):
            ch = expr[j]
            if ch == '[':
                depth += 1
            elif ch == ']':
                depth -= 1
                if depth == 0:
                    j += 1
                    break
            elif ch in '"\'':
                q = ch
                j += 1
                while j < len(expr) and expr[j] != q:
                    j += 1
            j += 1
        parts.append(expr[i:j])
        i = j
    return parts, i

def is_access(expr):
    r = split_brackets(expr.strip())
    if not r:
        return False
    parts, end = r
    return end == len(expr.strip())

def access_only(expr):
    return expr.strip() if is_access(expr) else None

def wrap_echo(expr):
    return "(isset(%s) ? %s : '')" % (expr, expr)

def wrap_if(expr):
    return "!empty(%s)" % expr

changes = 0
for f in glob.glob(ROOT + '/app/**/*.tpl', recursive=True):
    s = open(f, encoding='utf-8', errors='replace').read()
    orig = s

    def rep(m):
        global changes
        body = m.group(1)
        low = body.lower()

        # tree:
        if low.startswith('tree:'):
            mm = re.match(r'^tree:([^,]+),(.*)$', body)
            if mm:
                e = mm.group(1).strip()
                if is_access(e) and '??' not in e:
                    changes += 1
                    return "{x2;tree:(array)(%s ?? []),%s}" % (e, mm.group(2))
            return m.group(0)

        # date:
        if low.startswith('date:'):
            mm = re.match(r'^date:([^,]+),(.*)$', body)
            if mm:
                e = mm.group(1).strip()
                if is_access(e) and '??' not in e:
                    changes += 1
                    return "{x2;date:%s ?? 0,%s}" % (e, mm.group(2))
            return m.group(0)

        # if: / elseif: 只处理纯取值表达式
        if low.startswith('if:') or low.startswith('elseif:'):
            pre = 'if:' if low.startswith('if:') else 'elseif:'
            expr = body[len(pre):].strip()
            if expr.startswith('!empty(') or expr.startswith('isset(') or expr.startswith('!isset('):
                return m.group(0)
            # is_array(X)
            mm = re.match(r'^is_array\((.*)\)$', expr)
            if mm and is_access(mm.group(1)) and 'isset(' not in expr:
                inner = mm.group(1).strip()
                changes += 1
                return "{x2;%sisset(%s) && is_array(%s)}" % (pre, inner, inner)
            # !$a[..]
            if expr.startswith('!'):
                e2 = expr.lstrip('!').strip()
                if is_access(e2):
                    changes += 1
                    return "{x2;%s%s}" % (pre, wrap_if(e2))
                return m.group(0)
            # A || B / A && B ：只包裹"整段就是取值表达式"的操作数
            if ' || ' in expr or ' && ' in expr:
                parts = re.split(r'(\s+&&\s+|\s+\|\|\s+)', expr)
                changed_here = False
                for i2 in range(0, len(parts), 2):
                    piece = parts[i2]
                    if is_access(piece.strip()) and not piece.strip().startswith('!empty('):
                        pad_l = piece[:len(piece) - len(piece.lstrip())]
                        pad_r = piece[len(piece.rstrip()):]
                        parts[i2] = pad_l + wrap_if(piece.strip()) + pad_r
                        changed_here = True
                if changed_here:
                    changes += 1
                    return "{x2;%s%s}" % (pre, ''.join(parts))

            # 纯取值
            e2 = access_only(expr)
            if e2:
                changes += 1
                return "{x2;%s%s}" % (pre, wrap_if(e2))
            # 比较：LHS op RHS
            mm = re.match(r'^(.+?)\s*(===|!==|==|!=|>=|<=|>|<)\s*(.+)$', expr)
            if mm and is_access(mm.group(1)) and 'isset(' not in expr:
                lhs = mm.group(1).strip()
                rhs = mm.group(3).strip()
                if is_access(rhs):
                    rhs = "(isset(%s) ? %s : null)" % (rhs, rhs)
                changes += 1
                return "{x2;%s(isset(%s) ? %s : null) %s %s}" % (pre, lhs, lhs, mm.group(2), rhs)
            return m.group(0)

        # realhtml: 取值输出
        if low.startswith('realhtml:'):
            e = body[len('realhtml:'):].strip()
            if is_access(e) and 'isset(' not in e:
                changes += 1
                return "{x2;realhtml:%s}" % wrap_echo(e)
            return m.group(0)

        # 指令标签一律不动
        if low.startswith(DIRECTIVES):
            return m.group(0)

        # 普通 echo 标签：$var[..] / v:var[..]
        e = body.strip()
        if is_access(e) and 'isset(' not in e:
            changes += 1
            return "{x2;%s}" % wrap_echo(e)
        return m.group(0)

    s = re.sub(r'\{x2;([^}]*)\}', rep, s)
    if s != orig:
        open(f, 'w', encoding='utf-8').write(s)

print("转换标签数:", changes)
