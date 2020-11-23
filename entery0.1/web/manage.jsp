<%--
  Created by IntelliJ IDEA.
  User: MSI-PC
  Date: 2020/5/25
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>数据管理</title>
    <%
        String dbName = "entery_db";
        String username = "root";
        String password = "123456";
        String url = "jdbc:mysql://localhost/" + dbName;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url,username,password);
        Statement statement = conn.createStatement();
        String sql = "SELECT * FROM type";
        ResultSet rs = statement.executeQuery(sql);
    %>
</head>
<body>
<table border = "1">
    <th colspan = "5" sytle = "font-size:x-large;alignment:center"></th>
    <tr style="text-align:center">
        <td>消费类型</td>
        <td>操作</td>
    </tr>

    <% while(rs.next()){ %>
    <tr style="text-align: center">
        <td><%= rs.getString(1)%></td>
        <td>
            <form action=<% out.print("manage_del?type=" + rs.getString(1)); %> method="post">
                <input type="submit" value="删除"><br>
            </form>
        </td>
    </tr>
    <% } %>
</table>

    <form action="manage_add" method="post">
        新增消费类型:<input type="text" name="add_type" required><br>
        <input type="submit" value="添加"><br>
    </form>


    <%
        rs.close();
        statement.close();
        conn.close();
     %>

<form action=index.jsp method="post">
    <input type="submit" value="返回菜单"><br>
</form>

</body>
</html>
