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
                    视频课程
					<a style="font-size:2rem;color:#FFFFFF;" href="index.php?user-phone" class="pull-right glyphicon glyphicon-user ajax" data-target="user" data-page="user"></a>
				</h5>
			</header>
			{x2;tree:(array)($catids ?? []),cat,cid}
			<div class="container-fluid">
				<div class="row-fluid">
					<h4 class="title"><a href="index.php?course-phone-category&catid={x2;(isset(v:cat['catid'])?v:cat['catid']:'')}" class="ajax" data-target="coursecategory" data-page="coursecategory">{x2;(isset(v:cat['catname'])?v:cat['catname']:'')}</a></h4>
					{x2;tree:(array)($contents[v:cat['catid']]['data'] ?? []),content,cid}
					<div class="col-xs-6" style="padding:2px;">
						<div style="padding:1rem;background-color:#FFFFFF;overflow: auto;">
							<a href="index.php?course-phone-course&csid={x2;(isset(v:content['csid'])?v:content['csid']:'')}" class="ajax" data-target="courseplatform" data-page="courseplatform">
								<img src="{x2;(isset(v:content['csthumb'])?v:content['csthumb']:'')}" alt="">
							</a>
							<h5 class="text-center">{x2;(isset(v:content['cstitle'])?v:content['cstitle']:'')}</h5>
						</div>
					</div>
					{x2;endtree}
				</div>
			</div>
			{x2;endtree}
		</div>
        {x2;if:!empty($userhash)}
	</div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}