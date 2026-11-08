<ul class="list-group">
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'index'} active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'index'}首页
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master">首页</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'category'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'category'}分类管理
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-category">分类管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'seminar'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'seminar'}专题管理
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-seminar">专题管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'tpls'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'tpls'}模板管理
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-tpls">模板管理</a>
        {x2;endif}
    </li>
</ul>
