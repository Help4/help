<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>xxx市的民政局OA救助系统</title>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/icon.css" />
    <link rel="stylesheet" href="css/easyui.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/easyui.js"></script>
    <style type="text/css">
        html,body{
            height: 100%;
        }
    </style>
    <script type="text/javascript">

        function init(){

            //根据用户权限 	获取所有的数节点
            $.getJSON("findReByRole.do",{rid:${role.rid}},function(data) {

                for (var i in data) {

                    $("#main_resource").accordion("add", {

                        title: data[i].text,
                        content: "<ul class='easyui-tree' data-options=\"url:'findSubByPid.do?pid=" + data[i].re_id + "'\"></ul>"

                    });
                }

                //给所有树节点添加点击事件
                $(".easyui-tree").tree({
                    onClick:function(node){

                        var b=$("#work").tabs("exists",node.text);

                        if(b){
                            $("#work").tabs("select",node.text);
                        }else{
                            $("#work").tabs("add",{
                                title:node.text,
                                closable:true,
                                href:node.url

                            });
                        }
                    }

                });

            });


        }

        $(init);
    </script>
</head>
<body>
<div class="easyui-layout" style="width:100%;height:100%;">
    <div data-options="region:'north'"
         style="height:100px;background-color:blue;text-align: center" >
        <div style="margin-top: 20px"> <h3>xxx市的民政局OA救助系统</h3></div>
    </div>
    <div id="main_resource" class="easyui-accordion"
         data-options="region:'west'" style="width:20%"></div>
    <div id="work" class="easyui-tabs" data-options="region:'center'">

    </div>
</div>
</body>
</html>
