{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-9">
                    <div class="content-box padding">
                        <h2 class="title">
                            {x2;(isset($cat['catname']) ? $cat['catname'] : '')}
                            <a href="index.php?content-app-category&catid={x2;(isset($cat['catid']) ? $cat['catid'] : '')}" class="badge pull-right"> 返回 </a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border padding">
                                <h4 class="shorttitle text-center">{x2;(isset($content['contenttitle']) ? $content['contenttitle'] : '')}</h4>
                                <div class="intro">
                                    <div class="desc">
                                        <div class="text-center">
                                            <ul class="list-inline list-unstyled">
                                                <li class="toolbar">发布人：{x2;(isset($content['contentusername']) ? $content['contentusername'] : '')}</li>
                                                <li class="toolbar">阅读量：{x2;(isset($content['contentview']) ? $content['contentview'] : '')}</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="border morepadding">
                                <div class="intro">
                                    <div class="desc" id="content">
                                        {x2;realhtml:(isset($content['contenttext']) ? $content['contenttext'] : '')}
                                    </div>
                                </div>
                            </li>
                            <li class="border morepadding">
                                <div class="intro">
                                    <div class="desc">
                                        <div class="toolbar text-right">{x2;date:$content['contentinputtime'] ?? 0,'Y-m-d'}</div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-3 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">新闻推荐</h2>
                        <ul class="list-unstyled list-txt">
                            {x2;tree:(array)($topnews['data'] ?? []),content,cid}
                            <li class="striped">
                                <a href="index.php?content-app-content&contentid={x2;(isset(v:content['contentid']) ? v:content['contentid'] : '')}"> {x2;(isset(v:content['contenttitle']) ? v:content['contenttitle'] : '')}</a>
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
<script>
    $(function(){
        $.get("index.php?content-phone-content-setview&contentid={x2;(isset($content['contentid']) ? $content['contentid'] : '')}&"+Math.random());
    });
</script>
</body>
</html>
