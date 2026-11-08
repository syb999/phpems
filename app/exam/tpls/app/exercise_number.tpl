                            {x2;tree:(array)($questype ?? []),quest,qid}
                            {x2;if:!empty($numbers[v:quest['questid']])}
                            <li class="text_in">
                            	<!--<input type="checkbox" name="args[questype][{x2;(isset(v:quest)?v:quest:'')}]" value="1"/>-->{x2;(isset(v:quest['questype'])?v:quest['questype']:'')}（共{x2;(isset($numbers[v:quest['questid']])?$numbers[v:quest['questid']]:'')}题），选 <input id="question_{x2;(isset(v:quest['questid'])?v:quest['questid']:'')}" type="text" class="form-control" style="width:60px;" name="args[number][{x2;(isset(v:quest['questid'])?v:quest['questid']:'')}]" onChange="javascript:check_num(this);" onblur="" rel="{x2;(isset($numbers[v:quest['questid']])?$numbers[v:quest['questid']]:'')}"/> 题
                            	<span id="question_{x2;(isset(v:quest['questid'])?v:quest['questid']:'')}_error" class="red font_12 main_left0">选择的题数不能超过{x2;(isset($numbers[v:quest['questid']])?$numbers[v:quest['questid']]:'')}</span>
                            </li>
                            {x2;endif}
                        	{x2;endtree}
