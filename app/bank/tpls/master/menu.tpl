<ul class="list-group">
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'index'} active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'index'}首页
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master">首页</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'orders'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'orders'}订单管理
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-orders">订单管理</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:(isset($method) ? $method : null) == 'coupon'}active{x2;endif}">
        {x2;if:(isset($method) ? $method : null) == 'coupon'}代金券管理
        {x2;else}
        <a href="index.php?{x2;(isset($_app) ? $_app : '')}-master-coupon">代金券管理</a>
        {x2;endif}
    </li>
</ul>
