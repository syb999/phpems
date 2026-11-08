{x2;if:!empty($userhash)}
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
						<li><a href="index.php?course">课程</a></li>
						{x2;tree:(array)($catbread ?? []),cb,cbid}
						<li><a href="index.php?course-app-category&catid={x2;(isset(v:cb['catid'])?v:cb['catid']:'')}">{x2;(isset(v:cb['catname'])?v:cb['catname']:'')}</a></li>
						{x2;endtree}
						<li class="active">{x2;(isset($cat['catname'])?$cat['catname']:'')}</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="main" id="datacontent">
{x2;endif}
			<div class="col-xs-8" style="padding-left:0px;position:relative;">
				<div class="box itembox" style="height:auto;width:800px;top:0px;z-index:99">
					<h4 class="title" style="line-height:2.5em;">{x2;(isset($content['coursetitle'])?$content['coursetitle']:'')}<a class="pull-right btn btn-primary"><span id="timer_h">00</span>：<span id="timer_m">00</span>：<span id="timer_s">00</span></a></h4>
					<a class="pdfmedia" href="{x2;(isset($content['pdf_file'])?$content['pdf_file']:'')}" style="width:100%;"></a>
					<blockquote class="text-info">{x2;(isset(realhtml:$content['coursedescribe'])?realhtml:$content['coursedescribe']:'')}</blockquote>
				</div>
			</div>
			<div class="col-xs-4 pull-right" style="padding-right:0px;">
				<div class="box itembox" style="padding-top:10px;">
					<h4 class="title">{x2;(isset($course['cstitle'])?$course['cstitle']:'')}</h4>
					<div>
						{x2;(isset(realhtml:$course['csdescribe'])?realhtml:$course['csdescribe']:'')}
					</div>
				</div>
				{x2;tree:(array)($contents['data'] ?? []),content,cid}
				<div class="box" style="padding-top:10px;">
					<div class="col-xs-3">
						<a target="datacontent" href="index.php?course-app-course&page={x2;(isset($page)?$page:'')}&csid={x2;(isset($course['csid'])?$course['csid']:'')}&contentid={x2;(isset(v:content['courseid'])?v:content['courseid']:'')}" class="ajax">
							<img src="{x2;(isset(v:content['coursethumb'])?v:content['coursethumb']:'')}" alt="" width="100%">
						</a>
					</div>
					<div class="col-xs-9">
						<a target="datacontent" href="index.php?course-app-course&page={x2;(isset($page)?$page:'')}&csid={x2;(isset($course['csid'])?$course['csid']:'')}&contentid={x2;(isset(v:content['courseid'])?v:content['courseid']:'')}" class="ajax">
							<h4 class="title" style="margin-top:0px;">
							{x2;if:(isset($content['courseid']) ? $content['courseid'] : null) == v:content['courseid']}
							<span style="color:green;"><em class="glyphicon glyphicon-play-circle"></em></span>
							{x2;endif}
							{x2;if:!empty($cdata['lock'][v:content['courseid']])}
							<span style="color:red;"><em class="glyphicon glyphicon-lock"></em></span>
							{x2;endif}
							{x2;(isset(v:content['coursetitle'])?v:content['coursetitle']:'')}
							{x2;if:$logs[v:content['courseid']] && $logs[v:content['courseid']]['logstatus'] == 1}
							<span class="pull-right" style="color:green;">已学完</span>
							{x2;elseif:$logs[v:content['courseid']] && $logs[v:content['courseid']]['logstatus'] == 0}
							<span class="pull-right" style="color:green;">上次学习到{x2;(isset($logs[v:content['courseid']]['logprogress'])?$logs[v:content['courseid']]['logprogress']:'')}秒</span>
							{x2;else}
							<span class="pull-right" style="color:green;">未学习</span>
							{x2;endif}
							</h4>
						</a>
						<p style="font-size:13px;">{x2;realsubstring:v:content['coursedescribe'],90}</p>
					</div>
				</div>
				{x2;endtree}
				<ul class="pagination pull-right">{x2;(isset($contents['pages'])?$contents['pages']:'')}</ul>
			</div>
			<script type="text/javascript">
				$('a.pdfmedia').media({'width':'100%','height':'800'});
				var setting = {
					time:5,
					hbox:$("#timer_h"),
					mbox:$("#timer_m"),
					sbox:$("#timer_s"),
					finish:function(){
						$.get('index.php?course-app-course-endstatus&courseid={x2;(isset($content['courseid'])?$content['courseid']:'')}&'+Math.random(),function(){
							$("#timer_h").parent().html('History recorded!');
						});
					}
				}
				setting.lefttime = 0;
				countdown(setting);
			</script>
			<div class="modal fade" id="submodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="myModalLabel">Note</h4>
						</div>
						<div class="modal-body">
							<form id="notepform" method="post" action="index.php?course-app-course-setcourse">
								<textarea name="note" class="jckeditor">{x2;(isset($cnote['clsnote'])?$cnote['clsnote']:'')}</textarea>
								<input type="hidden" name="cnoteid" value="{x2;(isset($cnote['clsid'])?$cnote['clsid']:'')}"/>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" onclick="javascript:$('#notepform').submit();" class="btn btn-primary">Save</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">hide</button>
						</div>
					</div>
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