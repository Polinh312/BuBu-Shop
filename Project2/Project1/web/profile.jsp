<%-- 
    Document   : home
    Created on : Oct 9, 2022, 1:49:29 PM
    Author     : Phuong-Linh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>

<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Tiệm đồ ăn vặt</title>
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script>
            function doLogout() {
                if (confirm("Bạn chắc chắn đăng xuất?")) {
                    window.location = "logout";
                }
            }
        </script>
        <style>
            .profile{
                padding: 20px 10px 10px;
                background-color: #e9eeee;
                border: 0px solid #339900;
                width: 400px;
                height: auto;
                font-family: serif;
                margin: 0px 550px;
            }
            h2{
                color: #339900;
                font-family: serif;
                text-align: center;
            }

            .inputX{
                width: 250px;
                height: 30px;
                border-radius: 5px;
                border: 1px solid grey
            }

            .tt{
                margin-left: 70px;
            }
            button{
                width: 100px;
                height: 30px;
                background-color: #339900;
                color: white;
                border-radius: 3px;
            }
            a{
                color: #339900
            }
        </style>
    </head>
    <body>

        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__left">
                                <ul>
                                    <li><i class="fa fa-envelope"></i> hello@bubu.com</li>                                   
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="header__logo">
                            <a href="home"><img width="100px" height="100px" src="image//logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="home">Home</a></li>
                                <li><a href="shop">Shop</a></li>
                                <li><a href="#">Pages</a>
                                    <ul class="header__menu__dropdown">
                                        <li><a href="./shop-details.html">Shop Details</a></li>
                                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    </ul>
                                </li>

                                <li><a href="./contact.html">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">
                        <div class="header__cart">
                            <ul>
                                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                            </ul>

                            <div class="header__cart__price">
                                <%
                                if(request.getAttribute("acc") != null){
                                   Account a = (Account) request.getAttribute("acc");
                                    
                                %>
                                <a href="profile"><span><%=a.getFullname()%></span></a>

                                &nbsp; 
                                <a href="#" onclick="doLogout()"><span>Đăng xuất</span></a>
                                &nbsp; 
                                <a href="manage"><span>Quản lý</span></a>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="humberger__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <div class="profile">
            <h2>Thông tin tài khoản</h2>
            <br>
            <form action="updateuser">
                <c:set var="a" value="${requestScope.acc}"/>
                <div class="tt">
                    Tên đăng nhập: <br>
                    <input class="inputX" type="text"  name="lname" value="${a.loginName}"/> <br><br>
                    Mật khẩu: <br>
                    <input class="inputX" type="password"  name="pass" value="${a.pass}"/>  <br><br>
                    Họ và tên:<br>
                    <input class="inputX" type="text" name="fname" value="${a.fullname}"/> <br><br>
                    Email: <br>
                    <input class="inputX" type="text"  name="lemail" value="${a.email}"/><br><br>
                    Giới tính: 
                    <c:choose>
                        <c:when test = "${a.gender == '1'}">
                            <input type="radio"  name="gender" value="1" checked/> Nam
                            <input type="radio"  name="gender" value="0"/> Nữ <br><br>
                        </c:when>    
                        <c:otherwise>
                            <input type="radio"  name="gender" value="1"/> Nam
                            <input type="radio"  name="gender" value="0" checked/> Nữ <br><br>
                        </c:otherwise>
                    </c:choose>
                    <br><br>
                    Ngày sinh:<br>
                    <input class="inputX"  type="date" name="dob" value="${a.dob}"/> <br><br>
                    Địa chỉ: <br>
                    <input class="inputX" type="text" name="address" value="${a.address}"/> <br><br>
                    Số điện thoại:<br>
                    <input class="inputX" type="text" name="phone" value="${a.phone}"/> <br><br>
                    Người dùng: <br>
                    <input type="text" name="role" value="${a.role}" readonly=""/><br><br>
                    <button style="margin-left: 20px" type="submit">Lưu thay đổi</button> <a style="margin-left: 20px" href="changepass">Đổi mật khẩu</a>

                </div> 
            </form>
        </div>          
    </body>
</html>