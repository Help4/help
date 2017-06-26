
    <script type="text/javascript">
        function init() {

            //初始化
            $("#re").treegrid({
                title:"资源管理",
                url:"findRs.do",
                idField:"id",
                treeField:"text",
                columns:[[
                    {field:"id",title:"",width:100,checkbox:true},
                    {field:"text",title:"资源名称",width:200},
                    {field:"url",title:"路径",width:200},
                    {field:"pid",title:"上一级",width:200}
                ]],
                toolbar:[
                    {text:"添加",iconCls:"icon-add",handler:function(){add2();}},
                    {text:"删除",iconCls:"icon-remove",handler:function(){removeRes();}},
                    {text:"分配权限",iconCls:"icon-add",handler:function(){}}
                ]
            });
        }
        $(init);
        function add2(){
            var x=$("#re").treegrid("getSelected");

            /* $("#resource_pid").value(x.pid); */

            $("#resource_pid").val(x.id);
            alert(x.id);
            $("#resource_alert").window("open");

        }

        function saveRes(){
            var data=$("#resource_form").serialize();

            $.post("saveRes.do",data,function(){
                $("#resource_alert").window("close");
                init();
            });
            /* 	$.ajax({
                    url:"saveRes.do",
                    data:data,
                    method:"post",
                    success:function(d){
                        $("#resource_alert").window("close")
                    }

                }); */
        }


        function removeRes(){
            var x=$("#re").treegrid("getSelected");
            alert(x.id);
            $.post("removeRes.do",{id:x.id},function(){

                init();
            });
        }

    </script>



<!-- <a href="findRs.do">resource</a>
<br>
<ul id="test" class="easyui-tree" data-options="url:'findRs.do'">

</ul> -->
<div id="re"></div>

<!-- 弹出窗口 -->
<div id="resource_alert" class="easyui-window" data-options="closed:true" style="width:500px;height:300px">
    <form id="resource_form" class="form-group" style="margin: 10px">
        <input id="resource_pid" type="hidden" name="pid" />
        <div class="input-group">
            <span class="input-group-addon">资源名称</span>
            <input id="resource_text" type="text" name="text" class="form-control"/>
        </div>

        <div class="input-group">
            <span class="input-group-addon">资源路径</span>
            <input id="resource_url" type="text" name="url" class="form-control"/>
        </div>

        <a class="btn btn-success btn-block" href="javascript:saveRes()">保存</a>
    </form>

</div>




