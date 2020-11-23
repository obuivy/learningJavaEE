<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/11
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <script>
        function showHint(str) {
            let x = document.forms["register"]["password"].value;
            if(x!=""){
                if(!x.startsWith(str,0)){
                    document.getElementById("demo1").innerHTML="两次密码不一致";
                }else{
                    document.getElementById("demo1").innerHTML="";
                }
            }
        }
        function showHint1(str) {
            let x = document.forms["register"]["password1"].value;
            if(x!=""){
                if(!x.startsWith(str,0)){
                    document.getElementById("demo1").innerHTML="两次密码不一致";
                }else{
                    document.getElementById("demo1").innerHTML="";
                }
            }
        }
        function validDataForm() {
            let user = document.forms["register"]["user"].value;
            let userName = document.forms["register"]["username"].value;
            let rearName = document.forms["register"]["rearName"].value;
            let sex = document.forms["register"]["sex"].value;
            let password=document.forms["register"]["password"].value;
            let password1=document.forms["register"]["password1"].value;
            if(password!=password1) {
                document.getElementById("demo1").innerHTML = "两次密码不一致";
                return false;
            }
            if(user==null||user==""){
               alert("请选择是否是管理员注册！");
                return false;
            }
            if(sex==null||sex==""){
                alert("请选择性别！");
                return false;
            }
            if(userName==null||userName==" "||userName.indexOf(" ")>=0){
                alert("用户名框不能有空格！");
                return false;
            }
            if(rearName==null||rearName==" "||rearName.indexOf(" ")>=0){
                alert("真实姓名不能有空格！");
                return false;
            }
        }
    </script>
</head>
<body>
<form name="register" action="RegisterAction" onsubmit="return validDataForm()" method="post">
    <input type="radio" name="user" value="commonUser" checked>普通用户
    <input type="radio" name="user" value="administrator">管理员<br>
    账号：<input type="text" name="username" required><br>
    密码：<input type="password" name="password" onkeyup="showHint1(this.value)" required><br>
    确认密码：<input type="password" name="password1"  onkeyup="showHint(this.value)" required><br>
    <p id="demo1"></p>
    真实姓名：<input type="text" name="rearName" required><br>
    性别：<input type="radio" name="sex" value="male">男
    <input type="radio" name="sex" value="female">女<br>
    电话号码：<input type="tel" name="tel" required><br>
    邮箱：<input type="email" name="email" required><br>
    <input type="submit" value="注册">
    <input type="reset" value="清空"><br>
</form>
</body>
</html>
