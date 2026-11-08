{x2;if:empty($userhash)}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1"><span class="iconfont icon-left"></span></div>
            <div class="col-8">主观题评分</div>
            <div class="col-1"><span class="iconfont icon-menu hide"></span></div>
        </div>
        <div class="page-content header footer">
            <form method="post" action="index.php?exam-phone-history-makescore&ehid={x2;(isset($eh['ehid']) ? $eh['ehid'] : '')}" class="list-box bg" id="exampaper">
                <input type="hidden" name="makescore" value="1"/>
                {x2;eval: v:oid = 0}
                {x2;eval: v:qcid = 0}
                {x2;tree:(array)($questype ?? []),quests,qid}
                {x2;if:!empty(v:quests)}
                {x2;eval: v:quest = v:key}
                {x2;if:!empty($eh['ehquestion']['questions'][v:quest]) || !empty($eh['ehquestion']['questionrows'][v:quest])}
                {x2;eval: v:oid++}
                {x2;eval: v:tid = 0}
                {x2;tree:(array)($eh['ehquestion']['questions'][v:quest] ?? []),question,qnid}
                {x2;eval: v:tid++}
                {x2;eval: v:qcid++}
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
                            <div class="intro">
                                <span class="badge">我的答案</span>
                            </div>
                            <div class="intro">
                                {x2;realhtml:(isset($eh['ehuseranswer'][v:question['questionid']]) ? $eh['ehuseranswer'][v:question['questionid']] : '')}
                            </div>
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
                    <li class="unstyled">
                        <div class="rows">
                            <div class="intro">
                                提示：本题共{x2;(isset($eh['ehsetting']['examsetting']['questype'][v:quest]['score']) ? $eh['ehsetting']['examsetting']['questype'][v:quest]['score'] : '')}分，得 <input msg="第{x2;(isset(v:tid) ? v:tid : '')}题得分不能超过该题总分" maxvalue="{x2;(isset($eh['ehsetting']['examsetting']['questype'][v:quest]['score']) ? $eh['ehsetting']['examsetting']['questype'][v:quest]['score'] : '')}" type="text" class="form-control text-center" name="score[{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}]" value="" size="1" placeholder="0"> 分
                            </div>
                        </div>
                    </li>
                </ol>
                {x2;endtree}
                {x2;tree:(array)($eh['ehquestion']['questionrows'][v:quest] ?? []),questionrow,qrid}
                {x2;eval: v:tid++}
                {x2;tree:(array)(v:questionrow['data'] ?? []),question,qid}
                {x2;eval: v:qcid++}
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
                            <div class="intro">
                                <span class="badge">我的答案</span>
                            </div>
                            <div class="intro">
                                {x2;realhtml:(isset($eh['ehuseranswer'][v:question['questionid']]) ? $eh['ehuseranswer'][v:question['questionid']] : '')}
                            </div>
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
                    <li class="unstyled">
                        <div class="rows">
                            <div class="intro">
                                提示：本题共{x2;(isset($eh['ehsetting']['examsetting']['questype'][v:quest]['score']) ? $eh['ehsetting']['examsetting']['questype'][v:quest]['score'] : '')}分，得 <input msg="第{x2;(isset(v:tid) ? v:tid : '')}题得分不能超过该题总分" maxvalue="{x2;(isset($eh['ehsetting']['examsetting']['questype'][v:quest]['score']) ? $eh['ehsetting']['examsetting']['questype'][v:quest]['score'] : '')}" type="text" class="form-control text-center" name="score[{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}]" value="" size="1" placeholder="0"> 分
                            </div>
                        </div>
                    </li>
                </ol>
                {x2;endtree}
                {x2;endtree}
                {x2;endif}
                {x2;endif}
                {x2;endtree}
            </form>
        </div>
        <div class="page-footer">
            <ol class="pagination">
                <li class="col-2">&nbsp;</li>
                <li class="col-6 text-center">
                    <button class="subpaperbtn block" onclick="javascript:$('#exampaper').submit();">评分完毕</button>
                </li>
                <li class="col-2">&nbsp;</li>
            </ol>
        </div>
    </div>
    {x2;if:empty($userhash)}
</div>
</body>
</html>
{x2;endif}
