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
                    普通试题详情
                    <em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
                </h5>
            </header>
            <div class="container-fluid">
                <div class="row-fluid">
                    <table class="table table-hover">
                        {x2;if:!empty($question['questionknowsid'])}
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
                </div>
            </div>
        </div>
        {x2;if:empty($userhash)}
    </div>
</div>
</body>
</html>
{x2;endif}
