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
						<li><a href="index.php?docs-app-docs&docid=<?php echo (isset($this->tpl_var['doc']['docid'])?$this->tpl_var['doc']['docid']:''); ?>"><?php echo (isset($this->tpl_var['doc']['doctitle'])?$this->tpl_var['doc']['doctitle']:''); ?></a></li>
						<li class="active">历史版本</li>
					</ol>
				</div>
			</div>
			<div class="box itembox" style="padding-top:20px;">
				<h2 class="text-left"><?php echo (isset($this->tpl_var['doc']['doctitle'])?$this->tpl_var['doc']['doctitle']:''); ?>
					<span class="pull-right">
					<?php if(!empty($this->tpl_var['_user']['userid'])){ ?>
					<a class="btn btn-danger" href="index.php?docs-app-mydoc-history&docid=<?php echo (isset($this->tpl_var['doc']['docid'])?$this->tpl_var['doc']['docid']:''); ?>">我提交的版本</a>
					<?php } else { ?>
					<a class="btn btn-danger" href="javascript:;" onclick="javascript:$.loginbox.show();">我提交的版本</a>
					<?php } ?>
					</span>
				</h2>
				<table class="table table-bordered">
					<thead>
					<tr class="bg-info">
						<th width="80">ID</th>
						<th>修改日志</th>
						<th width="180">编辑时间</th>
						<th width="100">协作用户</th>
					</tr>
					</thead>
					<tbody>
					<?php $hid = 0;
 foreach((array)($this->tpl_var['histories']['data'] ?? []) as $key => $history){ 
 $hid++; ?>
					<tr>
						<td><?php echo (isset($history['dhid'])?$history['dhid']:''); ?></td>
						<td><?php if((isset($this->tpl_var['doc']['doccontentid']) ? $this->tpl_var['doc']['doccontentid'] : null) == $history['dhid']){ ?>【 当前版本 】<?php } ?><a href="index.php?docs-app-docs-viewhistory&dhid=<?php echo (isset($history['dhid'])?$history['dhid']:''); ?>"><?php echo (isset($history['dhtitle'])?$history['dhtitle']:''); ?></a></td>
						<td><?php echo date('Y-m-d H:i:s',$history['dhtime']); ?></td>
						<td><?php echo (isset($history['dhusername'])?$history['dhusername']:''); ?></td>
					</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
			<ul class="pagination pull-right">
				<?php echo (isset($this->tpl_var['contents']['pages'])?$this->tpl_var['contents']['pages']:''); ?>
			</ul>
		</div>
	</div>
</div>
<?php $this->_compileInclude('footer'); ?>
</body>
</html>