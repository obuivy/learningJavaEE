<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/7
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>图书管理系统</title>
    <script>
      let xmlhttp =new XMLHttpRequest();
      xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
        }
      };
      xmlhttp.open("GET", "/IdeaProjects_war_exploded/LoginAction?action=autoLogin", true);
      xmlhttp.send();
    </script>
  </head>
  <body>
  <h3>欢迎来到图书管理系统</h3>
  <form action="LoginAction?action=login" method="post">
    账号:<input type="text" name="username" required><br>
    密码:<input type="password" name="password" required><br>
    <input type="checkbox" name="autoLogin" value="1">自动登录
    <input type="submit" value="登录">
    <input type="reset" value="清空"><br>
  </form>
  <a href="/IdeaProjects_war_exploded/register.jsp">注册</a>
  </body>
</html>
