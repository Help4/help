<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<div id="panel" class="easyui-panel" title="查询条件"
           icon="icon-query-form" collapsible="true"
           style="padding: 10px;">
    <form id="queryFormfa" method="post">
        <label for="name">行政区域:</label>
        <input id="name" type="text" name="native_place"></input>
        <div style="padding: 10px;">
            <a href="#" class="easyui-linkbutton" onclick="queryfa();" iconCls="icon-search">确定</a>
            <a href="#" class="easyui-linkbutton" onclick="clearQueryFormfa();" iconCls="icon-cancel">取消</a>
        </div>
    </form>
</div>
<div id="fa_grid"></div>
<div id="fa_alert" class="easyui-window" data-options="closed:true" style="width:500px;height:600px">
    <form id="fa_form" class="form-group" style="margin: 10px">
        <input id="fa_id" type="hidden" name="money_id" value="0"/>
        <div class="input-group">
            <span class="input-group-addon">行政区划</span>
            <input id="fa_native_place" type="text" name="native_place" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">市级资金已发</span>
            <input id="fa_money_shiDistribute" type="text" name="money_shiDistribute" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">市级经手人</span>
            <input id="fa_shi" class="form-control" name="shi">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">县级资金已发</span>
            <input id="fa_money_xianDistribute"  name="money_xianDistribute" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">县级经手人</span>
            <input id="fa_xian" class="form-control" name="xian">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">乡级资金已发</span>
            <input id="fa_money_xiangDistribute" type="text" name="money_xiangDistribute" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">乡级经手人</span>
            <input id="fa_xiang" class="form-control" name="xiang">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">个人签收</span>
            <input id="fa_money_personGet" class="form-control" name="money_personGet">
            </input>
        </div>

        <div class="input-group">
            <span class="input-group-addon">次数</span>
            <input id="fa_money_Getsum" type="" class="form-control" name="money_Getsum">
            </input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">日期</span>
            <input id="fa_dissribute_DATE" type="date" class="form-control" name="dissribute_DATE">
            </input>
        </div>
        <a class="btn btn-success btn-block" href="javascript:saveFa()">保存</a>
    </form>
</div>
</div>
<script>
    function fainit() {
        $("#fa_grid").datagrid({
            columns: [[
                {field: "money_id", width: 50, checkbox: true},
                {field: "native_place", title: "行政区划", width: 100},
                {field: "money_shiDistribute", title: "市级资金已发", width: 100},
                {field: "shi", title: "市级经手人", width: 100},
                {field: "money_xianDistribute", title: "县级资金已发", width: 100},
                {field: "xian", title: "县级经手人", width:100},
                {field: "money_xiangDistribute", title: "乡级资金已发", width: 100},
                {field: "xiang", title: "乡级经手人", width: 100},
                {field: "money_personGet", title: "个人签收", width:100},
                {field: "money_Getsum", title: "次数", width: 100},
                {field: "dissribute_DATE", title: "日期", width: 100},
            ]],
            toolbar: [
                {
                    text: "新建任务", iconCls: "icon-add", handler: function () {
                    addwork();
                }
                },
                {
                    text: "修改任务", iconCls: "icon-edit", handler: function () {
                    editwork();
                }
                },
                {
                    text: "删除任务", iconCls: "icon-remove", handler: function () {
                    removework();
                }
                },
//                {
//                    text: "待办任务", iconCls: "icon-edit", handler: function () {
//                    todowork();
//                }
//                },
                {
                    text: "刷新", iconCls: "icon-edit", handler: function () {
                    reflashwork();
                }
                },
//                {
//                    text: "完成任务", iconCls: "icon-edit", handler: function () {
//                    overwork();
//                }
//                },
            ]
        });
        loadfa();
    }
    function loadfa() {
        $.getJSON("findMoney.do",function (data) {
            alert(data);
            //给列表填充数据
            $("#fa_grid").datagrid("loadData", data);
        });
    }
    function reflashfa() {
        loadfa();
    }
    function queryfa() {
        var d= $("#queryFormfa").serialize();
        //alert(d);
        $.getJSON("findMoneyByNp.do",d,function (data) {
             alert(data);
            //给列表填充数据
            $("#fa_grid").datagrid("loadData", data);
        });
    }
    function clearQueryFormfa(){
        $("#queryFormfa").form("clear");
    }
    function addwork(){
        var x = $("#fa_grid").datagrid("getSelected");
        $("#fa_id").val(0);
        $("#fa_native_place").val(x);
        $("#fa_money_shiDistribute").val(x);
        $("#fa_shi").val(x);
        $("#fa_money_xianDistribute").val(x);
        $("#fa_xian").val(x);
        $("#fa_money_xiangDistribute").val(x);
        $("#fa_xiang").val(x);
        $("#fa_money_Getsum").val(x);
        $("#fa_money_personGet").val(x);
        $("#fa_dissribute_DATE").val(x);
        $("#fa_alert").window("open");
    }
    function saveFa(){
        var y = $("#fa_grid").datagrid("getSelected");
        var x=$("#fa_form").serialize();
        alert("y"+y);
        alert("sava2"+x);
        alert("kk");
        if(y!=null){
            $.get("editwork.do", x, function (d) {
                alert("22");
                $("#fa_alert").window("close");
                //重新加载数据
                queryfa();
            });
        }else{
            $.post("addwork.do",x, function (d) {
                alert("33");
                $("#fa_alert").window("close");
                //重新加载数据
                queryfa();
            });
        }
    }
    function editwork() {
        var x = $("#fa_grid").datagrid("getSelections");
        //alert(x.length);
        if (x.length == 1) {
            $("#fa_id").val(x[0].money_id);
            $("#fa_native_place").val(x[0].native_place);
            $("#fa_money_shiDistribute").val(x[0].money_shiDistribute);
            $("#fa_shi").val(x[0].shi);
            $("#fa_money_xianDistribute").val(x[0].money_xianDistribute);
            $("#fa_xian").val(x[0].xian);
            $("#fa_money_xiangDistribute").val(x[0].money_xiangDistribute);
            $("#fa_xiang").val(x[0].xiang);
            $("#fa_money_Getsum").val(x[0].money_Getsum);
            $("#fa_money_personGet").val(x[0].money_personGet);
            $("#fa_dissribute_DATE").val(x[0].dissribute_DATE);
            $("#fa_alert").window("open");
        } else {
            $.messager.alert("系统提示：", "请选择一个账户");
        }
    }
    function removework() {
        var rows = $("#fa_grid").datagrid("getSelections");
        alert(rows[0].money_id);
        //创建一个数组
        var as = [];
        for (var i in rows) {
            as[i] = rows[i].money_id;
        }
        //转换为json
        var d = JSON.stringify(as);
        //提交数据到服务端
        $.ajax({
            url: "removeMoneyById.do",
            method: "post",
            data: d,
            contentType: "application/json",
            success: function (data) {
                loadfa();
            }
        });
    }
    $(fainit);
</script>
