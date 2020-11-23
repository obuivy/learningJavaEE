<%--
  Created by IntelliJ IDEA.
  User: MSI-PC
  Date: 2020/5/25
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>设定成本</title>
</head>
<body>
<form action="set_cost" method="post">
    当天成本金额:<input type="text" name="money" required><br>
    <input type="text" name="year" required>年
    <input type="text" name="month" required>月
    <input type="text" name="day" required>日<br>

    <input type="submit" value="完成设定">
</form>
<form action=index.jsp method="post">
    <input type="submit" value="返回菜单"><br>
</form>
</body>
</html>
