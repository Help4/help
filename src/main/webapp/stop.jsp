<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<div id="panel" class="easyui-panel" title="查询条件"
     icon="icon-query-form" collapsible="true"
     style="padding: 10px;">
    <form id="queryForm" method="post">
        <label for="name">姓名:</label>
        <input id="name" type="text" name="p_name"></input>
        <div style="padding: 10px;">
            <a href="#" class="easyui-linkbutton" onclick="query();" iconCls="icon-search">确定</a>
            <a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" iconCls="icon-cancel">取消</a>
        </div>
    </form>
</div>
<div id="stop_grid"></div>
</div>
<script>
    function init() {
        $("#stop_grid").datagrid({
            columns: [[
                {field: "pid", width: 100, checkbox: true},
                {field: "p_name", title: "姓名", width: 100},
                {field: "p_gender", title: "性别", width: 100},
                {field: "p_age", title: "年龄", width: 100},
                {field: "p_race", title: "民族", width: 100},
                {field: "p_hukou", title: "户口", width: 100},
                {field: "p_homesum", title: "人口", width: 100},
                {field: "p_marry", title: "婚姻关系", width: 100},
                {field: "p_adress", title: "地址", width: 100},
                {field: "p_workable", title: "劳动能力", width: 100},
                {field: "p_state", title: "低保状态", width: 100},
            ]],
            toolbar: [
                {
                    text: "终止", iconCls: "icon-add", handler: function () {
                    addUser();
                }
                },
                {
                    text: "修改", iconCls: "icon-edit", handler: function () {
                    edit();
                }
                },
                {
                    text: "删除", iconCls: "icon-remove", handler: function () {
                    remove();
                }
                }

            ]
        });
       query();
    }

    function query() {
       var d= $("#queryForm").serialize();
         alert(d);
        $.getJSON("findPersonByName.do",d,function (data) {
            //给列表填充数据
            $("#stop_grid").datagrid("loadData", data);
        });
    }
    init();
</script>
