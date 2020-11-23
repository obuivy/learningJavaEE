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

@WebServlet(name = "manage_del")
public class manage_del extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");

        PrintWriter out = response.getWriter();
        out.println("<a href='http://localhost:8080/entery0_1_war_exploded/'立刻返回</a><br>");


        String type = request.getParameter("type");
        System.out.println(type);

        String sql = "DELETE FROM type WHERE type = '" + type + "';";
        update_sql(sql);

        response.getWriter().write("1秒后跳到主页");
        //设置1秒钟跳转
        response.setHeader("refresh", "0;url=/entery0_1_war_exploded/manage.jsp");

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
            System.out.println(sql);
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
}

