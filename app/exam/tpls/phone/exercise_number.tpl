                            {x2;tree:(array)($questype ?? []),quest,qid}
                            {x2;if:!empty($numbers[v:quest['questid']])}
                            <li style="border-bottom:1px dotted #CCCCCC;padding:0.5rem;">
                            	{x2;(isset(v:quest['questype'])?v:quest['questype']:'')}（共{x2;(isset($numbers[v:quest['questid']])?$numbers[v:quest['questid']]:'')}题），选 <input id="question_{x2;(isset(v:quest['questid'])?v:quest['questid']:'')}" type="text" style="width:6rem;background-color: #fff;height:34px;padding: 1.2rem;border: 1px solid #ccc;border-radius: 4px;" name="args[number][{x2;(isset(v:quest['questid'])?v:quest['questid']:'')}]" rel="{x2;(isset($numbers[v:quest['questid']])?$numbers[v:quest['questid']]:'')}"/> 题
                            </li>
                            {x2;endif}
                        	{x2;endtree}
