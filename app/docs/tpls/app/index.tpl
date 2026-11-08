{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-9">
                    {x2;if:isset($docs) && is_array($docs)}
                    {x2;tree:(array)($docs ?? []),docs,did}
                    <div class="content-box padding">
                        <h2 class="title">
                            {x2;(isset($catids[v:key]['catname']) ? $catids[v:key]['catname'] : '')}
                            <a href="index.php?docs-app-category&catid={x2;(isset($catids[v:key]['catid']) ? $catids[v:key]['catid'] : '')}" class="badge pull-right">更多 <em class="glyphicon glyphicon-plus"></em> </a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            {x2;tree:(array)(v:docs['data'] ?? []),doc,cid}
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
                        </ul>
                    </div>
                    {x2;endtree}
                    {x2;else}
                    <div class="content-box padding alert alert-warning" role="alert">暂无词条</div>
                    {x2;endif}
                </div>
                <div class="col-xs-3 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">
                            待完善词条
                            <a href="index.php?docs-app-category-needmore" class="badge pull-right">更多 <em class="glyphicon glyphicon-plus"></em> </a>
                        </h2>
                        <ul class="list-unstyled list-txt">
                            {x2;tree:(array)($more['data'] ?? []),doc,did}
                            <li class="striped">
                                <a href="index.php?docs-app-docs&docid={x2;(isset(v:doc['docid']) ? v:doc['docid'] : '')}">{x2;substring:v:doc['doctitle'],36}</a>
                            </li>
                            {x2;endtree}
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
