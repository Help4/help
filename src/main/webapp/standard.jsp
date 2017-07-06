<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div>
<div id="sta_grid"></div>
<div id="sta_alert" class="easyui-window" data-options="closed:true" style="width:500px;height:500px">
    <form id="sta_form" class="form-group" style="margin: 10px">
        <input id="sta_id" type="hidden" name="id" value="0"/>
        <div class="input-group">
            <span class="input-group-addon">基数</span>
            <input id="st_base" type="text" name="name" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">百分比</span>
            <input id="st_percent" type="text" name="gender" class="form-control"/>
        </div>
        <a class="btn btn-success btn-block" href="javascript:saveSt()">保存</a>
    </form>
</div>
</div>
<script>
    function stainit(){
        $("#sta_grid").datagrid({
            columns:[[
                {field:"st_id",width:100,checkbox:true},
                {field:"st_base",title:"基数",width:100},
                {field:"st_percent",title:"百分比",width:100},
            ]],
            toolbar:[
                {text:"添加",iconCls:"icon-add",handler:function(){addSt();}},
                {text:"修改",iconCls:"icon-edit",handler:function(){editSt();}},
                {text:"删除",iconCls:"icon-remove",handler:function(){removeSt();}}

            ]
        });
        loadst();
    }
    function loadst(){
        $.getJSON("findSt.do",function(data){
            alert(data)
            //给列表填充数据
            $("#sta_grid").datagrid("loadData",data);
        });
    }
    function addSt(){
        //弹出窗口
        $("#sta_alert").window("open");
    }
    function saveSt(){
        var x=$("#sta_form").serialize();
        //  alert(x);
        $.get("addUser.do",x,function(d){
            $("#sta_alert").window("close");
            //重新加载数据
            $("#sta_grid").datagrid("reload");
        });

    }

    function removeSt(){
        var rows= $("#sta_grid").datagrid("getSelections");
        alert(rows[0].uid);
        //创建一个数组
        var as=[];
        for(var i in rows){
            as[i]=rows[i].uid;
        }
        //转换为json
        var d=JSON.stringify(as);
        //提交数据到服务端
        $.ajax({
            url:"removeUserById.do",
            method:"post",
            data:d,
            contentType:"application/json",
            success:function(data){
                alert(data);
                loadst();
            }
        });
    }

    //弹出窗口
    function qx_show(){
        var rows=$("#sta_grid").datagrid("getSelections");
        if(rows.length==1){
            //显示window
            $("#qx_window").window("open");
        }else{
            $.messager.alert("系统提示","请选择唯一一个账号");
        }
    }
    $(stainit);
</script>
