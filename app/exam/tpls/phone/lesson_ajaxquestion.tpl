<div class="page-header">
    <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
    <div class="col-8">{x2;(isset($knows['knows']) ? $knows['knows'] : '')}</div>
    <div class="col-1"><span class="iconfont icon-menu hide"></span></div>
</div>
<div class="page-content header footer" data-refresh="yes">
    <form class="list-box bg top">
        <ol>
            <li class="unstyled">
                <h4 class="title">
                    第 {x2;(isset($number) ? $number : '')} 题
                </h4>
            </li>
            {x2;if:!empty($parent)}
            <li class="unstyled">
                <div class="rows">
                    <p>{x2;realhtml:(isset($parent['qrquestion']) ? $parent['qrquestion'] : '')}</p>
                </div>
            </li>
            {x2;endif}
            <li class="unstyled">
                <div class="rows">
                    <p>{x2;realhtml:(isset($question['question']) ? $question['question'] : '')}</p>
                </div>
            </li>
            {x2;if:!$questype['questsort'] && $questype['questchoice'] != 5}
            <li class="unstyled">
                <div class="rows">
                    <p>{x2;realhtml:(isset($question['questionselect']) ? $question['questionselect'] : '')}</p>
                </div>
            </li>
            {x2;endif}
            {x2;if:!empty($questype['questsort'])}
            <li class="unstyled">
                <textarea rows="4" id="editor{x2;(isset($question['questionid']) ? $question['questionid'] : '')}" name="question[{x2;(isset($question['questionid']) ? $question['questionid'] : '')}]" rel="{x2;(isset($question['questionid']) ? $question['questionid'] : '')}">{x2;realhtml:(isset($sessionvars['examsessionuseranswer'][$question['questionid']]) ? $sessionvars['examsessionuseranswer'][$question['questionid']] : '')}</textarea>
            </li>
            <li class="unstyled text-center">
                <button class="primary badge" onclick="javascript:$(this).parents('li').hide().parents('.list-box').find('.rightanswer').removeClass('hide');">查看答案</button>
            </li>
            {x2;else}
            <li class="unstyled">
                <div class="rows">
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
                    {x2;endif}
                </div>
            </li>
            {x2;if:(isset($questype['questchoice']) ? $questype['questchoice'] : null) == 2 || $questype['questchoice'] == 3}
            <li class="unstyled text-center">
                <button class="primary badge finish" rel="{x2;(isset($question['questionid']) ? $question['questionid'] : '')}">答题完毕</button>
            </li>
            {x2;endif}
            {x2;endif}
            <li class="unstyled rightanswer hide">
                <div class="rows">
                    {x2;if:!empty($questype['questsort'])}
                    <div class="intro">
                        <span class="badge">正确答案</span>
                    </div>
                    <div class="intro">
                        {x2;realhtml:(isset($question['questionanswer']) ? $question['questionanswer'] : '')}
                    </div>
                    {x2;else}
                    <div class="col-4x intro">
                        <span class="badge">正确答案</span>
                    </div>
                    <div class="col-4l intro">
                        <b id="rightanswer_{x2;(isset($question['questionid']) ? $question['questionid'] : '')}">{x2;(isset($question['questionanswer']) ? $question['questionanswer'] : '')}</b>
                    </div>
                    {x2;endif}
                </div>
            </li>
            <li class="unstyled rightanswer hide">
                <div class="rows">
                    {x2;if:strlen($question['questiondescribe']) >= 10}
                    <div class="intro">
                        <span class="badge">试题解析</span>
                    </div>
                    <div class="intro">
                        {x2;realhtml:(isset($question['questiondescribe']) ? $question['questiondescribe'] : '')}
                    </div>
                    {x2;else}
                    <div class="col-4x">
                        <span class="badge">试题解析</span>
                    </div>
                    <div class="col-4l intro">
                        {x2;realhtml:(isset($question['questiondescribe']) ? $question['questiondescribe'] : '')}
                    </div>
                    {x2;endif}
                </div>
            </li>
            <li class="unstyled"></li>
        </ol>
    </form>
</div>
<div class="page-footer">
    <ol class="pagination">
        <li class="col-8x{x2;if:(isset($number) ? $number : null) > 1} jump" data-number="{x2;eval: echo $number - 1}{x2;endif}">
            <span class="iconfont icon-left-circle"></span>
        </li>
        <li class="col-8x favor" data-questionid="{x2;(isset($question['questionid']) ? $question['questionid'] : '')}">
            <span class="iconfont icon-star"></span>
        </li>
        <li class="col-5">
            <form method="post" data-target="questionpanel" action="index.php?exam-app-lesson-ajax-questions&knowsid={x2;(isset($knows['knowsid']) ? $knows['knowsid'] : '')}">
                共{x2;(isset($allnumber) ? $allnumber : '')}题，转到 <input class="text-center" name="number" placeholder="{x2;(isset($number) ? $number : '')}" type="search" size="3"> 题
            </form>
        </li>
        <li class="col-8x">
            <a href="index.php?exam-phone-lesson-reporterror&questionid={x2;(isset($question['questionid']) ? $question['questionid'] : '')}" class="ajax">
                <span class="iconfont icon-wrench"></span>
            </a>
        </li>
        <li class="col-8x{x2;if:(isset($number) ? $number : null) < (isset($allnumber) ? $allnumber : null)} jump" data-number="{x2;eval: echo $number + 1}{x2;endif}">
            <span class="iconfont icon-right-circle"></span>
        </li>
    </ol>
</div>
<script type="text/javascript">
    $(function(){
        var sumquestion = function(value,qid){
            $('.rightanswer').removeClass('hide');
            if(value == $("#rightanswer_"+qid).html())
            {
                $("#rightanswer_"+qid).attr('class','text-success');
            }
            else
            {
                pep.mask.show(null,{message:'回答错误'});
                $("#rightanswer_"+qid).attr('class','text-danger');
            }
            setTimeout(pep.mask.hide,1000);
        }
        $("input:radio").click(function(){
            var _this = $(this);
            var qid = _this.attr('rel');
            sumquestion(_this.val(),qid);
        });
        $('#questionpanel .favor').on('click',function() {
                favorquestion($(this).attr('data-questionid'));
            });
        $('#questionpanel .jump').on('click',function(){
            var number = parseInt($(this).attr('data-number'));
            if(number <= 0)return ;
            submitAjax({url:"index.php?exam-phone-lesson-ajax-questions&knowsid={x2;(isset($knows['knowsid']) ? $knows['knowsid'] : '')}&number="+number,"target":"questionpanel"});
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
                pep.mask.show(null,{message:'请先答题'});
                return;
            }
            sumquestion(value,qid);
        });
    });
</script>
