{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-9">
                    {x2;tree:(array)($contents ?? []),contents,cid}
                    <div class="content-box padding">
                        <h2 class="title">
                            {x2;(isset($catids[v:key]['catname']) ? $catids[v:key]['catname'] : '')}
                            <a href="index.php?content-app-category&catid={x2;(isset($catids[v:key]['catid']) ? $catids[v:key]['catid'] : '')}" class="badge pull-right">更多 <em class="glyphicon glyphicon-plus"></em> </a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            {x2;tree:(array)(v:contents['data'] ?? []),content,cid}
                            <li class="border morepadding">
                                <h4 class="shorttitle">
                                    <a href="index.php?content-app-content&contentid={x2;(isset(v:content['contentid']) ? v:content['contentid'] : '')}">
                                    {x2;(isset(v:content['contenttitle']) ? v:content['contenttitle'] : '')}
                                    </a>
                                </h4>
                                <div class="intro">
                                    <div class="col-xs-3 img">
                                        <a href="index.php?content-app-content&contentid={x2;(isset(v:content['contentid']) ? v:content['contentid'] : '')}">
                                            <img src="{x2;(isset(v:content['contentthumb']) ? v:content['contentthumb'] : '')}" />
                                        </a>
                                    </div>
                                    <div class="desc">
                                        <p>{x2;(isset(v:content['contentdescribe']) ? v:content['contentdescribe'] : '')}</p>
                                        <p class="toolbar">
                                            {x2;date:v:content['contentinputtime'] ?? 0,'Y-m-d'}
                                            【 {x2;(isset($categories[v:content['contentcatid']]['catname']) ? $categories[v:content['contentcatid']]['catname'] : '')} 】
                                            <a href="index.php?content-app-content&contentid={x2;(isset(v:content['contentid']) ? v:content['contentid'] : '')}" class="btn btn-info pull-right more">查看详情</a>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            {x2;endtree}
                        </ul>
                    </div>
                    {x2;endtree}
                </div>
                <div class="col-xs-3 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">推荐专题</h2>
                        <ul class="list-unstyled list-txt">
                            {x2;tree:(array)($topseminars['data'] ?? []),seminar,sid}
                            <li class="striped">
                                <a href="index.php?seminar-app-seminar&seminarid={x2;(isset(v:seminar['pccontentid']) ? v:seminar['pccontentid'] : '')}"> {x2;(isset(v:seminar['pctitle']) ? v:seminar['pctitle'] : '')}</a>
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
