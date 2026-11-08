<ul class="list-group">
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'index'} active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'index'}首页
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master">首页</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'positions'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'positions'}推荐管理
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-positions">推荐管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'category'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'category'}分类管理
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-category">分类管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'contents'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'contents'}内容管理
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-contents">内容管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'module'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'module'}模型管理
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-module">模型管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'blocks'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'blocks'}标签管理
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-blocks">标签管理</a>
        {x2;endif}
    </li>
</ul>
