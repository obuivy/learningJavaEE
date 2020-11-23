<%--
  Created by IntelliJ IDEA.
  User: MSI-PC
  Date: 2020/5/25
  Time: 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Entity.Type_num" %>
<head>
    <title>盈亏总览</title>
    <%--
        数据库连接及初始化数据
    --%>

    <%
        String dbName = "entery_db";
        String username = "root";
        String password = "123456";
        String url = "jdbc:mysql://localhost/" + dbName;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url,username,password);
        Statement statement = conn.createStatement();
        String sql = "SELECT * FROM profit order by date;";
        ResultSet rs = statement.executeQuery(sql);

        String str_year = request.getParameter("year");
        String str_month = request.getParameter("month");

        String ym = str_year + "-" + str_month;
        int len = ym.length();

        ArrayList<Type_num> type_list = new ArrayList<Type_num>();
        Type_num vtn = new Type_num();
        vtn.setNum(0);
        vtn.setType("无");
        type_list.add(vtn);
    %>
</head>
<body>
<%--
    实现表格
--%>
<table border = "1">
    <th colspan = "7" sytle = "font-size:x-large;alignment:center"><% out.print(str_year+"年"+str_month+"月的消费记录"); %></th>
    <tr style="text-align:center">
        <td>编号</td>
        <td>消费类别</td>
        <td>金额</td>
        <td>人数</td>
        <td>日期</td>
        <td colspan="2">操作</td>
    </tr>
    <%
        int sum_money = 0;
        int sum_people = 0;
        while(rs.next()){
            String str = rs.getString(5).substring(0,len);
            if(ym.equals(str)){
                //统计总额和人数
                try{
                    sum_money = sum_money + Integer.parseInt(rs.getString(3));
                    sum_people = sum_people + Integer.parseInt(rs.getString(4));
                }
                catch(Exception e){
                    System.out.println(e);
                }
                //统计消费类型
                if(!rs.getString(2).equals("成本")){
                    int flag = 0;
                    for(int i = 0; i < type_list.size(); i++){
                        if(type_list.get(i).getType().equals(rs.getString(2))){
                            type_list.get(i).setNum(type_list.get(i).getNum() + 1);
                            flag = 1;
                        }
                    }
                    if(flag == 0){
                        Type_num tn = new Type_num();
                        tn.setType(rs.getString(2));
                        tn.setNum(1);
                        type_list.add(tn);
                    }
                }


    %>
    <tr style="text-align: center">
        <td><%= rs.getString(1)%></td>
        <td><%= rs.getString(2)%></td>
        <td><%= rs.getString(3)%></td>
        <td><%= rs.getString(4)%></td>
        <td><%= rs.getString(5)%></td>
        <td>
            <form action=<% out.print("modify_consume.jsp?num=" + rs.getString(1)); %> method="post">
                <input type="submit" value="修改"><br>
            </form>
        </td>
        <td>
            <form action=<% out.print("profit_del?num=" + rs.getString(1) + "&year=" + str_year + "&month=" + str_month); %> method="post">
                <input type="submit" value="删除"><br>
            </form>
        </td>
    </tr>
    <%
            }
        }
    %>


    <%--
        切换日期
    --%>
    <%!//切换日期函数
        String get_new_month(String str_month,String action){
            if(str_month.equals("12")&&action.equals("next")){
                return "01";
            }
            if(str_month.equals("01")&&action.equals("previous")){
                return "12";
            }

            int month = Integer.parseInt(str_month);
            if(action.equals("previous")){
                month = month - 1;
            }
            if(action.equals("next")){
                month = month + 1;
            }

            if(month >= 10){
                str_month = String.valueOf(month);
            }
            else{
                str_month = String.valueOf(month);
                str_month = "0" + str_month;
            }
            return str_month;
        }

        String get_new_year(String str_year,String str_month,String action){
            int year = Integer.parseInt(str_year);
            if(str_month.equals("12")&&action.equals("next")){
                year = year + 1;
                return String.valueOf(year);
            }
            if(str_month.equals("01")&&action.equals("previous")){
                year = year - 1;
                return String.valueOf(year);
            }
            return str_year;
        }

    %>
    <%--
        获取本月数据后
    --%>
    <%
        int max = 0, max_index = 0;
        for(int i = 0; i < type_list.size(); i++){
            if(type_list.get(i).getNum() > max){
                max = type_list.get(i).getNum();
                max_index = i;
            }
        }

        /*
        for(int i = 0; i < type_list.size(); i++){
            System.out.print("i:");
            System.out.println(i);
            System.out.print(type_list.get(i).getType() + "的个数为");
            System.out.println(type_list.get(i).getNum());

        }
        */

        String previous_url = "display_profit.jsp?year=" + get_new_year(str_year,str_month,"previous")
                + "&month=" + get_new_month(str_month,"previous");
        String next_url = "display_profit.jsp?year=" + get_new_year(str_year,str_month,"next")
                + "&month=" + get_new_month(str_month,"next");


    %>

</table>
<form action=<% out.print(previous_url); %> method="post">
    <input type="submit" value="上个月">
</form>
<form action=<% out.print(next_url); %> method="post">
    <input type="submit" value="下个月">
</form>
<%--
    总计表格
--%>
<table border = "1">
    <th colspan = "3" sytle = "font-size:x-large;alignment:center">月度数据</th>
    <tr style="text-align:center">
        <td>月总营业额</td>
        <td>月总顾客数</td>
        <td>月最受欢迎消费类型</td>
    </tr>
    <tr style="text-align: center">
        <td><%= sum_money%></td>
        <td><%= sum_people%></td>
        <td><%= type_list.get(max_index).getType()%></td>
    </tr>
</table>
<form action=index.jsp method="post">
    <input type="submit" value="返回菜单"><br>
</form>


<%
    rs.close();
    statement.close();
    conn.close();
%>
</body>
</html>
