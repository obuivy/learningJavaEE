<%--
  Created by IntelliJ IDEA.
  User: MSI-PC
  Date: 2020/5/25
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>结账</title>
    <%

            String dbName = "entery_db";
            String username = "root";
            String password = "123456";
            String url = "jdbc:mysql://localhost/" + dbName;
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement statement = conn.createStatement();
            String sql = "SELECT type FROM type;";
            ResultSet rs = statement.executeQuery(sql);
            
    %>
</head>
<body>
<form action="consume" method="post">
    金额:<input type="text" name="money" required><br>
    人数:<input type="text" name="people" required><br>
    <select name="type">
        <% while(rs.next()){ %>
        <option value=<% out.print(rs.getString(1)); %> selected>
            <% out.print(rs.getString(1));%>
        </option>
        <% } %>
    </select><br>
<input type="submit" value="结账"><br>
</form>
<form action=index.jsp method="post">
    <input type="submit" value="返回菜单"><br>
</form>

</body>
</html>
