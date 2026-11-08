{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-9">
                    {x2;if:isset($catids) && is_array($catids)}
                    {x2;tree:(array)($catids ?? []),cat,cid}
                    <div class="content-box padding">
                        <h2 class="title">
                            {x2;(isset(v:cat['catname'])?v:cat['catname']:'')}
                            <a href="index.php?seminar-app-category&catid={x2;(isset(v:cat['catid'])?v:cat['catid']:'')}" class="badge pull-right">更多 <em class="glyphicon glyphicon-plus"></em> </a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            {x2;tree:(array)($seminars[v:cat['catid']]['data'] ?? []),seminar,sid}
                            <li class="border morepadding">
                                <h4 class="shorttitle">{x2;(isset(v:seminar['seminartitle'])?v:seminar['seminartitle']:'')}</h4>
                                <div class="intro">
                                    <div class="col-xs-3 img">
                                        <img src="{x2;(isset(v:seminar['seminarthumb'])?v:seminar['seminarthumb']:'')}" />
                                    </div>
                                    <div class="desc">
                                        <p>{x2;(isset(v:seminar['seminardescribe'])?v:seminar['seminardescribe']:'')}</p>
                                        <p class="toolbar">
                                            {x2;date:v:seminar['seminartime'],'Y-m-d'}
                                            【 {x2;(isset($categories[v:seminar['seminarcatid']]['catname'])?$categories[v:seminar['seminarcatid']]['catname']:'')} 】
                                            <a href="index.php?seminar-app-seminar&seminarid={x2;(isset(v:seminar['seminarid'])?v:seminar['seminarid']:'')}" class="btn btn-info pull-right more">查看专题</a>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            {x2;endtree}
                        </ul>
                    </div>
                    {x2;endtree}
                    {x2;else}
                    <div class="content-box padding alert alert-warning" role="alert">暂无专题</div>
                    {x2;endif}
                </div>
                <div class="col-xs-3 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">推荐专题</h2>
                        <ul class="list-unstyled list-img">
                            {x2;tree:(array)($topseminars['data'] ?? []),seminar,sid}
                            <li class="border padding">
                                <a href="index.php?seminar-app-seminar&seminarid={x2;(isset(v:seminar['pccontentid'])?v:seminar['pccontentid']:'')}">
                                    <div class="intro">
                                        <div class="col-xs-5 img noleftpadding">
                                            <img src="{x2;(isset(v:seminar['pcthumb'])?v:seminar['pcthumb']:'')}" />
                                        </div>
                                        <div class="desc">
                                            <p>{x2;(isset(v:seminar['pctitle'])?v:seminar['pctitle']:'')}</p>
                                        </div>
                                    </div>
                                </a>
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
