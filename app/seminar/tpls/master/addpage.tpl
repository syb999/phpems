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
                            <li><a href="index.php?{x2;(isset($_app)?$_app:'')}-master-contents&page={x2;(isset($page)?$page:'')}">内容管理</a></li>
                            <li class="active">添加内容</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:hidden">
                    <h4 class="title" style="padding:10px;">
                        选择模型
                        <a class="btn btn-primary pull-right" href="index.php?{x2;(isset($_app)?$_app:'')}-master-contents&catid={x2;(isset($catid)?$catid:'')}&page={x2;(isset($page)?$page:'')}">内容管理</a>
                    </h4>
                    <div style="padding: 10px 0px;overflow:visible">
                        {x2;tree:(array)($modules ?? []),module,mid}
                        <a class="col-xs-3 text-center" href="index.php?content-master-contents-add&moduleid={x2;(isset(v:module['moduleid'])?v:module['moduleid']:'')}">
                            <div class="well">
                                <h2>{x2;(isset(v:module['modulename'])?v:module['modulename']:'')}</h2>
                                <p>{x2;(isset(v:module['moduledescribe'])?v:module['moduledescribe']:'')}</p>
                            </div>
                        </a>
                        {x2;endtree}
                    </div>
                </div>
            </div>
{x2;if:!empty($userhash)}
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}
