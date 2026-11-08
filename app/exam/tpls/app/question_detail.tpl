                <table class="table table-hover">
                    {x2;if:!empty($question['questionknowsid'])}
                    <tr class="noborder">
                      <td width="100">科目：</td>
                      <td>{x2;(isset($subject['subject']) ? $subject['subject'] : '')}&nbsp;</td>
                    </tr>
                    <tr>
                      <td>章节：</td>
                      <td>{x2;tree:(array)($sections ?? []),section,sid}{x2;(isset(v:section['section']) ? v:section['section'] : '')}{x2;endtree}&nbsp;&nbsp;</td>
                    </tr>
                    <tr>
                      <td>知识点：</td>
                      <td>{x2;tree:(array)($question['questionknowsid'] ?? []),know,kid}{x2;(isset(v:know['knows']) ? v:know['knows'] : '')}{x2;endtree}&nbsp;&nbsp;</td>
                    </tr>
                    {x2;endif}
                    <tr>
                      <td width="100">标题：</td>
                      <td>{x2;realhtml:(isset($question['question']) ? $question['question'] : '')}</td>
                    </tr>
                    <tr>
                        <td>备选项：</td>
                        <td>
                          {x2;realhtml:(isset($question['questionselect']) ? $question['questionselect'] : '')}
                        </td>
                    </tr>
                    <tr>
                      <td>答案：</td>
                      <td>{x2;realhtml:(isset($question['questionanswer']) ? $question['questionanswer'] : '')}</td>
                    </tr>
                    <tr>
                      <td>解析：</td>
                      <td>{x2;realhtml:(isset($question['questiondescribe']) ? $question['questiondescribe'] : '')}&nbsp;</td>
                    </tr>
                    <tr>
                      <td>难度：</td>
                      <td>{x2;if:(isset($question['questionlevel']) ? $question['questionlevel'] : null) == 1}易{x2;elseif:(isset($question['questionlevel']) ? $question['questionlevel'] : null) == 2}中{x2;elseif:(isset($question['questionlevel']) ? $question['questionlevel'] : null) == 3}难{x2;endif}&nbsp;</td>
                    </tr>
                </table>
