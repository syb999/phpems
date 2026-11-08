{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:examnav}
            <div class="content">
                <div class="col-xs-3" style="width: 20%">
                    <div class="content-box padding">
                        {x2;include:menu}
                    </div>
                </div>
                <div class="col-xs-9 nopadding" style="width: 80%">
                    {x2;if:isset($sections) && is_array($sections)}{x2;tree:(array)($sections ?? []),section,sid}
                    {x2;if:!empty($basic['basicknows'][v:section['sectionid']])}
                    <div class="content-box padding">
                        <h2 class="title">{x2;(isset(v:section['section']) ? v:section['section'] : '')}</h2>
                        <ul class="list-unstyled list-txt">
                            {x2;tree:(array)($basic['basicknows'][v:section['sectionid']] ?? []),know,kid}
                            <li class="border">
                                {x2;(isset($knows[v:know]['knows']) ? $knows[v:know]['knows'] : '')}
                                <span class="tool pull-right">
                                    {x2;if:array_sum($knows[v:know]['knowsnumber'])}
                                    {x2;if:!empty($record[v:know])}
                                    <a class="btn btn-default" href="index.php?exam-app-lesson-paper&knowsid={x2;(isset(v:know) ? v:know : '')}">继续练习</a>
                                    {x2;else}
                                    <a class="btn btn-default" href="index.php?exam-app-lesson-paper&knowsid={x2;(isset(v:know) ? v:know : '')}">开始练习</a>
                                    {x2;endif}
                                    {x2;else}
                                    <a class="btn btn-default" href="javascript:;">暂无试题</a>
                                    {x2;endif}
                                </span>
                                <span class="tool pull-right">
                                    <span>共 {x2;eval: echo array_sum($knows[v:know]['knowsnumber'])} 题{x2;if:!empty($record[v:know])}，上次做到第 {x2;(isset($record[v:know]['exernumber']) ? $record[v:know]['exernumber'] : '')} 题{x2;endif}</span>
                                </span>
                            </li>
                            {x2;endtree}
                        </ul>
                    </div>
                    {x2;endif}
                    {x2;endtree}{x2;endif}
                </div>

            </div>
            {x2;include:footer}
        </div>
    </div>
</div>
</body>
</html>
