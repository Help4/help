<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div id="user_grid"></div>
<div id="qx_window" class="easyui-window" data-options="closed:true,modal:true" style="width:300px;height:400px">
    <div style="width:100%;height:90%;padding:30px 30px">
        <ul id="qx_tree" class="easyui-tree" data-options="url:'findRs.do?userid=32',checkbox:true,cascadeCheck:false"></ul>
    </div>
    <div style="display:flex;justify-content:center">
        <a class="easyui-linkbutton" onclick="qx_save()">保 &nbsp;&nbsp;&nbsp;存</a>
    </div>

</div>
<script>
    var userid=0;
    function init(){
        $("#user_grid").datagrid({

            columns:[[

                {field:"orgid",width:100,checkbox:true},
                {field:"org_name",title:"部门",width:100},
                {field:"org_description",title:"部门信息",width:100},
                {field:"org_parentId",title:"父节点",width:100}
            ]],
            toolbar:[
                {text:"添加",iconCls:"icon-add"},
                {text:"修改",iconCls:"icon-edit"},
                {text:"删除",iconCls:"icon-remove",handler:function(){remove();}},
                {text:"分配权限",iconCls:"icon-search",handler:function(){qx_show();}}

            ]
        });
        load();
    }
    function load(){
        $.getJSON("search.do",function(data){
            //给列表填充数据

            $("#user_grid").datagrid("loadData",data);
        });
    }
    //删除
    function remove(){
        //获取选择的数据
        var rows= $("#user_grid").datagrid("getSelections");
        //创建一个数组
        var as=[];
        for(var i in rows){
            as[i]=rows[i].id;
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
                load();
            }
        });
    }
    //弹出窗口
    function qx_show(){
        var rows=$("#user_grid").datagrid("getSelections");
        if(rows.length==1){
            //显示window
            $("#qx_window").window("open");
        }else{
            $.messager.alert("系统提示","请选择唯一一个账号");
        }

    }
    //保存
    function qx_save(){
        var user=$("#user_grid").datagrid("getSelected");
        //获取选择的节点
        var nodes= $("#qx_tree").tree("getChecked");
        var as=[];
        for(var x in nodes){
            var o={userid:user.id,resourceid:nodes[x].id};
            as[x]=o;
        }
        var json=JSON.stringify(as);
        //提交
        $.ajax({
            url:"fenpei.do",
            method:"post",
            data:json,
            contentType:"application/json",
            success:function(d){
                alert(d);
            }
        });
    }
    init();
</script>
