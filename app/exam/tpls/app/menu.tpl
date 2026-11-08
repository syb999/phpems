<h2 class="title">功能导航</h2>
<ul class="list-unstyled list-txt">
    <li  class="border{x2;if:(isset($method) ? $method : null) == 'lesson'} active{x2;endif}">
        <a href="index.php?exam-app-lesson">
            <span class="glyphicon glyphicon-pencil"></span> 章节练习
        </a>
    </li>
    <li  class="border{x2;if:(isset($method) ? $method : null) == 'exercise'} active{x2;endif}">
        <a href="index.php?exam-app-exercise">
            <span class="glyphicon glyphicon-refresh"></span> 强化训练
        </a>
    </li>
    <li  class="border{x2;if:(isset($method) ? $method : null) == 'exampaper'} active{x2;endif}">
        <a href="index.php?exam-app-exampaper">
            <span class="glyphicon glyphicon-time"></span> 模拟考试
        </a>
    </li>
    <li  class="border{x2;if:(isset($method) ? $method : null) == 'history'} active{x2;endif}">
        <a href="index.php?exam-app-history">
            <span class="glyphicon glyphicon-list-alt"></span> 考试记录
        </a>
    </li>
    <li  class="border{x2;if:(isset($method) ? $method : null) == 'favor'} active{x2;endif}">
        <a href="index.php?exam-app-favor">
            <span class="glyphicon glyphicon-star"></span> 习题收藏
        </a>
    </li>
    <li  class="border{x2;if:(isset($method) ? $method : null) == 'score'} active{x2;endif}">
        <a href="index.php?exam-app-score">
            <span class="glyphicon glyphicon-stats"></span> 成绩单
        </a>
    </li>
    {x2;if:(isset($data['currentbasic']['basicexam']['model']) ? $data['currentbasic']['basicexam']['model'] : null) == 0}
    <li  class="border{x2;if:(isset($method) ? $method : null) == 'questions'} active{x2;endif}">
        <a href="index.php?exam-app-questions">
            <span class="glyphicon glyphicon-equalizer"></span> 试题库
        </a>
    </li>
    {x2;endif}
</ul>
