{x2;if:!empty($userhash)}
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
                            <li><a href="index.php?{x2;(isset($_app)?$_app:'')}-master">{x2;(isset($apps[$_app]['appname'])?$apps[$_app]['appname']:'')}</a></li>
                            <li><a href="index.php?{x2;(isset($_app)?$_app:'')}-master-seminar&page={x2;(isset($page)?$page:'')}">专题管理</a></li>
                            <li class="active">添加组件</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                    <h4 class="title" style="padding:10px;">
                        {x2;(isset($elem['seltitle'])?$elem['seltitle']:'')}
                        <a class="btn btn-primary pull-right" href="index.php?{x2;(isset($_app)?$_app:'')}-master-seminar-layout&seminarid={x2;(isset($seminar['seminarid'])?$seminar['seminarid']:'')}">专题管理</a>
                    </h4>
                    <form action="index.php?seminar-master-seminar-modifyelem" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label for="seminartitle" class="control-label col-sm-2">标题：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" name="args[seltitle]" value="{x2;(isset($elem['seltitle'])?$elem['seltitle']:'')}" needle="needle" msg="您必须输入标题">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">位置：</label>
                            <div class="col-sm-9">
                                {x2;if:(isset($layout['slayoutgrid']) ? $layout['slayoutgrid'] : null) == 1}
                                <label class="radio-inline">
                                    <input type="radio" name="args[selpos]" value="0" checked/> 通栏
                                </label>
                                {x2;elseif:$layout['slayoutgrid'] == 2}
                                <label class="radio-inline">
                                    <input type="radio" name="args[selpos]" value="1"{x2;if:(isset($elem['selpos']) ? $elem['selpos'] : null) == 1} checked{x2;endif}/> 左栏
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="args[selpos]" value="2"{x2;if:(isset($elem['selpos']) ? $elem['selpos'] : null) == 2} checked{x2;endif}/> 右栏
                                </label>
                                {x2;elseif:$layout['slayoutgrid'] == 3}
                                <label class="radio-inline">
                                    <input type="radio" name="args[selpos]" value="0"{x2;if:(isset($elem['selpos']) ? $elem['selpos'] : null) == 0} checked{x2;endif}/> 中栏
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="args[selpos]" value="1"{x2;if:(isset($elem['selpos']) ? $elem['selpos'] : null) == 1} checked{x2;endif}/> 左栏
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="args[selpos]" value="2"{x2;if:(isset($elem['selpos']) ? $elem['selpos'] : null) == 2} checked{x2;endif}/> 右栏
                                </label>
                                {x2;endif}
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="seminardescribe" class="control-label col-sm-2">说明：</label>
                            <div class="col-sm-9">
                                <textarea id="seminardescribe" class="form-control" name="args[seldescribe]" rows="7" cols="4">{x2;(isset($elem['seldescribe'])?$elem['seldescribe']:'')}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="contenttext" class="control-label col-sm-2">代码：</label>
                            <div class="col-sm-10">
                                <div class="Codemirror"></div>
                                <textarea class="form-control hide blockcontent_content" rows="7" cols="4" name="args[selcode]">{x2;(isset(realhtml:$elem['selcode'])?realhtml:$elem['selcode']:'')}</textarea>
                                <span class="help-block">使用&lt;!--{{datasource}}--&gt;设定自动数据源</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="seminarcatid" class="control-label col-sm-2">范例代码：</label>
                            <div class="col-sm-9 form-inline">
                                <select class="form-control stpl">
                                    <option value="">不使用范例</option>
                                    {x2;tree:(array)($tpls ?? []),tpl,tid}
                                    <option value="{x2;(isset(v:tpl['stplid'])?v:tpl['stplid']:'')}">{x2;(isset(v:tpl['stplname'])?v:tpl['stplname']:'')}</option>
                                    {x2;endtree}
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary tplbutton" type="button">提交</button>
                                <input type="hidden" name="submit" value="1">
                                <input type="hidden" name="selid" value="{x2;(isset($elem['selid'])?$elem['selid']:'')}">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
{x2;if:!empty($userhash)}
        </div>
    </div>
</div>
{x2;include:code}
{x2;include:footer}
</body>
</html>
{x2;endif}
