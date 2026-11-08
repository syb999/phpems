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
							<li><a href="index.php?{x2;(isset($_app)?$_app:'')}-master">{x2;(isset($apps[$_app]['appname'])?$apps[$_app]['appname']:'')}</a></li>
							<li class="active">角色管理</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
						角色列表
						<a class="pull-right btn btn-primary" href="index.php?user-master-actor-add">添加角色</a>
					</h4>
					<table class="table table-hover table-bordered">
						<thead>
							<tr class="info">
								<th>ID</th>
								<th>角色名</th>
								<th>默认角色</th>
								<th>绑定模型</th>
								<th>角色描述</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							{x2;tree:(array)($actors['data'] ?? []),group,gid}
							<tr>
								<td>{x2;(isset(v:group['groupid'])?v:group['groupid']:'')}</td>
								<td>{x2;(isset(v:group['groupname'])?v:group['groupname']:'')}</td>
								<td>{x2;if:!empty(v:group['groupdefault'])}<a class="glyphicon glyphicon-ok"></a>{x2;else}<a class="glyphicon glyphicon-remove ajax" href="index.php?user-master-actor-selectactor&groupid={x2;(isset(v:group['groupid'])?v:group['groupid']:'')}&page={x2;(isset($page)?$page:'')}{x2;(isset($u)?$u:'')}"></a>{x2;endif}</td>
								<td>{x2;(isset($modules[v:group['groupmoduleid']]['modulename'])?$modules[v:group['groupmoduleid']]['modulename']:'')}</td>
								<td>{x2;(isset(v:group['groupdescribe'])?v:group['groupdescribe']:'')}</td>
								<td>
									<div class="btn-group">
										<a class="btn" href="index.php?user-master-actor-modifyactor&groupid={x2;(isset(v:group['groupid'])?v:group['groupid']:'')}&page={x2;(isset($page)?$page:'')}{x2;(isset($u)?$u:'')}" title="修改角色"><em class="glyphicon glyphicon-edit"></em></a>
										<a msg="删除后不可恢复，您确定要进行此操作吗？" class="btn confirm" href="index.php?user-master-actor-delactor&groupid={x2;(isset(v:group['groupid'])?v:group['groupid']:'')}&page={x2;(isset($page)?$page:'')}{x2;(isset($u)?$u:'')}" title="删除角色"><em class="glyphicon glyphicon-remove"></em></a>
									</div>
								</td>
							</tr>
							{x2;endtree}
						</tbody>
					</table>
					<ul class="pagination pagination-right">
						{x2;(isset($actors['pages'])?$actors['pages']:'')}
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