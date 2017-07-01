<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<div id="panel" class="easyui-panel" title="查询条件"
           icon="icon-query-form" collapsible="true"
           style="padding: 10px;">
    <form id="queryForm2" method="post">
        <label for="name">行政区域:</label>
        <input id="name" type="text" name="native_place"></input>
        <div style="padding: 10px;">
            <a href="#" class="easyui-linkbutton" onclick="query2();" iconCls="icon-search">确定</a>
            <a href="#" class="easyui-linkbutton" onclick="clearQueryForm2();" iconCls="icon-cancel">取消</a>
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
        <a class="btn btn-success btn-block" href="javascript:save()">保存</a>
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
                    text: "待办任务", iconCls: "icon-edit", handler: function () {
                    todowork();
                }
                },
                {
                    text: "刷新", iconCls: "icon-edit", handler: function () {
                    reflash();
                }
                },
//                {
//                    text: "完成任务", iconCls: "icon-edit", handler: function () {
//                    overwork();
//                }
//                },
            ]
        });
        load();
    }
    function load() {
        $.getJSON("findMoney.do",function (data) {
            alert(data);
            //给列表填充数据
            $("#fa_grid").datagrid("loadData", data);
        });
    }
    function reflash() {
        load();
    }
    function query2() {
        var d= $("#queryForm2").serialize();
        //alert(d);
        $.getJSON("findMoneyByNp.do",d,function (data) {
             alert(data);
            //给列表填充数据
            $("#fa_grid").datagrid("loadData", data);
        });
    }
    function clearQueryForm2(){
        $("#queryForm2").form("clear");
    }
    function addwork(){
       // var x = $("#fa_grid").datagrid("getSelections");
    //    alert("add1"+x[0].monery_id);
//       if(x.length==1){
//            //弹出窗口
//            $("#fa_alert").window("open");
//       }else{
//            $.messager.alert("系统提示：","请选择一个账户");
//        }
//        $("#fa_id").val(x[0].monery_id);
//        $("#fa_native_place").val(x[0].native_place);
//        $("#fa_monery_shiDistribute").val(x[0].monery_shiDistribute);
//        $("#fa_shi").val(x[0].shi);
//        $("#fa_monery_xianDistribute").val(x[0].monery_xianDistribute);
//        $("#fa_xian").val(x[0].xian);
//        $("#fa_monery_xiangDistribute").val(x[0].monery_xiangDistribute);
//        $("#fa_xiang").val(x[0].xiang);
//        $("#fa_monery_Getsum").val(x[0].monery_Getsum);
//        $("#fa_dissribute_DATE").val(x[0].dissribute_DATE);
        $("#fa_alert").window("open");
    }
    function save(){
        //var x = $("#fa_grid").datagrid("getSelections");
      //  alert("save1"+x[0].pid);
        var s=$("#fa_form").serialize();
        alert("sava2"+s);
        $.get("addwork.do",s, function (d) {
            //alert(d);
            $("#fa_alert").window("close");
            //重新加载数据
            query2();
       });
    }
    $(fainit);
</script>
