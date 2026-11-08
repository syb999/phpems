{x2;if:empty($userhash)}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs" id="questionpanel"></div>
    <script type="text/javascript">
        $(document).ready(function(){
            submitAjax({url:"index.php?exam-phone-lesson-ajax-questions&knowsid={x2;(isset($knows['knowsid']) ? $knows['knowsid'] : '')}","target":"questionpanel"});
        });
    </script>
    {x2;if:empty($userhash)}
</div>
</body>
</html>
{x2;endif}
