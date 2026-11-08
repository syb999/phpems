<?php $this->_compileInclude('header'); ?>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            <?php $this->_compileInclude('nav'); ?>
            <div class="content">
                <div class="col-xs-9">
                    <div class="content-box padding">
                        <h2 class="title"><?php echo (isset($this->tpl_var['elem']['seltitle'])?$this->tpl_var['elem']['seltitle']:''); ?></h2>
                        <ul class="list-unstyled list-img">
                            <?php $cid = 0;
 foreach((array)($this->tpl_var['contents']['data'] ?? []) as $key => $content){ 
 $cid++; ?>
                            <li class="border morepadding">
                                <h4 class="shorttitle"><?php echo (isset($content['contenttitle'])?$content['contenttitle']:''); ?></h4>
                                <div class="intro">
                                    <?php if(!empty($content['contentthumb'])){ ?>
                                    <div class="col-xs-3 img">
                                        <img src="<?php echo (isset($content['contentthumb'])?$content['contentthumb']:''); ?>" />
                                    </div>
                                    <?php } ?>
                                    <div class="desc">
                                        <p><?php echo (isset($content['contentdescribe'])?$content['contentdescribe']:''); ?></p>
                                        <p class="toolbar">
                                            <?php echo date('Y-m-d',$content['contentinputtime']); ?>
                                            <a href="index.php?content-app-content&contentid=<?php echo (isset($content['contentid'])?$content['contentid']:''); ?>" class="btn btn-info pull-right more">查看详细</a>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <?php } ?>
                            <?php if(!empty($this->tpl_var['contents']['pages'])){ ?>
                            <li class="border morepadding">
                                <ul class="pagination pull-right">
                                    <?php echo (isset($this->tpl_var['contents']['pages'])?$this->tpl_var['contents']['pages']:''); ?>
                                </ul>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
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
