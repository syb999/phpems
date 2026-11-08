{x2;if:empty($userhash)}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span2">
            {x2;include:menu}
        </div>
        <div class="span10" id="datacontent">
{x2;endif}
            <ul class="breadcrumb">
                <li><a href="index.php?{x2;(isset($_app) ? $_app : '')}-teach">{x2;(isset($apps[$_app]['appname']) ? $apps[$_app]['appname'] : '')}</a> <span class="divider">/</span></li>
                <li><a href="index.php?{x2;(isset($_app) ? $_app : '')}-teach-questions&page={x2;(isset($page) ? $page : '')}{x2;(isset($u) ? $u : '')}">普通试题管理</a> <span class="divider">/</span></li>
                <li class="active">添加普通试题</li>
            </ul>
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#">添加普通试题</a>
                </li>
                <li class="pull-right">
                    <a href="index.php?{x2;(isset($_app) ? $_app : '')}-teach-questions&page={x2;(isset($page) ? $page : '')}{x2;(isset($u) ? $u : '')}">普通试题管理</a>
                </li>
            </ul>
            <form action="index.php?exam-teach-questions-bataddquestion" method="post" class="form-horizontal">
                <div class="control-group">
                    <label for="content" class="control-label">试题文本：</label>
                    <div class="controls">
                        <textarea id="content" name="content" class="span9" rows="15"></textarea>
                        <span class="help-block">请将准备好的格式粘贴到文本框内，点击保存即可</span>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button class="btn btn-primary" type="submit">提交</button>
                        <input type="hidden" name="page" value="{x2;(isset($page) ? $page : '')}"/>
                        <input type="hidden" name="type" value="1"/>
                        <input type="hidden" name="insertquestion" value="1"/>
                        {x2;if:isset($search) && is_array($search)}{x2;tree:(array)($search ?? []),arg,aid}
                        <input type="hidden" name="search[{x2;(isset(v:key) ? v:key : '')}]" value="{x2;(isset(v:arg) ? v:arg : '')}"/>
                        {x2;endtree}{x2;endif}
                    </div>
                </div>
            </form>
{x2;if:empty($userhash)}
        </div>
    </div>
</div>
</body>
</html>
{x2;endif}
