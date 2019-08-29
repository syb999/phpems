<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * 项目维护：oiuv(QQ:7300637) | 定制服务：火眼(QQ:278768688)
 *
 * This source file is subject to the MIT license that is bundled.
 */

class action extends app
{
    public function display()
    {
        $action = $this->ev->url(3);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function reload()
    {
        $args = ['examsessionkey' => 0];
        $this->exam->modifyExamSession($args);
        header('location:index.php?exam-app-exampaper');
    }

    private function sign()
    {
        $sessionvars = $this->exam->getExamSessionBySessionid();
        $questype = $this->basic->getQuestypeList();
        $this->tpl->assign('questype', $questype);
        $this->tpl->assign('sessionvars', $sessionvars);
        $this->tpl->display('exampaper_sign');
    }

    private function ajax()
    {
        switch ($this->ev->url(4)) {
            //获取剩余考试时间
            case 'getexampaperlefttime':
                $sessionvars = $this->exam->getExamSessionBySessionid();
                $lefttime = 0;
                if (0 == $sessionvars['examsessionstatus'] && 1 == $sessionvars['examsessiontype']) {
                    if (TIME > ($sessionvars['examsessionstarttime'] + $sessionvars['examsessiontime'] * 60)) {
                        $lefttime = $sessionvars['examsessiontime'] * 60;
                    } else {
                        $lefttime = TIME - $sessionvars['examsessionstarttime'];
                    }
                }
                echo $lefttime;
                exit();
                break;

            case 'saveUserAnswer':
                $question = $this->ev->post('question');
                foreach ($question as $key => $t) {
                    if ('' == $t) {
                        unset($question[$key]);
                    }
                }
                $this->exam->modifyExamSession(['examsessionuseranswer' => $question]);
                echo is_array($question) ? count($question) : 0;
                exit;
                break;

            default:
        }
    }

    private function view()
    {
        $sessionvars = $this->exam->getExamSessionBySessionid();
        if (1 != $sessionvars['examsessiontype']) {
            if ($sessionvars['examsessiontype']) {
                header('location:index.php?exam-app-exam-view');
            } else {
                header('location:index.php?exam-app-exercise-view');
            }
            exit;
        }
        $this->tpl->assign('questype', $this->basic->getQuestypeList());
        $this->tpl->assign('sessionvars', $sessionvars);
        $this->tpl->display('exampaper_view');
    }

    private function makescore()
    {
        $questype = $this->basic->getQuestypeList();
        $sessionvars = $this->exam->getExamSessionBySessionid();
        if ($this->ev->get('makescore')) {
            $score = $this->ev->get('score');
            $sumscore = 0;
            if (is_array($score)) {
                foreach ($score as $key => $p) {
                    $sessionvars['examsessionscorelist'][$key] = $p;
                }
            }
            foreach ($sessionvars['examsessionscorelist'] as $p) {
                $sumscore = $sumscore + floatval($p);
            }
            $sessionvars['examsessionscore'] = $sumscore;
            $args['examsessionscorelist'] = $sessionvars['examsessionscorelist'];
            $allnumber = floatval(count($sessionvars['examsessionscorelist']));
            $args['examsessionscore'] = $sessionvars['examsessionscore'];
            $args['examsessionstatus'] = 2;
            $this->exam->modifyExamSession($args);
            if (!$sessionvars['examsessionissave']) {
                $id = $this->favor->addExamHistory();
            }
            if ($this->ev->get('direct')) {
                header("location:index.php?exam-app-exampaper-makescore&ehid={$id}");
                exit;
            }
            $message = ['statusCode' => 200, 'message' => '操作成功', 'callbackType' => 'forward', 'forwardUrl' => "index.php?exam-app-exampaper-makescore&ehid={$id}"];
            $this->G->R($message);
        } else {
            $ehid = $this->ev->get('ehid');
            $eh = $this->favor->getExamHistoryById($ehid);
            $sessionvars = ['examsession' => $eh['ehexam'], 'examsessiontype' => 2 == $eh['ehtype'] ? 1 : $eh['ehtype'], 'examsessionsetting' => $eh['ehsetting'], 'examsessionbasic' => $eh['ehbasicid'], 'examsessionquestion' => $eh['ehquestion'], 'examsessionuseranswer' => $eh['ehanswer'], 'examsessiontime' => $eh['ehtime'], 'examsessionscorelist' => $eh['ehscorelist'], 'examsessionscore' => $eh['ehscore'], 'examsessionstarttime' => $eh['ehstarttime']];
            $number = [];
            $right = [];
            $score = [];
            $allnumber = 0;
            $allright = 0;
            foreach ($questype as $key => $q) {
                $number[$key] = 0;
                $right[$key] = 0;
                $score[$key] = 0;
                if ($sessionvars['examsessionquestion']['questions'][$key]) {
                    foreach ($sessionvars['examsessionquestion']['questions'][$key] as $p) {
                        ++$number[$key];
                        ++$allnumber;
                        if ($sessionvars['examsessionscorelist'][$p['questionid']] == $sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score']) {
                            ++$right[$key];
                            ++$allright;
                        }
                        $score[$key] = $score[$key] + $sessionvars['examsessionscorelist'][$p['questionid']];
                    }
                }
                if ($sessionvars['examsessionquestion']['questionrows'][$key]) {
                    foreach ($sessionvars['examsessionquestion']['questionrows'][$key] as $v) {
                        foreach ($v['data'] as $p) {
                            ++$number[$key];
                            ++$allnumber;
                            if ($sessionvars['examsessionscorelist'][$p['questionid']] == $sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score']) {
                                ++$right[$key];
                                ++$allright;
                            }
                            $score[$key] = $score[$key] + $sessionvars['examsessionscorelist'][$p['questionid']];
                        }
                    }
                }
            }
            $this->tpl->assign('ehid', $ehid);
            $this->tpl->assign('allright', $allright);
            $this->tpl->assign('allnumber', $allnumber);
            $this->tpl->assign('right', $right);
            $this->tpl->assign('score', $score);
            $this->tpl->assign('number', $number);
            $this->tpl->assign('questype', $questype);
            $this->tpl->assign('sessionvars', $sessionvars);
            $this->tpl->display('exampaper_score');
        }
    }

    private function score()
    {
        $questype = $this->basic->getQuestypeList();
        $sessionvars = $this->exam->getExamSessionBySessionid();
        $needhand = 0;
        if ($this->ev->get('insertscore')) {
            $question = $this->ev->get('question');
            if (is_array($question)) {
                foreach ($question as $key => $a) {
                    $sessionvars['examsessionuseranswer'][$key] = $a;
                }
            }
            foreach ($sessionvars['examsessionquestion']['questions'] as $key => $tmp) {
                if (!$questype[$key]['questsort']) {
                    foreach ($tmp as $p) {
                        if (is_array($sessionvars['examsessionuseranswer'][$p['questionid']])) {
                            $nanswer = '';
                            $answer = $sessionvars['examsessionuseranswer'][$p['questionid']];
                            asort($answer);
                            $nanswer = implode('', $answer);
                            if ($nanswer == $p['questionanswer']) {
                                $score = $sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score'];
                            } else {
                                if (3 == $questype[$key]['questchoice']) {
                                    $alen = strlen($p['questionanswer']);
                                    $rlen = 0;
                                    foreach ($answer as $t) {
                                        if (false === strpos($p['questionanswer'], $t)) {
                                            $rlen = 0;
                                            break;
                                        }
                                        ++$rlen;
                                    }
                                    $score = floatval($sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score'] * $rlen / $alen);
                                } else {
                                    $score = 0;
                                }
                            }
                        } else {
                            $answer = $sessionvars['examsessionuseranswer'][$p['questionid']];
                            if ($answer == $p['questionanswer']) {
                                $score = $sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score'];
                            } else {
                                $score = 0;
                            }
                        }
                        $scorelist[$p['questionid']] = $score;
                    }
                } else {
                    if (is_array($tmp) && count($tmp)) {
                        $needhand = 1;
                    }
                }
            }
            foreach ($sessionvars['examsessionquestion']['questionrows'] as $key => $tmp) {
                if (!$questype[$key]['questsort']) {
                    foreach ($tmp as $tmp2) {
                        foreach ($tmp2['data'] as $p) {
                            if (is_array($sessionvars['examsessionuseranswer'][$p['questionid']])) {
                                $answer = $sessionvars['examsessionuseranswer'][$p['questionid']];
                                asort($answer);
                                $nanswer = implode('', $answer);
                                if ($nanswer == $p['questionanswer']) {
                                    $score = $sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score'];
                                } else {
                                    if (3 == $questype[$key]['questchoice']) {
                                        $alen = strlen($p['questionanswer']);
                                        $rlen = 0;
                                        foreach ($answer as $t) {
                                            if (false === strpos($p['questionanswer'], $t)) {
                                                $rlen = 0;
                                                break;
                                            }
                                            ++$rlen;
                                        }
                                        $score = $sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score'] * $rlen / $alen;
                                    } else {
                                        $score = 0;
                                    }
                                }
                            } else {
                                $answer = $sessionvars['examsessionuseranswer'][$p['questionid']];
                                if ($answer == $p['questionanswer']) {
                                    $score = $sessionvars['examsessionsetting']['examsetting']['questype'][$key]['score'];
                                } else {
                                    $score = 0;
                                }
                            }
                            $scorelist[$p['questionid']] = $score;
                        }
                    }
                } else {
                    if (!$needhand) {
                        if (is_array($tmp) && count($tmp)) {
                            $needhand = 1;
                        }
                    }
                }
            }
            $args['examsessionuseranswer'] = $question;
            $args['examsessionscorelist'] = $scorelist;
            if (!$needhand) {
                $args['examsessionstatus'] = 2;
                $this->exam->modifyExamSession($args);
                $message = ['statusCode' => 200, 'message' => '操作成功', 'callbackType' => 'forward', 'forwardUrl' => 'index.php?exam-app-exampaper-makescore&makescore=1&direct=1'];
            } else {
                if ($sessionvars['examsessionsetting']['examdecide']) {
                    $args['examsessionstatus'] = 2;
                    $this->exam->modifyExamSession($args);
                    $id = $this->favor->addExamHistory(0, 0);
                    $message = ['statusCode' => 200, 'message' => '操作成功，本试卷需要教师评分，请等待评分结果', 'callbackType' => 'forward', 'forwardUrl' => 'index.php?exam-app-history&ehtype=1'];
                } else {
                    $args['examsessionstatus'] = 1;
                    $this->exam->modifyExamSession($args);
                    $message = ['statusCode' => 200, 'message' => '操作成功', 'callbackType' => 'forward', 'forwardUrl' => 'index.php?exam-app-exampaper-score'];
                }
            }
            $this->G->R($message);
        } else {
            if (2 == $sessionvars['examsessionstatus']) {
                header('location:index.php?exam-app-exampaper-makescore');
                exit;
            }
            $this->tpl->assign('sessionvars', $sessionvars);
            $this->tpl->assign('questype', $questype);
            $this->tpl->display('exampaper_mkscore');
        }
    }

    private function paper()
    {
        $sessionvars = $this->exam->getExamSessionBySessionid();
        $lefttime = 0;
        $questype = $this->basic->getQuestypeList();
        if (2 == $sessionvars['examsessionstatus']) {
            header('location:index.php?exam-app-exampaper-makescore');
            exit;
        } elseif (1 == $sessionvars['examsessionstatus']) {
            header('location:index.php?exam-app-exampaper-score');
            exit;
        }
        //$exams = $this->exam->getExamSettingList(1,3,array(array("AND","examsubject = :examsubject",'examsubject',$this->data['currentsubject']['subjectid']),array("AND","examtype = 1")));
        $this->tpl->assign('questype', $questype);
        $this->tpl->assign('sessionvars', $sessionvars);
        $this->tpl->assign('lefttime', $lefttime);
        $this->tpl->assign('donumber', is_array($sessionvars['examsessionuseranswer']) ? count($sessionvars['examsessionuseranswer']) : 0);
        if ($this->data['currentbasic']['basicexam']['autotemplate']) {
            $this->tpl->display($this->data['currentbasic']['basicexam']['autotemplate']);
        } else {
            $this->tpl->display('exampaper_paper');
        }
    }

    private function selectquestions()
    {
        $sessionvars = $this->exam->getExamSessionBySessionid();
        $examid = $this->ev->get('examid');
        $r = $this->exam->getExamSettingById($examid);
        if (!$r['examid']) {
            $message = ['statusCode' => 300, 'message' => '参数错误，尝试退出后重新进入'];
            $this->G->R($message);
        } else {
            if (1 == $r['examtype']) {
                $questionids = $this->question->selectQuestions($examid, $this->data['currentbasic']);
                $questions = [];
                $questionrows = [];
                $str = '';
                foreach ($questionids['question'] as $key => $p) {
                    $ids = '';
                    if (count($p)) {
                        foreach ($p as $t) {
                            $ids .= $t.',';
                        }
                        $ids = trim($ids, ' ,');
                        $str .= $ids."\n";
                        if (!$ids) {
                            $ids = 0;
                        }
                        $questions[$key] = $this->exam->getQuestionListByIds($ids);
                    }
                }
                if (is_array($questionids['questionrow'])) {
                    foreach ($questionids['questionrow'] as $key => $p) {
                        $ids = '';
                        if (is_array($p)) {
                            if (count($p)) {
                                foreach ($p as $t) {
                                    $questionrows[$key][$t] = $this->exam->getQuestionRowsById($t);
                                }
                            }
                        } else {
                            $questionrows[$key][$p] = $this->exam->getQuestionRowsById($p);
                        }
                    }
                }
                $sargs['examsessionquestion'] = ['questionids' => $questionids, 'questions' => $questions, 'questionrows' => $questionrows];
                $sargs['examsessionsetting'] = $questionids['setting'];
                $sargs['examsessionstarttime'] = TIME;
                $sargs['examsession'] = $questionids['setting']['exam'];
                $sargs['examsessiontime'] = $questionids['setting']['examsetting']['examtime'] > 0 ? $questionids['setting']['examsetting']['examtime'] : 60;
                $sargs['examsessionstatus'] = 0;
                $sargs['examsessiontype'] = 1;
                $sargs['examsessionsign'] = null;
                $sargs['examsessionuseranswer'] = null;
                $sargs['examsessionbasic'] = $this->data['currentbasic']['basicid'];
                $sargs['examsessionkey'] = $examid;
                $sargs['examsessionissave'] = 0;
                $sargs['examsessionsign'] = '';
                $sargs['examsessionuserid'] = $this->_user['sessionuserid'];
                if ($sessionvars['examsessionid']) {
                    $this->exam->modifyExamSession($sargs);
                } else {
                    $this->exam->insertExamSession($sargs);
                }
                $message = ['statusCode' => 200, 'message' => '抽题完毕，转入试卷页面', 'callbackType' => 'forward', 'forwardUrl' => 'index.php?exam-app-exampaper-paper'];
                $this->G->R($message);
            } elseif (2 == $r['examtype']) {
                $sessionvars = $this->exam->getExamSessionBySessionid();
                $questions = [];
                $questionrows = [];
                foreach ($r['examquestions'] as $key => $p) {
                    $qids = '';
                    $qrids = '';
                    if ($p['questions']) {
                        $qids = trim($p['questions'], ' ,');
                    }
                    if ($qids) {
                        $questions[$key] = $this->exam->getQuestionListByIds($qids);
                    }
                    if ($p['rowsquestions']) {
                        $qrids = trim($p['rowsquestions'], ' ,');
                    }
                    if ($qrids) {
                        $qrids = explode(',', $qrids);
                        foreach ($qrids as $t) {
                            $qr = $this->exam->getQuestionRowsById($t);
                            if ($qr) {
                                $questionrows[$key][$t] = $qr;
                            }
                        }
                    }
                }
                $args['examsessionquestion'] = ['questions' => $questions, 'questionrows' => $questionrows];
                $args['examsessionsetting'] = $r;
                $args['examsessionstarttime'] = TIME;
                $args['examsession'] = $r['exam'];
                $args['examsessionscore'] = 0;
                $args['examsessionuseranswer'] = null;
                $args['examsessionscorelist'] = null;
                $args['examsessionsign'] = null;
                $args['examsessiontime'] = $r['examsetting']['examtime'];
                $args['examsessionstatus'] = 0;
                $args['examsessiontype'] = 1;
                $args['examsessionkey'] = $r['examid'];
                $args['examsessionissave'] = 0;
                $args['examsessionbasic'] = $this->data['currentbasic']['basicid'];
                $args['examsessionuserid'] = $this->_user['sessionuserid'];
                if ($sessionvars['examsessionid']) {
                    $this->exam->modifyExamSession($args);
                } else {
                    $this->exam->insertExamSession($args);
                }
                $message = ['statusCode' => 200, 'message' => '抽题完毕，转入试卷页面', 'callbackType' => 'forward', 'forwardUrl' => 'index.php?exam-app-exampaper-paper'];
                $this->G->R($message);
            } else {
                $sessionvars = $this->exam->getExamSessionBySessionid();
                $args['examsessionquestion'] = $r['examquestions'];
                $args['examsessionsetting'] = $r;
                $args['examsessionstarttime'] = TIME;
                $args['examsession'] = $r['exam'];
                $args['examsessionscore'] = 0;
                $args['examsessionuseranswer'] = '';
                $args['examsessionscorelist'] = '';
                $args['examsessionsign'] = '';
                $args['examsessiontime'] = $r['examsetting']['examtime'];
                $args['examsessionstatus'] = 0;
                $args['examsessiontype'] = 1;
                $args['examsessionkey'] = $r['examid'];
                $args['examsessionissave'] = 0;
                $args['examsessionbasic'] = $this->data['currentbasic']['basicid'];
                $args['examsessionuserid'] = $this->_user['sessionuserid'];
                if ($sessionvars['examsessionid']) {
                    $this->exam->modifyExamSession($args);
                } else {
                    $this->exam->insertExamSession($args);
                }
                $message = ['statusCode' => 200, 'message' => '抽题完毕，转入试卷页面', 'callbackType' => 'forward', 'forwardUrl' => 'index.php?exam-app-exampaper-paper'];
                $this->G->R($message);
            }
        }
    }

    private function index()
    {
        $page = $this->ev->get('page');
        $ids = trim($this->data['currentbasic']['basicexam']['auto'].','.$this->data['currentbasic']['basicexam']['train'], ', ');
        if (!$ids) {
            $ids = 0;
        }
        $exams = $this->exam->getExamSettingList($page, 20, [['AND', 'find_in_set(examid,:examid)', 'examid', $ids]]);
        $this->tpl->assign('exams', $exams);
        $this->tpl->display('exampaper');
    }
}
