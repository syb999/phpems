<ul class="list-group">
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'index'} active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'index'}首页
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master">首页</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'attachtype'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'attachtype'}文件类型
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-attachtype">文件类型</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'files'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'files'}文件管理
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-files">文件管理</a>
        {x2;endif}
    </li>
</ul>
