<ul class="list-group">
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'index'} active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'index'}首页
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master">首页</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'category'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'category'}课程分类
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-category">课程分类</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'course' || $method == 'contents'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'course' || $method == 'contents'}课程管理
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-course">课程管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'module'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'module'}模型管理
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-module">模型管理</a>
        {x2;endif}
    </li>
</ul>
