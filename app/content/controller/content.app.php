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

    private function index()
    {
        $page = $this->ev->get('page');
        $contentid = $this->ev->get('contentid');
        $content = $this->content->getContentById($contentid);
        if (!is_array($content) || !$content) {
            $this->G->R(['statusCode' => 404, 'message' => '文章不存在或已删除', 'callbackType' => 'forward', 'forwardUrl' => 'index.php']);
        }
        if (!empty($content['contentlink'])) {
            header('location:'.html_entity_decode($content['contentlink']).'');
        } else {
            $catid = isset($content['contentcatid']) ? $content['contentcatid'] : 0;
            $catbread = $this->category->getCategoryPos($catid);
            $cat = $this->category->getCategoryById($catid);
            if (!is_array($cat)) {
                $cat = [];
            }
            $catbrother = $this->category->getCategoriesByArgs([['AND', 'catparent = :catparent', 'catparent', isset($cat['catparent']) ? $cat['catparent'] : 0], ['AND', "catinmenu = '0'"]]);
            if (!empty($content['contenttemplate'])) {
                $template = $content['contenttemplate'];
            } else {
                $template = 'content_default';
            }
            $nearContent = $this->content->getNearContentById($contentid, isset($content['contentcatid']) ? $content['contentcatid'] : 0);
            if (!$template) {
                $template = 'content_default';
            }
            $this->tpl->assign('cat', $cat);
            $this->tpl->assign('nearContent', $nearContent);
            $this->tpl->assign('page', $page);
            $this->tpl->assign('catbread', $catbread);
            $this->tpl->assign('content', $content);
            $this->tpl->assign('catbrother', $catbrother);
            $this->tpl->display($template);
        }
    }
}
