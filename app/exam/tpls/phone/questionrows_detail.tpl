{x2;if:empty($userhash)}
{x2;include:header}
<body>
<div id="content">
    <div class="pages" id="questions">
{x2;endif}
        <div class="pagecontent">
            <header class="container-fluid" style="background-color:#337AB7;">
                <h5 class="text-center">
                    <em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
                    题冒题详情
                    <em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
                </h5>
            </header>
            <div class="container-fluid">
                <div class="row-fluid">
                    <table class="table table-hover">
                        {x2;if:!empty($question['qrknowsid'])}
                        <tr>
                          <td width="100">所属科目：</td>
                          <td>{x2;(isset($subject['subject']) ? $subject['subject'] : '')}&nbsp;</td>
                        </tr>
                        <tr>
                          <td>所属章节：</td>
                          <td>{x2;tree:(array)($sections ?? []),section,sid}{x2;(isset(v:section['section']) ? v:section['section'] : '')}{x2;endtree}&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                          <td>所属知识点：</td>
                          <td>{x2;tree:(array)($question['qrknowsid'] ?? []),know,kid}{x2;(isset(v:know['knows']) ? v:know['knows'] : '')}{x2;endtree}&nbsp;&nbsp;</td>
                        </tr>
                        {x2;endif}
                        <tr>
                          <td width="100">题帽：</td>
                          <td>{x2;realhtml:(isset($question['qrquestion']) ? $question['qrquestion'] : '')}</td>
                        </tr>
                        <tr>
                          <td>难度：</td>
                          <td>{x2;if:(isset($question['qrlevel']) ? $question['qrlevel'] : null) == 1}易{x2;elseif:(isset($question['qrlevel']) ? $question['qrlevel'] : null) == 2}中{x2;elseif:(isset($question['qrlevel']) ? $question['qrlevel'] : null) == 3}难{x2;endif}</td>
                        </tr>
                    </table>
                    {x2;tree:(array)($question['data'] ?? []),question,qid}
                    <table class="table table-hover">
                        <tr>
                          <td width="100">第{x2;(isset(v:qid) ? v:qid : '')}题</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td>标题：</td>
                          <td>{x2;eval: echo html_entity_decode(v:question['question'])}</td>
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
                          <td>{x2;realhtml:(isset(v:question['questiondescribe']) ? v:question['questiondescribe'] : '')}</td>
                        </tr>
                    </table>
                    {x2;endtree}
                </div>
            </div>
        </div>
        {x2;if:empty($userhash)}
    </div>
</div>
</body>
</html>
{x2;endif}
