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

    private function modifypass()
    {
        if ($this->ev->get('modifyuserpassword')) {
            $args = $this->ev->get('args');
            $oldpassword = $this->ev->get('oldpassword');
            $userid = isset($this->_user['sessionuserid']) ? $this->_user['sessionuserid'] : 0;
            $user = $this->user->getUserById($userid);
            if (md5($oldpassword) != $user['userpassword']) {
                $message = [
                    'statusCode' => 300,
                    'message' => '操作失败，原密码验证失败'.$oldpassword,
                ];
                exit(json_encode($message));
            }
            if ($args['password'] == $args['password2'] && $userid) {
                $id = $this->user->modifyUserPassword($args, $userid);
                $message = [
                    'statusCode' => 200,
                    'message' => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl' => 'reload',
                ];
                exit(json_encode($message));
            }

            $message = [
                    'statusCode' => 300,
                    'message' => '操作失败',
                ];
            exit(json_encode($message));
        }

        $this->tpl->display('modifypass');
    }


    private function index()
    {
        $page = $this->ev->get('page');
        $search = $this->ev->get('search');
        $search = is_array($search) ? $search : [];
        $u = '';
        if ($search) {
            $this->tpl->assign('search', $search);
            foreach ($search as $key => $arg) {
                $u .= "&search[{$key}]={$arg}";
            }
        }
        if ($this->ev->get('modifyuserinfo')) {
            $args = $this->ev->get('args');
            $userid = isset($this->_user['sessionuserid']) ? $this->_user['sessionuserid'] : 0;
            $group = $this->user->getGroupById($this->_user['sessiongroupid']);
            $args = $this->module->tidyNeedFieldsPars($args, $group['groupmoduleid'], ['iscurrentuser' => 1, 'group' => $group]);
            unset($args['userischeck']);
            $id = $this->user->modifyUserInfo($args, $userid);
            $message = [
                'statusCode' => 200,
                'message' => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl' => 'reload',
            ];
            exit(json_encode($message));
        }

        $userid = isset($this->_user['sessionuserid']) ? $this->_user['sessionuserid'] : 0;
        $user = $this->user->getUserById($userid);
        if (!is_array($user)) {
            $user = [];
        }
        $group = $this->user->getGroupById(isset($user['usergroupid']) ? $user['usergroupid'] : 0);
        $moduleid = isset($group['groupmoduleid']) ? $group['groupmoduleid'] : 0;
        $fields = $this->module->getMoudleFields($moduleid, ['iscurrentuser' => true, 'group' => $group]);
        $forms = $this->html->buildHtml($fields, $user);
        $actors = $this->user->getGroupsByModuleid($moduleid);
        $this->tpl->assign('moduleid', $moduleid);
        $this->tpl->assign('fields', $fields);
        $this->tpl->assign('forms', $forms);
        $this->tpl->assign('actors', $actors);
        $this->tpl->assign('user', $user);
        $this->tpl->assign('page', $page);
        $this->tpl->display('modifyuser');
    }
}
