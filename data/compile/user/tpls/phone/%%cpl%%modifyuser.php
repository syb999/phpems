<?php if(!empty($this->tpl_var['userhash'])){ ?>
<?php $this->_compileInclude('header'); ?>
<body>
<div class="pages">
    <?php } ?>
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">个人设置</div>
            <div class="col-1"><span class="iconfont icon-menu"></span></div>
        </div>
        <div class="page-content header">
            <form class="top" action="index.php?user-phone-privatement" method="post">
                <?php $fid = 0;
 foreach((array)($this->tpl_var['forms'] ?? []) as $key => $form){ 
 $fid++; ?>
                <div class="form-group underline">
                    <div class="col-3 tip">
                        <?php echo (isset($form['title'])?$form['title']:''); ?>
                    </div>
                    <div class="col-7">
                        <?php echo (isset($form['html'])?$form['html']:''); ?>
                    </div>
                </div>
                <?php } ?>
                <div class="form-group"></div>
                <div class="form-group">
                    <input type="hidden" name="modifyuserinfo" value="1"/>
                    <button class="primary block">修改设置</button>
                </div>
            </form>
        </div>
    </div>
    <?php if(!empty($this->tpl_var['userhash'])){ ?>
</div>
</body>
</html>
<?php } ?>
