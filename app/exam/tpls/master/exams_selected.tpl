                <table class="table table-hover">
                    <tr>
                        <td>
                            <b>普通试题</b>
                        </td>
                    </tr>
                    {x2;tree:(array)($questions ?? []),question,qid}
                    <tr id="selectedq_{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}">
                        <td>
                            <table>
                                <tr>
                                    <td width="80"><label class="checkbox-inline">{x2;if:empty($show)}<input type="checkbox" del="selectedq_{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}" rel="1" value="{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}" onclick="javascript:doselectquestions(this,'iselectquestions_{x2;(isset(v:question['questiontype']) ? v:question['questiontype'] : '')}','ialreadyselectnumber_{x2;(isset(v:question['questiontype']) ? v:question['questiontype'] : '')}');" checked />{x2;endif}第{x2;(isset(v:qid) ? v:qid : '')}题</label></td>
                                    <td>&nbsp;</td>
                                </tr>
                                {x2;if:!empty(v:question['questionknowsid'])}
                                <tr>
                                    <td>知识点：</td>
                                    <td>{x2;tree:(array)(v:question['questionknowsid'] ?? []),know,kid}&nbsp;{x2;(isset(v:know['knows']) ? v:know['knows'] : '')}{x2;endtree}&nbsp;</td>
                                </tr>
                                {x2;endif}
                                <tr>
                                    <td>标题：</td>
                                    <td>{x2;eval: echo strip_tags(html_entity_decode(v:question['question']))}</td>
                                </tr>
                                <tr>
                                    <td>备选项：</td>
                                    <td>
                                    {x2;realhtml:(isset(v:question['questionselect']) ? v:question['questionselect'] : '')}
                                    </td>
                                </tr>
                                <tr>
                                    <td>答案：</td>
                                    <td>{x2;realhtml:(isset(v:question['questionanswer']) ? v:question['questionanswer'] : '')}</td>
                                </tr>
                                <tr>
                                    <td>解析：</td>
                                    <td>{x2;realhtml:(isset(v:question['questiondescribe']) ? v:question['questiondescribe'] : '')}&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>难度：</td>
                                    <td>{x2;if:(isset(v:question['questionlevel']) ? v:question['questionlevel'] : null) == 1}易{x2;elseif:(isset(v:question['questionlevel']) ? v:question['questionlevel'] : null) == 2}中{x2;elseif:(isset(v:question['questionlevel']) ? v:question['questionlevel'] : null) == 3}难{x2;endif}&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    {x2;endtree}
                    <tr>
                        <td>
                            <b>题帽题</b>
                        </td>
                    </tr>
                    {x2;tree:(array)($rowsquestions ?? []),rowsquestion,qid}
                    <tr id="selectedqr_{x2;(isset(v:rowsquestion['qrid']) ? v:rowsquestion['qrid'] : '')}">
                        <td>
                            <div>
                                <table>
                                    <tr>
                                    <td width="80"><label class="checkbox inline">{x2;if:empty($show)}<input type="checkbox" del="selectedqr_{x2;(isset(v:rowsquestion['qrid']) ? v:rowsquestion['qrid'] : '')}" rel="{x2;(isset(v:rowsquestion['qrnumber']) ? v:rowsquestion['qrnumber'] : '')}" value="{x2;(isset(v:rowsquestion['qrid']) ? v:rowsquestion['qrid'] : '')}" onclick="javascript:doselectquestions(this,'iselectrowsquestions_{x2;(isset(v:rowsquestion['qrtype']) ? v:rowsquestion['qrtype'] : '')}','ialreadyselectnumber_{x2;(isset(v:rowsquestion['qrtype']) ? v:rowsquestion['qrtype'] : '')}');" checked />{x2;endif}<b>第{x2;(isset(v:qid) ? v:qid : '')}大题</b></label></td>
                                    <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                    <td>所属知识点：</td>
                                    <td>{x2;tree:(array)(v:rowsquestion['qrknowsid'] ?? []),know,kid}&nbsp;{x2;(isset(v:know['knows']) ? v:know['knows'] : '')}{x2;endtree}&nbsp;</td>
                                    </tr>
                                    <tr>
                                    <td>题帽：</td>
                                    <td>{x2;realhtml:(isset(v:rowsquestion['qrquestion']) ? v:rowsquestion['qrquestion'] : '')}</td>
                                    </tr>
                                </table>
                                {x2;tree:(array)(v:rowsquestion['data'] ?? []),question,cqid}
                                <table class="searchContent" width="96%">
                                    <tr>
                                        <td width="80">第{x2;(isset(v:cqid) ? v:cqid : '')}题</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>标题：</td>
                                        <td>{x2;eval: echo strip_tags(html_entity_decode(v:question['question']))}</td>
                                    </tr>
                                    <tr>
                                        <td>备选项：</td>
                                        <td>
                                        {x2;realhtml:(isset(v:question['questionselect']) ? v:question['questionselect'] : '')}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>答案：</td>
                                        <td>{x2;realhtml:(isset(v:question['questionanswer']) ? v:question['questionanswer'] : '')}</td>
                                    </tr>
                                    <tr>
                                        <td>解析：</td>
                                        <td>{x2;realhtml:(isset(v:question['questiondescribe']) ? v:question['questiondescribe'] : '')}&nbsp;</td>
                                    </tr>
                                    <tr style="display:none;">
                                        <td>难度：</td>
                                        <td>{x2;if:(isset(v:question['questionlevel']) ? v:question['questionlevel'] : null) == 2}中{x2;elseif:(isset(v:question['questionlevel']) ? v:question['questionlevel'] : null) == 3}难{x2;elseif:(isset(v:question['questionlevel']) ? v:question['questionlevel'] : null) == 1}易{x2;endif}&nbsp;</td>
                                    </tr>
                                </table>
                                {x2;endtree}
                            </div>
                        </td>
                    </tr>
                    {x2;endtree}
                </table>
