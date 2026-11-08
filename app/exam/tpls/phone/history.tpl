{x2;if:empty($userhash)}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">考试记录（{x2;if:(isset($ehtype) ? $ehtype : null) == 0}强化训练{x2;elseif:(isset($ehtype) ? $ehtype : null) == 1}模拟考试{x2;elseif:(isset($ehtype) ? $ehtype : null) == 2}正式考试{x2;endif}）</div>
            <div class="col-1" onclick="javascript:pep.mask.show('hismenu');"><span class="iconfont icon-menu"></span></div>
        </div>
        <div class="page-content header{x2;if:!empty($exams['pages'])} footer{x2;endif}">
            <div class="list-box bg">
                <ol>
                    {x2;tree:(array)($exams['data'] ?? []),exam,eid}
                    <a href="index.php?exam-phone-history-stats&ehid={x2;(isset(v:exam['ehid']) ? v:exam['ehid'] : '')}" class="ajax">
                    <li class="unstyled">
                        <div class="col-8x">
                            {x2;if:!v:exam['ehstatus'] && v:exam['ehdecide']}
                            <h4>待评</h4>
                            {x2;else}
                            <h2 class="text-center">{x2;eval: echo intval(v:exam['ehscore'])}</h2>
                            <div class="rows">
                                <div class="more text-center">分</div>
                            </div>
                            {x2;endif}
                        </div>
                        <div class="col-8l">
                            <div class="rows info">
                                <h5 class="title">{x2;(isset(v:exam['ehexam']) ? v:exam['ehexam'] : '')}</h5>
                                <div class="intro">
                                    <div class="col-4"> {x2;date:v:exam['ehstarttime'] ?? 0,'Y-m-d'}</div>
                                    <div class="col-4"> 用时：{x2;if:(isset(v:exam['ehtime']) ? v:exam['ehtime'] : null) >= 60}{x2;if:v:exam['ehtime']%60}{x2;eval: echo intval(v:exam['ehtime']/60)+1}{x2;else}{x2;eval: echo intval(v:exam['ehtime']/60)}{x2;endif}分{x2;else}{x2;(isset(v:exam['ehtime']) ? v:exam['ehtime'] : '')}秒{x2;endif}</div>
                                    {x2;if:!v:exam['ehstatus'] && v:exam['ehdecide']}
                                    <div class="col-2">待评分</div>
                                    {x2;else}
                                    {x2;if:!empty(v:exam['ehispass'])}
                                    <div class="col-2 text-success">及格</div>
                                    {x2;else}
                                    <div class="col-2 text-danger">不及格</div>
                                    {x2;endif}
                                    {x2;endif}
                                </div>
                            </div>
                        </div>
                    </li>
                    </a>
                    {x2;endtree}
                </ol>
            </div>
        </div>
        {x2;if:!empty($exams['pages'])}
        <div class="page-footer">
            <ul class="pagination">{x2;(isset($exams['pages']) ? $exams['pages'] : '')}</ul>
        </div>
        {x2;endif}
    </div>
    {x2;if:empty($userhash)}
</div>
</body>
</html>
{x2;endif}
