<ul class="list-group">
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'index'} active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'index'}首页
        {x2;else}
        <a href="index.php?user-master">首页</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'certificate'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'certificate'}证书管理
        {x2;else}
        <a href="index.php?certificate-master-certificate">证书管理</a>
        {x2;endif}
    </li>
</ul>
