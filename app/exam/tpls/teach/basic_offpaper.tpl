{x2;if:!empty($userhash)}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2" style="padding-top:10px;margin-bottom:0px;">
				{x2;include:menu}
			</div>
			<div class="col-xs-10" id="datacontent">
{x2;endif}
				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php?{x2;(isset($_app)?$_app:'')}-teach">{x2;(isset($apps[$_app]['appname'])?$apps[$_app]['appname']:'')}</a></li>
							<li><a href="index.php?{x2;(isset($_app)?$_app:'')}-teach-basic&page={x2;(isset($page)?$page:'')}{x2;(isset($u)?$u:'')}">考场管理</a></li>
							<li class="active">考试调度</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
						考试调度
						<a class="btn btn-primary pull-right" href="index.php?exam-teach-basic&page={x2;(isset($page)?$page:'')}{x2;(isset($u)?$u:'')}">考场管理</a>
					</h4>
			        <table class="table table-hover table-bordered">
						<thead>
							<tr class="info">
			                    <th>SessionId</th>
								<th>用户名</th>
								<th>真实姓名</th>
								<th>试卷名</th>
								<th>开考时间</th>
								<th>操作</th>
			                </tr>
			            </thead>
			            <tbody>
		                    {x2;tree:(array)($sessionusers['data'] ?? []),user,uid}
							<tr>
								<td>{x2;(isset(v:user['examsessionid'])?v:user['examsessionid']:'')}</td>
								<td>{x2;(isset(v:user['username'])?v:user['username']:'')}</td>
								<td>{x2;(isset(v:user['usertruename'])?v:user['usertruename']:'')}</td>
								<td>{x2;(isset(v:user['examsessionsetting']['exam'])?v:user['examsessionsetting']['exam']:'')}</td>
								<td>{x2;date:v:user['examsessionstarttime'],'m-d H:i'}</td>
								<td>
									<div class="btn-group">
										<a class="btn confirm" msg="确定要强行收卷？" href="index.php?exam-teach-basic-savepaper&examsessionid={x2;(isset(v:user['examsessionid'])?v:user['examsessionid']:'')}" title="强行收卷"><em class="glyphicon glyphicon-remove"></em></a>
									</div>
								</td>
							</tr>
							{x2;endtree}
			        	</tbody>
			        </table>
			        <ul class="pagination pull-right">
			            {x2;(isset($sessionusers['pages'])?$sessionusers['pages']:'')}
			        </ul>
				</div>
			</div>
{x2;if:!empty($userhash)}
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}