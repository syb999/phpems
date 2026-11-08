{x2;if:empty($userhash)}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
    <div class="row-fluid">
        <div class="main">
            <div class="col-xs-2 leftmenu">
                {x2;include:menu}
            </div>
            <div id="datacontent">
    {x2;endif}
                <div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
                    <div class="col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="index.php?{x2;(isset($_app) ? $_app : '')}-master">{x2;(isset($apps[$_app]['appname']) ? $apps[$_app]['appname'] : '')}</a></li>
                            <li><a href="index.php?course-master-course">课程管理</a></li>
                            <li><a href="index.php?course-master-course-members&courseid={x2;(isset($course['csid']) ? $course['csid'] : '')}">成员管理</a></li>
                            <li class="active">选择成员</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        选择成员
                        <a class="btn btn-primary pull-right" href="index.php?{x2;(isset($_app) ? $_app : '')}-master-course-members&courseid={x2;(isset($course['csid']) ? $course['csid'] : '')}">人员列表</a>
                    </h4>
                    <form action="index.php?course-master-course-selectmember&courseid={x2;(isset($course['csid']) ? $course['csid'] : '')}" method="post" style="margin-top:10px;" class="form-inline">
                        <table class="table">
                            <tr>
                                <td style="border-top:0px;">
                                    用户ID：
                                </td>
                                <td style="border-top:0px;">
                                    <input name="search[userid]" class="form-control" size="15" type="text" class="number" value="{x2;(isset($search['userid']) ? $search['userid'] : '')}"/>
                                </td>
                                <td style="border-top:0px;">
                                    注册时间：
                                </td>
                                <td style="border-top:0px;">
                                    <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="10" id="stime" value="{x2;(isset($search['stime']) ? $search['stime'] : '')}"/> - <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="10" type="text" name="search[etime]" id="etime" value="{x2;(isset($search['etime']) ? $search['etime'] : '')}"/>
                                </td>
                                <td style="border-top:0px;">
                                    用户名：
                                </td>
                                <td style="border-top:0px;">
                                    <input class="form-control" name="search[username]" size="15" type="text" value="{x2;(isset($search['username']) ? $search['username'] : '')}"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    电子邮箱：
                                </td>
                                <td>
                                    <input class="form-control" name="search[useremail]" size="15" type="text" value="{x2;(isset($search['useremail']) ? $search['useremail'] : '')}"/>
                                </td>
                                <td>
                                    用户组：
                                </td>
                                <td>
                                    <select name="search[groupid]" class="form-control">
                                          <option value="0">不限</option>
                                          {x2;tree:(array)($groups ?? []),group,gid}
                                          <option value="{x2;(isset(v:group['groupid']) ? v:group['groupid'] : '')}"{x2;if:(isset($search['groupid']) ? $search['groupid'] : null) == (isset(v:group['groupid']) ? v:group['groupid'] : null)} selected{x2;endif}>{x2;(isset(v:group['groupname']) ? v:group['groupname'] : '')}</option>
                                          {x2;endtree}
                                      </select>
                                </td>
                                <td>
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </td>
                                <td></td>
                            </tr>
                        </table>
                        <div class="input">
                            <input type="hidden" value="1" name="search[argsmodel]" />
                        </div>
                    </form>
                    <form action="index.php?course-master-course-selectmember" method="post">
                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr class="info">
                                    <th><input type="checkbox" class="checkall" target="delids"/></th>
                                    <th>ID</th>
                                    <th>用户名</th>
                                    <th>姓名</th>
                                    <th>电子邮件</th>
                                    <th>注册IP</th>
                                    <th>积分点数</th>
                                    <th>用户组</th>
                                    <th>注册时间</th>
                                </tr>
                            </thead>
                            <tbody>
                                {x2;tree:(array)($users['data'] ?? []),user,uid}
                                <tr>
                                    <td><input type="checkbox" name="delids[{x2;(isset(v:user['userid']) ? v:user['userid'] : '')}]" value="1"></td>
                                    <td>{x2;(isset(v:user['userid']) ? v:user['userid'] : '')}</td>
                                    <td>{x2;(isset(v:user['username']) ? v:user['username'] : '')}</td>
                                    <td>{x2;(isset(v:user['usertruename']) ? v:user['usertruename'] : '')}</td>
                                    <td>{x2;(isset(v:user['useremail']) ? v:user['useremail'] : '')}</td>
                                    <td>{x2;(isset(v:user['userregip']) ? v:user['userregip'] : '')}</td>
                                    <td>{x2;(isset(v:user['usercoin']) ? v:user['usercoin'] : '')}</td>
                                    <td>{x2;(isset($groups[v:user['usergroupid']]['groupname']) ? $groups[v:user['usergroupid']]['groupname'] : '')}</td>
                                    <td>{x2;date:v:user['userregtime'] ?? 0,'Y-m-d'}</td>
                                </tr>
                                {x2;endtree}
                            </tbody>
                        </table>
                        <div class="form-group">
                            <div class="controls">
                                <label class="radio-inline form-inline">
                                    开通 &nbsp;&nbsp;<input type="text" needle="needle" msg="您必须填写开通的天数" class="form-control" name="days" size="6" value="" /> &nbsp;&nbsp;天
                                </label>
                                {x2;if:isset($search) && is_array($search)}{x2;tree:(array)($search ?? []),arg,sid}
                                <input type="hidden" name="search[{x2;(isset(v:key) ? v:key : '')}]" value="{x2;(isset(v:arg) ? v:arg : '')}"/>
                                {x2;endtree}{x2;endif}
                                <input type="hidden" name="courseid" value="{x2;(isset($course['csid']) ? $course['csid'] : '')}"/>
                                <input type="hidden" name="submit" value="1"/>
                                <label class="radio-inline">
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </label>
                            </div>
                        </div>
                    </form>
                    <ul class="pagination pull-right">
                        {x2;(isset($users['pages']) ? $users['pages'] : '')}
                    </div>
                </div>
            </div>
{x2;if:empty($userhash)}
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}
