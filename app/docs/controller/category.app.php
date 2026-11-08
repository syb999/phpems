<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * 项目维护：oiuv(QQ:7300637) | 定制服务：火眼(QQ:278768688)
 *
 * This source file is subject to the MIT license that is bundled.
 */

#[\AllowDynamicProperties]
class action extends app
{
    public function display()
    {
        $action = $this->ev->url(3);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function needmore()
    {
        $page = $this->ev->get('page');
        $catid = intval($this->ev->get('catid'));
        $cat = [];
        $catparent = false;
        $catstring = '';
        $catbread = '';
        if ($catid) {
            $cat = $this->category->getCategoryById($catid);
            if (!is_array($cat)) {
                $cat = [];
            }
        }
        if ($cat) {
            if ($cat['catuseurl'] && $cat['caturl']) {
                header('location:'.html_entity_decode($cat['caturl']));
            }
            if ($cat['catparent']) {
                $catparent = $this->category->getCategoryById($cat['catparent']);
            }
            $catbread = $this->category->getCategoryPos($catid);
            $catstring = $this->category->getChildCategoryString($catid);
            if ($cat['cattpl']) {
                $template = $cat['cattpl'];
            } else {
                $template = 'category_default';
            }
        }
        $this->tpl->assign('cat', $cat);
        $this->tpl->assign('catparent', $catparent);
        $this->tpl->assign('catbread', $catbread);
        $args = [];
        $args[] = ['AND', 'docneedmore = 1'];
        if ($catid) {
            $args[] = ['AND', 'find_in_set(doccatid,:doccatid)', 'doccatid', $catstring];
        }
        $catchildren = $this->category->getCategoriesByArgs([['AND', 'catparent = :catparent', 'catparent', $catid], ['AND', "catinmenu = '0'"]]);
        $catbrother = $this->category->getCategoriesByArgs([['AND', 'catparent = :catparent', 'catparent', intval(isset($cat['catparent']) ? $cat['catparent'] : 0)], ['AND', "catinmenu = '0'"]]);
        $docs = $this->doc->getDocList($args, $page);
        $this->tpl->assign('catbrother', $catbrother);
        $this->tpl->assign('catchildren', $catchildren);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('docs', $docs);
        $this->tpl->display('needmore');
    }

    private function index()
    {
        $page = $this->ev->get('page');
        $catid = $this->ev->get('catid');
        $cat = $this->category->getCategoryById($catid);
        if (!is_array($cat) || !$cat) {
            $this->G->R(['statusCode' => 404, 'message' => '分类不存在或已删除', 'callbackType' => 'forward', 'forwardUrl' => 'index.php']);
        }
        $catparent = false;
        if (!empty($cat['catuseurl']) && !empty($cat['caturl'])) {
            header('location:'.html_entity_decode($cat['caturl']));
        }
        if (!empty($cat['catparent'])) {
            $catparent = $this->category->getCategoryById($cat['catparent']);
        }
        $catbread = $this->category->getCategoryPos($catid);
        $catstring = $this->category->getChildCategoryString($catid);
        $catchildren = $this->category->getCategoriesByArgs([['AND', 'catparent = :catparent', 'catparent', $catid], ['AND', "catinmenu = '0'"]]);
        $docs = $this->doc->getDocList([['AND', 'find_in_set(doccatid,:doccatid)', 'doccatid', $catstring]], $page);
        $catbrother = $this->category->getCategoriesByArgs([['AND', 'catparent = :catparent', 'catparent', isset($cat['catparent']) ? $cat['catparent'] : 0], ['AND', "catinmenu = '0'"]]);
        if (!empty($cat['cattpl'])) {
            $template = $cat['cattpl'];
        } else {
            $template = 'category_default';
        }
        $this->tpl->assign('cat', $cat);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('catbrother', $catbrother);
        $this->tpl->assign('catchildren', $catchildren);
        $this->tpl->assign('catparent', $catparent);
        $this->tpl->assign('catbread', $catbread);
        $this->tpl->assign('docs', $docs);
        $this->tpl->display($template);
    }
}
