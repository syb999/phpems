{x2;if:empty($userhash)}
{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:examnav}
            <div class="content">
                <div class="col-xs-3" style="width: 20%">
                    <div class="content-box padding">
                        {x2;include:menu}
                    </div>
                </div>
                <div class="col-xs-9 nopadding" style="width: 80%" id="datacontent">
                    {x2;endif}
                    <div class="content-box padding">
                        <h2 class="title">
                            普通试题
                            <a href="index.php?exam-app-questions-questionrows" class="badge pull-right">题冒题</a>
                            <a href="index.php?exam-app-questions" class="badge pull-right">普通试题</a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border">
                                <div class="desc">
                                    <form action="index.php?exam-app-questions" method="post" class="form-inline">
                                        <table class="table">
                                            <tr class="noborder">
                                                <td>
                                                    关键字：
                                                </td>
                                                <td>
                                                    <input placeholder="请输入关键字" class="form-control" name="search[keyword]" size="10" type="text" value="{x2;(isset($search['keyword']) ? $search['keyword'] : '')}"/>
                                                </td>
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
                                                <td></td>
                                                <td>
                                                    <button class="btn btn-primary" type="submit">搜索</button>
                                                    <input type="hidden" value="1" name="search[argsmodel]" />
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                            </li>
                            <li class="border">
                                <div class="desc">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                        <tr class="info">
                                            <th width="80">试题类型</th>
                                            <th>试题内容</th>
                                            <th width="48">难度</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        {x2;tree:(array)($questions['data'] ?? []),question,qid}
                                        <tr>
                                            <td>
                                                {x2;(isset($questypes[v:question['questiontype']]['questype']) ? $questypes[v:question['questiontype']]['questype'] : '')}
                                            </td>
                                            <td>
                                                <a title="查看试题" class="selfmodal" href="javascript:;" url="index.php?exam-app-questions-detail&questionid={x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}" data-target="#modal">{x2;substring:strip_tags(html_entity_decode(v:question['question'])),135}</a>
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
                            </li>
                        </ul>
                        {x2;if:!empty($exams['pages'])}
                        <ul class="pagination pull-right">{x2;(isset($exams['pages']) ? $exams['pages'] : '')}</ul>
                        {x2;endif}
                    </div>
                    {x2;if:empty($userhash)}
                </div>
            </div>
            {x2;include:footer}
        </div>
    </div>
</div>
<div id="modal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
                <h4 id="myModalLabel">
                    试题详情
                </h4>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button aria-hidden="true" class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
{x2;endif}
