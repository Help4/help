<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
   后台管理页面<br/>
    <%--当前用户如果是orderer角色就显示里面的内容--%>
   <%--pricipal:当前用户名--%>
    <shiro:hasRole name="orderer">
        <shiro:principal/>是orderer角色
    </shiro:hasRole>
    <%--当前用户如果有user:create权限就显示超链接--%>
    <shiro:hasPermission name="user:create">
        <a href="/toAddUser.do">添加用户</a>
    </shiro:hasPermission>
   <%--判断是否已经登录--%>
   <shiro:authenticated>
       欢迎:<shiro:principal/>
   </shiro:authenticated>

</body>
</html>
