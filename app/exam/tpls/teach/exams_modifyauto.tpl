{x2;if:empty($userhash)}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
    <div class="row-fluid">
        <div class="main">
            <div class="col-xs-2 leftmenu">
                {x2;include:menu}
            </div>
            <div id="datacontent">
{x2;endif}
                <div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
                    <div class="col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="index.php?{x2;(isset($_app) ? $_app : '')}-teach">{x2;(isset($apps[$_app]['appname']) ? $apps[$_app]['appname'] : '')}</a></li>
                            <li><a href="index.php?{x2;(isset($_app) ? $_app : '')}-teach-exams&page={x2;(isset($page) ? $page : '')}{x2;(isset($u) ? $u : '')}">试卷管理</a></li>
                            <li class="active">随机组卷修改</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        随机组卷修改
                        <a class="btn btn-primary pull-right" href="index.php?{x2;(isset($_app) ? $_app : '')}-teach-exams&page={x2;(isset($page) ? $page : '')}{x2;(isset($u) ? $u : '')}">试卷管理</a>
                    </h4>
                    <form action="index.php?exam-teach-exams-modify" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="content">试卷名称：</label>
                              <div class="col-sm-4">
                                  <input class="form-control" type="text" name="args[exam]" value="{x2;(isset($exam['exam']) ? $exam['exam'] : '')}" needle="needle" msg="您必须为该试卷输入一个名称"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">评卷方式</label>
                            <div class="col-sm-9">
                                <label class="radio-inline">
                                    <input name="args[examdecide]" type="radio" value="1"{x2;if:!empty($exam['examdecide'])} checked{x2;endif}/>教师评卷
                                </label>
                                <label class="radio-inline">
                                    <input name="args[examdecide]" type="radio" value="0"{x2;if:empty($exam['examdecide'])} checked{x2;endif}/>学生自评
                                </label>
                                <span class="help-block">教师评卷时有主观题则需要教师在后台评分后才能显示分数，无主观题自动显示分数。</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">考试科目：</label>
                              <div class="col-sm-9">
                                  <label class="radio">{x2;(isset($subjects[$exam['examsubject']]['subject']) ? $subjects[$exam['examsubject']]['subject'] : '')}</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="content">考试时间：</label>
                              <div class="col-sm-9 form-inline">
                                  <input class="form-control" type="text" name="args[examsetting][examtime]" value="{x2;(isset($exam['examsetting']['examtime']) ? $exam['examsetting']['examtime'] : '')}" size="4" needle="needle" class="inline"/> 分钟
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="content">来源：</label>
                              <div class="col-sm-4">
                                  <input class="form-control" type="text" name="args[examsetting][comfrom]" value="{x2;(isset($exam['examsetting']['comfrom']) ? $exam['examsetting']['comfrom'] : '')}" size="4"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="content">试卷总分：</label>
                              <div class="col-sm-4">
                                  <input class="form-control" type="text" name="args[examsetting][score]" value="{x2;(isset($exam['examsetting']['score']) ? $exam['examsetting']['score'] : '')}" size="4" needle="needle" msg="你要为本考卷设置总分" datatype="number"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="content">及格线：</label>
                              <div class="col-sm-4">
                                  <input class="form-control" type="text" name="args[examsetting][passscore]" value="{x2;(isset($exam['examsetting']['passscore']) ? $exam['examsetting']['passscore'] : '')}" size="4" needle="needle" msg="你要为本考卷设置一个及格分数线" datatype="number"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">题型排序</label>
                            <div class="col-sm-9">
                                <div class="sortable btn-group">
                                    {x2;if:!empty($exam['examsetting']['questypelite'])}
                                    {x2;tree:(array)($exam['examsetting']['questypelite'] ?? []),qlid,eqid}
                                    <a class="btn btn-primary questpanel panel_{x2;(isset(v:key) ? v:key : '')}">{x2;(isset($questypes[v:key]['questype']) ? $questypes[v:key]['questype'] : '')}<input type="hidden" name="args[examsetting][questypelite][{x2;(isset(v:key) ? v:key : '')}]" value="1" class="questypepanelinput" id="panel_{x2;(isset(v:key) ? v:key : '')}"/></a>
                                    {x2;endtree}
                                    {x2;else}
                                    {x2;tree:(array)($questypes ?? []),questype,qid}
                                    <a class="btn btn-primary questpanel panel_{x2;(isset(v:questype['questid']) ? v:questype['questid'] : '')}">{x2;(isset(v:questype['questype']) ? v:questype['questype'] : '')}<input type="hidden" name="args[examsetting][questypelite][{x2;(isset(v:questype['questid']) ? v:questype['questid'] : '')}]" value="1" class="questypepanelinput" id="panel_{x2;(isset(v:questype['questid']) ? v:questype['questid'] : '')}"/></a>
                                    {x2;endtree}
                                    {x2;endif}
                                </div>
                                <span class="help-block">拖拽进行题型排序</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">题量配比模式：</label>
                              <div class="col-sm-9">
                                <label class="radio-inline">
                                      <input type="radio" autocomplete="off" class="input-text" name="args[examsetting][scalemodel]" value="1" onchange="javascript:$('#modeplane').html($('#sptype').html());"{x2;if:!empty($exam['examsetting']['scalemodel'])} checked{x2;endif}/> 开启
                                  </label>
                                  <label class="radio-inline">
                                      <input type="radio" autocomplete="off" class="input-text" name="args[examsetting][scalemodel]" value="0" onchange="javascript:$('#modeplane').html($('#normaltype').html());"{x2;if:empty($exam['examsetting']['scalemodel'])} checked{x2;endif}/> 关闭
                                  </label>
                           </div>
                        </div>
                        <div id="modeplane">
                            {x2;if:!empty($exam['examsetting']['scalemodel'])}
                            <div class="form-group">
                                <label class="control-label col-sm-2">题量配比：</label>
                                  <div class="col-sm-9">
                                      <label class="radio-inline">题量配比模式关闭时，此设置不生效。题量配比操作繁琐，请尽量熟悉后再行操作。题量配比会受考场中考试范围制约，请谨慎配置。</label>
                               </div>
                            </div>
                            {x2;tree:(array)($questypes ?? []),questype,qid}
                            <div class="form-group questpanel panel_{x2;(isset(v:questype['questid']) ? v:questype['questid'] : '')}">
                                <label class="control-label col-sm-2" for="content">{x2;(isset(v:questype['questype']) ? v:questype['questype'] : '')}：</label>
                                <div class="col-sm-9 form-inline">
                                    <span class="info">共&nbsp;</span>
                                    <input id="iselectallnumber_{x2;(isset(v:key) ? v:key : '')}" type="text" class="form-control" needle="needle" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][number]" value="{x2;eval: echo intval($exam['examsetting']['questype'][v:key]['number'])}" size="2" msg="您必须填写总题数"/>
                                    <span class="info">&nbsp;题，每题&nbsp;</span><input class="form-control" needle="needle" type="text" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][score]" value="{x2;eval: echo floatval($exam['examsetting']['questype'][v:key]['score'])}" size="2" msg="您必须填写每题的分值"/>
                                    <span class="info">&nbsp;分，描述&nbsp;</span><input class="form-control" type="text" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][describe]" value="{x2;(isset($exam['examsetting']['questype'][v:key]['describe']) ? $exam['examsetting']['questype'][v:key]['describe'] : '')}" size="12"/>
                                </div>
                            </div>
                            <div class="form-group questpanel panel_{x2;(isset(v:questype['questid']) ? v:questype['questid'] : '')}">
                                <label class="control-label col-sm-2" for="content">配比率：</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" rows="7" cols="4" name="args[examsetting][examscale][{x2;(isset(v:questype['questid']) ? v:questype['questid'] : '')}]">{x2;(isset($exam['examsetting']['examscale'][v:questype['questid']]) ? $exam['examsetting']['examscale'][v:questype['questid']] : '')}</textarea>
                                </div>
                            </div>
                            {x2;endtree}
                            {x2;else}
                            {x2;tree:(array)($questypes ?? []),questype,qid}
                            <div class="form-group questpanel panel_{x2;(isset(v:questype['questid']) ? v:questype['questid'] : '')}">
                                <label class="control-label col-sm-2" for="content">{x2;(isset(v:questype['questype']) ? v:questype['questype'] : '')}：</label>
                                <div class="col-sm-9 form-inline">
                                    <span class="info">共&nbsp;</span>
                                    <input id="iselectallnumber_{x2;(isset(v:key) ? v:key : '')}" type="text" class="form-control" needle="needle" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][number]" value="{x2;eval: echo intval($exam['examsetting']['questype'][v:key]['number'])}" size="1" msg="您必须填写总题数"/>
                                    <span class="info">&nbsp;题，每题&nbsp;</span><input class="form-control" needle="needle" type="text" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][score]" value="{x2;eval: echo floatval($exam['examsetting']['questype'][v:key]['score'])}" size="1" msg="您必须填写每题的分值"/>
                                    <span class="info">&nbsp;分，描述&nbsp;</span><input class="form-control" type="text" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][describe]" value="{x2;(isset($exam['examsetting']['questype'][v:key]['describe']) ? $exam['examsetting']['questype'][v:key]['describe'] : '')}" size="8"/>
                                    <span class="info">&nbsp;易&nbsp;</span><input class="form-control" type="text" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][easynumber]" value="{x2;eval: echo intval($exam['examsetting']['questype'][v:key]['easynumber'])}" size="1" msg="您需要填写简单题的数量，最小为0"/>
                                      <span class="info">&nbsp;中&nbsp;</span><input class="form-control" type="text" needle="needle" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][middlenumber]" value="{x2;eval: echo intval($exam['examsetting']['questype'][v:key]['middlenumber'])}" size="1" msg="您需要填写中等难度题的数量，最小为0"/>
                                      <span class="info">&nbsp;难&nbsp;</span><input class="form-control" type="text" needle="needle" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][hardnumber]" value="{x2;eval: echo intval($exam['examsetting']['questype'][v:key]['hardnumber'])}" size="1" datatype="number" msg="您需要填写难题的数量，最小为0"/>
                                </div>
                            </div>
                            {x2;endtree}
                            {x2;endif}
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="submitsetting" value="1"/>
                                  <input type="hidden" name="page" value="{x2;(isset($page) ? $page : '')}" />
                                  <input name="args[examsubject]" type="hidden" value="{x2;(isset($exam['examsubject']) ? $exam['examsubject'] : '')}">
                                  <input name="examid" type="hidden" value="{x2;(isset($exam['examid']) ? $exam['examid'] : '')}">
                                {x2;if:isset($search) && is_array($search)}{x2;tree:(array)($search ?? []),arg,aid}
                                    <input type="hidden" name="search[{x2;(isset(v:key) ? v:key : '')}]" value="{x2;(isset(v:arg) ? v:arg : '')}"/>
                                {x2;endtree}{x2;endif}
                            </div>
                        </div>
                    </form>
                    <div id="sptype" class="hide">
                        <div class="form-group">
                            <label class="control-label col-sm-2">题量配比：</label>
                              <div class="col-sm-9">
                                  <label class="radio inline">题量配比模式关闭时，此设置不生效。题量配比操作繁琐，请尽量熟悉后再行操作。题量配比会受考场中考试范围制约，请谨慎配置。</label>
                           </div>
                        </div>
                        {x2;tree:(array)($questypes ?? []),questype,qid}
                        <div class="form-group questpanel panel_{x2;(isset(v:questype['questid']) ? v:questype['questid'] : '')}">
                            <label class="control-label col-sm-2" for="content">{x2;(isset(v:questype['questype']) ? v:questype['questype'] : '')}：</label>
                            <div class="col-sm-9 form-inline">
                                <span class="info">共&nbsp;</span>
                                <input id="iselectallnumber_{x2;(isset(v:key) ? v:key : '')}" type="text" class="form-control" needle="needle" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][number]" value="{x2;eval: echo intval($exam['examsetting']['questype'][v:key]['number'])}" size="2" msg="您必须填写总题数"/>
                                <span class="info">&nbsp;题，每题&nbsp;</span><input class="form-control" needle="needle" type="text" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][score]" value="{x2;eval: echo floatval($exam['examsetting']['questype'][v:key]['score'])}" size="2" msg="您必须填写每题的分值"/>
                                <span class="info">&nbsp;分，描述&nbsp;</span><input class="form-control" type="text" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][describe]" value="{x2;(isset($exam['examsetting']['questype'][v:key]['describe']) ? $exam['examsetting']['questype'][v:key]['describe'] : '')}" size="12"/>
                            </div>
                        </div>
                        <div class="form-group questpanel panel_{x2;(isset(v:questype['questid']) ? v:questype['questid'] : '')}">
                            <label class="control-label col-sm-2" for="content">配比率：</label>
                            <div class="col-sm-9">
                                <textarea class="form-control" rows="7" cols="4" name="args[examsetting][examscale][{x2;(isset(v:questype['questid']) ? v:questype['questid'] : '')}]">{x2;(isset($exam['examsetting']['examscale'][v:questype['questid']]) ? $exam['examsetting']['examscale'][v:questype['questid']] : '')}</textarea>
                            </div>
                        </div>
                        {x2;endtree}
                    </div>
                    <div id="normaltype" class="hide">
                        {x2;tree:(array)($questypes ?? []),questype,qid}
                        <div class="form-group questpanel panel_{x2;(isset(v:questype['questid']) ? v:questype['questid'] : '')}">
                            <label class="control-label col-sm-2" for="content">{x2;(isset(v:questype['questype']) ? v:questype['questype'] : '')}：</label>
                            <div class="col-sm-9 form-inline">
                                <span class="info">共&nbsp;</span>
                                <input id="iselectallnumber_{x2;(isset(v:key) ? v:key : '')}" type="text" class="form-control" needle="needle" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][number]" value="{x2;eval: echo intval($exam['examsetting']['questype'][v:key]['number'])}" size="1" msg="您必须填写总题数"/>
                                <span class="info">&nbsp;题，每题&nbsp;</span><input class="form-control" needle="needle" type="text" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][score]" value="{x2;eval: echo floatval($exam['examsetting']['questype'][v:key]['score'])}" size="1" msg="您必须填写每题的分值"/>
                                <span class="info">&nbsp;分，描述&nbsp;</span><input class="form-control" type="text" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][describe]" value="{x2;(isset($exam['examsetting']['questype'][v:key]['describe']) ? $exam['examsetting']['questype'][v:key]['describe'] : '')}" size="8"/>
                                <span class="info">&nbsp;易&nbsp;</span><input class="form-control" type="text" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][easynumber]" value="{x2;eval: echo intval($exam['examsetting']['questype'][v:key]['easynumber'])}" size="1" msg="您需要填写简单题的数量，最小为0"/>
                                  <span class="info">&nbsp;中&nbsp;</span><input class="form-control" type="text" needle="needle" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][middlenumber]" value="{x2;eval: echo intval($exam['examsetting']['questype'][v:key]['middlenumber'])}" size="1" msg="您需要填写中等难度题的数量，最小为0"/>
                                  <span class="info">&nbsp;难&nbsp;</span><input class="form-control" type="text" needle="needle" name="args[examsetting][questype][{x2;(isset(v:key) ? v:key : '')}][hardnumber]" value="{x2;eval: echo intval($exam['examsetting']['questype'][v:key]['hardnumber'])}" size="1" datatype="number" msg="您需要填写难题的数量，最小为0"/>
                            </div>
                        </div>
                        {x2;endtree}
                    </div>
                </div>
            </div>
{x2;if:empty($userhash)}
        </div>
    </div>
</div>
<script>
$.getJSON('index.php?exam-teach-basic-getsubjectquestype&subjectid={x2;(isset($exam['examsubject']) ? $exam['examsubject'] : '')}&'+Math.random(),function(data){$('.questpanel').hide();$('.questypepanelinput').val('0');for(x in data){$('.panel_'+data[x]).show();$('#panel_'+data[x]).val('1');}});
</script>
{x2;include:footer}
</body>
</html>
{x2;endif}
