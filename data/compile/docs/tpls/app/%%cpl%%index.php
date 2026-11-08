<?php $this->_compileInclude('header'); ?>
<body>
<?php $this->_compileInclude('nav'); ?>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main" style="overflow:hidden;">
			<div class="col-xs-10 box" style="padding:0px;width:79%;padding: 20px 10px 10px 10px;">
                <?php $did = 0;
 foreach((array)($this->tpl_var['docs']['top']['data'] ?? []) as $key => $doc){ 
 $did++; ?>
				<div class="col-xs-3">
					<a href="index.php?docs-app-docs&docid={x2;(isset(v:doc['docid'])?v:doc['docid']:'')}" class="thumbnail">
						<img src="{x2;(isset(v:doc['docthumb'])?v:doc['docthumb']:'')}" alt="" width="100%">
					</a>
					<h5 class="text-center"><?php echo $this->G->make('strings')->subString($doc['doctitle'],36); ?></h5>
				</div>
                <?php } ?>
			</div>
			<div class="col-xs-2 box itembox pull-right" style="width:20%;overflow:hidden;padding: 20px 20px 30px 20px;">
				<h4 class="text-center" style="line-height: 2em">共有词条 {x2;(isset($number['all'])?$number['all']:'')} 个</h4>
				<h4 class="text-center" style="line-height: 2em">待完善词条 {x2;(isset($number['more'])?$number['more']:'')} 个</h4>
				<h5>&nbsp;</h5>
				<p><a class="btn btn-primary btn-block" href="index.php?docs-app-category-needmore">协助完善词条</a></p>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-6 box itembox" style="min-height:200px;">
				<h4 class="title">最新词条</h4>
				<ul class="list-unstyled">
                    <?php $did = 0;
 foreach((array)($this->tpl_var['docs']['new']['data'] ?? []) as $key => $doc){ 
 $did++; ?>
					<li><a href="index.php?docs-app-docs&docid={x2;(isset(v:doc['docid'])?v:doc['docid']:'')}" title="{x2;(isset(v:doc['doctitle'])?v:doc['doctitle']:'')}">{x2;(isset(v:doc['doctitle'])?v:doc['doctitle']:'')}</a></li>
                    <?php } ?>
				</ul>
			</div>
			<div class="col-xs-6 box itembox" style="min-height:200px;">
				<h4 class="title"><a href="index.php?docs-app-category-needmore">待完善词条</a></h4>
				<ul class="list-unstyled">
                    <?php $did = 0;
 foreach((array)($this->tpl_var['docs']['more']['data'] ?? []) as $key => $doc){ 
 $did++; ?>
					<li><a href="index.php?docs-app-docs&docid={x2;(isset(v:doc['docid'])?v:doc['docid']:'')}" title="{x2;(isset(v:doc['doctitle'])?v:doc['doctitle']:'')}">{x2;(isset(v:doc['doctitle'])?v:doc['doctitle']:'')}</a></li>
                    <?php } ?>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<?php $cid = 0;
 foreach((array)($this->tpl_var['categories'][0] ?? []) as $key => $cat){ 
 $cid++; ?>
			<div class="col-xs-3 box itembox" style="min-height:200px;">
				<h4 class="title"><a href="index.php?docs-app-category&catid=1">{x2;(isset(v:cat['catname'])?v:cat['catname']:'')}</a></h4>
				<ul class="list-unstyled">
                    <?php if(isset($this->tpl_var['categories'][$cat['catid']]) && is_array($this->tpl_var['categories'][$cat['catid']])){ ?>
					<?php $ccid = 0;
 foreach((array)($this->tpl_var['categories'][$cat['catid']] ?? []) as $key => $ccat){ 
 $ccid++; ?>
					<li><a href="index.php?docs-app-category&catid={x2;(isset(v:ccat['catid'])?v:ccat['catid']:'')}" title="{x2;(isset(v:ccat['catname'])?v:ccat['catname']:'')}">{x2;(isset(v:ccat['catname'])?v:ccat['catname']:'')}</a></li>
					<?php } ?>
                    <?php } ?>
				</ul>
			</div>
			<?php } ?>
		</div>
	</div>
</div>
<?php $this->_compileInclude('footer'); ?>
</body>
</html>
