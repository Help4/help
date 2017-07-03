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
<div id="check_grid"></div>
<div id="check_alert" class="easyui-window" data-options="closed:true" style="width:500px;height:600px">
    <form id="check_form" class="form-group" style="margin: 10px">
        <input id="check_id" type="hidden" name="pid" value="0"/>
        <div class="input-group">
            <span class="input-group-addon">姓名</span>
            <input id="check_name" type="text" name="p_name" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">性别</span>
            <input id="check_gender" type="text" name="p_gender" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">年龄</span>
            <input id="check_age" type="number" name="p_age" class="form-control"/>
        </div>

        <div class="input-group">
            <span class="input-group-addon">民族</span>
            <input id="check_race" type="text" name="p_race" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">户口</span>
            <input id="check_hukou" class="form-control" name="p_hukou">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">人口</span>
            <input id="check_peo" class="form-control" name="p_homesum">
            </input>
        </div>

        <div class="input-group">
            <span class="input-group-addon">病因</span>
            <input id="check_reason" class="form-control" name="p_ill">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">职业</span>
            <input id="check_job" class="form-control" name="p_trade">
            </input>
        </div>

        <div class="input-group">
            <span class="input-group-addon">电话</span>
            <input id="check_pho" class="form-control" name="p_phone">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">地址</span>
            <input id="check_address" class="form-control" name="p_adress">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">婚姻关系</span>
            <input id="check_marry" class="form-control" name="p_marry">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">首次享保</span>
            <input id="check_first" class="form-control" name="p_first">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">身份证号</span>
            <input id="identify" type="text" name="identify" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">劳动能力</span>
            <input id="check_work" class="form-control" name="p_workable">
            </input>
        </div>
        <a class="btn btn-success btn-block" href="javascript:save()">保存</a>
    </form>
</div>

<script>
    function checkinit() {
        $("#check_grid").datagrid({
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
                    addDaiban();
                }
                },
                {
                    text: "审查", iconCls: "icon-edit", handler: function () {
                    editcheck();
                }
                },
                {
                    text: "通过", iconCls: "icon-remove", handler: function () {
                    removecheck();
                }
                },
                {
                    text: "刷新", iconCls: "icon-remove", handler: function () {
                    reflash();
                }
                }

            ]
        });
        checkload();
    }
    function checkload() {
        $.getJSON("findPersonNull.do", function (data) {
            //给列表填充数据
            $("#check_grid").datagrid("loadData", data);
        });
    }
    function reflash(){
        checkload();
    }
    function clearQueryForm(){
        $("#queryForm").form("clear");
    }
    //    function addDang(){
    //        var x = $("#dangan_grid").datagrid("getSelected");
    //        $("#dangan_name").val(x);
    //        $("#dangan_gender").val(x);
    //        $("#dangan_age").val(x);
    //        $("#dangan_race").val(x);
    //        $("#dangan_hukou").val(x);
    //        $("#dangan_peo").val(x);
    //        $("#dangan_reason").val(x);
    //        $("#dangan_job").val(x);
    //        $("#dangan_pho").val(x);
    //        $("#dangan_address").val(x);
    //        $("#dangan_marry").val(x);
    //        $("#dangan_first").val(x);
    //        $("#identify").val(x);
    //        $("#dangan_work").val(x);
    //        $("#dangan_alert").window("open");
    //    }
    function save(){
        // var x = $("#yiban_grid").datagrid("getSelected");
        // alert("save1"+x)
        var y=$("#check_form").serialize()
        alert("save2"+y)
//        if(x!=null) {
        alert("执行edit")
        $.get("editDangan.do",y, function (d) {
            alert(d)
            $("#check_alert").window("close");
            //重新加载数据
            checkload();
        });
//        }else {
//            alert("执行add")
//            $.post("addDangan.do",y, function (d) {
//                $("#yiban_alert").window("close");
//                //重新加载数据
//                yibanload();
//            });
//        }
    }
//    function editOrder() {
//        var x = $("#check_grid").datagrid("getSelections");
//        alert(x.length);
//        if(x.length==1){
//            $("#order_id").val(x[0].pid);
//            $("#order_name").val(x[0].p_name);
//            $("#order_gender").val(x[0].p_gender);
//            $("#order_age").val(x[0].p_age);
//            $("#order_race").val(x[0].p_race);
//            $("#order_hukou").val(x[0].p_hukou);
//            $("#order_peo").val(x[0].p_homesum);
//            $("#order_reason").val(x[0].p_ill);
//            $("#order_job").val(x[0].p_trade);
//            $("#order_pho").val(x[0].p_phone);
//            $("#order_address").val(x[0].p_adress);
//            $("#order_marry").val(x[0].p_marry);
//            $("#order_first").val(x[0].p_first);
//            $("#identify").val(x[0].identify);
//            $("#order_work").val(x[0].p_workable);
//            $("#order_alert").window("open");
//
//        }else{
//            $.messager.alert("系统提示：","请选择一个账户");
//        }
//    }

    function query() {
        var d= $("#queryForm").serialize();
        $.getJSON("findPersonByName.do",d,function (data) {
            //给列表填充数据
            $("#check_grid").datagrid("loadData", data);
        });
    }
//    function removeOrder(){
//        var rows = $("#check_grid").datagrid("getSelections");
//        alert(rows[0].pid);
//        //创建一个数组
//        var as = [];
//        for (var i in rows) {
//            as[i] = rows[i].pid;
//        }
//        //转换为json
//        var d = JSON.stringify(as);
//        //提交数据到服务端
//        $.ajax({
//            url: "removeDanganId.do",
//            method: "post",
//            data: d,
//            contentType: "application/json",
//            success: function (data) {
//                orderload();
//            }
//        });
//    }
    $(checkinit)
</script>
