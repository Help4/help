 @Resource
    private UserService us;

    @RequestMapping("tologin22.do")
    public String login(String account,String pwd) {
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(account,pwd);
        try {
            subject.login(token);
        } catch (AuthenticationException e) {
            return "login";
        }

        return "main";
    }

    //添加用户
    @RequestMapping("doAddUser.do")
    @ResponseBody
    @RequiresPermissions({"user:create"})
    public String doAddUser() {
        System.out.println("--doAddUser");
        return "doAddUser";
    }

    //去添加用户页面
    @RequestMapping("/toAddUser.do")
    @RequiresPermissions("user:create")
    public String toAddUser() {
        return "adduser";
    }



//去登陆页面
    @RequestMapping("togo.do")
    public String togo() {
     System.out.print("haha");
        return "login";
    }



    @RequestMapping("toNoqx.do")
    public String toNoqx() {
        return "noqx";
    }


Alt+回车 导入包,自动修正
Ctrl+N   查找类
Ctrl+Shift+N 查找文件
Ctrl+Alt+L  格式化代码
Ctrl+Alt+O 优化导入的类和包
Alt+Insert 生成代码(如get,set方法,构造函数等)
Ctrl+E或者Alt+Shift+C  最近更改的代码
Ctrl+R 替换文本
Ctrl+F 查找文本
Ctrl+Shift+Space 自动补全代码
Ctrl+空格 代码提示
Ctrl+Alt+Space 类名或接口名提示
Ctrl+P 方法参数提示
Ctrl+Shift+Alt+N 查找类中的方法或变量
Alt+Shift+C 对比最近修改的代码

Shift+F6  重构-重命名
Ctrl+Shift+先上键
Ctrl+X 删除行
Ctrl+D 复制行
Ctrl+/ 或 Ctrl+Shift+/  注释（// 或者/*...*/ ）
Ctrl+J  自动代码
Ctrl+E 最近打开的文件
Ctrl+H 显示类结构图
Ctrl+Q 显示注释文档
Alt+F1 查找代码所在位置
Alt+1 快速打开或隐藏工程面板
Ctrl+Alt+ left/right 返回至上次浏览的位置
Alt+ left/right 切换代码视图
Alt+ Up/Down 在方法间快速移动定位
Ctrl+Shift+Up/Down 代码向上/下移动。
F2 或Shift+F2 高亮错误或警告快速定位

代码标签输入完成后，按Tab，生成代码。
选中文本，按Ctrl+Shift+F7 ，高亮显示所有该文本，按Esc高亮消失。
Ctrl+W 选中代码，连续按会有其他效果
选中文本，按Alt+F3 ，逐个往下查找相同文本，并高亮显示。
Ctrl+Up/Down 光标跳转到第一行或最后一行下
Ctrl+B 快速打开光标处的类或方法










    @RequiresRoles("admin")
    public void toAdmin() {
    }

http://www.cnblogs.com/lavezhang/p/5582484.html


jsp导入excel
http://www.cnblogs.com/bobodeboke/p/4959103.htmlhttp://www.cnblogs.com/bobodeboke/p/4959103.html

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>My JSP 'user.jsp' starting page</title>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/icon.css"/>
    <link rel="stylesheet" href="css/easyui.css"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/easyui.js"></script>
    <script type="text/javascript">
        function init(){
          $("#user_grid").datagrid({
            title:"用户管理",
            url:"user.do",
            columns:
            [[
               {field:"id",title:"选择",width:100,checkbox:true},
              {field:"account",title:"账号",width:100},
              {field:"pwd",title:"密码",width:100},
              {field:"re.name",title:"角色",width:100,formatter:function(v,row,index){return row["re"]["name"]}}

            ]],
            toolbar:[
             {text:"添加",iconCls:"icon-add",handler:function(){addUser();}},
             {text:"修改",iconCls:"icon-edit",handler:function(){editUser();}},
             {text:"删除",iconCls:"icon-remove",handler:function(){deleteUser();}}
            ]
          });
        }
        $(init);
        function deleteUser(){
        //获取选择的数据
          var x=  $("#user_grid").datagrid("getSelected");
          //x非空,就是选择了要删除的数据
          if(x){
             $.get("user.do?flag=delete",{id:x.id},function(d){
            location.reload(true);
          });
          }else{
             //提示框
             $.messager.alert("系统提示","请选择要删除的数据");
          }


        }
        function addUser(){
         $.get("role.do",function(data){
         //把普通string解析为json对象
             var json=JSON.parse(data);
             var op="";
             for(var i in json){
                 op+="<option value="+json[i].id+">"+json[i].name+"</option>";
             }

             $("#user_rid").html(op);
         });
        //弹出窗口
         $("#user_alert").window("open");
        }
        function save(){
          var x=$("#user_form").serialize();
            $.get("user.do",x+"&flag=add",function(d){
            $("#user_alert").window("close");
            //重新加载数据
            $("#user_grid").datagrid("reload");
          });

        }
        //修改
        function editUser(){
          //获取要修改的数据
          var data=$("#user_grid").datagrid("getSelected");
          $("#user_id").val(data.id);
          $("#user_account").val(data.account);
          $("#user_pwd").val(data.pwd);
          $("#user_alert").window("open");
        }
    </script>
  </head>
  <body>
      <div id="user_grid"></div>
      <!-- 定义窗口 -->
      <div id="user_alert" class="easyui-window" data-options="closed:true" style="width:500px;height:300px">
         <form id="user_form" class="form-group" style="margin: 10px">
            <input id="user_id" type="hidden" name="id" value="0"/>
            <div class="input-group">
              <span class="input-group-addon">账号</span>
              <input id="user_account" type="text" name="account" class="form-control"/>
            </div>
            <div class="input-group">
              <span class="input-group-addon">密码</span>
              <input id="user_pwd" type="password" name="pwd" class="form-control"/>
            </div>
            <div class="input-group">
              <span class="input-group-addon">角色</span>
              <select name="rid" id="user_rid" class="form-control"></select>
            </div>
             <a class="btn btn-success btn-block" href="javascript:save()">保存</a>
         </form>

      </div>
  </body>
