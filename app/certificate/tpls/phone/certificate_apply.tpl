{x2;if:!empty($userhash)}
{x2;include:header}
<body>
<div id="content">
	<div class="pages" id="page1">
{x2;endif}
		<div class="pagecontent">
			<header class="container-fluid" style="background-color:#337AB7;">
				<h5 class="text-center">
					<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
					申请新证书
					<a style="font-size:2rem;color:#FFFFFF;" href="index.php?user-phone" class="pull-right glyphicon glyphicon-user ajax" data-target="user" data-page="user"></a>
				</h5>
			</header>
			<div class="container-fluid">
				<h4 class="text-center">确认您的信息</h4>
				<hr/>
				<div class="col-xs-12">
					<div class="form-horizontal" style="padding:20px;">
						<fieldset>
							<table class="table table-bordered">
								<tr>
									<td style="width:8rem;">照片：</td>
									<td><img src="{x2;(isset($_user['photo'])?$_user['photo']:'')}" class="pull-right" style="width:16rem;"/></td>
								</tr>
								<tr>
									<td>证书名：</td>
									<td>{x2;(isset($ce['cetitle'])?$ce['cetitle']:'')}</td>
								</tr>
								<tr>
									<td>价格：</td>
									<td>{x2;(isset($ce['ceprice'])?$ce['ceprice']:'')}积分</td>
								</tr>
								<tr>
									<td>身份证号：</td>
									<td>{x2;(isset($_user['username'])?$_user['username']:'')}</td>
								</tr>
								<tr>
									<td>姓名：</td>
									<td>{x2;(isset($_user['usertruename'])?$_user['usertruename']:'')}</td>
								</tr>
								<tr>
									<td>性别：</td>
									<td>{x2;(isset($_user['usersex'])?$_user['usersex']:'')}</td>
								</tr>
								<tr>
									<td>文化程度：</td>
									<td>{x2;(isset($_user['userdegree'])?$_user['userdegree']:'')}</td>
								</tr>
								<tr>
									<td>地址：</td>
									<td>{x2;(isset($_user['useraddress'])?$_user['useraddress']:'')}</td>
								</tr>
								<tr>
									<td>联系电话：</td>
									<td>{x2;(isset($_user['userphone'])?$_user['userphone']:'')}</td>
								</tr>
							</table>
							<div class="form-group">
								<div class="col-sm-8">
									<a class="btn btn-primary ajax btn-block" msg="申请证书将扣除余额{x2;(isset($ce['ceprice'])?$ce['ceprice']:'')}元，确定支付吗？" href="index.php?certificate-phone-certificate-apply&apply=1&ceid={x2;(isset($ce['ceid'])?$ce['ceid']:'')}">资料无误 申请证书</a>
									<input type="hidden" name="modifyuserinfo" value="1"/>
									<input type="hidden" name="page" value="{x2;(isset($page)?$page:'')}"/>
									{x2;tree:(array)($search ?? []),arg,aid}
									<input type="hidden" name="search[{x2;(isset(v:key)?v:key:'')}]" value="{x2;(isset(v:arg)?v:arg:'')}"/>
									{x2;endtree}
								</div>
						</fieldset>
					</div>
				</div>
			</div>
		</div>
	{x2;if:!empty($userhash)}
    </div>
</div>
</body>
</html>
{x2;endif}