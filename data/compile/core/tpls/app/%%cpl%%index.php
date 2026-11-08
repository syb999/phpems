<?php $this->_compileInclude('header'); ?>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            <?php $this->_compileInclude('nav'); ?>
            <div class="content">
                <div class="col-xs-9">
                    <div class="content-box">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <?php $cid = 0;
 foreach((array)($this->tpl_var['topimgs']['data'] ?? []) as $key => $content){ 
 $cid++; ?>
                                <div class="swiper-slide">
                                    <a href="index.php?content-app-content&contentid={x2;(isset(v:content['pccontentid'])?v:content['pccontentid']:'')}">
                                        <img src="{x2;(isset(v:content['pcthumb'])?v:content['pcthumb']:'')}" style="max-width:100%;"/>
                                    </a>
                                </div>
                                <?php } ?>
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                    <div class="content-box padding">
                        <h2 class="title">
                            最新考试
                            <a href="index.php?exam" class="badge pull-right">更多 <em class="glyphicon glyphicon-plus"></em> </a>
                        </h2>
                        <ul class="list-box list-unstyled">
                            <?php $bid = 0;
 foreach((array)($this->tpl_var['basics']['data'] ?? []) as $key => $basic){ 
 $bid++; ?>
                            <li class="col-xs-4 box">
                                <a href="index.php?exam-app-basics-detail&basicid={x2;(isset(v:basic['basicid'])?v:basic['basicid']:'')}">
                                    <div class="img">
                                        <img src="<?php if(!empty($basic['basicthumb'])){ ?>{x2;(isset(v:basic['basicthumb'])?v:basic['basicthumb']:'')}<?php } else { ?>app/core/styles/img/item.jpg<?php } ?>" />
                                    </div>
                                    <h5 class="box-title">{x2;(isset(v:basic['basic'])?v:basic['basic']:'')}</h5>
                                    <div class="intro">
                                        <p><?php echo $this->G->make('strings')->subString($basic['basicdescribe'],78); ?></p>
                                    </div>
                                </a>
                            </li>
                            <?php if($bid == 3){ ?>
                        </ul>
                        <ul class="list-box list-unstyled">
                            <?php } ?>
                            <?php } ?>
                        </ul>
                    </div>
                    <div class="content-box padding">
                        <h2 class="title">
                            最新课程
                            <a href="index.php?course" class="badge pull-right">更多 <em class="glyphicon glyphicon-plus"></em> </a>
                        </h2>
                        <ul class="list-unstyled list-box">
                            <?php $cid = 0;
 foreach((array)($this->tpl_var['courses']['data'] ?? []) as $key => $content){ 
 $cid++; ?>
                            <li class="col-xs-4 box">
                                <a href="index.php?course-app-course&csid={x2;(isset(v:content['csid'])?v:content['csid']:'')}">
                                    <div class="img">
                                        <img src="<?php if(!empty($content['csthumb'])){ ?>{x2;(isset(v:content['csthumb'])?v:content['csthumb']:'')}<?php } else { ?>app/core/styles/img/item.jpg<?php } ?>" />
                                    </div>
                                    <h5 class="box-title">{x2;(isset(v:content['cstitle'])?v:content['cstitle']:'')}</h5>
                                    <div class="intro">
                                        <p><?php echo $this->G->make('strings')->subString($content['csdescribe'],78); ?></p>
                                    </div>
                                </a>
                            </li>
                            <?php if($cid == 3){ ?>
                        </ul>
                        <ul class="list-box list-unstyled">
                            <?php } ?>
                            <?php } ?>
                        </ul>
                    </div>
                    <div class="content-box padding">
                        <h2 class="title">
                            热点新闻
                            <a href="index.php?content" class="badge pull-right">更多 <em class="glyphicon glyphicon-plus"></em> </a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            <?php $cid = 0;
 foreach((array)($this->tpl_var['topnews']['data'] ?? []) as $key => $content){ 
 $cid++; ?>
                            <li class="border morepadding">
                                <h4 class="shorttitle">
                                    <a href="index.php?content-app-content&contentid={x2;(isset(v:content['pccontentid'])?v:content['pccontentid']:'')}">{x2;(isset(v:content['pctitle'])?v:content['pctitle']:'')}</a>
                                </h4>
                                <div class="intro">
                                    <div class="col-xs-3 img">
                                        <img src="{x2;(isset(v:content['pcthumb'])?v:content['pcthumb']:'')}" />
                                    </div>
                                    <div class="desc">
                                        <p>{x2;(isset(v:content['pcdescribe'])?v:content['pcdescribe']:'')}</p>
                                        <p class="toolbar">
                                            <?php echo date('Y-m-d',$content['pctime']); ?>
                                            <a href="index.php?content-app-content&contentid={x2;(isset(v:content['pccontentid'])?v:content['pccontentid']:'')}" class="hide btn btn-info pull-right more">查看详情</a>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-3 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">网站公告</h2>
                        <ul class="list-unstyled list-txt">
                            <?php $lid = 0;
 foreach((array)($this->tpl_var['notices']['data'] ?? []) as $key => $content){ 
 $lid++; ?>
                            <li class="border">
                                <a target="_blank" href="index.php?content-app-content&contentid={x2;(isset(v:content['contentid'])?v:content['contentid']:'')}">
                                    <?php echo $this->G->make('strings')->subString($content['contenttitle'],45); ?>
                                </a>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                    <div class="content-box padding">
                        <h2 class="title">精彩专题<a href="index.php?seminar" class="badge pull-right">更多 <em class="glyphicon glyphicon-plus"></em> </a> </h2>
                        <ul class="list-unstyled list-img">
                            <?php $sid = 0;
 foreach((array)($this->tpl_var['topseminars']['data'] ?? []) as $key => $seminar){ 
 $sid++; ?>
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
                            <?php } ?>
                        </ul>
                    </div>
                    <div class="content-box padding hide">
                        <h2 class="title">点击排行</h2>
                        <ul class="list-unstyled list-txt">
                            <li class="striped">
                                <span class="badge">1</span> PHPEMS6.0开发界面预览
                            </li>
                            <li class="striped">
                                <span class="badge">2</span> PHPEMS6.0开发界面预览
                            </li>
                            <li class="striped">
                                <span class="badge">3</span> PHPEMS6.0开发界面预览
                            </li>
                            <li class="striped">
                                <span class="badge">4</span> PHPEMS6.0开发界面预览
                            </li>
                            <li class="striped">
                                <span class="badge">5</span> PHPEMS6.0开发界面预览
                            </li>
                            <li class="striped">
                                <span class="badge">6</span> PHPEMS6.0开发界面预览
                            </li>
                            <li class="striped">
                                <span class="badge">7</span> PHPEMS6.0开发界面预览
                            </li>
                            <li class="striped">
                                <span class="badge">8</span> PHPEMS6.0开发界面预览
                            </li>
                        </ul>
                    </div>
                    <div class="content-box padding">
                        <h2 class="title">友情链接</h2>
                        <ul class="list-unstyled list-txt">
                            <?php $lid = 0;
 foreach((array)($this->tpl_var['links']['data'] ?? []) as $key => $content){ 
 $lid++; ?>
                            <li class="border">
                                <a target="_blank" href="index.php?content-app-content&contentid={x2;(isset(v:content['contentid'])?v:content['contentid']:'')}">
                                    <?php echo $this->G->make('strings')->subString($content['contenttitle'],45); ?>
                                </a>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
            </div>
            <?php $this->_compileInclude('footer'); ?>
        </div>
    </div>
</div>
<script>
    $(function(){
        var mySwiper = new Swiper ('.swiper-container',{
            autoplay: true,
            loop:true,
            pagination: {
                el: '.swiper-pagination'
            }
        });
    });
</script>
</body>
</html>
