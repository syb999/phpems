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

    private function config()
    {
        $appid = $this->ev->get('appid');
        $app = $this->apps->getApp($appid);
        if ($this->ev->get('appconfig')) {
            $args = $this->ev->get('args');
            if (!is_array($args)) {
                $args = [];
            }
            if (!isset($args['appsetting'])) {
                $args['appsetting'] = (is_array($app) && isset($app['appsetting'])) ? $app['appsetting'] : [];
            }
            if (!isset($args['appusersetting'])) {
                $args['appusersetting'] = (is_array($app) && isset($app['appusersetting'])) ? $app['appusersetting'] : [];
            }
            if ($app) {
                $this->apps->modifyApp($appid, $args);
            } else {
                $this->apps->addApp($appid, $args);
            }
            $message = [
                'statusCode' => 200,
                'message' => '操作成功，正在转入目标页面',
                'callbackType' => 'forward',
                'forwardUrl' => 'index.php?core-master-apps',
            ];
            exit(json_encode($message));
        }

        $this->tpl->assign('appid', $appid);
        $this->tpl->assign('app', $app);
        $this->tpl->display('config');
    }

    private function index()
    {
        $this->tpl->display('apps');
    }
}
