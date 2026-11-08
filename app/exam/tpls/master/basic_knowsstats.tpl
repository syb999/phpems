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
                            <li><a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-basic">考场管理</a></li>
                            <li class="active">成绩分析</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        【{x2;(isset($basic['basic']) ? $basic['basic'] : '')}】知识点正确率分析
                        <a class="pull-right btn btn-primary" href="index.php?exam-master-basic-stats&basicid={x2;(isset($basicid) ? $basicid : '')}{x2;(isset($u) ? $u : '')}">试题正确率分析</a>
                    </h4>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr class="info">
                                <th>知识点ID</th>
                                <th width="40%">知识点名称</th>
                                <th>正确次数</th>
                                <th>出现次数</th>
                                <th>正确率</th>
                            </tr>
                        </thead>
                        <tbody>
                            {x2;tree:(array)($stats['data'] ?? []),stat,sid}
                            <tr>
                                <td>
                                    {x2;(isset(v:stat['knowsid']) ? v:stat['knowsid'] : '')}
                                </td>
                                <td>
                                    {x2;realhtml:(isset(v:stat['knows']) ? v:stat['knows'] : '')}
                                </td>
                                <td>
                                    {x2;eval: echo intval(v:stat['right'])}
                                </td>
                                <td>
                                    {x2;(isset(v:stat['number']) ? v:stat['number'] : '')}
                                </td>
                                <td>
                                    {x2;eval: echo round(100 * v:stat['right']/v:stat['number'],2)}%
                                </td>
                            </tr>
                            {x2;endtree}
                        </tbody>
                    </table>
                    <ul class="pagination pull-right">
                        {x2;(isset($stats['pages']) ? $stats['pages'] : '')}
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
