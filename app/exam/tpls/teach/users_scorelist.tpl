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
                            <li><a href="index.php?{x2;(isset($_app) ? $_app : '')}-teach">{x2;(isset($apps[$_app]['appname']) ? $apps[$_app]['appname'] : '')}</a></li>
                            <li><a href="index.php?{x2;(isset($_app) ? $_app : '')}-teach-users">课程成绩</a></li>
                            <li class="active">成绩统计</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        成绩统计
                        <a class="ajax pull-right btn btn-primary" href="index.php?{x2;(isset($_app) ? $_app : '')}-teach-users-outscore&basicid={x2;(isset($basicid) ? $basicid : '')}{x2;(isset($u) ? $u : '')}">导出成绩</a>
                    </h4>
                    <form action="index.php?exam-teach-users-scorelist&basicid={x2;(isset($basicid) ? $basicid : '')}" method="post">
                        <table class="table form-inline">
                            <tr>
                                <td>
                                    考试时间：
                                </td>
                                <td>
                                    <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="15" id="stime" value="{x2;(isset($search['stime']) ? $search['stime'] : '')}"/> - <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="15" type="text" name="search[etime]" id="etime" value="{x2;(isset($search['etime']) ? $search['etime'] : '')}"/>
                                </td>
                                <td>
                                    分数段：
                                </td>
                                <td>
                                    <input class="form-control" name="search[sscore]" id="sscore" type="text" value="{x2;(isset($search['sscore']) ? $search['sscore'] : '')}" size="10"/> - <input class="form-control" type="text" name="search[escore]" id="escore" value="{x2;(isset($search['escore']) ? $search['escore'] : '')}" size="10"/>
                                </td>
                                <td>
                                    用户名：
                                </td>
                                <td>
                                    <input class="form-control" name="search[username]" id="username" type="text" value="{x2;(isset($search['username']) ? $search['username'] : '')}" size="10"/>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    试卷：
                                </td>
                                <td>
                                    <select name="search[examid]" class="form-control">
                                          <option value="0">不限</option>
                                          {x2;tree:(array)($exampaper ?? []),ep,eid}
                                          <option value="{x2;(isset(v:ep['examid']) ? v:ep['examid'] : '')}"{x2;if:(isset($search['examid']) ? $search['examid'] : null) == (isset(v:ep['examid']) ? v:ep['examid'] : null)} selected{x2;endif}>{x2;(isset(v:ep['exam']) ? v:ep['exam'] : '')}</option>
                                          {x2;endtree}
                                      </select>
                                </td>
                                <td>
                                    类型：
                                </td>
                                <td>
                                    <select name="search[examtype]" class="form-control">
                                        <option value="0">不限</option>
                                        <option value="1"{x2;if:(isset($search['examtype']) ? $search['examtype'] : null) == 1} selected{x2;endif}>模拟考试</option>
                                        <option value="2"{x2;if:(isset($search['examtype']) ? $search['examtype'] : null) == 2} selected{x2;endif}>正式考试</option>
                                    </select>
                                </td>
                                <td>
                                    排序：
                                </td>
                                <td>
                                    <select name="search[order]" class="form-control">
                                        <option value="0">按时间排序</option>
                                        <option value="1"{x2;if:(isset($search['order']) ? $search['order'] : null) == 1} selected{x2;endif}>按名次排序</option>
                                    </select>
                                </td>
                                <td>
                                    <button class="btn btn-primary" type="submit">提交</button>
                                    <a class="btn btn-primary" href="index.php?exam-teach-users-stats&basicid={x2;(isset($basicid) ? $basicid : '')}{x2;(isset($u) ? $u : '')}">统计</a>
                                    <a class="btn btn-primary ajax hide" href="index.php?exam-teach-users-outanswer&basicid={x2;(isset($basicid) ? $basicid : '')}{x2;(isset($u) ? $u : '')}">导出答案</a>
                                </td>
                            </tr>
                        </table>
                        <div class="input">
                            <input type="hidden" value="1" name="search[argsmodel]" />
                        </div>
                    </form>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr class="info">
                                <th>ID</th>
                                {x2;if:(isset($search['order']) ? $search['order'] : null) == 1}
                                <th>名次</th>
                                {x2;endif}
                                <th>考生用户名</th>
                                {x2;tree:(array)($fields ?? []),field,fid}
                                <th>{x2;(isset(v:field['fieldtitle']) ? v:field['fieldtitle'] : '')}</th>
                                {x2;endtree}
                                <th>分数</th>
                                <th>考试名称</th>
                                <th>类型</th>
                                <th>考试时间</th>
                                <th>考试用时</th>
                                <th width="170">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            {x2;tree:(array)($exams['data'] ?? []),exam,eid}
                            <tr {x2;if:!empty(v:exam['ehneedresit'])}class="text-danger"{x2;endif}>
                                <td>
                                    {x2;(isset(v:exam['ehid']) ? v:exam['ehid'] : '')}
                                </td>
                                {x2;if:(isset($search['order']) ? $search['order'] : null) == 1}
                                <td>
                                    {x2;eval: echo ($page - 1) * 10 + v:eid}
                                </td>
                                {x2;endif}
                                <td>
                                    {x2;(isset(v:exam['ehusername']) ? v:exam['ehusername'] : '')}
                                </td>
                                {x2;tree:(array)($fields ?? []),field,fid}
                                <th>{x2;(isset(v:exam[v:field['field']]) ? v:exam[v:field['field']] : '')}</th>
                                {x2;endtree}
                                <td>
                                    {x2;(isset(v:exam['ehscore']) ? v:exam['ehscore'] : '')}
                                </td>
                                <td>
                                    {x2;(isset(v:exam['ehexam']) ? v:exam['ehexam'] : '')}
                                </td>
                                <td>
                                    {x2;if:(isset(v:exam['ehtype']) ? v:exam['ehtype'] : null) == 1}模拟考试{x2;else}正式考试{x2;endif}
                                </td>
                                <td>
                                    {x2;date:v:exam['ehstarttime'] ?? 0,'Y-m-d H:i'}
                                </td>
                                <td>
                                    {x2;if:(isset(v:exam['ehtime']) ? v:exam['ehtime'] : null) >= 60}{x2;if:v:exam['ehtime']%60}{x2;eval: echo intval(v:exam['ehtime']/60)+1}{x2;else}{x2;eval: echo intval(v:exam['ehtime']/60)}{x2;endif}分钟{x2;else}{x2;(isset(v:exam['ehtime']) ? v:exam['ehtime'] : '')}秒{x2;endif}
                                </td>
                                <td>
                                    <a class="btn btn-primary" href="index.php?exam-teach-users-readpaper&ehid={x2;(isset(v:exam['ehid']) ? v:exam['ehid'] : '')}" target="_blank">阅卷</a>&nbsp;
                                    {x2;if:!v:exam['ehneedresit'] && v:exam['ehtype'] == 2}
                                    <a class="btn btn-danger confirm" msg="设为补考后本次成绩将作废，用户可以再进行一次考试，确定要进行此操作吗？" href="index.php?exam-teach-users-setresit&ehid={x2;(isset(v:exam['ehid']) ? v:exam['ehid'] : '')}">要求补考</a>&nbsp;
                                    {x2;endif}
                                    <a class="btn btn-primary hide" href="index.php?exam-teach-users-changescore&ehid={x2;(isset(v:exam['ehid']) ? v:exam['ehid'] : '')}" target="_blank">纠分</a>
                                </td>
                            </tr>
                            {x2;endtree}
                        </tbody>
                    </table>
                    <ul class="pagination pull-right">
                        {x2;(isset($exams['pages']) ? $exams['pages'] : '')}
                    </ul>
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
