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
							<li><a href="index.php?<?php echo (isset($this->tpl_var['_app'])?$this->tpl_var['_app']:''); ?>-master"><?php echo (isset($this->tpl_var['apps'][$this->tpl_var['_app']]['appname'])?$this->tpl_var['apps'][$this->tpl_var['_app']]['appname']:''); ?></a></li>
							<li class="active">订单列表</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
						订单列表
					</h4>
					<form action="index.php?bank-master-orders-batremove" method="post">
						<fieldset>
							<table class="table table-hover table-bordered">
								<thead>
									<tr class="info">
										<th><input type="checkbox" class="checkall" target="delids"/></th>
										<th>订单号</th>
										<th>订单客户</th>
										<th>充值金额</th>
										<th>下单时间</th>
										<th>订单状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<?php $oid = 0;
 foreach((array)($this->tpl_var['orders']['data'] ?? []) as $key => $order){ 
 $oid++; ?>
									<tr>
										<td><input type="checkbox" name="delids[<?php echo (isset($order['ordersn'])?$order['ordersn']:''); ?>]" value="1"></td>
										<td><?php echo (isset($order['ordersn'])?$order['ordersn']:''); ?></td>
										<td><?php echo (isset($order['orderuserinfo']['username'])?$order['orderuserinfo']['username']:''); ?></td>
										<td><?php echo (isset($order['orderprice'])?$order['orderprice']:''); ?></td>
										<td><?php echo date('Y-m-d',$order['ordercreatetime']); ?></td>
										<td>
								        	<div class="dropdown">
									        	<a class="dropdown-toggle" href="#" data-toggle="dropdown"><?php echo (isset($this->tpl_var['orderstatus'][$order['orderstatus']])?$this->tpl_var['orderstatus'][$order['orderstatus']]:''); ?><strong class="caret"></strong></a>
									        	<ul class="dropdown-menu">
										        	<li><a href="javascript:;">更改状态</a></li>
													<li class="divider"></li>
													<?php $oid = 0;
 foreach((array)($this->tpl_var['orderstatus'] ?? []) as $key => $os){ 
 $oid++; ?>
													<?php if($key > $order['orderstatus']){ ?>
													<li><a class="ajax" href="index.php?<?php echo (isset($this->tpl_var['_app'])?$this->tpl_var['_app']:''); ?>-master-orders-change&ordersn=<?php echo (isset($order['ordersn'])?$order['ordersn']:''); ?>&orderstatus=<?php echo (isset($key)?$key:''); ?>&page=<?php echo (isset($this->tpl_var['page'])?$this->tpl_var['page']:''); ?>"><?php echo (isset($os)?$os:''); ?></a></li>
													<?php } ?>
													<?php } ?>
												</ul>
						                    </div>
								        </td>
										<td>
											<div class="btn-group">
												<a class="btn confirm" href="index.php?<?php echo (isset($this->tpl_var['_app'])?$this->tpl_var['_app']:''); ?>-master-orders-remove&ordersn=<?php echo (isset($order['ordersn'])?$order['ordersn']:''); ?>&page=<?php echo (isset($this->tpl_var['page'])?$this->tpl_var['page']:''); ?><?php echo (isset($this->tpl_var['u'])?$this->tpl_var['u']:''); ?>" title="删除订单"><em class="glyphicon glyphicon-remove"></em></a>
											</div>
										</td>
									</tr>
									<?php } ?>
								</tbody>
							</table>
							<div class="form-group">
					            <div class="controls">
						            <label class="radio-inline">
						                <input type="radio" name="action" value="delete" checked/>删除
						            </label>
                                    <?php if(isset($this->tpl_var['search']) && is_array($this->tpl_var['search'])){ ?>
						            <?php $sid = 0;
 foreach((array)($this->tpl_var['search'] ?? []) as $key => $arg){ 
 $sid++; ?>
						            <input type="hidden" name="search[<?php echo (isset($key)?$key:''); ?>]" value="<?php echo (isset($arg)?$arg:''); ?>"/>
						            <?php } ?>
                                    <?php } ?>
						            <label class="radio-inline">
						            	<button class="btn btn-primary" type="submit">提交</button>
						            </label>
						            <input type="hidden" name="page" value="<?php echo (isset($this->tpl_var['page'])?$this->tpl_var['page']:''); ?>"/>
						        </div>
					        </div>
							<ul class="pagination pull-right">
								<?php echo (isset($this->tpl_var['orders']['pages'])?$this->tpl_var['orders']['pages']:''); ?>
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
