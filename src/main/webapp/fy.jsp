<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>分页</title>
    <link rel="stylesheet" href="css/icon.css" />
    <link rel="stylesheet" href="css/easyui.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/easyui.js"></script>
    <script type="text/javascript">
        function init(){
            $("#user_grid").datagrid({
                title:"用户信息",

                pagination:true,//显示分页组件
                columns:[[
                    {field:"account",title:"账号",width:100},
                    {field:"pwd",title:"密码",width:100}
                ]]
            });
            load(1);
        }
        $(init);
        //加载数据
        function load(p){
            //异步获取json对象
            $.getJSON("fy.do",{page:p},function(data){
                $("#user_grid").datagrid("loadData",data);
                //获取列表的分页组件
                var pager= $("#user_grid").datagrid("getPager");
                //设置分页组件的参数
                pager.pagination({
                    total:5,//总条数
                    pageNumber:p,//指定当前是第几页
                    pageSize:2,//默认条数
                    //设置页面尺寸选择数组
                    pageList:[1,2,3,4,5,6,7,8,9,10,],
                    onSelectPage:function(page,size){
                        //根据新页码获取数据
                        load(page);
                    }
                });
            });
        }
    </script>
</head>
<body>
<div id="user_grid"></div>
</body>
</html>
