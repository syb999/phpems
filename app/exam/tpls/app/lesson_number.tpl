<table class="table table-hover table-bordered">
    <tr class="success"><td colspan="2">{x2;(isset($knows['knows']) ? $knows['knows'] : '')}</td></tr>
    <tr>
    {x2;eval: v:tmp = 0}
    {x2;tree:(array)($questype ?? []),quest,qid}
        {x2;if:!empty($numbers[v:quest['questid']])}
        <td>
        <a href="index.php?exam-app-lesson-ajax-setlesson&questype={x2;(isset(v:quest['questid']) ? v:quest['questid'] : '')}&knowsid={x2;(isset($knows['knowsid']) ? $knows['knowsid'] : '')}" class="ajax" action-before="clearStorage">{x2;(isset(v:quest['questype']) ? v:quest['questype'] : '')}（共{x2;(isset($numbers[v:quest['questid']]) ? $numbers[v:quest['questid']] : '')}题）</a>
        {x2;eval: v:tmp++}
        </td>
        {x2;endif}
        {x2;if:v:tmp % 2 == 0}
    </tr>
    <tr>
        {x2;endif}
    {x2;endtree}
    </tr>
</table>
