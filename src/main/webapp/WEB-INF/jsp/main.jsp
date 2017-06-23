<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>main</title>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/icon.css" />
    <link rel="stylesheet" href="css/easyui.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/easyui.js"></script>
    <style type="text/css">
        html, body {
            height: 100%;
        }
    </style>
    <script type="text/javascript">
        function init(){
            $("#system").tree({
            /de:所点击的节点
            onClick:function(node){
                //判断指定名称的tab是否存在
                var isExists=$("#work").tabs("exists",node.text);
                if(isExists){
                    $("#work").tabs("select",node.text);
                }else{
                    //添加tab
                    $("#work").tabs("add",{
                        title:node.text,//tab的标题
                        href:"user.jsp",//加载user.jsp的内容
                        closable:true   //可以关闭
                    });
                }

            }
        });
        }
        $(init);
    </script>
</head>
<body>
<!-- 布局:把页面分为上下左右中 -->
<div class="easyui-layout" style="width:100%;height:100%;">
    <div data-options="region:'north'"
         style="height:100px;background-color:blue"><h2>XXX市民政局OA救助系统</h2></div>
    <div id="sum" class="easyui-accordion" data-options="region:'west'"
         style="width:20%">
        <div title="系统管理">
            <ul class="easyui-tree" id="system">
                <li>用户管理
                    <>
                <li>角色管理<>
                <li>模块管理<>
            </ul>
        </div>
        <div title="分类管理">
            <ul class="easyui-tree" id="fenlei">
                <li><a href="second.jsp">zhushipeng</a>
                    <>
                <li>agdag<>
                <li>ggahg<>
            </ul>
        </div>
        <div title="订单管理"></div>
    </div>
    <div id="work" class="easyui-tabs" data-options="region:'center'">

    </div>
</div>
</body>
