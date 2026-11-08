{x2;if:empty($userhash)}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">{x2;(isset($sessionvars['examsession']) ? $sessionvars['examsession'] : '')}</div>
            <div class="col-1"><span class="iconfont icon-menu hide"></span></div>
        </div>
        <div class="page-content header footer" style="height: 100%;overflow: hidden">
            <div class="list-box bg" style="height: 100%;" id="exampaper">
                <input type="hidden" name="insertscore" value="1"/>
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        {x2;eval: v:oid = 0}
                        {x2;eval: v:qcid = 0}
                        {x2;tree:(array)($sessionvars['examsessionsetting']['examsetting']['questypelite'] ?? []),lite,qid}
                        {x2;if:!empty(v:lite)}
                        {x2;eval: v:quest = v:key}
                        {x2;if:!empty($sessionvars['examsessionquestion']['questions'][v:quest]) || !empty($sessionvars['examsessionquestion']['questionrows'][v:quest])}
                        {x2;eval: v:oid++}
                        {x2;eval: v:tid = 0}
                        {x2;tree:(array)($sessionvars['examsessionquestion']['questions'][v:quest] ?? []),question,qnid}
                        {x2;eval: v:tid++}
                        {x2;eval: v:qcid++}
                        <div class="swiper-slide" style="overflow-y: scroll">
                            <ol>
                                <li class="unstyled">
                                    <h4 class="title">
                                        第 {x2;(isset(v:qcid) ? v:qcid : '')} 题 【 {x2;(isset($questype[v:quest]['questype']) ? $questype[v:quest]['questype'] : '')} 】
                                    </h4>
                                </li>
                                <li class="unstyled">
                                    <div class="rows">
                                        <p>{x2;realhtml:(isset(v:question['question']) ? v:question['question'] : '')}</p>
                                    </div>
                                </li>
                                <li class="unstyled">
                                    <div class="rows">
                                        <p>{x2;realhtml:(isset(v:question['questionselect']) ? v:question['questionselect'] : '')}</p>
                                    </div>
                                </li>
                                <li class="unstyled">
                                    <div class="rows">
                                        {x2;if:!empty($questype[v:question['questiontype']]['questsort'])}
                                        <div class="intro">
                                            <span class="badge">我的答案</span>
                                        </div>
                                        <div class="intro">
                                            {x2;if:isset($sessionvars['examsessionuseranswer'][v:question['questionid']]) && is_array($sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;eval: echo implode('',$sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;else}{x2;realhtml:(isset($sessionvars['examsessionuseranswer'][v:question['questionid']]) ? $sessionvars['examsessionuseranswer'][v:question['questionid']] : '')}{x2;endif}
                                        </div>
                                        {x2;else}
                                        <div class="col-4x intro">
                                            <span class="badge">我的答案</span>
                                        </div>
                                        <div class="col-4l intro">
                                            <b id="rightanswer_{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}">{x2;if:isset($sessionvars['examsessionuseranswer'][v:question['questionid']]) && is_array($sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;eval: echo implode('',$sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;else}{x2;realhtml:(isset($sessionvars['examsessionuseranswer'][v:question['questionid']]) ? $sessionvars['examsessionuseranswer'][v:question['questionid']] : '')}{x2;endif}</b>
                                        </div>
                                        {x2;endif}
                                    </div>
                                </li>
                                <li class="unstyled">
                                    <div class="rows">
                                        {x2;if:!empty($questype[v:question['questiontype']]['questsort'])}
                                        <div class="intro">
                                            <span class="badge">正确答案</span>
                                        </div>
                                        <div class="intro">
                                            {x2;realhtml:(isset(v:question['questionanswer']) ? v:question['questionanswer'] : '')}
                                        </div>
                                        {x2;else}
                                        <div class="col-4x intro">
                                            <span class="badge">正确答案</span>
                                        </div>
                                        <div class="col-4l intro">
                                            <b id="rightanswer_{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}">{x2;(isset(v:question['questionanswer']) ? v:question['questionanswer'] : '')}</b>
                                        </div>
                                        {x2;endif}
                                    </div>
                                </li>
                                <li class="unstyled">
                                    <div class="rows">
                                        {x2;if:strlen(v:question['questiondescribe']) >= 10}
                                        <div class="intro">
                                            <span class="badge">试题解析</span>
                                        </div>
                                        <div class="intro">
                                            {x2;realhtml:(isset(v:question['questiondescribe']) ? v:question['questiondescribe'] : '')}
                                        </div>
                                        {x2;else}
                                        <div class="col-4x">
                                            <span class="badge">试题解析</span>
                                        </div>
                                        <div class="col-4l intro">
                                            {x2;realhtml:(isset(v:question['questiondescribe']) ? v:question['questiondescribe'] : '')}
                                        </div>
                                        {x2;endif}
                                    </div>
                                </li>
                            </ol>
                        </div>
                        {x2;endtree}
                        {x2;tree:(array)($sessionvars['examsessionquestion']['questionrows'][v:quest] ?? []),questionrow,qrid}
                        {x2;eval: v:tid++}
                        {x2;tree:(array)(v:questionrow['data'] ?? []),question,qid}
                        {x2;eval: v:qcid++}
                        <div class="swiper-slide" style="overflow-y: scroll">
                            <ol>
                                <li class="unstyled">
                                    <h4 class="title">
                                        第 {x2;(isset(v:qcid) ? v:qcid : '')} 题
                                    </h4>
                                </li>
                                <li class="unstyled">
                                    <div class="rows">
                                        <p>{x2;realhtml:(isset(v:questionrow['qrquestion']) ? v:questionrow['qrquestion'] : '')}</p>
                                    </div>
                                </li>
                                <li class="unstyled">
                                    <div class="rows">
                                        <p>{x2;realhtml:(isset(v:question['question']) ? v:question['question'] : '')}</p>
                                    </div>
                                </li>
                                <li class="unstyled">
                                    <div class="rows">
                                        <p>{x2;realhtml:(isset(v:question['questionselect']) ? v:question['questionselect'] : '')}</p>
                                    </div>
                                </li>
                                <li class="unstyled">
                                    <div class="rows">
                                        {x2;if:!empty($questype[v:question['questiontype']]['questsort'])}
                                        <div class="intro">
                                            <span class="badge">我的答案</span>
                                        </div>
                                        <div class="intro">
                                            {x2;if:isset($sessionvars['examsessionuseranswer'][v:question['questionid']]) && is_array($sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;eval: echo implode('',$sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;else}{x2;realhtml:(isset($sessionvars['examsessionuseranswer'][v:question['questionid']]) ? $sessionvars['examsessionuseranswer'][v:question['questionid']] : '')}{x2;endif}
                                        </div>
                                        {x2;else}
                                        <div class="col-4x intro">
                                            <span class="badge">我的答案</span>
                                        </div>
                                        <div class="col-4l intro">
                                            <b id="rightanswer_{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}">{x2;if:isset($sessionvars['examsessionuseranswer'][v:question['questionid']]) && is_array($sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;eval: echo implode('',$sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;else}{x2;realhtml:(isset($sessionvars['examsessionuseranswer'][v:question['questionid']]) ? $sessionvars['examsessionuseranswer'][v:question['questionid']] : '')}{x2;endif}</b>
                                        </div>
                                        {x2;endif}
                                    </div>
                                </li>
                                <li class="unstyled">
                                    <div class="rows">
                                        {x2;if:!empty($questype[v:question['questiontype']]['questsort'])}
                                        <div class="intro">
                                            <span class="badge">正确答案</span>
                                        </div>
                                        <div class="intro">
                                            {x2;realhtml:(isset(v:question['questionanswer']) ? v:question['questionanswer'] : '')}
                                        </div>
                                        {x2;else}
                                        <div class="col-4x intro">
                                            <span class="badge">正确答案</span>
                                        </div>
                                        <div class="col-4l intro">
                                            <b id="rightanswer_{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}">{x2;(isset(v:question['questionanswer']) ? v:question['questionanswer'] : '')}</b>
                                        </div>
                                        {x2;endif}
                                    </div>
                                </li>
                                <li class="unstyled">
                                    <div class="rows">
                                        {x2;if:strlen(v:question['questiondescribe']) >= 10}
                                        <div class="intro">
                                            <span class="badge">试题解析</span>
                                        </div>
                                        <div class="intro">
                                            {x2;realhtml:(isset(v:question['questiondescribe']) ? v:question['questiondescribe'] : '')}
                                        </div>
                                        {x2;else}
                                        <div class="col-4x">
                                            <span class="badge">试题解析</span>
                                        </div>
                                        <div class="col-4l intro">
                                            {x2;realhtml:(isset(v:question['questiondescribe']) ? v:question['questiondescribe'] : '')}
                                        </div>
                                        {x2;endif}
                                    </div>
                                </li>
                            </ol>
                        </div>
                        {x2;endtree}
                        {x2;endtree}
                        {x2;endif}
                        {x2;endif}
                        {x2;endtree}
                    </div>
                </div>
            </div>
        </div>
        <div class="page-content header footer hide">
            <div class="list-box bg">
                <ol>
                    {x2;eval: v:oid = 0}
                    {x2;eval: v:qmid = 0}
                    {x2;tree:(array)($sessionvars['examsessionsetting']['examsetting']['questypelite'] ?? []),lite,qid}
                    {x2;if:!empty(v:lite)}
                    {x2;eval: v:quest = v:key}
                    {x2;if:!empty($sessionvars['examsessionquestion']['questions'][v:quest]) || !empty($sessionvars['examsessionquestion']['questionrows'][v:quest])}
                    {x2;eval: v:oid++}
                    <li class="unstyled">
                        <div class="rows">
                            <h4 class="title text-center">{x2;(isset($questype[v:quest]['questype']) ? $questype[v:quest]['questype'] : '')}</h4>
                            {x2;eval: v:tid = 0}
                            {x2;tree:(array)($sessionvars['examsessionquestion']['questions'][v:quest] ?? []),question,qnid}
                            {x2;eval: v:tid++}
                            {x2;eval: v:qmid++}
                            <div class="col-2">
                                <a data-index="{x2;(isset(v:qmid) ? v:qmid : '')}" data-questionid="{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}" id="sign_{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}" class="btn order{x2;if:empty($eh['ehscorelist'][v:question['questionid']])} danger{x2;endif}">{x2;(isset(v:tid) ? v:tid : '')}</a>
                            </div>
                            {x2;endtree}
                            {x2;tree:(array)($sessionvars['examsessionquestion']['questionrows'][v:quest] ?? []),questionrow,qrid}
                            {x2;eval: v:tid++}
                            {x2;tree:(array)(v:questionrow['data'] ?? []),question,did}
                            {x2;eval: v:qmid++}
                            <div class="col-2">
                                <a data-index="{x2;(isset(v:qmid) ? v:qmid : '')}" data-questionid="{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}" id="sign_{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}" class="btn order{x2;if:empty($eh['ehscorelist'][v:question['questionid']])} danger{x2;endif}">{x2;(isset(v:tid) ? v:tid : '')}-{x2;(isset(v:did) ? v:did : '')}</a>
                            </div>
                            {x2;endtree}
                            {x2;endtree}
                        </div>
                    </li>
                    {x2;endif}
                    {x2;endif}
                    {x2;endtree}
                </ol>
            </div>
        </div>
        <div class="page-footer">
            <div class="col-3x iconmenu" id="favor">
                <span class="iconfont icon-star"></span><br />收藏
            </div>
            <div class="col-3x iconmenu" id="card">
                <span class="iconfont icon-detail"></span><br />题卡
            </div>
            <div class="col-3x iconmenu" id="error">
                <span class="iconfont icon-wrench"></span><br />纠错
            </div>
        </div>
        <script>
            $(function(){
                var mySwiper = new Swiper ('.swiper-container',{});
                $('#card').on('click',function(){
                    $('.page-content').toggleClass('hide');
                    $(this).toggleClass('active');
                });
                $('.order').on('click',function(){
                    $('.page-content').toggleClass('hide');
                    $('#card').toggleClass('active');
                    mySwiper.slideTo($(this).attr('data-index')-1);
                });
                $('#favor').on('click',function(){
                    favorquestion($('.order').eq(mySwiper.activeIndex).attr('data-questionid'));
                });
                $('#error').on('click',function(){
                    errorport($('.order').eq(mySwiper.activeIndex).attr('data-questionid'));
                });
            });
        </script>
    </div>
    {x2;if:empty($userhash)}
</div>
</body>
</html>
{x2;endif}
