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
                            学习进度
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border padding">
                                <div class="desc">
                                    <table class="table table-hover table-bordered">
                                        <tr class="info">
                                            <td>ID</td>
                                            <td>课程</td>
                                            <td>课程状态</td>
                                            <td>考试</td>
                                            <td>考试状态</td>
                                            <td>开始学习时间</td>
                                            <td>完成学习时间</td>
                                            <td>学习状态</td>
                                        </tr>
                                        {x2;tree:(array)($progresses['data'] ?? []),progress,pid}
                                        <tr>
                                            <td>{x2;(isset(v:progress['prsid']) ? v:progress['prsid'] : '')}</td>
                                            <td>{x2;(isset($courses[v:progress['prscourseid']]['cstitle']) ? $courses[v:progress['prscourseid']]['cstitle'] : '')}</td>
                                            <td>{x2;(isset($status[v:progress['prscoursestatus']]) ? $status[v:progress['prscoursestatus']] : '')}</td>
                                            <td>{x2;(isset($basics[v:progress['prsexamid']]['basic']) ? $basics[v:progress['prsexamid']]['basic'] : '')}</td>
                                            <td>{x2;(isset($status[v:progress['prsexamstatus']]) ? $status[v:progress['prsexamstatus']] : '')}</td>
                                            <td>{x2;date:v:progress['prstime'] ?? 0,'Y-m-d'}</td>
                                            <td>{x2;if:!empty(v:progress['prsendtime'])}{x2;date:v:progress['prsendtime'] ?? 0,'Y-m-d'}{x2;else}-{x2;endif}</td>
                                            <td>{x2;(isset($status[v:progress['prstatus']]) ? $status[v:progress['prstatus']] : '')}</td>
                                        </tr>
                                        {x2;endtree}
                                    </table>
                                </div>
                            </li>
                            {x2;if:!empty($progresses['pages'])}
                            <li class="border padding">
                                <ul class="pagination pagination-right">{x2;(isset($progresses['pages']) ? $progresses['pages'] : '')}</ul>
                            </li>
                            {x2;endif}
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