</html>








  {field:"uid",title:"选择",width:100,checkbox:true},
                {field:"u_name",title:"账号",width:100},
                {field:"email",title:"邮箱",width:100},
                {field:"phone",title:"电话",width:100},
                {field:"u_responsidle",title:"权限",width:100},
                {field:"u_gender",title:"性别",width:100},
                {field:"u_age",title:"年龄",width:100}



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

public class ResourceController{
    @Resource
    private ResourceService rService;
    //所有节点
	/*@RequestMapping("findAllResource.do")
	@ResponseBody
	public List<Resource2> findAllResource(){
		return rService.findAllResource();
	}
	//查找指定节点的子节点
	@RequestMapping("findChild.do")
	@ResponseBody
	public List<Resource2> findChild(int id){

		return rService.findChild(id);
	}*/

    //查询所有的资源管理
    @RequestMapping("findRs.do")
    @ResponseBody
    public List<Resource2> findRs(int userid){

        return rService.findRs(userid);



    }


    //添加子节点
    @RequestMapping(value="saveRes.do",method= RequestMethod.POST)
    public void saveRes(HttpServletRequest request, HttpServletResponse res){
        String text = request.getParameter("text");
        String url = request.getParameter("url");

        String pid1 = request.getParameter("pid");

        int pid = Integer.parseInt(pid1);

        System.out.println(text+":text"+url+":url"+pid+":pid");
        Resource2 resource2 = new Resource2();
        resource2.setPid(pid);
        resource2.setText(text);
        resource2.setUrl(url);
        rService.saveRes(resource2);


    }
    //删除子节点
    @RequestMapping(value="removeRes.do",method=RequestMethod.POST)
    @ResponseBody
    public void removeRes(HttpServletRequest request,HttpServletResponse res){
        String id = request.getParameter("id");
        //System.out.println(id+"----------");
        rService.removeRes(Integer.parseInt(id));
    }


    //分配权限
    @RequestMapping(value="fenpei.do",method=RequestMethod.POST)
    @ResponseBody
    public int fenpei(@RequestBody ArrayList<Map> data){
        //System.out.println(data.size()+"----");
        for (Map map : data) {
            System.out.println(map);
        }
        return rService.fenpei(data);

    }

}


//poi
public File generateReport(String templateFile,SchemeVO schemeVO, Map inputParams) throws Exception{
        List paramsList = null;
        if ((inputParams!=null)&&(inputParams.size()!=0)){
            paramsList = initInputParams(schemeVO,inputParams);
        }else{
           paramsList = schemeVO.getInputParamVOList();
        }
        HSSFSheet sheet = null;
        HSSFWorkbook wb =null;
        try{
            POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(templateFile));
            wb = new HSSFWorkbook(fs);
            sheet = wb.getSheetAt(0);
        }catch(Exception ex){
            throw new Exception ("parser excel file error.");
        }
        List dataBlockVOList = schemeVO.getDataBlockVOList();
        for (Iterator i = dataBlockVOList.iterator(); i.hasNext(); ) {
            DataBlockVO item =(DataBlockVO)i.next();
            //insertDataToSheet(sheet,item,schemeVO.getInputParamVOList());
            SQLQueryVO queryVO = item.getSqlQueryVO();
            List columnVOList = item.getColumnVOList();
            if (queryVO==null){//no sql query
                for (int columnI = 0; columnI < columnVOList.size(); columnI++) {
                    ColumnVO columnVO = (ColumnVO) columnVOList.get(columnI);
                    String columnName = columnVO.getQueryName();
                    for (int i1 = 0; i1 < paramsList.size(); i1++) {
                        InputParamVO paramVO = (InputParamVO) paramsList.get(i1);
                        String title = paramVO.getTitle();
                        if (title.trim().compareToIgnoreCase(columnName.trim())== 0) { //equal
                            insertDataToSheet(sheet,columnVO,paramVO.getInitValue());
                            break;
                        }
                    }
                }
            }else{//have slq query
                String sqlString = getSQLString(paramsList,queryVO);//get the sqlString
                int columnCount = columnVOList.size();
                ReportDAO reportDAO = new ReportDAO();
                List list = reportDAO.getQueryList(sqlString,columnCount);
                System.out.println("Listllllllllllllllllllll");
                insertDataToSheet(sheet,columnVOList,list);
            }
        }
        File file = new File(Constants.fileName);
//        if (file.exists()){
//            file.delete();
//        }
        FileOutputStream fileOut = new FileOutputStream(file);
        wb.write(fileOut);
        fileOut.close();
        file.createNewFile();
        return file;
    }
