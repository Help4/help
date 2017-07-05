<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/3 0003
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<div id="xuqi_grid"></div>
<div id="check_grid" ></div>
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
                    text: "审查续期", iconCls: "icon-search", handler: function () {
                    checkDang();
                }
                },
                {
                    text: "是否通过", iconCls: "icon-ok", handler: function () {
                    okDang();
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
    function  checkDang() {
        $("#check_grid").datagrid({
            columns: [[
                {field: "id", width: 100, checkbox: true},
                {field: "carid", title: "车牌号", width: 100},
                {field: "brand", title: "品牌", width: 100},
                {field: "holder", title: "所有人", width: 100},
            ]],
        });
            checkload();
    }
    function checkload() {
        $.getJSON("check.do", function (data) {
            //给列表填充数据
            $("#check_grid").datagrid("loadData", data);
        });
    }
    function dangload() {
        $.getJSON("findxuqi.do", function (data) {
            //给列表填充数据
            $("#xuqi_grid").datagrid("loadData", data);
        });
    }

    $(init)
</script>