package action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * @author admin
 */
public class RegisterAction extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");

        //获取数据
        String user = request.getParameter("user");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String realname = request.getParameter("rearName");
        String sex = request.getParameter("sex");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        System.out.println(user);
        System.out.println(username);
        System.out.println(password);
        System.out.println(realname);
        System.out.println(sex);
        System.out.println(tel);
        System.out.println(email);


        //初始化文件
        File f = new File("\\data\\userlog.txt");
        File dir = new File("\\data\\");
        File dir1 = new File("\\data\\user_details\\");
        System.out.println(f.getAbsolutePath());
        System.out.println(dir.getAbsolutePath());
        System.out.println(dir1.getAbsolutePath());
        if (!dir.exists()) {
            dir.mkdirs();
        }
        if (!dir1.exists()) {
            dir1.mkdirs();
        }
        if (!f.exists()) {
            f.createNewFile();
        }
        //判断是否重名
        String path = dir1.getAbsolutePath() + "\\" + username + ".txt";
        File new_user = new File(path);
        if (new_user.exists()) {
            //注册失败
            PrintWriter out = response.getWriter();
            out.write("注册失败！用户名已被使用！");
            out.println("<a href='http://localhost:8080/IdeaProjects_war_exploded/register.jsp'>返回注册</a>");
        }
        else {
            //注册成功
            //创建个人档案
            new_user.createNewFile();
            String[] details = {password, user, realname, sex, tel, email};
            //0：密码 1：权限 2：姓名 3：性别 4：电话 5：邮箱
            String total_details = "";
            for (int i = 0; i < 6; i++)
                total_details = total_details + details[i] + "\n";
            byte[] buf = null;
            buf = total_details.getBytes();
            FileOutputStream output = new FileOutputStream(new_user);
            output.write(buf);
            output.close();


            //读取原文件的数据
            String[] userlist = new String[100];
            try {
                FileInputStream input = new FileInputStream(f);
                int len = input.read(buf);
                String str = "";
                for (int i = 0, j = 0, times = 0; j < len; j++) {
                    if (buf[j] == '\n') {
                        str = new String(buf, i, j - i);
                        userlist[times] = str;
                        i = j + 1;
                        times++;
                    }
                }
            } catch (Exception e) {
                System.out.println(e);
            }


            //添加数据
            for (int i = 0; i < 100; i++) {
                if (userlist[i] == null) {
                    userlist[i] = username;
                    break;
                }
            }

            //将新数据添加至文件中
            String total_data = "";
            for (String string : userlist) {
                if (string != null)
                    total_data = total_data + string + "\n";
                else break;
            }
            System.out.println(total_data);
            try {
                buf = total_data.getBytes();
                output = new FileOutputStream(f);
                output.write(buf);
                output.close();
            }
            catch (Exception e) {
                System.out.println(e);
            }
            PrintWriter out = response.getWriter();
            out.write("注册成功！");
            out.println("<a href='http://localhost:8080/IdeaProjects_war_exploded/index.jsp'>返回登陆</a>");
        }
    }
}