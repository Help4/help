<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<div id="panel" class="easyui-panel" title="查询条件"
     icon="icon-query-form" collapsible="true"
     style="padding: 10px;">
    <form id="queryForm" method="post">
        <label for="name">搜索档案:</label>
        <input id="name" type="text" name="p_name"placeholder="请输入姓名"></input>
        <div style="padding: 10px;">
            <a href="#" class="easyui-linkbutton" onclick="queryOrder();" iconCls="icon-search">确定</a>
            <a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" iconCls="icon-cancel">取消</a>
        </div>
    </form>
</div>
<div id="order_grid"></div>
<div id="order_alert" class="easyui-window" data-options="closed:true" style="width:500px;height:600px">
    <form id="order_form" class="form-group" style="margin: 10px">
                <input id="order_id" type="hidden" name="pid" value="0"/>
                <div class="input-group">
                    <span class="input-group-addon">状态</span>
                    <select id="order_org" class="form-control" name="sta_name">
                    </select>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">原因</span>
                    <select id="order_why" class="form-control" name="why">
                    </select>
                </div>
                <a class="btn btn-success btn-block" href="javascript:saveOrder()">保存</a>
            </form>
        </div>
<script>
    function orderinit() {
        $("#order_grid").datagrid({
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
                    text: "审核", iconCls: "icon-add", handler: function () {
                    addOrder();
                }
                },
                {
                    text: "通过", iconCls: "icon-edit", handler: function () {
                    editOrder();
                }
                },
                {
                    text: "删除", iconCls: "icon-remove", handler: function () {
                    removeOrder();
                }
                },
                {
                    text: "刷新", iconCls: "icon-remove", handler: function () {
                    reflashOrder();
                }
                }

            ]
        });
        orderload();
    }
    function orderload() {
        $.getJSON("findPersonBySta1.do", function (data) {
            //给列表填充数据
            $("#order_grid").datagrid("loadData", data);
        });
    }
    function reflashOrder(){
        orderload();
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
    function saveOrder(){
         var x = $("#order_grid").datagrid("getSelected");
         alert("save1"+x)
        var y=$("#order_form").serialize()
        alert("save2"+y)
        if(x!=null) {
        alert("执行edit")
        $.get("editState.do",y, function (d) {
            alert(d)
            $("#order_alert").window("close");
            //重新加载数据
            orderload();
        });
        }else {
            alert("执行add")
            $.post("",y, function (d) {
                $("#yiban_alert").window("close");
                //重新加载数据
                yibanload();
            });
        }
    }
    function editOrder() {
        var x = $("#order_grid").datagrid("getSelections");
        alert(x.length);
        if(x.length==1){
            $.getJSON("findAllState.do", function (json) {
                //alert(json);
                //把普通string解析为json对象
                var op="";
                for(var i in json){
                    op+="<option value="+json[i].sta_id+">"+json[i].sta_name+"</option>";
                }
                $("#order_org").html(op);
            })
            $.getJSON("findAllWhy.do", function (json) {
                //   alert("why"+json);
                //把普通string解析为json对象
                var op="";
                for(var i in json){
                    op+="<option value="+json[i].wid+">"+json[i].why+"</option>";
                }
                $("#order_why").html(op);
            })
            $("#order_id").val(x[0].pid);
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
            $("#order_org").val(x[0].sta_name);
            $("#order_why").val(x[0].why);
            $("#order_alert").window("open");

        }else{
            $.messager.alert("系统提示：","请选择一个账户");
        }
    }

    function queryOrder() {
        var d= $("#queryFormOrder").serialize();
        $.getJSON("findPersonByName.do",d,function (data) {
            //给列表填充数据
            $("#order_grid").datagrid("loadData", data);
        });
    }
    function removeOrder(){
        var rows = $("#order_grid").datagrid("getSelections");
        alert(rows[0].pid);
        //创建一个数组
        var as = [];
        for (var i in rows) {
            as[i] = rows[i].pid;
        }
        //转换为json
        var d = JSON.stringify(as);
        //提交数据到服务端
        $.ajax({
            url: "removeDanganId.do",
            method: "post",
            data: d,
            contentType: "application/json",
            success: function (data) {
                orderload();
            }
        });
    }
    $(orderinit)
</script>
