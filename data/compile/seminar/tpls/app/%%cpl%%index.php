<?php $this->_compileInclude('header'); ?>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            <?php $this->_compileInclude('nav'); ?>
            <div class="content">
                <div class="col-xs-9">
                    <?php if(isset($this->tpl_var['catids']) && is_array($this->tpl_var['catids'])){ ?>
                    <?php $cid = 0;
 foreach((array)($this->tpl_var['catids'] ?? []) as $key => $cat){ 
 $cid++; ?>
                    <div class="content-box padding">
                        <h2 class="title">
                            <?php echo (isset($cat['catname'])?$cat['catname']:''); ?>
                            <a href="index.php?seminar-app-category&catid=<?php echo (isset($cat['catid'])?$cat['catid']:''); ?>" class="badge pull-right">更多 <em class="glyphicon glyphicon-plus"></em> </a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            <?php $sid = 0;
 foreach((array)($this->tpl_var['seminars'][$cat['catid']]['data'] ?? []) as $key => $seminar){ 
 $sid++; ?>
                            <li class="border morepadding">
                                <h4 class="shorttitle"><?php echo (isset($seminar['seminartitle'])?$seminar['seminartitle']:''); ?></h4>
                                <div class="intro">
                                    <div class="col-xs-3 img">
                                        <img src="<?php echo (isset($seminar['seminarthumb'])?$seminar['seminarthumb']:''); ?>" />
                                    </div>
                                    <div class="desc">
                                        <p><?php echo (isset($seminar['seminardescribe'])?$seminar['seminardescribe']:''); ?></p>
                                        <p class="toolbar">
                                            <?php echo date('Y-m-d',$seminar['seminartime']); ?>
                                            【 <?php echo (isset($this->tpl_var['categories'][$seminar['seminarcatid']]['catname'])?$this->tpl_var['categories'][$seminar['seminarcatid']]['catname']:''); ?> 】
                                            <a href="index.php?seminar-app-seminar&seminarid=<?php echo (isset($seminar['seminarid'])?$seminar['seminarid']:''); ?>" class="btn btn-info pull-right more">查看专题</a>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                    <?php } ?>
                    <?php } else { ?>
                    <div class="content-box padding alert alert-warning" role="alert">暂无专题</div>
                    <?php } ?>
                </div>
                <div class="col-xs-3 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">推荐专题</h2>
                        <ul class="list-unstyled list-img">
                            <?php $sid = 0;
 foreach((array)($this->tpl_var['topseminars']['data'] ?? []) as $key => $seminar){ 
 $sid++; ?>
                            <li class="border padding">
                                <a href="index.php?seminar-app-seminar&seminarid=<?php echo (isset($seminar['pccontentid'])?$seminar['pccontentid']:''); ?>">
                                    <div class="intro">
                                        <div class="col-xs-5 img noleftpadding">
                                            <img src="<?php echo (isset($seminar['pcthumb'])?$seminar['pcthumb']:''); ?>" />
                                        </div>
                                        <div class="desc">
                                            <p><?php echo (isset($seminar['pctitle'])?$seminar['pctitle']:''); ?></p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
            </div>
            <?php $this->_compileInclude('footer'); ?>
        </div>
    </div>
</div>
</body>
</html>
