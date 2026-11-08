{x2;if:!empty($userhash)}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
    <div class="row-fluid">
        <div class="main">
            <div class="col-xs-2 leftmenu">
                {x2;include:menu}
            </div>
            <div id="datacontent">
{x2;endif}
                <div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
                    <div class="col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="index.php?{x2;(isset($_app)?$_app:'')}-master">{x2;(isset($apps[$_app]['appname'])?$apps[$_app]['appname']:'')}</a></li>
                            <li><a href="index.php?{x2;(isset($_app)?$_app:'')}-master-module">用户模型</a></li>
                            <li><a href="index.php?{x2;(isset($_app)?$_app:'')}-master-module-fields&moduleid={x2;(isset($module['moduleid'])?$module['moduleid']:'')}">字段管理</a></li>
                            <li class="active">编辑{x2;if:!empty($fieldpublic)}公共{x2;else}模型{x2;endif}字段</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox">
                    <h4 class="title" style="padding:10px;">
                        {x2;(isset($field['fieldtitle'])?$field['fieldtitle']:'')}[{x2;(isset($field['field'])?$field['field']:'')}]
                    </h4>
                    <div id="tabs-694325" class="tabbable">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#panel-344373" data-toggle="tab">样式编辑</a>
                            </li>
                            <li>
                                <a href="#panel-788842" data-toggle="tab">数据编辑</a>
                            </li>
                            <a class="pull-right btn btn-primary" href="index.php?{x2;(isset($_app)?$_app:'')}-master-module-fields&moduleid={x2;(isset($module['moduleid'])?$module['moduleid']:'')}">字段列表</a>
                        </ul>
                        <div class="tab-content">
                            <div id="panel-344373" class="tab-pane active">
                                <form action="index.php?{x2;(isset($_app)?$_app:'')}-master-module-modifyfield" method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-sm-2"></label>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">字段别名：</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" type="text" size="40" name="args[fieldtitle]" needle="needle" datatype="userName" id="fieldtitle" msg="您必须填写字段别名，字段别名必须为中英文字符或数字" value="{x2;(isset($field['fieldtitle'])?$field['fieldtitle']:'')}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="fieldhtmltype" class="control-label col-sm-2">HTML类型：</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" name="args[fieldhtmltype]" id="fieldhtmltype">
                                                  <option value="text"{x2;if:(isset($field['fieldhtmltype']) ? $field['fieldhtmltype'] : null) == 'text'} selected{x2;endif}>文本域(text)</option>
                                                  <option value="htmltime"{x2;if:(isset($field['fieldhtmltype']) ? $field['fieldhtmltype'] : null) == 'htmltime'} selected{x2;endif}>时间文本域(htmltime)</option>
                                                  <option value="password"{x2;if:(isset($field['fieldhtmltype']) ? $field['fieldhtmltype'] : null) == 'password'} selected{x2;endif}>密码域(password)</option>
                                                  <option value="hidden"{x2;if:(isset($field['fieldhtmltype']) ? $field['fieldhtmltype'] : null) == 'hidden'} selected{x2;endif}>隐藏域(hidden)</option>
                                                  <option value="select"{x2;if:(isset($field['fieldhtmltype']) ? $field['fieldhtmltype'] : null) == 'select'} selected{x2;endif}>下拉菜单/选择框(select)</option>
                                                  <option value="radio"{x2;if:(isset($field['fieldhtmltype']) ? $field['fieldhtmltype'] : null) == 'radio'} selected{x2;endif}>单选框(radio)</option>
                                                  <option value="checkbox"{x2;if:(isset($field['fieldhtmltype']) ? $field['fieldhtmltype'] : null) == 'checkbox'} selected{x2;endif}>复选框(checkbox)</option>
                                                  <option value="checkboxarray"{x2;if:(isset($field['fieldhtmltype']) ? $field['fieldhtmltype'] : null) == 'checkboxarray'} selected{x2;endif}>复选框组(checkboxarray)</option>
                                                  <option value="textarea"{x2;if:(isset($field['fieldhtmltype']) ? $field['fieldhtmltype'] : null) == 'textarea'} selected{x2;endif}>文本区域(textarea)</option>
                                                  <option value="editor"{x2;if:(isset($field['fieldhtmltype']) ? $field['fieldhtmltype'] : null) == 'editor'} selected{x2;endif}>编辑器(editor)</option>
                                                  <option value="thumb"{x2;if:(isset($field['fieldhtmltype']) ? $field['fieldhtmltype'] : null) == 'thumb'} selected{x2;endif}>缩略图上传(thumb)</option>
                                                  <option value="picture"{x2;if:(isset($field['fieldhtmltype']) ? $field['fieldhtmltype'] : null) == 'picture'} selected{x2;endif}>组图上传(picture)</option>
                                                  <option value="auto"{x2;if:(isset($field['fieldhtmltype']) ? $field['fieldhtmltype'] : null) == 'auto'} selected{x2;endif}>自定义(auto)</option>
                                                  <option value="videotext"{x2;if:(isset($field['fieldhtmltype']) ? $field['fieldhtmltype'] : null) == 'videotext'} selected{x2;endif}>上传(videotext)</option>
                                              </select>
                                          </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">HTML属性：</label>
                                          <div class="col-sm-9">
                                              <textarea class="form-control" rows="7" cols="4" name="args[fieldhtmlproperty]" id="fieldhtmlproperty">{x2;(isset($field['fieldhtmlproperty'])?$field['fieldhtmlproperty']:'')}</textarea>
                                            <span class="help-block">每行一个，等号隔开，如：style=width:100px;</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">可选值列表：</label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" rows="7" cols="4" name="args[fieldvalues]" id="fieldvalues">{x2;(isset($field['fieldvalues'])?$field['fieldvalues']:'')}</textarea>
                                            <span class="help-block">每行一个，等号隔开，如：属性=值;</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">默认值：</label>
                                        <div class="col-sm-3">
                                            <input class="form-control" type="text" size="40" name="args[fielddefault]" class="form-control" id="fielddefault" value="{x2;(isset($field['fielddefault'])?$field['fielddefault']:'')}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">禁止修改：</label>
                                          <div class="col-sm-9">
                                              <label class="checkbox-inline">
                                                  <input type="checkbox" name="args[fieldforbidactors][]" value="-1" {x2;if:strpos($field['fieldforbidactors'],',-1,') !== false}checked="true"{x2;endif}/> 本用户
                                              </label>
                                              {x2;tree:(array)($groups ?? []),group,gid}
                                              {x2;if:v:group['groupmoduleid'] == 1}
                                              <label class="checkbox-inline">
                                                  <input type="checkbox" name="args[fieldforbidactors][]" value="{x2;(isset(v:group['groupid'])?v:group['groupid']:'')}" {x2;if:strpos($field['fieldforbidactors'],','.v:group['groupid'].',') !== false}checked="true"{x2;endif}/> {x2;(isset(v:group['groupname'])?v:group['groupname']:'')}
                                              </label>
                                              {x2;endif}
                                              {x2;endtree}
                                          </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">字段描述：</label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" rows="7" cols="4" name="args[fielddescribe]" id="fielddescribe">{x2;(isset($field['fielddescribe'])?$field['fielddescribe']:'')}</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">系统字段：</label>
                                          <div class="col-sm-9">
                                            <label class="radio-inline">
                                                  <input type="radio" class="input-text" name="args[fieldsystem]" value="1"{x2;if:!empty($field['fieldsystem'])} checked{x2;endif}/> 作为系统字段
                                              </label>
                                              <label class="radio-inline">
                                                  <input type="radio" class="input-text" name="args[fieldsystem]" value="0"{x2;if:!empty($field['fieldsystem'])} checked{x2;endif}/> 作为普通字段
                                              </label>
                                              <span class="help-block">系统字段不能被删除</span>
                                       </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2"></label>
                                        <div class="col-sm-9">
                                            <button class="btn btn-primary" type="submit">提交</button>
                                            <input type="hidden" name="moduleid" value="{x2;(isset($field['fieldmoduleid'])?$field['fieldmoduleid']:'')}"/>
                                            <input type="hidden" name="fieldid" value="{x2;(isset($fieldid)?$fieldid:'')}"/>
                                            <input type="hidden" name="modifyfieldhtml" value="1"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div id="panel-788842" class="tab-pane">
                                <form action="index.php?{x2;(isset($_app)?$_app:'')}-master-module-modifyfield" method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-sm-2"></label>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">字段类型：</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" id="fieldtype" name="args[fieldtype]">
                                                <option value="int"{x2;if:(isset($field['fieldtype']) ? $field['fieldtype'] : null) == 'int'} selected{x2;endif}>整型(int/time)</option>
                                                <option value="varchar"{x2;if:(isset($field['fieldtype']) ? $field['fieldtype'] : null) == 'varchar'} selected{x2;endif}>0~255字符串型(varchar)</option>
                                                <option value="decimal"{x2;if:(isset($field['fieldtype']) ? $field['fieldtype'] : null) == 'decimal'} selected{x2;endif}>浮点型(decimal)</option>
                                                <option value="text"{x2;if:(isset($field['fieldtype']) ? $field['fieldtype'] : null) == 'text'} selected{x2;endif}>长文字型(text)</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">字段长度：</label>
                                        <div class="col-sm-3">
                                            <input type="text" size="16" name="args[fieldlength]" class="form-control" id="fieldlength" value="{x2;(isset($field['fieldlength'])?$field['fieldlength']:'')}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">索引类型：</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" name="args[fieldindextype]" id="fieldindextype">
                                                  <option value="0">无(NULL)</option>
                                                  <option value="INDEX"{x2;if:(isset($field['fieldindextype']) ? $field['fieldindextype'] : null) == 'INDEX'} selected{x2;endif}>普通索引(INDEX)</option>
                                                  <option value="UNIQUE"{x2;if:(isset($field['fieldindextype']) ? $field['fieldindextype'] : null) == 'UNIQUE'} selected{x2;endif}>不重复索引(UNIQUE)</option>
                                                  <option value="FULLTEXT"{x2;if:(isset($field['fieldindextype']) ? $field['fieldindextype'] : null) == 'FULLTEXT'} selected{x2;endif}>全文索引(FULLTEXT)</option>
                                              </select>
                                          </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2"></label>
                                        <div class="col-sm-9">
                                            <button class="btn btn-primary" type="submit">提交</button>
                                            <input type="hidden" name="moduleid" value="{x2;(isset($field['fieldmoduleid'])?$field['fieldmoduleid']:'')}"/>
                                            <input type="hidden" name="fieldid" value="{x2;(isset($fieldid)?$fieldid:'')}"/>
                                            <input type="hidden" name="modifyfielddata" value="1"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
{x2;if:!empty($userhash)}
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}
