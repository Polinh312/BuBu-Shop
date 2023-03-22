<%-- 
    Document   : updatepass
    Created on : Oct 15, 2022, 4:28:06 PM
    Author     : Phuong-Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tiệm đồ ăn vặt</title>
        <style>
            h1{
                font-family: serif;
            }

            .enpass{
                width: 300px;
                height: 300px;
                border: 1px solid #1fcc44;
                border-radius: 10px;
                text-align: center;
            }
            input{
                width: 200px;
                height: 30px;
                margin-bottom: 10px;
                border-radius: 5px;
                border: 1px solid grey;
            }
            button{
                width: 200px;
                height: 30px;
                border-radius: 5px;
                border: none;
                background-color: #45a049;
                color: white;
            }

        </style>
    </head>
    <body>
        <div class="enpass">
            <h1>Đổi mật khẩu</h1>
            <form action="changepass" method="POST">
                <input type="password" placeholder="Mật khẩu mới" name="newpass"/>
                </br></br>
                <input type="password" placeholder="Mật khẩu cũ" name="oldpass"/>
                </br></br>
                <button type="submit">Lưu thay đổi</button>
            </form>
        </div>
    </body>
</html>
