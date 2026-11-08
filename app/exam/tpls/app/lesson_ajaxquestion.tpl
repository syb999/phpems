        <h2 class="title">
            第 {x2;(isset($number) ? $number : '')} 题
            <a class="badge pull-right favor" data-questionid="{x2;(isset($question['questionid']) ? $question['questionid'] : '')}">收藏</a>
            <a class="badge pull-right error" data-questionid="{x2;(isset($question['questionid']) ? $question['questionid'] : '')}">纠错</a>
            {x2;if:(isset($number) ? $number : null) < (isset($allnumber) ? $allnumber : null)}
            <a class="jump next badge pull-right" data-number="{x2;eval: echo $number + 1}">下一题</a>
            {x2;endif}
            {x2;if:(isset($number) ? $number : null) > 1}
            <a class="jump prev badge pull-right" data-number="{x2;eval: echo $number - 1}">上一题</a>
            {x2;endif}
        </h2>
        <ul class="list-unstyled list-img">
            {x2;if:!empty($parent)}
            <li class="border morepadding">
                <div class="desc">
                    <p>{x2;realhtml:(isset($parent['qrquestion']) ? $parent['qrquestion'] : '')}</p>
                </div>
            </li>
            {x2;endif}
            <li class="border morepadding">
                <div class="desc">
                    <p>{x2;realhtml:(isset($question['question']) ? $question['question'] : '')}</p>
                </div>
            </li>
            {x2;if:!$questype['questsort'] && $questype['questchoice'] != 5}
            <li class="border morepadding">
                <div class="desc">
                    <p>{x2;realhtml:(isset($question['questionselect']) ? $question['questionselect'] : '')}</p>
                </div>
            </li>
            {x2;endif}
            {x2;if:!empty($questype['questsort'])}
            <li class="border morepadding">
                <textarea class="jckeditor" etype="simple" id="editor{x2;(isset($question['questionid']) ? $question['questionid'] : '')}" name="question[{x2;(isset($question['questionid']) ? $question['questionid'] : '')}]" rel="{x2;(isset($question['questionid']) ? $question['questionid'] : '')}">{x2;realhtml:(isset($sessionvars['examsessionuseranswer'][$question['questionid']]) ? $sessionvars['examsessionuseranswer'][$question['questionid']] : '')}</textarea>
            </li>
            <li class="border morepadding">
                <label class="inline"><button class="btn btn-primary badge" onclick="javascript:$(this).parents('li').hide().parents('.content-box').find('.rightanswer').removeClass('hide');">查看答案</button></label>
            </li>
            <!--
            <li class="border morepadding">
                <form class="nopadding desc">
                    <label class="inline"><input type="radio" name="question[{x2;(isset($question['questionid']) ? $question['questionid'] : '')}]" rel="{x2;(isset($question['questionid']) ? $question['questionid'] : '')}" value="A" {x2;if:'A' == $sessionvars['examsessionuseranswer'][$question['questionid']]}checked{x2;endif}/><span class="selector">掌握</span> </label>
                    <label class="inline"><input type="radio" name="question[{x2;(isset($question['questionid']) ? $question['questionid'] : '')}]" rel="{x2;(isset($question['questionid']) ? $question['questionid'] : '')}" value="B" {x2;if:'B' == $sessionvars['examsessionuseranswer'][$question['questionid']]}checked{x2;endif}/><span class="selector">未掌握</span> </label>
                </form>
            </li>
            -->
            {x2;else}
            <li class="border morepadding">
                <form class="nopadding desc">
                    {x2;if:(isset($questype['questchoice']) ? $questype['questchoice'] : null) == 1 || $questype['questchoice'] == 4}
                    {x2;tree:(array)($selectorder ?? []),so,sid}
                    {x2;if:(isset(v:key) ? v:key : null) == (isset($question['questionselectnumber']) ? $question['questionselectnumber'] : null)}
                    {x2;eval: break;}
                    {x2;endif}
                    <label class="inline"><input type="radio" name="question[{x2;(isset($question['questionid']) ? $question['questionid'] : '')}]" rel="{x2;(isset($question['questionid']) ? $question['questionid'] : '')}" value="{x2;(isset(v:so) ? v:so : '')}" {x2;if:(isset(v:so) ? v:so : null) == (isset($sessionvars['examsessionuseranswer'][$question['questionid']]) ? $sessionvars['examsessionuseranswer'][$question['questionid']] : null)}checked{x2;endif}/><span class="selector">{x2;(isset(v:so) ? v:so : '')}</span> </label>
                    {x2;endtree}
                    {x2;elseif:(isset($questype['questchoice']) ? $questype['questchoice'] : null) == 5}
                    <input type="text" name="question[{x2;(isset($question['questionid']) ? $question['questionid'] : '')}]" placeholder="点击此处填写答案" value="{x2;(isset($sessionvars['examsessionuseranswer'][$question['questionid']]) ? $sessionvars['examsessionuseranswer'][$question['questionid']] : '')}" rel="{x2;(isset($question['questionid']) ? $question['questionid'] : '')}"/>
                    <label class="inline pull-right"><button class="btn btn-primary badge finish fill" rel="{x2;(isset($question['questionid']) ? $question['questionid'] : '')}">答题完毕</button></label>
                    {x2;else}
                    {x2;tree:(array)($selectorder ?? []),so,sid}
                    {x2;if:(isset(v:key) ? v:key : null) >= (isset($question['questionselectnumber']) ? $question['questionselectnumber'] : null)}
                    {x2;eval: break;}
                    {x2;endif}
                    <label class="inline"><input type="checkbox" name="question[{x2;(isset($question['questionid']) ? $question['questionid'] : '')}][{x2;(isset(v:key) ? v:key : '')}]" rel="{x2;(isset($question['questionid']) ? $question['questionid'] : '')}" value="{x2;(isset(v:so) ? v:so : '')}" {x2;if:in_array(v:so,$sessionvars['examsessionuseranswer'][$question['questionid']])}checked{x2;endif}/><span class="selector">{x2;(isset(v:so) ? v:so : '')}</span> </label>
                    {x2;endtree}
                    <label class="inline pull-right"><button class="btn btn-primary badge finish" rel="{x2;(isset($question['questionid']) ? $question['questionid'] : '')}">答题完毕</button></label>
                    {x2;endif}
                </form>
            </li>
            {x2;endif}
            <li class="border morepadding rightanswer hide">
                <div class="intro">
                    <div class="desc">
                        <div class="col-xs-1 nopadding">
                            <div class="toolbar"><span class="badge">正确答案</span></div>
                        </div>
                        {x2;if:!empty($questype['questsort'])}
                        <div class="col-xs-11">
                            {x2;realhtml:(isset($question['questionanswer']) ? $question['questionanswer'] : '')}
                        </div>
                        {x2;else}
                        <div class="col-xs-11">
                            <b id="rightanswer_{x2;(isset($question['questionid']) ? $question['questionid'] : '')}">{x2;(isset($question['questionanswer']) ? $question['questionanswer'] : '')}</b>
                        </div>
                        {x2;endif}
                    </div>
                </div>
            </li>
            <li class="border morepadding rightanswer hide">
                <div class="intro">
                    <div class="desc">
                        <div class="col-xs-1 nopadding">
                            <div class="toolbar"><span class="badge">试题解析</span></div>
                        </div>
                        <div class="col-xs-11">
                            {x2;realhtml:(isset($question['questiondescribe']) ? $question['questiondescribe'] : '')}
                        </div>
                    </div>
                </div>
            </li>
            <li class="border padding">
                <div class="intro text-right">
                    <div class="desc">
                        <form class="toolbar" target="questionpanel" action="index.php?exam-app-lesson-ajax-questions&knowsid={x2;(isset($knows['knowsid']) ? $knows['knowsid'] : '')}">
                            共 {x2;(isset($allnumber) ? $allnumber : '')} 题，当前第 {x2;(isset($number) ? $number : '')} 题。
                            <span class="form-inline form-group">
                                去第 <input type="search" size="1" class="form-control text-center" name="number" placeholder="{x2;(isset($number) ? $number : '')}"> 题
                            </span>
                        </form>
                    </div>
                </div>
            </li>
        </ul>
        <script type="text/javascript">
        $(function(){
            var sumquestion = function(value,qid){
                $('.rightanswer').removeClass('hide');
                console.log(value);
                console.log($("#rightanswer_"+qid).html());
                if(value == $("#rightanswer_"+qid).html())
                {
                    $.zoombox.show('ajaxOK',{message:'回答正确'});
                    $("#rightanswer_"+qid).attr('class','text-success');
                }
                else
                {
                    $.zoombox.show('ajax',{message:'回答错误'});
                    $("#rightanswer_"+qid).attr('class','text-danger');
                }
                setTimeout($.zoombox.hide,1000);
            }
            $("input:radio").click(function(){
                var _this = $(this);
                var qid = _this.attr('rel');
                sumquestion(_this.val(),qid);
            });
            $(".finish").click(function(){
                var _this = $(this);
                var qid = _this.attr('rel');
                var parent = _this.parents("form:first");
                var value = '';
                if(_this.hasClass('fill')){
                    value = parent.find("input").val();
                }
                else{
                    parent.find("input:checked").each(function(){
                        value += $(this).val().toUpperCase();
                    });
                }
                if(value == '')
                {
                    $.zoombox.show('ajax',{message:'请先答题'});
                    return;
                }
                sumquestion(value,qid);
            });
        });

        </script>
