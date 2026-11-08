{x2;include:header}
<body>
<script src="app/exam/styles/js/plugin.js"></script>
{x2;include:nav}
<div class="row-fluid">
    <div class="container-fluid examcontent">
        <div class="exambox" id="datacontent">
            <div class="examform" style="position:relative;">
                <div class="scoreArea">{x2;(isset($sessionvars['examsessionscore']) ? $sessionvars['examsessionscore'] : '')}</div>
                <ul class="breadcrumb">
                    <li>
                        <span class="icon-home"></span> <a href="index.php?exam">考场选择</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="index.php?exam-app-basics">{x2;(isset($data['currentbasic']['basic']) ? $data['currentbasic']['basic'] : '')}</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="index.php?exam-app-exam">正式考试</a> <span class="divider">/</span>
                    </li>
                    <li class="active">
                        答案与解析
                    </li>
                </ul>
                <h3 class="text-center">{x2;(isset($sessionvars['examsession']) ? $sessionvars['examsession'] : '')}</h3>
                {x2;eval: v:oid = 0}
                {x2;tree:(array)($questype ?? []),quest,qid}
                {x2;if:!empty($sessionvars['examsessionquestion']['questions'][v:quest['questid']]) || !empty($sessionvars['examsessionquestion']['questionrows'][v:quest['questid']])}
                {x2;eval: v:oid++}
                <div id="panel-type{x2;(isset(v:quest['questid']) ? v:quest['questid'] : '')}" class="tab-pane{x2;if:(!$ctype && v:qid == 1) || ($ctype == v:quest['questid'])} active{x2;endif}">
                    <ul class="breadcrumb">
                        <li>
                            <h5>{x2;(isset(v:oid) ? v:oid : '')}、{x2;(isset(v:quest['questype']) ? v:quest['questype'] : '')}</h5>
                        </li>
                    </ul>
                    {x2;eval: v:tid = 0}
                    {x2;tree:(array)($sessionvars['examsessionquestion']['questions'][v:quest['questid']] ?? []),question,qnid}
                    {x2;eval: v:tid++}
                    <div id="question_{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}" class="paperexamcontent decidediv">
                        {x2;if:!empty($sessionvars['examsessionscorelist'][v:question['questionid']]) && $sessionvars['examsessionscorelist'][v:question['questionid']] == $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest['questid']]['score']}<div class="right"></div>{x2;else}<div class="wrong"></div>{x2;endif}
                        <div class="media well">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <span class="badge badge-info questionindex">{x2;(isset(v:tid) ? v:tid : '')}</span>
                                </li>
                                <li class="btn-group pull-right">
                                    <button class="btn" type="button" onclick="javascript:favorquestion('{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}');"><em class="icon-heart" title="收藏"></em></button>
                                </li>
                            </ul>
                            <div class="media-body well text-warning">
                                <a name="question_{x2;(isset(v:question['questionid']) ? v:question['questionid'] : '')}"></a>{x2;realhtml:(isset(v:question['question']) ? v:question['question'] : '')}
                            </div>
                            {x2;if:empty(v:quest['questsort'])}
                            <div class="media-body well">
                                {x2;realhtml:(isset(v:question['questionselect']) ? v:question['questionselect'] : '')}
                            </div>
                            {x2;endif}
                            <div class="media-body well">
                                  <p class="text-error">本题得分：{x2;(isset($sessionvars['examsessionscorelist'][v:question['questionid']]) ? $sessionvars['examsessionscorelist'][v:question['questionid']] : '')}分</p>
                              </div>
                            <div class="media-body well">
                                <ul class="unstyled">
                                    <li class="text-error">正确答案：</li>
                                    <li class="text-success">{x2;realhtml:(isset(v:question['questionanswer']) ? v:question['questionanswer'] : '')}</li>
                                    <li class="text-info">您的答案：</li>
                                    <li class="text-success">{x2;if:isset($sessionvars['examsessionuseranswer'][v:question['questionid']]) && is_array($sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;eval: echo implode('',$sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;else}{x2;realhtml:(isset($sessionvars['examsessionuseranswer'][v:question['questionid']]) ? $sessionvars['examsessionuseranswer'][v:question['questionid']] : '')}{x2;endif}</li>
                                    <li><span class="text-info">所在章：</span>{x2;tree:(array)(v:question['questionknowsid'] ?? []),knowsid,kid}&nbsp;&nbsp;{x2;(isset($globalsections[$globalknows[v:knowsid['knowsid']]['knowssectionid']]['section']) ? $globalsections[$globalknows[v:knowsid['knowsid']]['knowssectionid']]['section'] : '')}&nbsp;{x2;endtree}</li>
                                    <li class="text-success"><span class="text-info">知识点：</span>{x2;tree:(array)(v:question['questionknowsid'] ?? []),knowsid,kid}&nbsp;&nbsp;{x2;(isset($globalknows[v:knowsid['knowsid']]['knows']) ? $globalknows[v:knowsid['knowsid']]['knows'] : '')}&nbsp;{x2;endtree}</li>
                                    <li class="text-info">答案解析：</li>
                                    <li class="text-success">{x2;realhtml:(isset(v:question['questiondescribe']) ? v:question['questiondescribe'] : '')}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    {x2;endtree}
                    {x2;tree:(array)($sessionvars['examsessionquestion']['questionrows'][v:quest['questid']] ?? []),questionrow,qrid}
                    {x2;eval: v:tid++}
                    <div id="questionrow_{x2;(isset(v:questionrow['qrid']) ? v:questionrow['qrid'] : '')}">
                        <div class="media well">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <span class="badge badge-info questionindex">{x2;(isset(v:tid) ? v:tid : '')}</span>
                                </li>
                            </ul>
                            <div class="media-body well">
                                {x2;realhtml:(isset(v:questionrow['qrquestion']) ? v:questionrow['qrquestion'] : '')}
                            </div>
                            {x2;tree:(array)(v:questionrow['data'] ?? []),data,did}
                            <div class="paperexamcontent decidediv">
                                {x2;if:!empty($sessionvars['examsessionscorelist'][v:data['questionid']]) && $sessionvars['examsessionscorelist'][v:data['questionid']] == $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest['questid']]['score']}<div class="right"></div>{x2;else}<div class="wrong"></div>{x2;endif}
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <span class="badge questionindex">{x2;(isset(v:did) ? v:did : '')}</span>
                                    </li>
                                    <li class="btn-group pull-right">
                                        <button class="btn" type="button" onclick="javascript:favorquestion('{x2;(isset(v:data['questionid']) ? v:data['questionid'] : '')}');"><em class="icon-heart" title="收藏"></em></button>
                                    </li>
                                </ul>
                                <div class="media-body well text-warning">
                                    <a name="question_{x2;(isset(v:data['questionid']) ? v:data['questionid'] : '')}"></a>{x2;realhtml:(isset(v:data['question']) ? v:data['question'] : '')}
                                </div>
                                {x2;if:empty(v:quest['questsort'])}
                                <div class="media-body well">
                                    {x2;realhtml:(isset(v:data['questionselect']) ? v:data['questionselect'] : '')}
                                </div>
                                {x2;endif}
                                <div class="media-body well">
                                      <p class="text-error">本题得分：{x2;(isset($sessionvars['examsessionscorelist'][v:data['questionid']]) ? $sessionvars['examsessionscorelist'][v:data['questionid']] : '')}分</p>
                                  </div>
                                <div class="media-body well">
                                    <ul class="unstyled">
                                        <li class="text-error">正确答案：</li>
                                        <li class="text-success">{x2;realhtml:(isset(v:data['questionanswer']) ? v:data['questionanswer'] : '')}</li>
                                        <li class="text-info">您的答案：</li>
                                        <li class="text-success">{x2;if:isset($sessionvars['examsessionuseranswer'][v:data['questionid']]) && is_array($sessionvars['examsessionuseranswer'][v:data['questionid']])}{x2;eval: echo implode('',$sessionvars['examsessionuseranswer'][v:data['questionid']])}{x2;else}{x2;realhtml:(isset($sessionvars['examsessionuseranswer'][v:data['questionid']]) ? $sessionvars['examsessionuseranswer'][v:data['questionid']] : '')}{x2;endif}</li>
                                        <li><span class="text-info">所在章：</span>{x2;tree:(array)(v:questionrow['qrknowsid'] ?? []),knowsid,kid}&nbsp;&nbsp;{x2;(isset($globalsections[$globalknows[v:knowsid['knowsid']]['knowssectionid']]['section']) ? $globalsections[$globalknows[v:knowsid['knowsid']]['knowssectionid']]['section'] : '')}&nbsp;{x2;endtree}</li>
                                        <li><span class="text-info">知识点：</span>{x2;tree:(array)(v:questionrow['qrknowsid'] ?? []),knowsid,kid}&nbsp;&nbsp;{x2;(isset($globalknows[v:knowsid['knowsid']]['knows']) ? $globalknows[v:knowsid['knowsid']]['knows'] : '')}&nbsp;{x2;endtree}</li>
                                        <li class="text-info">答案解析：</li>
                                        <li class="text-success">{x2;realhtml:(isset(v:data['questiondescribe']) ? v:data['questiondescribe'] : '')}</li>
                                    </ul>
                                </div>
                            </div>
                            {x2;endtree}
                        </div>
                    </div>
                    {x2;endtree}
                </div>
                {x2;endif}
                {x2;endtree}
            </div>
        </div>
    </div>
</div>
{x2;include:foot}
</body>
</html>
