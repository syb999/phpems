{x2;if:empty($userhash)}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">成绩单</div>
            <div class="col-1"><span class="iconfont icon-menu"></span></div>
        </div>
        <div class="page-content header{x2;if:!empty($scores['pages'])} footer{x2;endif}">
            <div class="list-box bg">
                <ol>
                    <li class="unstyled">
                        <div class="col-5">您的最高分：<span class="text-warning">{x2;(isset($s['score']) ? $s['score'] : '')}</span></div>
                        <div class="col-5">您的最好名次：<span class="text-warning">{x2;(isset($s['index']) ? $s['index'] : '')}</span></div>
                    </li>
                </ol>
            </div>
            <div class="list-box bg top">
                <ol>
                    {x2;tree:(array)($scores['data'] ?? []),score,sid}
                    <li class="unstyled">
                        <div class="col-8x">
                            <h2 class="text-center">{x2;eval: echo ($page - 1)*20 + v:sid}</h2>
                            <div class="rows">
                                <div class="more text-center">名</div>
                            </div>
                        </div>
                        <div class="col-8l">
                            <div class="rows info">
                                <h5 class="title">{x2;(isset(v:score['username']) ? v:score['username'] : '')}</h5>
                                <div class="intro">
                                    <div class="col-6"> {x2;date:v:score['ehstarttime'] ?? 0,'Y-m-d H:i:s'}</div>
                                    <div class="col-4"> {x2;(isset(v:score['ehscore']) ? v:score['ehscore'] : '')}分</div>
                                </div>
                            </div>
                        </div>
                    </li>
                    {x2;endtree}
                </ol>
            </div>
        </div>
        {x2;if:!empty($scores['pages'])}
        <div class="page-footer">
            <ul class="pagination">{x2;(isset($scores['pages']) ? $scores['pages'] : '')}</ul>
        </div>
        {x2;endif}
    </div>
    {x2;if:empty($userhash)}
</div>
</body>
</html>
{x2;endif}
