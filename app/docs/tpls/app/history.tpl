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
						<li><a href="index.php?docs-app-docs&docid={x2;(isset($doc['docid'])?$doc['docid']:'')}">{x2;(isset($doc['doctitle'])?$doc['doctitle']:'')}</a></li>
						<li class="active">历史版本</li>
					</ol>
				</div>
			</div>
			<div class="box itembox" style="padding-top:20px;">
				<h2 class="text-left">{x2;(isset($doc['doctitle'])?$doc['doctitle']:'')}
					<span class="pull-right">
					{x2;if:!empty($_user['userid'])}
					<a class="btn btn-danger" href="index.php?docs-app-mydoc-history&docid={x2;(isset($doc['docid'])?$doc['docid']:'')}">我提交的版本</a>
					{x2;else}
					<a class="btn btn-danger" href="javascript:;" onclick="javascript:$.loginbox.show();">我提交的版本</a>
					{x2;endif}
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
					{x2;tree:(array)($histories['data'] ?? []),history,hid}
					<tr>
						<td>{x2;(isset(v:history['dhid'])?v:history['dhid']:'')}</td>
						<td>{x2;if:(isset($doc['doccontentid']) ? $doc['doccontentid'] : null) == v:history['dhid']}【 当前版本 】{x2;endif}<a href="index.php?docs-app-docs-viewhistory&dhid={x2;(isset(v:history['dhid'])?v:history['dhid']:'')}">{x2;(isset(v:history['dhtitle'])?v:history['dhtitle']:'')}</a></td>
						<td>{x2;date:v:history['dhtime'],'Y-m-d H:i:s'}</td>
						<td>{x2;(isset(v:history['dhusername'])?v:history['dhusername']:'')}</td>
					</tr>
					{x2;endtree}
					</tbody>
				</table>
			</div>
			<ul class="pagination pull-right">
				{x2;(isset($contents['pages'])?$contents['pages']:'')}
			</ul>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>