{x2;if:empty($userhash)}
{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                {x2;endif}
                <div class="col-xs-12" id="datacontent">
                    <div class="content-box padding">
                        <h4 class="title">考场列表<a href="index.php?exam-app" class="btn btn-primary pull-right"><em class="glyphicon glyphicon-tasks"></em> 我的考场</a></h4>
                        <form class="form" action="index.php?exam-app-basics-open">
                            <table class="table">
                                <tr>
                                    <td>
                                        <label>是否免费：</label>
                                    </td>
                                    <td>
                                        <select name="search[basicdemo]" class="form-control">
                                            <option value="0">不限</option>
                                            <option value="1"{x2;if:!empty($search['basicdemo'])} selected{x2;endif}>免费</option>
                                        </select>
                                    </td>
                                    <td>
                                        <label>关键字：</label>
                                    </td>
                                    <td>
                                        <input class="form-control" placeholder="输入考场关键字查询" name="search[keyword]" type="text" value="{x2;(isset($search['keyword']) ? $search['keyword'] : '')}" />
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>地区：</label>
                                    </td>
                                    <td>
                                        <select name="search[basicareaid]" class="form-control">
                                            <option value="0">选择地区</option>
                                            {x2;tree:(array)($areas ?? []),area,aid}
                                            <option value="{x2;(isset(v:area['areaid']) ? v:area['areaid'] : '')}"{x2;if:(isset(v:area['areaid']) ? v:area['areaid'] : null) == (isset($search['basicareaid']) ? $search['basicareaid'] : null)} selected{x2;endif}>{x2;(isset(v:area['area']) ? v:area['area'] : '')}</option>
                                            {x2;endtree}
                                        </select>
                                    </td>
                                    <td>
                                        <label>科目：</label>
                                    </td>
                                    <td>
                                        <select name="search[basicsubjectid]" class="form-control">
                                            <option value="0">选择科目</option>
                                            {x2;if:isset($subjects) && is_array($subjects)}
                                            {x2;tree:(array)($subjects ?? []),subject,sid}
                                            <option value="{x2;(isset(v:subject['subjectid']) ? v:subject['subjectid'] : '')}"{x2;if:(isset(v:subject['subjectid']) ? v:subject['subjectid'] : null) == (isset($search['basicsubjectid']) ? $search['basicsubjectid'] : null)} selected{x2;endif}>{x2;(isset(v:subject['subject']) ? v:subject['subject'] : '')}</option>
                                            {x2;endtree}
                                            {x2;endif}
                                        </select>
                                    </td>
                                    <td>
                                        <button class="btn btn-primary" type="submit">提交</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <hr>
                        <div class="col-xs-12 nopadding">
                            {x2;tree:(array)($basics['data'] ?? []),basic,bid}
                            <div class="col-xs-3" style="width:20%">
                                <a href="index.php?exam-app-basics-detail&basicid={x2;(isset(v:basic['basicid']) ? v:basic['basicid'] : '')}" class="thumbnail" style="position:relative;">
                                    {x2;if:!empty($data['openbasics'][v:basic['basicid']])}
                                    <img src="app/core/styles/img/opened.png" style="position:absolute;right:4px;top:4px;">
                                    {x2;elseif:!empty(v:basic['basicdemo'])}
                                    <img src="app/core/styles/img/free.png" style="position:absolute;right:4px;top:4px;">
                                    {x2;endif}
                                    <img src="{x2;if:!empty(v:basic['basicthumb'])}{x2;(isset(v:basic['basicthumb']) ? v:basic['basicthumb'] : '')}{x2;else}app/core/styles/img/item.jpg{x2;endif}" alt="" width="100%">
                                </a>
                                <h5 class="text-center">
                                    {x2;(isset(v:basic['basic']) ? v:basic['basic'] : '')}
                                </h5>
                            </div>
                            {x2;if:v:bid % 5 == 0}
                            <div class="col-xs-12"><hr /></div>
                            {x2;endif}
                            {x2;endtree}
                        </div>
                        <div class="col-xs-12">
                            <ul class="pagination pull-right">
                                {x2;(isset($basics['pages']) ? $basics['pages'] : '')}
                            </ul>
                        </div>
                    </div>
                </div>
                {x2;if:empty($userhash)}
            </div>
            {x2;include:footer}
        </div>
    </div>
</div>
</body>
</html>
{x2;endif}
