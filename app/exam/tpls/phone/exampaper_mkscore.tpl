    <div class="pagecontent">
        <header class="container-fluid" style="background-color:#337AB7;">
            <h5 class="text-center">
                <em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
                模拟考试主观题评分
                <em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
            </h5>
        </header>
        <div class="container-fluid" id="datacontent">
            <div class="row-fluid">
                <form id="form1" name="form1" class="col-xs-12" action="index.php?exam-phone-exampaper-makescore">
                    {x2;eval: v:oid = 0}
                    {x2;tree:(array)($questype ?? []),quest,qid}
                    {x2;if:!empty(v:quest['questsort'])}
                    {x2;if:!empty($sessionvars['examsessionquestion']['questions'][v:quest['questid']]) || !empty($sessionvars['examsessionquestion']['questionrows'][v:quest['questid']])}
                    {x2;eval: v:oid++}
                    <h4 class="title">
                        {x2;(isset($ols[v:oid]) ? $ols[v:oid] : '')}、{x2;(isset(v:quest['questype']) ? v:quest['questype'] : '')}{x2;(isset($sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['describe']) ? $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['describe'] : '')}
                    </h4>
                    {x2;eval: v:tid = 0}
                    {x2;tree:(array)($sessionvars['examsessionquestion']['questions'][v:quest['questid']] ?? []),question,qnid}
                    {x2;eval: v:tid++}
                    <div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;">
                        <h4 class="title">
                            第{x2;(isset(v:tid) ? v:tid : '')}题
                            <span class="pull-right">
                                <a class="btn text-primary qicon"><i class="glyphicon glyphicon-heart-empty"></i></a>
                                <a name="question_{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}"></a>
                                <input id="time_{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}" type="hidden" name="time[{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}]"/>
                            </span>
                        </h4>
                        <div class="choice">
                            {x2;realhtml:(isset(v:question['question']) ? v:question['question'] : '')}
                        </div>
                        {x2;if:empty($questype[v:quest]['questsort'])}
                        {x2;if:!empty(v:question['questionselect']) && $questype[v:quest]['questchoice'] != 5}
                        <div class="choice">
                            {x2;realhtml:(isset(v:question['questionselect']) ? v:question['questionselect'] : '')}
                        </div>
                        {x2;endif}
                        {x2;endif}
                        <div class="selector decidediv">
                            <table class="table table-hover table-bordered">
                                <tr class="info">
                                    <td width="30%">正确答案：</td>
                                    <td>{x2;realhtml:(isset(v:question['questionanswer']) ? v:question['questionanswer'] : '')}</td>
                                </tr>
                                <tr>
                                    <td>您的答案：</td>
                                    <td>{x2;if:isset($sessionvars['examsessionuseranswer'][v:question['questionid']]) && is_array($sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;eval: echo implode('',$sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;else}{x2;realhtml:(isset($sessionvars['examsessionuseranswer'][v:question['questionid']]) ? $sessionvars['examsessionuseranswer'][v:question['questionid']] : '')}{x2;endif}</td>
                                </tr>
                            </table>
                        </div>
                        <div class="choice" style="line-height:2.5rem;">
                              <input type="text" class="col-xs-12" name="score[{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}]" value="" maxvalue="{x2;(isset($sessionvars['examsessionsetting']['examsetting']['questype'][v:quest['questid']]['score']) ? $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest['questid']]['score'] : '')}">
                              <span class="text-error">【请根据参考答案给出分值】提示：本题共{x2;(isset($sessionvars['examsessionsetting']['examsetting']['questype'][v:quest['questid']]['score']) ? $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest['questid']]['score'] : '')}分，可输入0.5的倍数。</span>
                          </div>
                    </div>
                    {x2;endtree}
                    {x2;tree:(array)($sessionvars['examsessionquestion']['questionrows'][v:quest['questid']] ?? []),questionrow,qrid}
                    {x2;eval: v:tid++}
                    <div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;">
                        <h4 class="title">第{x2;(isset(v:tid) ? v:tid : '')}题{x2;(isset(v:did) ? v:did : '')}小题
                            <span class="pull-right">
                                <a class="btn text-primary qicon"><i class="glyphicon glyphicon-heart-empty"></i></a>
                                <a name="question_{x2;(isset(v:data['questionid']) ? v:data['questionid'] : '')}"></a>
                                <input id="time_{x2;(isset(v:data['questionid']) ? v:data['questionid'] : '')}" type="hidden" name="time[{x2;(isset(v:data['questionid']) ? v:data['questionid'] : '')}]"/>
                            </span>
                        </h4>
                        <div class="choice">
                            {x2;realhtml:(isset(v:questionrow['qrquestion']) ? v:questionrow['qrquestion'] : '')}
                        </div>
                        {x2;tree:(array)(v:questionrow['data'] ?? []),data,did}
                        {x2;eval: v:qcid++}
                        <hr />
                        <div style="padding:0rem 1.5rem;margin-top:1rem;">
                            <div class="choice">
                                {x2;realhtml:(isset(v:data['question']) ? v:data['question'] : '')}
                            </div>
                            <div class="selector decidediv">
                                <table class="table table-hover table-bordered">
                                    <tr class="info">
                                        <td width="30%">正确答案：</td>
                                        <td>{x2;realhtml:(isset(v:data['questionanswer']) ? v:data['questionanswer'] : '')}</td>
                                    </tr>
                                    <tr>
                                        <td>您的答案：</td>
                                        <td>{x2;if:isset($sessionvars['examsessionuseranswer'][v:data['questionid']]) && is_array($sessionvars['examsessionuseranswer'][v:data['questionid']])}{x2;eval: echo implode('',$sessionvars['examsessionuseranswer'][v:data['questionid']])}{x2;else}{x2;realhtml:(isset($sessionvars['examsessionuseranswer'][v:data['questionid']]) ? $sessionvars['examsessionuseranswer'][v:data['questionid']] : '')}{x2;endif}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="choice" style="line-height:2.5rem;">
                                  <input type="text" class="col-xs-12" name="score[{x2;(isset(v:data['questionid']) ? v:data['questionid'] : '')}]" value="" maxvalue="{x2;(isset($sessionvars['examsessionsetting']['examsetting']['questype'][v:quest['questid']]['score']) ? $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest['questid']]['score'] : '')}">
                                  <span class="text-error">【请根据参考答案给出分值】提示：本题共{x2;(isset($sessionvars['examsessionsetting']['examsetting']['questype'][v:quest['questid']]['score']) ? $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest['questid']]['score'] : '')}分，可输入0.5的倍数。</span>
                              </div>
                        </div>
                        {x2;endtree}
                    </div>
                    {x2;endtree}
                    {x2;endif}
                    {x2;endif}
                    {x2;endtree}
                    <h3 class="text-center">
                         <button type="submit" class="btn btn-primary">自行判分完毕，提交分数</button>
                         <input type="hidden" name="makescore" value="1"/>
                    </h3>
                </form>
            </div>
        </div>
    </div>
