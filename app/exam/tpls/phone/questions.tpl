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
                    普通试题
                    <em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
                </h5>
            </header>
            <div class="container-fluid">
                <div class="row-fluid">
                    <ul class="nav nav-tabs" style="padding-top:1rem;">
                        <li class="active">
                            <a href="index.php?exam-phone-questions" class="ajax">普通试题</a>
                        </li>
                        <li>
                            <a href="index.php?exam-phone-questions-questionrows" class="ajax">题冒题</a>
                        </li>
                    </ul>
                    <form action="index.php?exam-phone-questions" method="post" class="form-inline">
                        <table class="table">
                            <tr>
                                <td>
                                    试题ID：
                                </td>
                                <td>
                                    <input name="search[questionid]" class="form-control" size="10" type="text" class="number" value="{x2;(isset($search['questionid']) ? $search['questionid'] : '')}"/>
                                </td>
                                <td>
                                    关键字：
                                </td>
                                <td>
                                    <input class="form-control" name="search[keyword]" size="10" type="text" value="{x2;(isset($search['keyword']) ? $search['keyword'] : '')}"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    试题类型：
                                </td>
                                <td>
                                    <select name="search[questiontype]" class="form-control">
                                        <option value="0">类型不限</option>
                                        {x2;tree:(array)($questypes ?? []),questype,qid}
                                        <option value="{x2;(isset(v:questype['questid']) ? v:questype['questid'] : '')}"{x2;if:(isset($search['questiontype']) ? $search['questiontype'] : null) == (isset(v:questype['questid']) ? v:questype['questid'] : null)} selected{x2;endif}>{x2;(isset(v:questype['questype']) ? v:questype['questype'] : '')}</option>
                                        {x2;endtree}
                                    </select>
                                </td>

                                <td>
                                    难度：
                                </td>
                                <td>
                                    <select name="search[questionlevel]" class="form-control">
                                        <option value="0">难度不限</option>
                                        <option value="1"{x2;if:(isset($search['questionlevel']) ? $search['questionlevel'] : null) == 1} selected{x2;endif}>易</option>
                                        <option value="2"{x2;if:(isset($search['questionlevel']) ? $search['questionlevel'] : null) == 2} selected{x2;endif}>中</option>
                                        <option value="3"{x2;if:(isset($search['questionlevel']) ? $search['questionlevel'] : null) == 3} selected{x2;endif}>难</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    章节：
                                </td>
                                <td>
                                    <select name="search[questionsectionid]" class="combox form-control" id="sectionselect" target="knowsselect" refUrl="index.php?exam-app-questions-getknowsbysectionid&sectionid={value}">
                                    <option value="0">选择章节</option>
                                    {x2;if:!empty($sections)}
                                    {x2;tree:(array)($sections ?? []),section,sid}
                                    <option value="{x2;(isset(v:section['sectionid']) ? v:section['sectionid'] : '')}"{x2;if:(isset(v:section['sectionid']) ? v:section['sectionid'] : null) == (isset($search['questionsectionid']) ? $search['questionsectionid'] : null)} selected{x2;endif}>{x2;(isset(v:section['section']) ? v:section['section'] : '')}</option>
                                    {x2;endtree}
                                    {x2;endif}
                                    </select>
                                </td>
                                <td>
                                    知识点：
                                </td>
                                <td>
                                    <select name="search[questionknowsid]" id="knowsselect" class="form-control">
                                        <option value="">选择知识点</option>
                                        {x2;if:!empty($knows)}
                                        {x2;tree:(array)($knows ?? []),know,kid}
                                        <option value="{x2;(isset(v:know['knowsid']) ? v:know['knowsid'] : '')}"{x2;if:(isset(v:know['knowsid']) ? v:know['knowsid'] : null) == (isset($search['questionknowsid']) ? $search['questionknowsid'] : null)} selected{x2;endif}>{x2;(isset(v:know['knows']) ? v:know['knows'] : '')}</option>
                                        {x2;endtree}
                                        {x2;endif}
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <button class="btn btn-primary" type="submit">搜索</button>
                                    <input type="hidden" value="1" name="search[argsmodel]" />
                                </td>
                                <td colspan="4"></td>
                            </tr>
                        </table>
                    </form>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr class="info">
                                <th style="width:7rem;">试题类型</th>
                                <th>试题内容</th>
                                <th style="width:4rem;">难度</th>
                            </tr>
                        </thead>
                        <tbody>
                            {x2;tree:(array)($questions['data'] ?? []),question,qid}
                            <tr>
                                <td>
                                    {x2;(isset($questypes[v:question['questiontype']]['questype']) ? $questypes[v:question['questiontype']]['questype'] : '')}
                                </td>
                                <td>
                                    <a title="查看试题" class="ajax" data-target="questiondetail" data-page="questiondetail" href="index.php?exam-phone-questions-detail&questionid={x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}">{x2;substring:strip_tags(html_entity_decode(v:question['question'])),135}</a>
                                </td>
                                <td>
                                    {x2;if:(isset(v:question['questionlevel']) ? v:question['questionlevel'] : null) == 2}中{x2;elseif:(isset(v:question['questionlevel']) ? v:question['questionlevel'] : null) == 3}难{x2;elseif:(isset(v:question['questionlevel']) ? v:question['questionlevel'] : null) == 1}易{x2;endif}
                                </td>
                            </tr>
                            {x2;endtree}
                        </tbody>
                    </table>
                    <ul class="pagination pull-right">
                        {x2;(isset($questions['pages']) ? $questions['pages'] : '')}
                    </ul>
                </div>
            </div>
        </div>
    {x2;if:empty($userhash)}
    </div>
</div>
</body>
</html>
{x2;endif}
