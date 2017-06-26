<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<table id="res_grid"></table>

<script type="text/javascript">
    function res_init(){
        $("#res_grid").treegrid({
            idField:"re_id",
            treeField:"text",
            singleSelect : false,
            columns:[[
                {field:"re_id",width:100,checkbox:true},
                {field:"text",title:"名称",width:150},
                {field:"url",title:"路径",width:200},
                {field:"ptext",title:"父资源",width:100},
            ]],
            toolbar:[
                {text:"添加",iconCls:"icon-add"},
                {text:"修改",iconCls:"icon-edit"},
                {text:"删除",iconCls:"icon-remove",handler:function(){res_remove();}},


            ]
        });
        res_load();
    }
    function res_load(){
        $.getJSON("findAllResource.do",function(data){
            //给列表填充数据

            $("#res_grid").treegrid("loadData",data);
        });
    }
    function res_remove() {
        var rows = $("#user_grid").datagrid("getSelections");
        alert(rows[0].uid);
        //创建一个数组
        var as = [];
        for (var i in rows) {
            as[i] = rows[i].uid;
        }
        //转换为json
        var d = JSON.stringify(as);
        //提交数据到服务端
        $.ajax({
            url: "removeResourceBy",
            method: "post",
            data: d,
            contentType: "application/json",
            success: function (data) {
                alert(data);
                load();
            }
        });
    }
    res_init();
</script>
