<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<div id="role_grid"></div>
</div>
<script>
    function roleinit() {
        $("#role_grid").datagrid({
            columns: [[
                {field: "rid", width: 100, checkbox: true},
                {field: "account", title: "账户", width: 100},
                {field: "pwd", title: "密码", width: 100},
            ]],
            toolbar: [
                {
                    text: "添加", iconCls: "icon-add", handler: function () {
                    add();
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
        load();
    }
    function load() {
        $.getJSON("findAllRole.do",function (data) {
            //给列表填充数据
            $("#role_grid").datagrid("loadData", data);
        });
    }
    $(roleinit);
</script>
