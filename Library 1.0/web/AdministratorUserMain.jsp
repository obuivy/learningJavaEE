<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/4/12
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书管理员界面</title>
    <script>
        let xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                let myObj = JSON.parse(this.responseText);
                document.getElementById("username1").innerHTML = myObj.username;
            }
        };
        xmlhttp.open("GET", "/IdeaProjects_war_exploded/BookAction?action=getUser", true);
        xmlhttp.send();
        function action(str) {
            let xmlhttp = new XMLHttpRequest();
            if (str == "checkAllBooks") {
                /**
                 * 这里可以进来
                 */
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        document.getElementById("demo1").innerHTML = xmlhttp.responseText;
                    }
                };
                xmlhttp.open("GET", "/IdeaProjects_war_exploded/BookAction?action=checkAllBooks", true);
                xmlhttp.send();
            }
        }
        function action2() {
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        alert(xmlhttp.responseText);
                    }
                };
                let id = document.forms["addBook"]["id"].value;
                let bookName = document.forms["addBook"]["bookName"].value;
                let price = document.forms["addBook"]["price"].value;
                xmlhttp.open("GET", "/IdeaProjects_war_exploded/BookAction?action=addBook&bookName=" + bookName + "&id=" + id + "&price=" + price, true);
                xmlhttp.send();
        }
        function action3() {
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    alert(xmlhttp.responseText);
                }
            };
            let bookName=document.forms["deleteBook"]["bookName"].value;
            let id=document.forms["deleteBook"]["id"].value;
            xmlhttp.open("GET","/IdeaProjects_war_exploded/BookAction?action=deleteBook&bookName="+bookName+"&id="+id,true);
            xmlhttp.send();
        }
    </script>
</head>
<body>
账号：<b id="username1"></b><br>
身份：<b>管理员</b>
    <h5>添加书籍</h5>
    <form name="addBook">
        书籍id：<input type="text" name="id"><br>
        书籍名称：<input type="text" name="bookName"><br>
        书籍价格：<input type="text" name="price"><br>
        <button type="button" onclick="action2()">添加书籍</button>
        <input type="reset" value="清空"><br>
    </form>
<p id="add"></p>
<h5>删除书籍</h5>
    <form name="deleteBook">
        书籍id：<input type="text" name="id"><br>
        书籍名称：<input type="text" name="bookName"><br>
        <button type="button" onclick="action3()">删除书籍</button>
        <input type="reset" value="清空"><br>
    </form>
<p id="delete"></p>
    <button type="button" onclick="action('checkAllBooks')">查看所有书籍</button>
    <p id="demo1"></p>
</body>

</html>
