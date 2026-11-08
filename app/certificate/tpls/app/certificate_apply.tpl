{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="box itembox" style="margin-bottom:0px;">
				<div class="col-xs-12">
					<ol class="breadcrumb">
					  <li><a href="index.php">首页</a></li>
					  <li><a href="index.php?certificate">办理证书</a></li>
					  <li class="active">{x2;(isset($ce['cetitle'])?$ce['cetitle']:'')}</li>
					</ol>
				</div>
			</div>
			<div class="box itembox" style="padding-top:20px;">
				<form class="form-horizontal" style="padding:20px;">
					<fieldset>
						<div class="col-xs-12">
							<h3 class="text-center">{x2;(isset($ce['cetitle'])?$ce['cetitle']:'')}</h3>
							<hr/>
						</div>
						<div>
							<div class="col-xs-12">
								<table class="table table-bordered">
									<tr>
										<td width="25%">证书名称：</td>
										<td width="25%">{x2;(isset($ce['cetitle'])?$ce['cetitle']:'')}</td>
										<td width="25%">申请费用：</td>
										<td width="25%">{x2;(isset($ce['ceprice'])?$ce['ceprice']:'')}积分</td>
									</tr>
									<tr>
										<td>需过考试：</td>
										<td>{x2;(isset($basic['basic'])?$basic['basic']:'')}</td>
										<td>加入时间：</td>
										<td>{x2;date:$ce['cetime'] ?? 0,'Y-m-d'}</td>
									</tr>
									<tr>
										<td>身份证号：</td>
										<td>{x2;(isset($_user['userpassport'])?$_user['userpassport']:'')}</td>
										<td>姓名：</td>
										<td>{x2;(isset($_user['usertruename'])?$_user['usertruename']:'')}</td>
									</tr>
									<tr>
										<td>性别：</td>
										<td>{x2;(isset($_user['usergender'])?$_user['usergender']:'')}</td>
										<td>文化程度：</td>
										<td>{x2;(isset($_user['userdegree'])?$_user['userdegree']:'')}</td>
									</tr>
									<tr>
										<td>地址：</td>
										<td>{x2;(isset($_user['useraddress'])?$_user['useraddress']:'')}</td>
										<td>联系电话：</td>
										<td>{x2;(isset($_user['userphone'])?$_user['userphone']:'')}</td>
									</tr>
								</table>
								<div class="form-group">
									<div class="col-sm-12 text-center">
										<a class="btn btn-primary confirm" msg="申请证书将扣除余额{x2;(isset($ce['ceprice'])?$ce['ceprice']:'')}积分，确定支付吗？" href="index.php?certificate-app-certificate-apply&apply=1&ceid={x2;(isset($ce['ceid'])?$ce['ceid']:'')}">资料无误 申请证书</a>
										<a class="btn btn-danger" href="index.php?user-center-privatement">修改资料</a>
										<a class="btn btn-info" href="index.php?user-center-payfor">充值</a>
										<input type="hidden" name="modifyuserinfo" value="1"/>
										<input type="hidden" name="page" value="{x2;(isset($page)?$page:'')}"/>
                                        {x2;if:isset($search) && is_array($search)}
                                        {x2;tree:(array)($search ?? []),arg,aid}
										<input type="hidden" name="search[{x2;(isset(v:key)?v:key:'')}]" value="{x2;(isset(v:arg)?v:arg:'')}"/>
                                        {x2;endtree}
                                        {x2;endif}
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12" id="content">
							{x2;(isset(realhtml:$ce['cedescribe'])?realhtml:$ce['cedescribe']:'')}
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>
