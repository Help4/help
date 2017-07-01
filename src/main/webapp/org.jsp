<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div id="org_grid"></div>
<div id="org_alert" class="easyui-window" data-options="closed:true" style="width:500px;height:300px">
    <form id="org_form" class="form-group" style="margin: 10px">
        <input id="org_id" type="hidden" name="orgid" value="0"/>
        <div class="input-group">
            <span class="input-group-addon">组织名</span>
            <input id="org_name" type="text" name="org_name" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">描述</span>
            <input id="org_des" type="text" name="org_description" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">上级</span>
            <select id="parent" class="form-control" name="org_parentId">
            </select>
        </div>
        <a class="btn btn-success btn-block" href="javascript:save()">保存</a>
    </form>
</div>
<script type="text/javascript">
    function orginit(){
        $("#org_grid").treegrid({
            idField:"orgid",
            treeField:"org_name",
            singleSelect : false,
            columns:[[
                {field:"orgid",width:100,checkbox:true},
                {field:"org_name",title:"组织名",width:150},
                {field:"org_description",title:"描述",width:200},
                {field:"org_parentId",title:"上级",width:100},
            ]],
            toolbar:[
                {text:"添加",iconCls:"icon-add",handler:function(){addOrg();}},
                {text:"修改",iconCls:"icon-edit",handler:function(){editOrg();}},
                {text:"删除",iconCls:"icon-remove",handler:function(){removeOrg();}},
                {
                    text: "刷新", iconCls: "icon-edit", handler: function () {
                    reflash();
                }
                },
            ]
        });
        orgload();
    }
    function reflash(){
        orgload();
    }
    function orgload(){
        $.getJSON("findAllOrganization.do",function(data){
            //给列表填充数据
            $("#org_grid").treegrid("loadData",data);
        });
    }
    function addOrg(){
        $.getJSON("findParOrg.do", function (json) {
            //把普通string解析为json对象
            var op="";
            for(var i in json){
                op+="<option value="+json[i].orgid+">"+json[i].org_name+"</option>";
            }
            $("#parent").html(op);
        })
        $("#org_alert").window("open");
    }
    function save() {
        var x=$("#org_form").serialize()
        var y= $("#org_grid").treegrid("getSelected");
       // alert(x);
        if(y!=null){
            $.get("editOrg.do", x, function (d) {
                $("#org_alert").window("close");
                //重新加载数据
                orgload();
            });
        }else{
            $.get("addOrg.do", x, function (d) {

                $("#org_alert").window("close");
                //重新加载数据
                orgload();
            });
        }
    }
    function editOrg() {
        var x = $("#org_grid").treegrid("getSelections");
       //alert(x[0].orgid)
        if(x.length==1){
            $("#org_id").val(x[0].orgid);
            $("#org_name").val(x[0].org_name);
            $("#org_des").val(x[0].org_description);
            $("#parent").val(x[0].org_parentId);

            $.getJSON("findParOrg.do", function (json) {
                //把普通string解析为json对象
                var op="";
                for(var i in json){
                    if(json[i].orgid==x[0].org_parentId){
                        op+="<option selected = \"selected\" value="+json[i].orgid+">"+json[i].org_name+"</option>";
                    }
                    op+="<option value="+json[i].orgid+">"+json[i].org_name+"</option>";
                }

                $("#parent").html(op);
            })

            //弹出窗口
            $("#org_alert").window("open");
        }else{
            $.messager.alert("系统提示", "请选择唯一一个账号");
        }
    }
    function removeOrg() {
        var rows = $("#org_grid").treegrid("getSelections");
        //alert(rows[0].orgid);
        //创建一个数组
        var as = [];
        for (var i in rows) {
            as[i] = rows[i].orgid;
        }
       //转换为json
        var d = JSON.stringify(as);
        //提交数据到服务端
       $.ajax({
            url: "removeOrg.do",
            method: "post",
            data: d,
            contentType: "application/json",
            success: function (data) {
                //alert(data);
                orgload();
            }
        });
    }
    $(orginit);
</script>










