{x2;if:empty($userhash)}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">课后练习</div>
            <div class="col-1"><span class="iconfont icon-menu hide"></span></div>
        </div>
        <div class="page-content header">
            {x2;tree:(array)($sections ?? []),section,sid}
            {x2;if:!empty($basic['basicknows'][v:section['sectionid']])}
            <div class="list-box bg top">
                <ol>
                    <li class="unstyled">
                        <h4 class="bigtitle">{x2;(isset(v:section['section']) ? v:section['section'] : '')}</h4>
                    </li>
                    {x2;tree:(array)($basic['basicknows'][v:section['sectionid']] ?? []),know,kid}
                    <li class="unstyled">
                        <a href="index.php?exam-phone-lesson-paper&knowsid={x2;(isset(v:know) ? v:know : '')}" class="ajax">
                            <div class="rows info">
                                <h5 class="title">{x2;(isset($knows[v:know]['knows']) ? $knows[v:know]['knows'] : '')}</h5>
                                <p class="intro">共 {x2;eval: echo array_sum($knows[v:know]['knowsnumber'])} 题{x2;if:!empty($record[v:know])}，上次做到第 {x2;(isset($record[v:know]['exernumber']) ? $record[v:know]['exernumber'] : '')} 题{x2;endif}，点击继续练习</p>
                            </div>
                        </a>
                    </li>
                    {x2;endtree}
                </ol>
            </div>
            {x2;endif}
            {x2;endtree}
        </div>
    </div>
    {x2;if:empty($userhash)}
</div>
</body>
</html>
{x2;endif}
