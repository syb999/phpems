<ul class="list-group">
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'index'} active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'index'}首页
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master">首页</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'datas'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'datas'}表单数据
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-datas">表单数据</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'module'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'module'}模型管理
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-module">模型管理</a>
        {x2;endif}
    </li>
</ul>
