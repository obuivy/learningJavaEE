<%@ page import="java.util.Calendar" %>
<%--
  Created by IntelliJ IDEA.
  User: MSI-PC
  Date: 2020/5/25
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>餐饮店数据模拟</title>

    <%
      Calendar cal = Calendar.getInstance();
      int day = cal.get(Calendar.DATE);
      int month = cal.get(Calendar.MONTH) + 1;
      int year = cal.get(Calendar.YEAR);

      System.out.println("Current Date: " + cal.getTime());
      System.out.println("Day: " + day);
      System.out.println("Month: " + month);
      System.out.println("Year: " + year);

      String str_year = String.valueOf(year);
      String str_month;
      if(month >= 10){
        str_month = String.valueOf(month);
      }
      else{
        str_month = String.valueOf(month);
        str_month = "0" + str_month;
      }

      String url_consume = "consume.jsp";
      String url_display_profit = "display_profit.jsp?year=" + str_year + "&month=" + str_month;
      String url_display_consume = "display_consume.jsp";
      String url_manage = "manage.jsp";
      String url_set_cost = "set_cost.jsp";


    %>

  </head>
  <body>
  <a href=<% out.print(url_consume); %>>结账</a><br>
  <a href=<% out.print(url_display_consume); %>>消费情况</a><br>
  <a href=<% out.print(url_display_profit); %>>盈亏总览</a><br>
  <a href=<% out.print(url_manage); %>>数据管理</a><br>
  <a href=<% out.print(url_set_cost); %>>设定成本</a><br>

  </body>
</html>
