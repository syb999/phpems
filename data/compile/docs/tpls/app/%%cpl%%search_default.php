<?php $this->_compileInclude('header'); ?>
<body>
<?php $this->_compileInclude('nav'); ?>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="box itembox" style="margin-bottom:0px;">
				<div class="col-xs-12">
					<ol class="breadcrumb">
						<li><a href="index.php">首页</a></li>
						<li><a href="index.php?docs">文档</a></li>
						<li class="active">搜索</li>
					</ol>
				</div>
			</div>
			<?php $did = 0;
 foreach((array)($this->tpl_var['docs']['data'] ?? []) as $key => $doc){ 
 $did++; ?>
			<div class="box itembox" style="padding-top:20px;">
				<div class="col-xs-3">
					<a href="index.php?docs-app-docs&docid=<?php echo (isset($doc['docid'])?$doc['docid']:''); ?>" class="thumbnail pull-left">
						<img src="<?php echo (isset($doc['docthumb'])?$doc['docthumb']:''); ?>" alt="" width="100%">
					</a>
				</div>
				<div class="col-xs-9">
					<a href="index.php?docs-app-docs&docid=<?php echo (isset($doc['docid'])?$doc['docid']:''); ?>"><h4 class="title"><?php echo (isset($doc['doctitle'])?$doc['doctitle']:''); ?></h4></a>
					<p><?php echo (isset($doc['docdescribe'])?$doc['docdescribe']:''); ?></p>
					<hr/>
					<p>
						<span class="pull-right">
							<a href=""><span class="glyphicon glyphicon-time"></span> <span><?php echo date('Y-m-d H:i:s',$doc['docinputtime']); ?></span></a>&nbsp;&nbsp;
						</span>
					</p>
				</div>
			</div>
			<?php } ?>
		</div>
	</div>
</div>
<?php $this->_compileInclude('footer'); ?>
</body>
</html>