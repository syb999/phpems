{x2;if:empty($userhash)}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
    <div class="row-fluid">
        <div class="main">
            <div class="col-xs-2 leftmenu">
                {x2;include:menu}
            </div>
            <div id="datacontent">
{x2;endif}
                <div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
                    <div class="col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="index.php?{x2;(isset($_app) ? $_app : '')}-master">{x2;(isset($apps[$_app]['appname']) ? $apps[$_app]['appname'] : '')}</a></li>
                            <li><a href="index.php?exam-master-recyle">回收站</a></li>
                            <li class="active">已删知识点</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        已删知识点
                        <a class="btn btn-primary pull-right" href="index.php?exam-master-recyle">回收站</a>
                    </h4>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr class="info">
                                <th>知识点ID</th>
                                <th>知识点名称</th>
                                <th width="100">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            {x2;tree:(array)($knows['data'] ?? []),know,kid}
                            <tr>
                                <td>{x2;(isset(v:know['knowsid']) ? v:know['knowsid'] : '')}</td>
                                <td>{x2;(isset(v:know['knows']) ? v:know['knows'] : '')}</td>
                                <td>
                                    <div class="btn-group">
                                        <a class="btn ajax" href="index.php?exam-master-recyle-backknows&page={x2;(isset($page) ? $page : '')}&knowsid={x2;(isset(v:know['knowsid']) ? v:know['knowsid'] : '')}{x2;(isset($u) ? $u : '')}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
                                        <a class="btn ajax" href="index.php?exam-master-recyle-delknows&page={x2;(isset($page) ? $page : '')}&knowsid={x2;(isset(v:know['knowsid']) ? v:know['knowsid'] : '')}{x2;(isset($u) ? $u : '')}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
                                    </div>
                                </td>
                            </tr>
                            {x2;endtree}
                        </tbody>
                    </table>
                    <div class="form-group hide">
                        <div class="col-sm-9">
                            <label class="radio-inline">
                                <input type="radio" name="action" value="reback" checked/>恢复
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="action" value="delete" />删除
                            </label>
                            {x2;if:isset($search) && is_array($search)}{x2;tree:(array)($search ?? []),arg,sid}
                            <input type="hidden" name="search[{x2;(isset(v:key) ? v:key : '')}]" value="{x2;(isset(v:arg) ? v:arg : '')}"/>
                            {x2;endtree}{x2;endif}
                            <label class="radio-inline">
                                <button class="btn btn-primary" type="submit">提交</button>
                            </label>
                            <input type="hidden" name="modifycontentsequence" value="1"/>
                            <input type="hidden" name="catid" value="{x2;(isset($catid) ? $catid : '')}"/>
                            <input type="hidden" name="page" value="{x2;(isset($page) ? $page : '')}"/>
                        </div>
                    </div>
                    <ul class="pagination pull-right">
                        {x2;(isset($knows['pages']) ? $knows['pages'] : '')}
                    </ul>
                </div>
            </div>
{x2;if:empty($userhash)}
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}
