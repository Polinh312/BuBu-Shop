<%-- 
    Document   : login
    Created on : Oct 11, 2022, 8:38:38 AM
    Author     : Phuong-Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tiệm đồ ăn vặt</title>
        <style>
            .login{
                margin: 100px 600px;
                width: 300px;
                height: 300px;
                border: 1px solid #1fcc44;
                border-radius: 10px;
                text-align: center;
            }
            h1{
                color: #1fcc44;
                font-family: sans-serif;
            }
            .text_input{
                width: 250px;
                height: 40px;
                margin-bottom: 10px;
                border-radius: 5px;
                border: 1px solid grey;
            }
            button{
                width: 250px;
                height: 40px;
                border-radius: 5px;
                border: none;
                background-color: #45a049;
                color: white;
            }

        </style>
    </head>
    <body>      
        <h3>${requestScope.ms}</h3>
        <div class="login">
            <h1>Đăng nhập</h1>
            <form action="login" method="POST">
                <input class="text_input" type="text" name="name" placeholder="Username" value="${cookie.name.value}" ><br/><br/>
                <input class="text_input" type="password" name="pass" placeholder="Password" value="${cookie.pass.value}"><br/>
                <div style="margin-right: 140px;">
                    <input type="checkbox" name="remember me" ${(cookie.rem.value!=null?'checked':'')} value="on"/> Remember me <br/>
                </div>
                <button type="submit">Đăng nhập</button>
                <h3>${requestScope.error}</h3>
            </form>
        </div>
    </body>
</html>
