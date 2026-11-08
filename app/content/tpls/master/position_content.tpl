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
                            {x2;if:!empty($catid)}
                            <li><a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-positions">推荐管理</a></li>
                            <li class="active">{x2;(isset($categories[$catid]['catname']) ? $categories[$catid]['catname'] : '')}</li>
                            {x2;else}
                            <li class="active">推荐内容</li>
                            {x2;endif}
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                    <h4 class="title" style="padding:10px;">
                        {x2;(isset($pos['posname']) ? $pos['posname'] : '')}
                        <span class="pull-right">
                            <a class="btn btn-primary" href="index.php?content-master-positions-addpage">推荐位管理</a>
                        </span>
                    </h4>
                    <form action="index.php?content-master-positions-lite" method="post">
                        <fieldset>
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr class="info">
                                        <th width="36"><input type="checkbox" class="checkall" target="delids"/></th>
                                        <th width="60">权重</th>
                                        <th width="40">ID</th>
                                        <th>标题</th>
                                        <th width="140">推荐时间</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {x2;tree:(array)($contents['data'] ?? []),content,cid}
                                    <tr>
                                        <td><input type="checkbox" name="delids[{x2;(isset(v:content['pcid']) ? v:content['pcid'] : '')}]" value="1"></td>
                                        <td><input class="form-control" type="text" name="ids[{x2;(isset(v:content['pcid']) ? v:content['pcid'] : '')}]" value="{x2;(isset(v:content['pcsequence']) ? v:content['pcsequence'] : '')}" style="width:32px;padding:2px 5px;"/></td>
                                        <td>{x2;(isset(v:content['pcid']) ? v:content['pcid'] : '')}</td>
                                        <td>
                                            {x2;(isset(v:content['pctitle']) ? v:content['pctitle'] : '')}
                                        </td>
                                        <td>
                                            {x2;date:v:content['pctime'] ?? 0,'y-m-d'}
                                        </td>
                                    </tr>
                                    {x2;endtree}
                                </tbody>
                            </table>
                            <div class="control-group">
                                <div class="controls">
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="modify" checked/>排序
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
                                {x2;(isset($contents['pages']) ? $contents['pages'] : '')}
                            </ul>
                        </fieldset>
                    </form>
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
