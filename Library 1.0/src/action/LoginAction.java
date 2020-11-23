package action;

import entity.Book;
import entity.Log;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
/**
 * @author admin
 */
public class LoginAction extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        HttpSession session = request.getSession();
        System.out.println(session+"   "+ session.getId());
        String action = "";
        action = request.getParameter("action");
        System.out.println(action);
        if("login".equals(action)){
            Login(request,response,session);
        }else if("autoLogin".equals(action)){
            autoLogin(request,response,session);
        }else{
            loginOut(request,response,session);
        }
    }

    private void loginOut(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        session.setAttribute("loginOut","1");
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }

    private void Login(HttpServletRequest request,HttpServletResponse  response,HttpSession session) throws ServletException, IOException {
        String username ="";
        String password ="";
        String autoLogin="";
        autoLogin=request.getParameter("autoLogin");
        username=request.getParameter("username");
        password=request.getParameter("password");
        System.out.println("传过来的登录账号" + username);
        System.out.println("传过来的登录密码" + password);

        String path = "\\data\\user_details\\";
        path = path + username + ".txt";
        File f = new File(path);
        if(!f.exists()){
            //登陆失败
            System.out.println("fail!");
            PrintWriter out = response.getWriter();
            out.write("登陆失败！");
            out.println("<a href='http://localhost:8080/IdeaProjects_war_exploded/'>返回</a>");

        }
        else{
            String[] details = new String[6];
            FileInputStream input = new FileInputStream(f);
            byte[] buf = new byte[200];
            int len = input.read(buf);
            String str = "";
            for(int i = 0,j = 0,times = 0; j < len; j++) {
                if(buf[j] == '\n') {
                    str = new String(buf,i,j-i);
                    details[times] = str;
                    i = j + 1;
                    times++;
                }
            }
            if(password.equals(details[0])){
                if(details[1].equals("commonUser")){
                    if("1".equals(autoLogin)){
                        Cookie cookie=new Cookie("commonUsername",request.getParameter("username"));
                        cookie.setMaxAge(60*60*2);
                        response.addCookie(cookie);
                    }
                    //登陆成功
                    request.getRequestDispatcher("/CommonUserMain.jsp").forward(request,response);
                    System.out.println("success!");
                }
                else{
                    if(details[1].equals("administrator")){
                        request.getRequestDispatcher("/AdministratorUserMain.jsp").forward(request,response);
                        System.out.println("success!");
                    }
                }
                session.setAttribute("nowUsername",username);
            }else{
                response.getWriter().write("登录密码错误<br>");
                response.getWriter().write("请重新<a href='http://localhost:8080/IdeaProjects_war_exploded/index.jsp'>登录</a>");
            }
        }
    }

    private void autoLogin(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws ServletException, IOException {
            String username ="";
            if(session.getAttribute("loginOut")==null){
                for (Cookie cookie : request.getCookies()) {
                    if ("commonUsername".equals(cookie.getName())){
                        username=cookie.getValue();
                    }
                }
                if(username!=""){
                    session.setAttribute("nowUsername",username);
                    System.out.println("CommonUserMain");
                }else {
                    System.out.println("index");
                }
            }
    }
}
