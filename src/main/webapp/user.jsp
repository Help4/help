<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<div id="panel" class="easyui-panel" title="查询条件"
     icon="icon-query-form" collapsible="true"
     style="padding: 10px;">
    <form id="queryForm" method="post">
        <label for="id">登录ID:</label>
        <input id="id" type="text" name="id"></input>
        <label for="name">姓名:</label>
        <input id="name" type="text" name="name"></input>
        <label for="email">邮箱:</label>
        <input id="email" type="text" name="email"></input>
        <label for="phone">电话 :</label>
        <input id="phone" type="text" name="phone"></input>
        <div style="padding: 10px;">
            <a href="#" class="easyui-linkbutton" onclick="queryVO();" iconCls="icon-search">确定</a>
            <a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" iconCls="icon-cancel">取消</a>
        </div>
    </form>
</div>
<div id="user_grid"></div>
<div id="user_alert" class="easyui-window" data-options="closed:true" style="width:500px;height:300px">
    <form id="user_form" class="form-group" style="margin: 10px">
        <input id="user_id" type="hidden" name="uid" value="0"/>
        <div class="input-group">
            <span class="input-group-addon">姓名</span>
            <input id="user_name" type="text" name="name" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">性别</span>
            <input id="user_gender" type="text" name="gender" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">年龄</span>
            <input id="user_age" type="number" name="age" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">邮箱</span>
            <input id="user_email" type="text" name="email" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">电话</span>
            <input id="user_phone" type="text" name="phone" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">权限</span>
            <input id="user_des" type="text" name="responsidle" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">部门</span>
            <select id="user_org" class="form-control" name="org_name">
            </select>
        </div>
        <a class="btn btn-success btn-block" href="javascript:save()">保存</a>
    </form>
</div>
</div>
<script>
    function init() {
        $("#user_grid").datagrid({

            columns: [[
                {field: "uid", width: 100, checkbox: true},
                {field: "name", title: "姓名", width: 100},
                {field: "gender", title: "性别", width: 100},
                {field: "age", title: "年龄", width: 100},
                {field: "email", title: "邮箱", width: 100},
                {field: "phone", title: "电话", width: 100},
                {field: "responsidle", title: "权限（是/否）", width: 100},
                {field: "org_name", title: "部门", width: 100},
            ]],
            toolbar: [
                {
                    text: "添加", iconCls: "icon-add", handler: function () {
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
        load();
    }

    function load() {
        $.getJSON("findAllUser.do", function (data) {
            //给列表填充数据
            $("#user_grid").datagrid("loadData", data);
        });
    }

    function addUser() {
        $.getJSON("findAll_Org.do", function (json) {


            //把普通string解析为json对象


             var op="";
             for(var i in json){
                 op+="<option value="+json[i].orgid+">"+json[i].org_name+"</option>";
             }

             $("#user_org").html(op);
        })
        //弹出窗口
        $("#user_alert").window("open");
    }

    function save() {
        var x = $("#user_form").serialize();
        //  alert(x);
        $.get("addUser.do", x, function (d) {
            alert(d);
            $("#user_alert").window("close");
            //重新加载数据
            load();
        });

    }

    function remove() {
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
            url: "removeUserById.do",
            method: "post",
            data: d,
            contentType: "application/json",
            success: function (data) {
                alert(data);
                load();
            }
        });
    }

    //弹出窗口
    function qx_show() {
        var rows = $("#user_grid").datagrid("getSelections");
        if (rows.length == 1) {
            //显示window
            $("#qx_window").window("open");
        } else {
            $.messager.alert("系统提示", "请选择唯一一个账号");
        }
    }

    function edit() {
        var x = $("#user_grid").datagrid("getSelected");
        if(x.uid!=0){
            $("#user_id").val(x.uid);
            $("#user_name").val(x.name);
            $("#user_age").val(x.age);
            $("#user_email").val(x.email);

            $("#user_gender").val(x.gender);
            $("#user_phone").val(x.phone);

            $.getJSON("findAll_Org.do", function (json) {


                //把普通string解析为json对象


                var op="";
                for(var i in json){
                    if(json[i].org_name==x.org_name){
                        op+="<option selected = \"selected\" value="+json[i].orgid+">"+json[i].org_name+"</option>";
                    }
                    op+="<option value="+json[i].orgid+">"+json[i].org_name+"</option>";
                }

                $("#user_org").html(op);
            })

            //弹出窗口
            $("#user_alert").window("open");
        }


    }
    init();
</script>
