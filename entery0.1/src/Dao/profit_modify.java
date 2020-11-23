package Dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

@WebServlet(name = "profit_modify")
public class profit_modify extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");

        PrintWriter out = response.getWriter();
        String num = request.getParameter("num");
        String people = request.getParameter("people");
        if(people.equals(null)){
            for_cost(request,response);
        }
        else{
            for_comsume(request,response);
        }

        response.setHeader("refresh", "0;url=/entery0_1_war_exploded/modify_consume.jsp?num=" + num);
    }

    public void update_sql(String sql){
        try{
            System.out.println("*");

            String dbName = "entery_db";
            String username = "root";
            String password = "123456";
            String url = "jdbc:mysql://localhost/" + dbName;
            System.out.println(dbName);
            System.out.println(username);
            System.out.println(password);
            System.out.println(url);
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement statement = conn.createStatement();
            //System.out.println(sql);
            int result = statement.executeUpdate(sql);

            if(result > 0){
                System.out.println("成功！");
            }
            else{
                System.out.println("失败！");
            }
        }
        catch(Exception e){
            System.out.println(e);
        }
    }

    public void for_cost(HttpServletRequest request, HttpServletResponse response){
        String num = request.getParameter("num");
        String str_year = request.getParameter("year");
        String str_month = request.getParameter("month");
        String str_day = request.getParameter("day");



    }

    public void for_comsume(HttpServletRequest request, HttpServletResponse response){
        String num = request.getParameter("num");
        String type = request.getParameter("type");
        String money = request.getParameter("money");
        String people = request.getParameter("people");

        String sentence_type = "",sentence_money = "",sentence_people = "";

        if(!type.equals("")){
            sentence_type = "type = '" + type + "'";
        }
        if(!money.equals("")){
            sentence_money = ",money = " + money;
        }
        if(!people.equals("")){
            sentence_people = ",people = " + people;
        }


        String sql = "UPDATE profit SET " + sentence_type + sentence_money + sentence_people + " WHERE num = " + num + ";";
        System.out.println(sql);
        update_sql(sql);
    }

}
