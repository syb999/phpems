<?php if(!empty($this->tpl_var['userhash'])){ ?>
<?php $this->_compileInclude('header'); ?>
<?php $signPackage = $this->G->make('jssdk','user')->GetSignPackage();; ?>
<body>
<div id="content">
    <div class="pages" id="page1">
        <?php } ?>
        <div class="pagecontent">
            <header class="container-fluid" style="background-color:#337AB7;">
                <h5 class="text-center">
                    <em style="font-size:2rem;" class="pull-left glyphicon glyphicon-home"></em>
                    <span class="ttlo">PHPEMS模拟考试系统</span>
                    <a style="font-size:2rem;color:#FFFFFF;" href="index.php?user-phone"
                       class="pull-right glyphicon glyphicon-user ajax" data-target="user" data-page="user"></a>
                </h5>
            </header>
            <div class="container-fluid" style="overflow:hidden;margin-top:1rem;margin-bottom:0.4rem;">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <?php $cid = 0;
 foreach((array)($this->tpl_var['contents'][2]['data'] ?? []) as $key => $content){ 
 $cid++; ?>
                        <div class="swiper-slide">
                            <a href="index.php?content-phone-content&contentid=<?php echo (isset($content['contentid'])?$content['contentid']:''); ?>" class="ajax"
                               data-page="rollpage" data-target="rollpage">
                                <img src="<?php echo (isset($content['contentthumb'])?$content['contentthumb']:''); ?>">
                            </a>
                        </div>
                        <?php } ?>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
            <div class="container-fluid">
                <div style="clear:both;overflow:hidden;" class="items">
                    <div class="col-xs-4" style="padding:0.2rem;">
                        <div class="text-center" style="padding:0.2rem;padding-top:1.5rem;">
                            <a href="index.php?exam-phone-index" class="ajax" data-page="mybasic" data-target="mybasic">
                                <p>
                                    <img src="app/core/styles/img/exam.png" style="width:92%;"/>
                                </p>
                                <h5>在线考试</h5>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-4" style="padding:0.2rem;">
                        <div class="text-center" style="padding:0.2rem;padding-top:1.5rem;">
                            <a class="ajax" href="index.php?exam-phone-basics-open" data-target="course" data-page="course">
                                <p>
                                    <img src="app/core/styles/img/video.png" style="width:92%;"/>
                                </p>
                                <h5>开通考场</h5>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-4" style="padding:0.2rem;">
                        <div class="text-center" style="padding:0.2rem;padding-top:1.5rem;">
                            <a href="index.php?exam-phone-basics" data-target="certificate" data-page="certificate"
                               class="ajax">
                                <p>
                                    <img src="app/core/styles/img/t3.png" style="width:92%;"/>
                                </p>
                                <h5>最近考试</h5>
                            </a>
                        </div>
                    </div>
                    <!--
                    <div class="col-xs-3" style="padding:0.2rem;">
                        <div class="text-center" style="padding:0.2rem;padding-top:1.5rem;">
                            <a class="ajax" href="index.php?course-phone-index" data-target="course" data-page="course">
                                <p>
                                    <img src="app/core/styles/img/video.png" style="width:92%;"/>
                                </p>
                                <h5>视频课程</h5>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-3" style="padding:0.2rem;">
                        <div class="text-center" style="padding:0.2rem;padding-top:1.5rem;">
                            <a href="index.php?certificate-phone" data-target="certificate" data-page="certificate"
                               class="ajax">
                                <p>
                                    <img src="app/core/styles/img/t3.png" style="width:92%;"/>
                                </p>
                                <h5>证书申请</h5>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-3" style="padding:0.2rem;">
                        <div class="text-center" style="padding:0.2rem;padding-top:1.5rem;">
                            <a href="index.php?content-phone-category" data-target="contentcategory"
                               data-page="contentcategory" class="ajax">
                                <p>
                                    <img src="app/core/styles/img/news.png" style="width:92%;"/>
                                </p>
                                <h5>考试资讯</h5>
                            </a>
                        </div>
                    </div>
                    -->
                </div>
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <div class="alert alert-info">好好刷题，天天进步，祝同学们封考必过哦！^_^<div class="text-right">--考神</div></div>
                        </div>
                        <?php $ehid = 0;
 foreach((array)($this->tpl_var['eh'] ?? []) as $key => $eh){ 
 $ehid++; ?>
                        <div class="item">
                            <?php if($eh['ehscore']>=80){ ?>
                            <div class="alert alert-success"><?php echo (isset($eh['ehusername'])?$eh['ehusername']:''); ?>
                                于 <?php echo date('H:i',$eh['ehstarttime']); ?> 参加《<?php echo (isset($this->tpl_var['basic'][$eh['ehbasicid']])?$this->tpl_var['basic'][$eh['ehbasicid']]:''); ?>》测试，得分 <?php echo (isset($eh['ehscore'])?$eh['ehscore']:''); ?></div>
                            <?php } elseif($eh['ehscore']>60 && $eh['ehscore']<80){ ?>
                            <div class="alert alert-warning"><?php echo (isset($eh['ehusername'])?$eh['ehusername']:''); ?>
                                于 <?php echo date('H:i',$eh['ehstarttime']); ?> 参加《<?php echo (isset($this->tpl_var['basic'][$eh['ehbasicid']])?$this->tpl_var['basic'][$eh['ehbasicid']]:''); ?>》测试，得分 <?php echo (isset($eh['ehscore'])?$eh['ehscore']:''); ?></div>
                            <?php } else { ?>
                            <div class="alert alert-danger"><?php echo (isset($eh['ehusername'])?$eh['ehusername']:''); ?>
                                于 <?php echo date('H:i',$eh['ehstarttime']); ?> 参加《<?php echo (isset($this->tpl_var['basic'][$eh['ehbasicid']])?$this->tpl_var['basic'][$eh['ehbasicid']]:''); ?>》测试，得分 <?php echo (isset($eh['ehscore'])?$eh['ehscore']:''); ?></div>
                            <?php } ?>
                        </div>
                        <?php } ?>
                    </div>

                    <!-- Controls -->
                </div>
                <h4 style="overflow:hidden;clear:both;padding-top:0.2rem;">
                    <span class="pull-left" style="width:35%"><hr/></span>
                    <span class="col-xs-4 text-center" style="width:30%;line-height:4rem;">热门考场</span>
                    <span class="pull-right" style="width:35%"><hr/></span>
                </h4>
                <div style="clear:both;padding:0px;margin-bottom:1rem;overflow: hidden;">
                    <?php if(isset($this->tpl_var['basics']['basic']) && is_array($this->tpl_var['basics']['basic'])){ ?>
                    <?php $bid = 0;
 foreach((array)($this->tpl_var['basics']['basic'] ?? []) as $key => $basic){ 
 $bid++; ?>
                    <div class="col-xs-6" style="padding:3px;">
                        <div style="background-color:#FFFFFF;padding:7px">
                            <a href="index.php?exam-phone-index-setCurrentBasic&basicid=<?php echo (isset($basic['basicid'])?$basic['basicid']:''); ?>"
                               class="ajax" data-target="basic" data-page="basic">
                                <img src="<?php echo (isset($basic['basicthumb'])?$basic['basicthumb']:''); ?>" style="width:100%;"/>
                            </a>
                            <h5 class="text-center">
                                <a href="index.php?exam-phone-index-setCurrentBasic&basicid=<?php echo (isset($basic['basicid'])?$basic['basicid']:''); ?>"
                                   class="ajax" data-target="basic" data-page="basic"><?php echo (isset($basic['basic'])?$basic['basic']:''); ?></a>
                            </h5>
                        </div>
                    </div>
                    <?php } ?>
                    <?php } ?>
                </div>
                <div>
                    <h4 style="overflow:hidden;clear:both;padding-top:0.2rem;">
                        <span class="pull-left" style="width:35%"><hr/></span>
                        <span class="col-xs-4 text-center" style="width:30%;line-height:4rem;">视频课程</span>
                        <span class="pull-right" style="width:35%"><hr/></span>
                    </h4>
                </div>
                <div style="clear:both;padding:0px;margin-bottom:1rem;">
                    <?php $cid = 0;
 foreach((array)($this->tpl_var['courses']['data'] ?? []) as $key => $course){ 
 $cid++; ?>
                    <div class="col-xs-6" style="padding:3px;">
                        <div style="background-color:#FFFFFF;padding:7px">
                            <a class="ajax" href="index.php?course-phone-course&csid=<?php echo (isset($course['csid'])?$course['csid']:''); ?>"
                               data-target="courseplatform" data-page="courseplatform" style="width:8rem;">
                                <img src="<?php echo (isset($course['csthumb'])?$course['csthumb']:''); ?>" style="width:100%;" alt="<?php echo (isset($course['cstitle'])?$course['cstitle']:''); ?>">
                            </a>
                            <h5 class="text-center"><a class="ajax"
                                                       href="index.php?course-phone-course&csid=<?php echo (isset($course['csid'])?$course['csid']:''); ?>"
                                                       data-target="courseplatform"
                                                       data-page="courseplatform"><?php echo (isset($course['cstitle'])?$course['cstitle']:''); ?></a></h5>
                        </div>
                    </div>
                    <?php } ?>
                </div>
                <?php $cid = 0;
 foreach((array)($this->tpl_var['contents'] ?? []) as $key => $contents){ 
 $cid++; ?>
                <?php if($key != 2){ ?>
                <div>
                    <h4 style="overflow:hidden;clear:both;padding-top:0.2rem;">
                        <span class="pull-left" style="width:35%"><hr/></span>
                        <span class="col-xs-4 text-center"
                              style="width:30%;line-height:4rem;"><?php echo $this->G->make('strings')->subString($this->tpl_var['rcats'][$key]['catname'],15); ?></span>
                        <span class="pull-right" style="width:35%"><hr/></span>
                    </h4>
                </div>
                <div style="clear:both;padding:1.5rem;background-color:#FFFFFF;margin-bottom:1rem;" class="col-xs-12">
                    <?php $cid = 0;
 foreach((array)($contents['data'] ?? []) as $key => $content){ 
 $cid++; ?>
                    <div class="media">
                        <div class="media-body">
                            <h5 class="media-heading"><a class="ajax"
                                                         href="index.php?content-phone-content&contentid=<?php echo (isset($content['contentid'])?$content['contentid']:''); ?>"
                                                         data-target="contentpage"
                                                         data-page="contentpage"><?php echo (isset($content['contenttitle'])?$content['contenttitle']:''); ?></a></h5>
                            <p style="font-size:0.8rem;"><?php echo $this->G->make('strings')->subString($content['contentdescribe'],81); ?> </p>
                        </div>
                    </div>
                    <?php } ?>
                </div>
                <?php } ?>
                <?php } ?>
            </div>
        </div>
        <script>
            $(function () {
                var mySwiper = new Swiper('.swiper-container', {
                    "pagination": ".swiper-pagination",
                    "loop": true,
                    "autoplay": 3000,
                    "observer": true,
                    "observeParents": true
                });
            });
        </script>
        <?php $this->_compileInclude('footer'); ?>
        <?php if(!empty($this->tpl_var['userhash'])){ ?>
    </div>
</div>
<script src="//res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<script>
    wx.config({
        debug: false,
        appId: '<?php echo (isset($signPackage['appId'])?$signPackage['appId']:''); ?>',
        timestamp: <?php echo (isset($signPackage['timestamp'])?$signPackage['timestamp']:''); ?>,
        nonceStr: '<?php echo (isset($signPackage['nonceStr'])?$signPackage['nonceStr']:''); ?>',
        signature: '<?php echo (isset($signPackage['signature'])?$signPackage['signature']:''); ?>',
        jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage']
    });
</script>
</body>
</html>
<?php } ?>
