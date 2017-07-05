<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/3 0003
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<div id="xuqi_grid"></div>
<script>
    function init() {
        $("#xuqi_grid").datagrid({
            columns: [[
                {field: "money_id", width: 100, checkbox: true},
                {field: "native_place", title: "地点", width: 100},
                {field: "money_shiDistribute", title: "是否发钱", width: 100},
                {field: "shi", title: "市负责人", width: 100},
                {field:"money_xianDistribute",title:"是否发钱",width:100},
                {field: "xian", title: "县负责人", width: 100},
                {field: "money_xiangDistribute", title: "是否发钱", width: 100},
                {field: "xiang", title: "乡负责人", width: 100},
                {field: "money_personGet", title: "是否得到钱", width: 100},
                {field: "money_Getsum", title: "得到多少钱", width: 100},
                {field: "dissribute_DATE", title: "发放日期", width: 100},

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
                    text: "刷新", iconCls: "icon-reload", handler: function () {
                    reflash();
                }
                }

            ]
        });
        dangload();
    }

    function dangload() {
        $.getJSON("findxuqi.do", function (data) {
            //给列表填充数据
            $("#xuqi_grid").datagrid("loadData", data);
        });
    }

    $(init)
</script>