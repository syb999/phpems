<?php if(!empty($this->tpl_var['userhash'])){ ?>
<?php $this->_compileInclude('header'); ?>
<body>
<?php $this->_compileInclude('nav'); ?>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2" style="padding-top:10px;margin-bottom:0px;">
				<?php $this->_compileInclude('menu'); ?>
			</div>
			<div class="col-xs-10" id="datacontent">
<?php } ?>
				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php?{x2;(isset($_app)?$_app:'')}-master">{x2;(isset($apps[$_app]['appname'])?$apps[$_app]['appname']:'')}</a></li>
							<li class="active">优惠券管理</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
						优惠券列表
						<span class="dropdown pull-right">
							<a data-toggle="dropdown" class="btn btn-primary" href="#">操作 <strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="index.php?bank-master-coupon-batadd">添加优惠券</a></li>
								<li><a href="index.php?bank-master-coupon-outcoupon">导出优惠券</a></li>
							</ul>
						</span>
					</h4>
					<form action="index.php?bank-master-coupon" method="post">
						<fieldset>
							<table class="table table-hover table-bordered">
								<thead>
									<tr class="info">
										<th>券码</th>
										<th>兑换积分</th>
										<th>生成时间</th>
										<th>过期时间</th>
										<th>状态</th>
									</tr>
								</thead>
								<tbody>
									<?php $cid = 0;
 foreach((array)($this->tpl_var['coupons']['data'] ?? []) as $key => $coupon){ 
 $cid++; ?>
									<tr>
										<td>{x2;(isset(v:coupon['couponsn'])?v:coupon['couponsn']:'')}</td>
										<td>{x2;(isset(v:coupon['couponvalue'])?v:coupon['couponvalue']:'')}</td>
										<td><?php echo date('Y-m-d',$coupon['couponaddtime']); ?></td>
										<td><?php echo date('Y-m-d',$coupon['couponendtime']); ?></td>
										<td>
								        	<?php if(!empty($coupon['couponstatus'])){ ?>已使用<?php } else { ?>未使用<?php } ?>
								        </td>
									</tr>
									<?php } ?>
								</tbody>
							</table>
							<div class="form-group">
					            <div class="controls">
						            <label class="radio-inline">
						            	<a class="btn btn-primary confirm" href="index.php?bank-master-coupon-clearouttime" msg="此操作不可回复，确认清理吗？">清理过期优惠券</a>
						            </label>
						        </div>
					        </div>
							<ul class="pagination pull-right">
								{x2;(isset($coupons['pages'])?$coupons['pages']:'')}
							</ul>
						</fieldset>
					</form>
				</div>
			</div>
<?php if(!empty($this->tpl_var['userhash'])){ ?>
		</div>
	</div>
</div>
<?php $this->_compileInclude('footer'); ?>
</body>
</html>
<?php } ?>