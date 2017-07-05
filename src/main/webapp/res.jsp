<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<table id="res_grid"></table>
<div id="res_alert" class="easyui-window" data-options="closed:true" style="width:500px;height:300px">
    <form id="res_form" class="form-group" style="margin: 10px">
        <input id="re_id" type="hidden" name="re_id" value="0"/>
        <div class="input-group">
            <span class="input-group-addon">资源名称</span>
            <input id="re_text" type="text" name="text" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">路径</span>
            <input id="re_url" type="text" name="url" class="form-control"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">父资源</span>
            <select id="re_pid" class="form-control" name="re_pid">
            </select>
        </div>
        <a class="btn btn-success btn-block" href="javascript:res_save()">保存</a>
    </form>
</div>
<script type="text/javascript">
    function res_init(){
        $("#res_grid").treegrid({
            idField:"re_id",
            treeField:"text",
            singleSelect : false,
            columns:[[
                {field:"re_id",width:100,checkbox:true},
                {field:"text",title:"名称",width:150},
                {field:"url",title:"路径",width:200},
                {field:"ptext",title:"父资源",width:100}
            ]],
            toolbar:[
                {text:"添加",iconCls:"icon-add",handler:function(){addRes();}},
                {text:"修改",iconCls:"icon-edit",handler:function(){editRes();}},
                {text:"删除",iconCls:"icon-remove",handler:function(){res_remove();}},

            ]
        });
        res_load(1,10);
    }
    function res_load(p,size){
        $.getJSON("findAllResource.do",{page:p,size:size},function(data){
            //给列表填充数据
            $("#res_grid").treegrid("loadData",data);
            var pager= $("#res_grid").treegrid()("getPager");
            pager.pagination({
                total:18,//总条数
                pageNumber:p,//指定当前2是第几页
                pageSize:size,//默认条数
                //设置页面尺寸选择数组
                pageList:[1,2,3,4,5,6,7,8,9,10],
                onSelectPage:function(page,size){
                    //根据新页码获取数据
                    r_page2=page;
                    r_size2=size;
                    load(page,size);
                }
            });
        });
    }
    function res_remove() {
        var rows = $("#res_grid").treegrid("getSelections");

        //创建一个数组
        var as = [];
        for (var i in rows) {
            as[i] = rows[i].re_id;
        }
        //转换为json
        var d = JSON.stringify(as);
        //提交数据到服务端
        $.ajax({
            url: "removeResourceById.do",
            method: "post",
            data: d,
            contentType: "application/json",
            success: function (data) {

                res_load();
            }
        });
    }
    function addRes(){
        $.getJSON("findFirstRes.do", function (json) {
            var op="";
            for(var i in json){
                op+="<option value="+json[i].re_id+">"+json[i].text+"</option>";
            }

            $("#re_pid").html(op);
        })
        //弹出窗口
        $("#res_alert").window("open");
    }
    function res_save() {
        var x = $("#res_form").serialize();
        var y= $("#res_grid").treegrid("getSelected");


        if(y!=null){

            $.get("editRes.do", x, function (d) {

                $("#res_alert").window("close");
                //重新加载数据
                res_load();
            });
        }else{
            $.get("addRes.do", x, function (d) {

                $("#res_alert").window("close");
                //重新加载数据
                res_load();
            });
        }

    }
    function editRes() {
        var x = $("#res_grid").treegrid("getSelections");
        if(x.length==1){
            $("#re_id").val(x[0].re_id);
            $("#re_text").val(x[0].text);
            $("#re_url").val(x[0].url);
            $("#re_pid").val(x[0].re_pid);


            $.getJSON("findFirstRes.do", function (json) {
                //把普通string解析为json对象
                var op="";
                for(var i in json){
                    if(json[i].re_id==x[0].re_pid){
                        op+="<option selected = \"selected\" value="+json[i].re_id+">"+json[i].text+"</option>";
                    }
                    op+="<option value="+json[i].re_id+">"+json[i].text+"</option>";
                }

                $("#re_pid").html(op);
            })

            //弹出窗口
            $("#res_alert").window("open");
        }else{
            $.messager.alert("系统提示", "请选择唯一一个账号");
        }
    }
    res_init();
</script>
