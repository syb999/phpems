                            {x2;tree:(array)($questype ?? []),quest,qid}
                            {x2;if:!empty($numbers[v:quest['questid']])}
                            <li class="form-group">
                                {x2;(isset(v:quest['questype']) ? v:quest['questype'] : '')}（共{x2;(isset($numbers[v:quest['questid']]) ? $numbers[v:quest['questid']] : '')}题），选 <input id="question_{x2;(isset(v:quest['questid']) ? v:quest['questid'] : '')}" size="5" type="text" name="args[number][{x2;(isset(v:quest['questid']) ? v:quest['questid'] : '')}]" rel="{x2;(isset($numbers[v:quest['questid']]) ? $numbers[v:quest['questid']] : '')}" value="0"/> 题
                            </li>
                            {x2;endif}
                            {x2;endtree}
