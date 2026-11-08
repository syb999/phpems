{x2;if:empty($userhash)}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">{x2;(isset($course['cstitle']) ? $course['cstitle'] : '')}</div>
            <div class="col-1">
                <span class="iconfont icon-menu"></span>
            </div>
        </div>
        <div class="page-content header">
            <div id="videoPlayer" style="width: 100%;height: 2.4rem"></div>
            <div class="list-box bg" id="videos-list" style="overflow-y: scroll">
                <ol>
                    <li class="unstyled">
                        <h4 class="title">课程清单</h4>
                    </li>
                    {x2;tree:(array)($contents['data'] ?? []),content,cid}
                    {x2;if:(isset(v:content['courseid']) ? v:content['courseid'] : null) == (isset($content['courseid']) ? $content['courseid'] : null)}
                    <li class="unstyled smallpadding">
                        <a data-target="pagination" href="index.php?course-app-course&csid={x2;(isset($course['csid']) ? $course['csid'] : '')}&contentid={x2;(isset(v:content['courseid']) ? v:content['courseid'] : '')}">
                            <div class="rows">
                                <div class="intro">
                                    <span class="badge primary">播放中</span>
                                    {x2;(isset(v:content['coursetitle']) ? v:content['coursetitle'] : '')}
                                </div>
                            </div>
                        </a>
                    </li>
                    {x2;else}
                    {x2;if:!empty($cdata['lock'][v:content['courseid']])}
                    <li class="unstyled smallpadding">
                        <div class="rows">
                            <div class="intro">
                                <span class="badge danger">待解锁</span>
                                {x2;(isset(v:content['coursetitle']) ? v:content['coursetitle'] : '')}
                            </div>
                        </div>
                    </li>
                    {x2;else}
                    <li class="unstyled smallpadding">
                        <a class="ajax" data-target="pagination" href="index.php?course-app-course&csid={x2;(isset($course['csid']) ? $course['csid'] : '')}&contentid={x2;(isset(v:content['courseid']) ? v:content['courseid'] : '')}">
                            <div class="rows">
                                <div class="intro">
                                    <span class="badge{x2;if:(isset($logs[v:content['courseid']]['logstatus']) ? $logs[v:content['courseid']]['logstatus'] : null) == 1} success{x2;endif}">待播放</span>
                                    {x2;(isset(v:content['coursetitle']) ? v:content['coursetitle'] : '')}
                                </div>
                            </div>
                        </a>
                    </li>
                    {x2;endif}
                    {x2;endif}
                    {x2;endtree}
                </ol>
            </div>
        </div>
    </div>
    <script src="files/public/js/clappr/clappr.min.js?v=20261108b"></script>
    <script>
    $(function(){
        clearInterval(pep.recordVideo);
        var playerElement = document.getElementById("videoPlayer");
        var allowseek = true;
        var player = new Clappr.Player({
            source: '{x2;(isset($content['course_files']) ? $content['course_files'] : '')}',
            mute: false,
            width:'100%',
            height:'2.4rem',
            disableVideoTagContextMenu:true
        });
        player.attachTo(playerElement);
        pep.recordVideo = setInterval(function(){
            $.get('index.php?course-phone-course-recordtime&courseid={x2;(isset($content['courseid']) ? $content['courseid'] : '')}&time='+player.getCurrentTime()+'&'+Math.random());
        },10000);
        var listenseek = function () {
            player.once('seek',function(){
                var time = this.getCurrentTime();
                setTimeout(function(){
                    player.seek(time);
                    listenseek();
                },10);
            });
        }
        player.on('play',function(){
            if(allowseek) {
                allowseek = false;
                setTimeout(function () {
                    {x2;if:!empty($logs[$content['courseid']]['logprogress'])}
                    player.seek({x2;(isset($logs[$content['courseid']]['logprogress']) ? $logs[$content['courseid']]['logprogress'] : '')});
                    {x2;endif}
                    listenseek();
                }, 5);
            }
        });
        player.on('ended',function(){
            $.get('index.php?course-phone-course-endstatus&courseid={x2;(isset($content['courseid']) ? $content['courseid'] : '')}&'+Math.random(),function(){
                window.location.reload();
            });
        });
        //player.play();
        $('#videos-list').css('height',$(window).height() - 290);
        pep.allowpre = true;
    });
    </script>
    {x2;if:empty($userhash)}
</div>
</body>
</html>
{x2;endif}
