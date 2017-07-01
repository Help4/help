<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<div id="role_grid"></div>
<div id="role_alert" class="easyui-window" data-options="closed:true" style="width:500px;height:300px">
    <form id="role_form" class="form-group" style="margin: 10px">
        <input id="role_rid" type="hidden" name="rid" value="0"/>
        <div class="input-group">
            <span class="input-group-addon">账户</span>
            <input id="role_account" type="text" name="account" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">密码</span>
            <input id="role_pwd" type="text" name="pwd" class="form-control"/>
        </div>
        <a class="btn btn-success btn-block" href="javascript:save()">保存</a>
    </form>
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
                    addRole();
                }
                },
                {
                    text: "修改", iconCls: "icon-edit", handler: function () {
                    editRole();
                }
                },
                {
                    text: "删除", iconCls: "icon-remove", handler: function () {
                    removeRole();
                }
                },
                {
                    text: "分配权限", iconCls: "icon-edit", handler: function () {
                    editqx();
                }
                },
                {
                    text: "刷新", iconCls: "icon-edit", handler: function () {
                    reflash();
                }
                },

            ]
        });
        roload();
    }
    function reflash(){
        roload();
    }
    function roload() {
        $.getJSON("findAllRole.do",function (data) {
            //给列表填充数据
            $("#role_grid").datagrid("loadData", data);
        });
    }
    function addRole() {
        var x = $("#role_grid").datagrid("getSelected");
        $("#role_rid").val(0);
        $("#role_account").val(x);
        $("#role_pwd").val(x);
        $("#role_alert").window("open");
    }
    function save() {
        var y = $("#role_grid").datagrid("getSelected");
        var x=$("#role_form").serialize();
      //  alert(x);
        if(y!=null) {
            $.get("editRole.do", x, function (d) {
                //alert(d);
                $("#role_alert").window("close");
                //重新加载数据
                roload();
            });
        }else {
            $.post("addRole.do",x, function (d) {
              //  alert(d)
                $("#role_alert").window("close");
                //重新加载数据
                roload();
            });
        }
    }
    //弹出窗口
    function qx_show() {
        var rows = $("#role_grid").datagrid("getSelections");
        if (rows.length == 1) {
            //显示window
            $("#qx_window").window("open");
        } else {
            $.messager.alert("系统提示", "请选择唯一一个账号");
        }
    }

    function editRole() {
        var x = $("#role_grid").datagrid("getSelections");
       // alert(x.length);
        if(x.length==1){
            $("#role_rid").val(x[0].rid);
            $("#role_account").val(x[0].account);
            $("#role_pwd").val(x[0].pwd);
            //弹出窗口
            $("#role_alert").window("open");
        }else{
            $.messager.alert("系统提示：","请选择一个账户");
        }
    }
    function removeRole() {
        var rows = $("#role_grid").datagrid("getSelections");
        //alert(rows[0].rid);
        //创建一个数组
        var as = [];
        for (var i in rows) {
            as[i] = rows[i].rid;
        }
        //转换为json
        var d = JSON.stringify(as);
        //提交数据到服务端
        $.ajax({
            url: "removeRoleById.do",
            method: "post",
            data: d,
            contentType: "application/json",
            success: function (data) {
              //  alert(data);
                roload();
            }
        });
    }
    $(roleinit);
</script>
