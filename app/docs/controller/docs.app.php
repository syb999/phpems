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

    private function history()
    {
        $docid = $this->ev->get('docid');
        $page = $this->ev->get('page');
        $doc = $this->doc->getDocById($docid, false);
        $args = [];
        $args[] = ['AND', 'dhstatus = 1'];
        $args[] = ['AND', 'dhdocid = :dhdocid', 'dhdocid', $docid];
        $histories = $this->doc->getDocHistoryListByArgs($args, $page);
        $this->tpl->assign('doc', $doc);
        $this->tpl->assign('histories', $histories);
        $this->tpl->display('history');
    }

    private function viewhistory()
    {
        $dhid = $this->ev->get('dhid');
        $history = $this->doc->getDocHistroyById($dhid);
        if (!is_array($history) || !$history) {
            $this->G->R(['statusCode' => 404, 'message' => '该版本不存在', 'callbackType' => 'forward', 'forwardUrl' => 'index.php?docs-app']);
        }
        $doc = $this->doc->getDocById($history['dhdocid']);
        if (!is_array($doc) || !$doc) {
            $this->G->R(['statusCode' => 404, 'message' => '文档不存在', 'callbackType' => 'forward', 'forwardUrl' => 'index.php?docs-app']);
        }
        $doc['content'] = $history;
        $this->tpl->assign('doc', $doc);
        $this->tpl->display('history_view');
    }

    private function index()
    {
        $docid = $this->ev->get('docid');
        $doc = $this->doc->getDocById($docid);
        if (!is_array($doc) || !$doc) {
            $this->G->R(['statusCode' => 404, 'message' => '文档不存在或已删除', 'callbackType' => 'forward', 'forwardUrl' => 'index.php']);
        }
        $doccatid = isset($doc['doccatid']) ? $doc['doccatid'] : 0;
        $catbread = $this->category->getCategoryPos($doccatid);
        $cat = $this->category->getCategoryById($doccatid);
        $template = 'doc_default';
        $this->tpl->assign('cat', $cat);
        $this->tpl->assign('catbread', $catbread);
        $this->tpl->assign('doc', $doc);
        $this->tpl->display($template);
    }
}
