<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/12
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书管理用户界面</title>
    <script>
        let xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                let myObj = JSON.parse(this.responseText);
                document.getElementById("username").innerHTML = myObj.username;
            }
        };
        xmlhttp.open("GET", "/IdeaProjects_war_exploded/BookAction?action=getUser", true);
        xmlhttp.send();
        function action1(str) {
            let xmlhttp = new XMLHttpRequest();
            if(str=="borrowBook") {
                xmlhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        //document.getElementById("borrow").innerHTML=xmlhttp.responseText;
                        alert(xmlhttp.responseText);
                    }
                };
                let bookName = document.forms["borrowBook"]["bookName"].value;
                let id = document.forms["borrowBook"]["id"].value;
                xmlhttp.open("GET", "/IdeaProjects_war_exploded/BookAction?" +
                    "action=borrowBook&bookName=" + bookName + "&id=" + id, true);
                xmlhttp.send();
            }
            else if(str=="returnBook"){
                xmlhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        //document.getElementById("return").innerHTML=xmlhttp.responseText;
                        alert(xmlhttp.responseText);
                    }
                };
                let bookName=document.forms["returnBook"]["bookName"].value;
                let id=document.forms["returnBook"]["id"].value;
                xmlhttp.open("GET", "/IdeaProjects_war_exploded/BookAction?action=returnBook&bookName="+bookName+"&id="+id, true);
                xmlhttp.send();
            }
            else if(str=="checkBorrowBooks"){
                xmlhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("userBooks").innerHTML=xmlhttp.responseText;
                    }
                };
                xmlhttp.open("GET", "/IdeaProjects_war_exploded/BookAction?action=checkBorrowBooks", true);
                xmlhttp.send();
            }
            else{
                xmlhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("allBooks").innerHTML=xmlhttp.responseText;
                    }
                };
                xmlhttp.open("GET", "/IdeaProjects_war_exploded/BookAction?action=checkAllBooks", true);
                xmlhttp.send();
            }
        }
        function action4() {
            let xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    alert("登出");
                }
            };
            xmlhttp.open("GET", "/IdeaProjects_war_exploded/LoginAction?action=loginOut", true);
            xmlhttp.send();
        }
    </script>
</head>
<body>
账号：<b id="username"></b><br>
身份：<b>普通用户</b>
<button type="button" onclick="action4()">登录其他账号</button>
<h5>借书</h5>
<form name="borrowBook">
    书籍名称：<input type="text" name="bookName"><br>
    书籍id：<input type="text" name="id"><br>
    <button type="button" onclick="action1('borrowBook')">确定</button>
    <input type="reset" value="清空"><br>
    <p id="borrow"></p>
</form>
<h5>还书</h5>
<form name="returnBook">
    书籍名称：<input type="text" name="bookName"><br>
    书籍id：<input type="text" name="id"><br>
    <button type="button" onclick="action1('returnBook')">确定</button>
    <input type="reset" value="清空"><br>
    <p id="return"></p>
</form>
<button type="button" onclick="action1('checkBorrowBooks')">查看我借阅的书籍</button><br>
<p id="userBooks"></p>
<button type="button" onclick="action1('checkAllBooks')">查看所有书籍</button><br>
<p id="allBooks"></p>
</body>
</html>
