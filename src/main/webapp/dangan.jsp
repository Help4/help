<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<div id="panel" class="easyui-panel" title="查询条件"
     icon="icon-query-form" collapsible="true"
     style="padding: 10px;">
    <form id="queryForm" method="post">
        <label for="name">搜索档案:</label>
        <input id="name" type="text" name="p_name"placeholder="请输入姓名"></input>
        <div style="padding: 10px;">
            <a href="#" class="easyui-linkbutton" onclick="query();" iconCls="icon-search">确定</a>
            <a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" iconCls="icon-cancel">取消</a>
        </div>
    </form>
</div>
<div id="dangan_grid"></div>

<div id="dangan_alert" class="easyui-window" data-options="closed:true" style="width:500px;height:600px">
    <form id="dangan_form" class="form-group" style="margin: 10px">
        <input id="dangan_id" type="hidden" name="uid" value="0"/>
        <div class="input-group">
            <span class="input-group-addon">姓名</span>
            <input id="dangan_name" type="text" name="name" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">性别</span>
            <input id="dangan_gender" type="text" name="gender" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">年龄</span>
            <input id="dangan_age" type="number" name="age" class="form-control"/>
        </div>

        <div class="input-group">
            <span class="input-group-addon">民族</span>
            <input id="dangan_race" type="text" name="phone" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">户口</span>
            <input id="dangan_hukou" class="form-control" name="account">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">人口</span>
            <input id="dangan_peo" class="form-control" name="org_name">
            </input>
        </div>

        <div class="input-group">
            <span class="input-group-addon">病因</span>
            <input id="dangan_reason" class="form-control" name="org_name">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">职业</span>
            <input id="dangan_job" class="form-control" name="org_name">
            </input>
        </div>

        <div class="input-group">
            <span class="input-group-addon">电话</span>
            <input id="dangan_pho" class="form-control" name="org_name">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">地址</span>
            <input id="dangan_address" class="form-control" name="org_name">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">婚姻关系</span>
            <input id="dangan_marry" class="form-control" name="org_name">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">首次享保</span>
            <input id="dangan_first" class="form-control" name="org_name">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">身份证号</span>
            <input id="user_iden" type="text" name="email" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">劳动能力</span>
            <input id="dangan_work" class="form-control" name="org_name">
            </input>
        </div>
        <a class="btn btn-success btn-block" href="javascript:save()">保存</a>
    </form>
</div>

<script>
    function init() {
        $("#dangan_grid").datagrid({
            columns: [[
                {field: "pid", width: 100, checkbox: true},
                {field: "p_name", title: "姓名", width: 100},
                {field: "p_gender", title: "性别", width: 100},
                {field: "p_age", title: "年龄", width: 100},
                {field:"identify",title:"身份证号",width:100},
                {field: "p_race", title: "民族", width: 100},
                {field: "p_hukou", title: "户口", width: 100},
                {field: "p_homesum", title: "人口", width: 100},
                {field: "p_first", title: "首次享保", width: 100},
                {field: "p_ill", title: "病因", width: 100},
                {field: "p_trade", title: "职业", width: 100},
                {field: "p_marry", title: "婚姻关系", width: 100},
                {field: "p_phone", title: "电话", width: 100},
                {field: "p_adress", title: "地址", width: 100},
                {field: "p_workable", title: "劳动能力", width: 100},
                {field: "sta_name", title: "低保状态", width: 100},
            ]],
            toolbar: [
                {
                    text: "添加", iconCls: "icon-add", handler: function () {
                    addDang();
                }
                },
                {
                    text: "修改", iconCls: "icon-edit", handler: function () {
                    editDang();
                }
                },
                {
                    text: "删除", iconCls: "icon-remove", handler: function () {
                    removeDang();
                }
                },
                {
                    text: "刷新", iconCls: "icon-remove", handler: function () {
                    reflash();
                }
                }

            ]
        });
        load();
    }
    function load() {
        $.getJSON("findPerson.do", function (data) {
            //给列表填充数据
            $("#dangan_grid").datagrid("loadData", data);
        });
    }
    function reflash() {
        load();
    }
    function clearQueryForm(){
        $("#queryForm").form("clear");
    }
    function addDang(){
       var x = $("#dangan_grid").datagrid("getSelected");
        $("#dangan_name").val(x);
        $("#dangan_gender").val(x);
        $("#dangan_age").val(x);
        $("#dangan_race").val(x);
        $("#dangan_hukou").val(x);
        $("#dangan_peo").val(x);
        $("#dangan_reason").val(x);
        $("#dangan_job").val(x);
        $("#dangan_pho").val(x);
        $("#dangan_address").val(x);
        $("#dangan_marry").val(x);
        $("#dangan_marry").val(x);
        $("#user_iden").val(x);
        $("#dangan_work").val(x);

        $("#dangan_alert").window("open");
    }

    function query() {
        var d= $("#queryForm").serialize();
        $.getJSON("findPersonByName.do",d,function (data) {
            //给列表填充数据
            $("#dangan_grid").datagrid("loadData", data);
        });
    }
    init();
</script>
