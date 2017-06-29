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
<div id="user_grid" class="easyui-pagination"></div>
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
            <select id="user_des" class="form-control" name="account">
            </select>
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
    function userinit() {
        $("#user_grid").datagrid({
            pagination:true,//显示分页组件
            columns: [[
                {field: "uid", width: 100, checkbox: true},
                {field: "name", title: "姓名", width: 100},
                {field: "gender", title: "性别", width: 100},
                {field: "age", title: "年龄", width: 100},
                {field: "email", title: "邮箱", width: 100},
                {field: "phone", title: "电话", width: 100},
                {field: "account", title: "角色", width: 100},
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
                },
            ]
        });
        load(1);
    }
    var page2=null;
    function load(p) {
        $.getJSON("findAllUser.do",{page:p}, function (data) {
            //给列表填充数据
            $("#user_grid").datagrid("loadData", data);
            //获取列表的分页组件
            var pager= $("#user_grid").datagrid("getPager");
            //设置分页组件的参数
            pager.pagination({
                total:5,//总条数
                pageNumber:page2,//指定当前2是第几页
                pageSize:2,//默认条数
                //设置页面尺寸选择数组
                pageList:[1,2,3,4,5,6,7],
                onSelectPage:function(page,size){
                    //根据新页码获取数据
                    page2=page;
                    load(page);
                }
            });
        });
    }
    function addUser() {
        var x = $("#user_grid").datagrid("getSelected");
        $.getJSON("findAll_Org.do", function (json) {
            //把普通string解析为json对象
             var op="";
             for(var i in json){
                 op+="<option value="+json[i].orgid+">"+json[i].org_name+"</option>";
             }
             $("#user_org").html(op);
        })
        $.getJSON("findAllRole.do", function (json) {
            //alert(json);
            //把普通string解析为json对象
            var op="";
            for(var i in json){
                op+="<option value="+json[i].rid+">"+json[i].account+"</option>";
            }
            $("#user_des").html(op);
        })

        $("#user_id").val(0);
        $("#user_name").val(x);
        $("#user_age").val(x);
        $("#user_email").val(x);
        $("#user_des").val(x);
        $("#user_gender").val(x);
        $("#user_phone").val(x);
        $("#user_alert").window("open");
    }
    function save() {
        var y = $("#user_grid").datagrid("getSelected");
        var x = $("#user_form").serialize();
            if(y!=null) {
                $.get("editUser.do", x, function (d) {
                    $("#user_alert").window("close");
                    //重新加载数据
                    load(page2);
                });
            }else {
            $.post("addUser.do",x, function (d) {
                $("#user_alert").window("close");
                //重新加载数据
                load(page2);
            });
            }
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

                load(page2);
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
        var x = $("#user_grid").datagrid("getSelections");
        alert(x.length);
        if(x.length==1){
            $("#user_id").val(x[0].uid);
            $("#user_name").val(x[0].name);
            $("#user_age").val(x[0].age);
            $("#user_email").val(x[0].email);
            $("#user_des").val(x[0].responsidle);
            $("#user_gender").val(x[0].gender);
            $("#user_phone").val(x[0].phone);

            $.getJSON("findAll_Org.do", function (json) {
                //把普通string解析为json对象
                var op="";
                for(var i in json){
                    if(json[i].org_name==x[0].org_name){
                        op+="<option selected = \"selected\" value="+json[i].orgid+">"+json[i].org_name+"</option>";
                    }
                    op+="<option value="+json[i].orgid+">"+json[i].org_name+"</option>";
                }
                $("#user_org").html(op);
            })
            $.getJSON("findAllRole.do", function (json) {
                alert(json);
                //把普通string解析为json对象
                var op="";
                for(var i in json){
                    if(json[i].account==x[0].account){
                        op+="<option selected = \"selected\" value="+json[i].rid+">"+json[i].account+"</option>";
                    }
                    op+="<option value="+json[i].rid+">"+json[i].account+"</option>";
                }
                $("#user_des").html(op);
            })
            //弹出窗口
            $("#user_alert").window("open");

        }else{
            $.messager.alert("系统提示：","请选择一个账户");
        }
    }
    $(userinit);
</script>
