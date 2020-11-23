<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: MSI-PC
  Date: 2020/5/30
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改数据</title>
    <%
        String num = request.getParameter("num");

        String dbName = "entery_db";
        String username = "root";
        String password = "123456";
        String url = "jdbc:mysql://localhost/" + dbName;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url,username,password);
        Statement statement = conn.createStatement();
        String sql = "SELECT * FROM profit WHERE num = " + num + ";";
        ResultSet rs = statement.executeQuery(sql);
        rs.next();

    %>
</head>
<body>
<table border="1">
    <th colspan="5" sytle = "font-size:x-large;alignment:center">当前数据</th>
    <tr style="text-align:center">
        <td>编号</td>
        <td>消费类别</td>
        <td>金额</td>
        <td>人数</td>
        <td>日期</td>
    </tr>
    <tr style="text-align:center">
        <td><%= rs.getString(1)%></td>
        <td><%= rs.getString(2)%></td>
        <td><%= rs.getString(3)%></td>
        <td><%= rs.getString(4)%></td>
        <td><%= rs.getString(5)%></td>
    </tr>
</table>
<%
    if(rs.getString(2).equals("成本")){
%>
<form action=<% out.print("profit_modify?num=" + num);%> method="post">
    <form action="set_cost" method="post">
        当天成本金额:<input type="text" name="money" ><br>
        <input type="text" name="year" required>年
        <input type="text" name="month" required>月
        <input type="text" name="day" required>日<br>
        <input type="submit" value="修改">
</form>
<%
    }
    else{
        sql = "SELECT * FROM type;";
        rs = statement.executeQuery(sql);
%>
    <form action=<% out.print("profit_modify?num=" + num);%>  method="post">
        金额:<input type="text" name="money" ><br>
        人数:<input type="text" name="people" ><br>
        <select name="type">
            <% while(rs.next()){ %>
            <option value=<% out.print(rs.getString(1)); %> selected>
                <% out.print(rs.getString(1));%>
            </option>
            <% } %>
        </select><br>
        <input type="submit" value="修改"><br>
    </form>
<%
    }
%>
    <form action="index.jsp" method="post">
        <input type="submit" value="返回菜单"><br>
</body>
</html>
