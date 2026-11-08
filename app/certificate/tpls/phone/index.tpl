{x2;if:empty($userhash)}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="fa fa-chevron-left"></span></div>
            <div class="col-8">我的证书</div>
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
                                <img src="{x2;(isset(v:certificate['cethumb']) ? v:certificate['cethumb'] : '')}">
                            </div>
                        </div>
                        <div class="col-4l">
                            <div class="rows info">
                                <h5 class="title">{x2;(isset(v:certificate['cetitle']) ? v:certificate['cetitle'] : '')}</h5>
                                <p class="intro">{x2;(isset($status[v:certificate['ceqstatus']]) ? $status[v:certificate['ceqstatus']] : '')} &nbsp; {x2;date:v:certificate['ceqtime'] ?? 0,'Y-m-d'}</p>
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
