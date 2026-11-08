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
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'docs'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'docs'}词条管理
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-docs">词条管理</a>
        {x2;endif}
    </li>
</ul>
