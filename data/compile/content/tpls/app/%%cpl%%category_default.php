<?php $this->_compileInclude('header'); ?>
<body>
<?php $this->_compileInclude('nav'); ?>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2" style="margin-top:10px;">
				<ul class="list-group">
					<?php $cid = 0;
 foreach((array)($this->tpl_var['catbrother'] ?? []) as $key => $cat){ 
 $cid++; ?>
					<li class="list-group-item<?php if((isset($this->tpl_var['cat']['catid']) ? $this->tpl_var['cat']['catid'] : null) == $cat['catid']){ ?> active<?php } ?>">
						<?php if((isset($this->tpl_var['cat']['catid']) ? $this->tpl_var['cat']['catid'] : null) == $cat['catid']){ ?>
						<?php echo (isset($cat['catname'])?$cat['catname']:''); ?>
						<?php } else { ?>
						<a href="index.php?content-app-category&catid=<?php echo (isset($cat['catid'])?$cat['catid']:''); ?>"><?php echo (isset($cat['catname'])?$cat['catname']:''); ?></a>
						<?php } ?>
					</li>
					<?php } ?>
					<?php if(!empty($this->tpl_var['cat']['catparent'])){ ?>
					<li class="list-group-item">
						<a href="index.php?content-app-category&catid=<?php echo (isset($this->tpl_var['cat']['catparent'])?$this->tpl_var['cat']['catparent']:''); ?>">返回</a>
					</li>
					<?php } ?>
				</ul>
			</div>
			<div class="col-xs-10">
				<div class="box itembox" style="margin-bottom:0px;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php">首页</a></li>
							<li><a href="index.php?content">新闻</a></li>
						  	<?php $cbid = 0;
 foreach((array)($this->tpl_var['catbread'] ?? []) as $key => $cb){ 
 $cbid++; ?>
							<li><a href="index.php?content-app-category&catid=<?php echo (isset($cb['catid'])?$cb['catid']:''); ?>"><?php echo (isset($cb['catname'])?$cb['catname']:''); ?></a> <span class="divider">/</span></li>
							<?php } ?>
							<li class="active"><?php echo (isset($this->tpl_var['cat']['catname'])?$this->tpl_var['cat']['catname']:''); ?></li>
						</ol>
					</div>
				</div>
				<?php $cid = 0;
 foreach((array)($this->tpl_var['contents']['data'] ?? []) as $key => $content){ 
 $cid++; ?>
				<div class="box itembox" style="padding-top:20px;">
					<div class="col-xs-3">
						<a href="index.php?content-app-content&contentid=<?php echo (isset($content['contentid'])?$content['contentid']:''); ?>" class="thumbnail pull-left">
							<img src="<?php echo (isset($content['contentthumb'])?$content['contentthumb']:''); ?>" alt="" width="100%">
						</a>
					</div>
					<div class="col-xs-9">
						<a href="index.php?content-app-content&contentid=<?php echo (isset($content['contentid'])?$content['contentid']:''); ?>"><h4 class="title"><?php echo (isset($content['contenttitle'])?$content['contenttitle']:''); ?></h4></a>
						<p><?php echo (isset($content['contentdescribe'])?$content['contentdescribe']:''); ?></p>
						<hr/>
						<p>
							<span class="pull-right">
								<a href=""><span class="glyphicon glyphicon-time"></span> <span><?php echo date('Y-m-d H:i:s',$content['contentinputtime']); ?></span></a>&nbsp;&nbsp;
							</span>
						</p>
					</div>
				</div>
				<?php } ?>
				<ul class="pagination pull-right">
					<?php echo (isset($this->tpl_var['contents']['pages'])?$this->tpl_var['contents']['pages']:''); ?>
				</ul>
			</div>
		</div>
	</div>
</div>
<?php $this->_compileInclude('footer'); ?>
</body>
</html>