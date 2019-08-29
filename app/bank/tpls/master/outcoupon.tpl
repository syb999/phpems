{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
    <div class="row-fluid">
        <div class="main">
            <div class="col-xs-2" style="padding-top:10px;margin-bottom:0px;">
                {x2;include:menu}
            </div>
            <div class="col-xs-10" id="datacontent">
                <div class="box itembox" style="margin-bottom:0;border-bottom:1px solid #CCCCCC;">
                    <ul class="breadcrumb">
                        <li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a> <span
                                class="divider">/</span></li>
                        <li><a href="index.php?bank-master-coupon">代金券管理</a> <span class="divider">/</span></li>
                        <li class="active">导出代金券</li>
                    </ul>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0;">
                    <h4 class="title" style="padding:10px;">
                        导出代金券
                        <a class="btn btn-primary pull-right" href="index.php?bank-master-coupon">代金券列表</a>
                    </h4>
                    <form action="index.php?bank-master-coupon-outcoupon" method="post" class="form-horizontal">
                        <fieldset>
                            <div class="control-group">
                            </div>
                            <div class="control-group">
                                <label for="createtime" class="control-label">生成日期</label>
                                <div class="controls">
                                    <input class="input-small datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}"
                                           data-date-format="yyyy-mm-dd" type="text" name="stime" size="10" id="stime"
                                           value=""/> - <input class="input-small datetimepicker"
                                                               data-date="{x2;date:TIME,'Y-m-d'}"
                                                               data-date-format="yyyy-mm-dd" size="10" type="text"
                                                               name="etime" id="etime" value=""/>
                                    <span class="help-block">请输入生成日期起止时间</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <button class="btn btn-primary" type="submit">提交</button>
                                    <input type="hidden" name="outcoupon" value="1"/>
                                    {x2;if:is_array($search)}
                                    {x2;tree:$search,arg,aid}
                                    <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                    {x2;endtree}
                                    {x2;endif}
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
