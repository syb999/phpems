<link rel="stylesheet" href="files/public/js/codemirror/lib/codemirror.css?v=20261108b">
<link rel="stylesheet" href="files/public/js/codemirror/theme/monokai.css?v=20261108b">
<script src="files/public/js/codemirror/lib/codemirror.js?v=20261108b"></script>
<script src="files/public/js/codemirror/addon/edit/closetag.js?v=20261108b"></script>
<script src="files/public/js/codemirror/mode/xml/xml.js?v=20261108b"></script>
<script src="files/public/js/codemirror/mode/javascript/javascript.js?v=20261108b"></script>
<script src="files/public/js/codemirror/mode/css/css.js?v=20261108b"></script>
<script src="files/public/js/codemirror/mode/htmlmixed/htmlmixed.js?v=20261108b"></script>
<script>
    $(function(){
        $('.Codemirror').each(function(){
            var that = this;
            var cm = CodeMirror(that,{
                lineNumbers: true,
                mode:  "htmlmixed",
                theme: 'monokai',
                lineWrapping: true,
                autofocus: true,
                tabSize: 4,
                value:$(that).parent().find('.blockcontent_content:first').val(),
                autoCloseTags: true
            });
            var fm = $(that).parents('form:first');
            fm.find('.tplbutton').on('click',function(){
                var _this = this;
                fm.find('.blockcontent_content:first').val(cm.getValue());
                fm.submit();
            });
        });
    });
</script>