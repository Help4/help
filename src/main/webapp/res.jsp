<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<table id="res_grid"></table>

<script type="text/javascript">
    function init(){
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
                {text:"删除",iconCls:"icon-remove",handler:function(){remove();}},


            ]
        });
        load();
    }
    function load(){
        $.getJSON("findAllResource.do",function(data){
            //给列表填充数据

            $("#res_grid").treegrid("loadData",data);
        });
    }
    function remove() {
        var rows=$("#res_grid").treegrid("getSelections");
        alert(rows[0].re_id)
    }
    init();
</script>
