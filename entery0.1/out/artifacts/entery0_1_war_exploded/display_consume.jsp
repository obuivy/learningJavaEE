<%--
  Created by IntelliJ IDEA.
  User: MSI-PC
  Date: 2020/5/25
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@page import="java.sql.*"%>
<head>
    <title>盈亏总览</title>
    <%
        String dbName = "entery_db";
        String username = "root";
        String password = "123456";
        String url = "jdbc:mysql://localhost/" + dbName;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url,username,password);
        Statement statement = conn.createStatement();
        String sql = "SELECT * FROM profit WHERE money > 0;";
        ResultSet rs = statement.executeQuery(sql);
    %>
</head>
<body>
<table border = "1">
    <th colspan = "5" sytle = "font-size:x-large;alignment:center">消费记录</th>
    <tr style="text-align:center">
        <td>编号</td>
        <td>消费类别</td>
        <td>金额</td>
        <td>人数</td>
        <td>日期</td>
    </tr>
        <% while(rs.next()){ %>
    <tr style="text-align: center">
        <td><%= rs.getString(1)%></td>
        <td><%= rs.getString(2)%></td>
        <td><%= rs.getString(3)%></td>
        <td><%= rs.getString(4)%></td>
        <td><%= rs.getString(5)%></td>
    </tr>
        <% } %>
        <%
            rs.close();
            statement.close();
            conn.close();
        %>
</table>
<form action=index.jsp method="post">
    <input type="submit" value="返回菜单"><br>
</form>
</body>
</html>
