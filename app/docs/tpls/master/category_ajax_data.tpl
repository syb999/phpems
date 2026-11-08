					{x2;tree:(array)($child ?? []),category,cid}
					<tr class="submenu{x2;(isset($catid)?$catid:'')}">
						<td><input type="text" name="ids[{x2;(isset(v:category['catid'])?v:category['catid']:'')}]" value="{x2;(isset(v:category['catlite'])?v:category['catlite']:'')}" style="width:24px;padding:2px 5px;"/></td>
						<td>{x2;(isset(v:category['catid'])?v:category['catid']:'')}</td>
						<td><img src="{x2;if:!empty(v:category['catthumb'])}{x2;(isset(v:category['catthumb'])?v:category['catthumb']:'')}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:24px;"/></td>
						<td><a onclick="javascript:openmenu(this);" href="javascript:void(0);" class="icon-plus-sign catool" rel="{x2;(isset(v:category['catid'])?v:category['catid']:'')}" data="0" app="{x2;(isset($_app)?$_app:'')}"></a><span>{x2;(isset(v:category['catname'])?v:category['catname']:'')}</span></td>
						<td>
							<div class="btn-group">
								<a class="btn" href="index.php?{x2;(isset($_app)?$_app:'')}-master-category-edit&page={x2;(isset($page)?$page:'')}&catid={x2;(isset(v:category['catid'])?v:category['catid']:'')}{x2;(isset($u)?$u:'')}"><em class="icon-edit"></em></a>
								<a class="btn ajax" href="index.php?{x2;(isset($_app)?$_app:'')}-master-category-del&catid={x2;(isset(v:category['catid'])?v:category['catid']:'')}&page={x2;(isset($page)?$page:'')}{x2;(isset($u)?$u:'')}"><em class="icon-remove"></em></a>
							</div>
						</td>
					</tr>
					{x2;endtree}