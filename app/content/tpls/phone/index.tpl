{x2;if:!$userhash}
{x2;include:header}
{x2;eval: v:signPackage = v:this->G->make('jssdk','user')->GetSignPackage();}
<body>
<div id="content">
    <div class="pages" id="page1">
        {x2;endif}
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
                        {x2;tree:$contents[2]['data'],content,cid}
                        <div class="swiper-slide">
                            <a href="index.php?content-phone-content&contentid={x2;v:content['contentid']}" class="ajax"
                               data-page="rollpage" data-target="rollpage">
                                <img src="{x2;v:content['contentthumb']}">
                            </a>
                        </div>
                        {x2;endtree}
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
                        {x2;tree:$eh,eh,ehid}
                        <div class="item">
                            {x2;if:v:eh['ehscore']>=80}
                            <div class="alert alert-success">{x2;v:eh['ehusername']}
                                于 {x2;date:v:eh['ehstarttime'],'H:i'} 参加《{x2;$basic[v:eh['ehbasicid']]}》测试，得分 {x2;v:eh['ehscore']}</div>
                            {x2;elseif:v:eh['ehscore']>60 && v:eh['ehscore']<80}
                            <div class="alert alert-warning">{x2;v:eh['ehusername']}
                                于 {x2;date:v:eh['ehstarttime'],'H:i'} 参加《{x2;$basic[v:eh['ehbasicid']]}》测试，得分 {x2;v:eh['ehscore']}</div>
                            {x2;else}
                            <div class="alert alert-danger">{x2;v:eh['ehusername']}
                                于 {x2;date:v:eh['ehstarttime'],'H:i'} 参加《{x2;$basic[v:eh['ehbasicid']]}》测试，得分 {x2;v:eh['ehscore']}</div>
                            {x2;endif}
                        </div>
                        {x2;endtree}
                    </div>

                    <!-- Controls -->
                </div>
                <h4 style="overflow:hidden;clear:both;padding-top:0.2rem;">
                    <span class="pull-left" style="width:35%"><hr/></span>
                    <span class="col-xs-4 text-center" style="width:30%;line-height:4rem;">热门考场</span>
                    <span class="pull-right" style="width:35%"><hr/></span>
                </h4>
                <div style="clear:both;padding:0px;margin-bottom:1rem;overflow: hidden;">
                    {x2;if:is_array($basics['basic'])}
                    {x2;tree:$basics['basic'],basic,bid}
                    <div class="col-xs-6" style="padding:3px;">
                        <div style="background-color:#FFFFFF;padding:7px">
                            <a href="index.php?exam-phone-index-setCurrentBasic&basicid={x2;v:basic['basicid']}"
                               class="ajax" data-target="basic" data-page="basic">
                                <img src="{x2;v:basic['basicthumb']}" style="width:100%;"/>
                            </a>
                            <h5 class="text-center">
                                <a href="index.php?exam-phone-index-setCurrentBasic&basicid={x2;v:basic['basicid']}"
                                   class="ajax" data-target="basic" data-page="basic">{x2;v:basic['basic']}</a>
                            </h5>
                        </div>
                    </div>
                    {x2;endtree}
                    {x2;endif}
                </div>
                <div>
                    <h4 style="overflow:hidden;clear:both;padding-top:0.2rem;">
                        <span class="pull-left" style="width:35%"><hr/></span>
                        <span class="col-xs-4 text-center" style="width:30%;line-height:4rem;">视频课程</span>
                        <span class="pull-right" style="width:35%"><hr/></span>
                    </h4>
                </div>
                <div style="clear:both;padding:0px;margin-bottom:1rem;">
                    {x2;tree:$courses['data'],course,cid}
                    <div class="col-xs-6" style="padding:3px;">
                        <div style="background-color:#FFFFFF;padding:7px">
                            <a class="ajax" href="index.php?course-phone-course&csid={x2;v:course['csid']}"
                               data-target="courseplatform" data-page="courseplatform" style="width:8rem;">
                                <img src="{x2;v:course['csthumb']}" style="width:100%;" alt="{x2;v:course['cstitle']}">
                            </a>
                            <h5 class="text-center"><a class="ajax"
                                                       href="index.php?course-phone-course&csid={x2;v:course['csid']}"
                                                       data-target="courseplatform"
                                                       data-page="courseplatform">{x2;v:course['cstitle']}</a></h5>
                        </div>
                    </div>
                    {x2;endtree}
                </div>
                {x2;tree:$contents,contents,cid}
                {x2;if:v:key != 2}
                <div>
                    <h4 style="overflow:hidden;clear:both;padding-top:0.2rem;">
                        <span class="pull-left" style="width:35%"><hr/></span>
                        <span class="col-xs-4 text-center"
                              style="width:30%;line-height:4rem;">{x2;substring:$rcats[v:key]['catname'],15}</span>
                        <span class="pull-right" style="width:35%"><hr/></span>
                    </h4>
                </div>
                <div style="clear:both;padding:1.5rem;background-color:#FFFFFF;margin-bottom:1rem;" class="col-xs-12">
                    {x2;tree:v:contents['data'],content,cid}
                    <div class="media">
                        <div class="media-body">
                            <h5 class="media-heading"><a class="ajax"
                                                         href="index.php?content-phone-content&contentid={x2;v:content['contentid']}"
                                                         data-target="contentpage"
                                                         data-page="contentpage">{x2;v:content['contenttitle']}</a></h5>
                            <p style="font-size:0.8rem;">{x2;substring:v:content['contentdescribe'],81} </p>
                        </div>
                    </div>
                    {x2;endtree}
                </div>
                {x2;endif}
                {x2;endtree}
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
        {x2;include:footer}
        {x2;if:!$userhash}
    </div>
</div>
<script src="//res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<script>
    wx.config({
        debug: false,
        appId: '{x2;v:signPackage['appId']}',
        timestamp: {x2;v:signPackage['timestamp']},
        nonceStr: '{x2;v:signPackage['nonceStr']}',
        signature: '{x2;v:signPackage['signature']}',
        jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage']
    });
</script>
</body>
</html>
{x2;endif}
