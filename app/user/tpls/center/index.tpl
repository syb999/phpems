{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-3" style="width: 20%">
                    <div class="content-box padding">
                        {x2;include:menu}
                    </div>
                </div>
                <div class="col-xs-9 nopadding" style="width: 80%">
                    <div class="content-box padding">
                        <h2 class="title">
                            {x2;(isset($_user['username']) ? $_user['username'] : '')}
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border morepadding">
                                <div class="intro">
                                    <div class="col-xs-3 img">
                                        <img src="{x2;if:!empty($_user['userphoto'])}{x2;(isset($_user['userphoto']) ? $_user['userphoto'] : '')}{x2;else}app/exam/styles/image/paper.png{x2;endif}" />
                                    </div>
                                    <div class="desc col-xs-9">
                                        <table width="100%">
                                            <tr>
                                                <td width="33%">
                                                    <p>注册日期：{x2;date:$_user['userregtime'] ?? 0,'Y-m-d'}</p>
                                                    <p>注册IP：{x2;(isset($_user['userregip']) ? $_user['userregip'] : '')}</p>
                                                    <p>您现有积分：{x2;(isset($_user['usercoin']) ? $_user['usercoin'] : '')}</p>
                                                    <p>&nbsp;</p>
                                                </td>
                                                <td>
                                                    <p>用户组：{x2;(isset($groups[$_user['usergroupid']]['groupname']) ? $groups[$_user['usergroupid']]['groupname'] : '')}</p>
                                                    <p>真实姓名：{x2;(isset($_user['usertruename']) ? $_user['usertruename'] : '')}</p>
                                                    <p>邮箱：{x2;(isset($_user['useremail']) ? $_user['useremail'] : '')}</p>
                                                    <p>&nbsp;</p>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            {x2;include:footer}
        </div>
    </div>
</div>
</body>
</html>
