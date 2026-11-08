{x2;if:empty($userhash)}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="fa fa-chevron-left"></span></div>
            <div class="col-8">申请证书</div>
            <div class="col-1">
                <a href="index.php?certificate-phone-certificate" class="ajax">
                    <span class="fa fa-plus-circle"></span>
                </a>
            </div>
        </div>
        <div class="page-content header{x2;if:!empty($certificates['pages'])} footer{x2;endif}">
            <div class="list-box bg">
                <ol>
                    {x2;tree:(array)($certificates['data'] ?? []),certificate,bid}
                    <li class="unstyled">
                        <div class="col-4x">
                            <div class="rows illus">
                                <a href="index.php?certificate-phone-certificate-apply&ceid={x2;(isset(v:certificate['ceid']) ? v:certificate['ceid'] : '')}" class="ajax">
                                    <img src="{x2;(isset(v:certificate['cethumb']) ? v:certificate['cethumb'] : '')}">
                                </a>
                            </div>
                        </div>
                        <div class="col-4l">
                            <div class="rows info">
                                <a href="index.php?certificate-phone-certificate-apply&ceid={x2;(isset(v:certificate['ceid']) ? v:certificate['ceid'] : '')}" class="ajax">
                                    <h5 class="title">{x2;(isset(v:certificate['cetitle']) ? v:certificate['cetitle'] : '')}</h5>
                                    <p class="more">{x2;date:v:certificate['cetime'] ?? 0,'Y-m-d'}</p>
                                </a>
                            </div>
                        </div>
                    </li>
                    {x2;endtree}
                </ol>
            </div>
        </div>
        {x2;if:!empty($certificates['pages'])}
        <div class="page-footer">
            <ul class="pagination">{x2;(isset($certificates['pages']) ? $certificates['pages'] : '')}</ul>
        </div>
        {x2;endif}
    </div>
    {x2;if:empty($userhash)}
</div>
</body>
</html>
{x2;endif}
