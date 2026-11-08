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
                <li><a href="index.php?{x2;(isset($_app) ? $_app : '')}-master">{x2;(isset($apps[$_app]['appname']) ? $apps[$_app]['appname'] : '')}</a> <span class="divider">/</span></li>
                <li><a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-course&page={x2;(isset($page) ? $page : '')}">内容管理</a> <span class="divider">/</span></li>
                <li class="active">复制内容</li>
            </ul>
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#">复制内容</a>
                </li>
                <li class="pull-right">
                    <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-course&page={x2;(isset($page) ? $page : '')}{x2;(isset($u) ? $u : '')}">内容管理</a>
                </li>
            </ul>
            <form action="index.php?course-master-course-lite" method="post" class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">内容ID</label>
                    <div class="controls">
                        <input type="text" name="courseids" value="{x2;(isset($courseids) ? $courseids : '')}" needle="needle" msg="您必须输入标题" readonly>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">目标分类</label>
                    <div class="controls">
                        <select msg="您必须选择一个目标分类" needle="needle" class="autocombox input-medium" name="targetcatid" refUrl="index.php?course-master-category-ajax-getchildcategory&catid={value}">
                            <option value="">选择一级分类</option>
                            {x2;tree:(array)($parentcat ?? []),cat,cid}
                            <option value="{x2;(isset(v:cat['catid']) ? v:cat['catid'] : '')}">{x2;(isset(v:cat['catname']) ? v:cat['catname'] : '')}</option>
                            {x2;endtree}
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button class="btn btn-primary" type="submit">提交</button>
                        <a class="btn btn-primary" href="index.php?course-master-course&page={x2;(isset($page) ? $page : '')}{x2;(isset($u) ? $u : '')}">取消</a>
                        {x2;if:isset($search) && is_array($search)}{x2;tree:(array)($search ?? []),arg,sid}
                        <input type="hidden" name="search[{x2;(isset(v:key) ? v:key : '')}]" value="{x2;(isset(v:arg) ? v:arg : '')}"/>
                        {x2;endtree}{x2;endif}
                        <input type="hidden" name="copycategory" value="1">
                        <input type="hidden" name="catid" value="{x2;(isset($catid) ? $catid : '')}">
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
