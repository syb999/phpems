<ul class="list-group">
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'index'} active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'index'}首页
        {x2;else}
        <a href="index.php?user-master">首页</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'user'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'user'}用户管理
        {x2;else}
        <a href="index.php?user-master-user">用户管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'actor'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'actor'}用户组管理
        {x2;else}
        <a href="index.php?user-master-actor">用户组管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'config'} active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'config'}模块设置
        {x2;else}
        <a href="index.php?user-master-config">模块设置</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'module'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'module'}模型管理
        {x2;else}
        <a href="index.php?user-master-module">模型管理</a>
        {x2;endif}
    </li>
</ul>
