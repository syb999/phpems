{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-3">
                    <div class="content-box padding">
                        <h2 class="title">分类导航</h2>
                        <ul class="list-unstyled list-txt">
                            {x2;tree:(array)($catbrother ?? []),cat,cid}
                            <li class="border{x2;if:(isset(v:cat['catid']) ? v:cat['catid'] : null) == (isset($cat['catid']) ? $cat['catid'] : null)} active{x2;endif}">
                                <a href="index.php?docs-app-category&catid={x2;(isset(v:cat['catid']) ? v:cat['catid'] : '')}">{x2;(isset(v:cat['catname']) ? v:cat['catname'] : '')}</a>
                            </li>
                            {x2;endif}
                        </ul>
                    </div>
                </div>
                <div class="col-xs-9 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">
                            {x2;(isset($cat['catname']) ? $cat['catname'] : '')}
                            <a href="index.php?docs-app" class="badge pull-right">回首页</a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            {x2;tree:(array)($docs['data'] ?? []),doc,did}
                            <li class="border morepadding">
                                <h4 class="shorttitle">{x2;(isset(v:doc['doctitle']) ? v:doc['doctitle'] : '')}</h4>
                                <div class="intro">
                                    <div class="col-xs-3 img">
                                        <img src="{x2;(isset(v:doc['docthumb']) ? v:doc['docthumb'] : '')}" />
                                    </div>
                                    <div class="desc">
                                        <p>{x2;(isset(v:doc['contentdescribe']) ? v:doc['contentdescribe'] : '')}</p>
                                        <p class="toolbar">
                                            {x2;date:v:doc['docinputtime'] ?? 0,'Y-m-d'}
                                            【 {x2;(isset($categories[v:doc['doccatid']]['catname']) ? $categories[v:doc['doccatid']]['catname'] : '')} 】
                                            <a href="index.php?docs-app-docs&docid={x2;(isset(v:doc['docid']) ? v:doc['docid'] : '')}" class="btn btn-info pull-right more">查看详情</a>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            {x2;endtree}
                            {x2;if:!empty($docs['pages'])}
                            <li class="border morepadding">
                                <ul class="pagination pull-right">
                                    {x2;(isset($docs['pages']) ? $docs['pages'] : '')}
                                </ul>
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
