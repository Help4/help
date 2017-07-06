<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<div id="panel" class="easyui-panel" title="查询条件"
     icon="icon-query-form" collapsible="true"
     style="padding: 10px;">
    <form id="queryFormstop" method="post">
        <label for="name">姓名:</label>
        <input id="name" type="text" name="p_name"></input>
        <div style="padding: 10px;">
            <a href="#" class="easyui-linkbutton" onclick="querystop();" iconCls="icon-search">确定</a>
            <a href="#" class="easyui-linkbutton" onclick="clearQueryForm1();" iconCls="icon-cancel">取消</a>
        </div>
    </form>
</div>
<div id="stop_grid"></div>
<div id="stop_alert" class="easyui-window" data-options="closed:true" style="width:500px;height:300px">
    <form id="stop_form" class="form-group" style="margin: 10px">
        <input id="sta_pid" type="hidden" name="pid" value="0"/>
        <div class="input-group">
            <span class="input-group-addon">状态</span>
            <select id="stop_org" class="form-control" name="sta_name">
            </select>
        </div>
        <div class="input-group">
            <span class="input-group-addon">原因</span>
            <select id="stop_why" class="form-control" name="why">
            </select>
        </div>
        <a class="btn btn-success btn-block" href="javascript:saveStop()">保存</a>
    </form>
</div>
</div>
<script>
    function stopinit() {
        $("#stop_grid").datagrid({
            columns: [[
                {field: "pid", width: 50, checkbox: true},
                {field: "p_name", title: "姓名", width: 50},
                {field: "p_gender", title: "性别", width: 50},
                {field: "p_age", title: "年龄", width: 50},
                {field: "p_race", title: "民族", width: 50},
                {field: "p_hukou", title: "户口", width: 100},
                {field: "p_homesum", title: "人口", width: 50},
                {field: "p_marry", title: "婚姻关系", width: 100},
                {field: "p_adress", title: "地址", width: 100},
                {field: "p_workable", title: "劳动能力", width: 100},
                //{field: "org_name", title: "户籍", width: 100},
                {field: "sta_name", title: "低保状态", width: 100},
                {field: "why", title: "意见", width: 100},
            ]],
            toolbar: [
                {
                    text: "冻结", iconCls: "icon-add", handler: function () {
                    addStop();
                }
                },
                {
                    text: "解冻", iconCls: "icon-edit", handler: function () {
                    addStop();
                }
                },
                {
                    text: "刷新", iconCls: "icon-edit", handler: function () {
                    reflashstop();
                }
                },
            ]
        });
       querystop();
    }
    function reflashstop() {
        querystop();
    }
    function querystop() {
       var d= $("#queryFormstop").serialize();
        // alert(d);
        $.getJSON("findPersonByName.do",d,function (data) {
           // alert(data);
            //给列表填充数据
            $("#stop_grid").datagrid("loadData", data);
        });
    }
    function clearQueryForm1(){
        $("#queryForm1").form("clear");
    }
    function addStop(){
        var x = $("#stop_grid").datagrid("getSelections");
        alert("add1"+x[0].pid);
        if(x.length==1){
            $.getJSON("findAllState.do", function (json) {
                //alert(json);
                //把普通string解析为json对象
                var op="";
                for(var i in json){
                    op+="<option value="+json[i].sta_id+">"+json[i].sta_name+"</option>";
                }
                $("#stop_org").html(op);
            })
            $.getJSON("findParOrg.do", function (json) {
                //  alert(json);
                //把普通string解析为json对象
                var op="";
                for(var i in json){
                    op+="<option value="+json[i].orgid+">"+json[i].org_name+"</option>";
                }
                $("#stop_huji").html(op);
            })
            $.getJSON("findAllWhy.do", function (json) {
                //   alert("why"+json);
                //把普通string解析为json对象
                var op="";
                for(var i in json){
                    op+="<option value="+json[i].wid+">"+json[i].why+"</option>";
                }
                $("#stop_why").html(op);
            })
            $("#sta_pid").val(x[0].pid);
            $("#sta_org").val(x[0].sta_name);
            $("#sta_why").val(x[0].why);
            //弹出窗口
            $("#stop_alert").window("open");
        }else{
            $.messager.alert("系统提示：","请选择一个账户");
        }
    }
    function saveStop(){
        var x = $("#stop_grid").datagrid("getSelections");
        alert("save1"+x[0].sta_name+x[0].pid);
        var s=$("#stop_form").serialize();
        alert("sava2"+s);
        $.get("editState.do",s, function (d) {
            alert(d);
            $("#stop_alert").window("close");
            //重新加载数据
            querystop();
        });
    }
    $(stopinit);
</script>
