<%-- 
    Document   : deletecate
    Created on : Nov 2, 2022, 1:13:29 PM
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
        <title>Quản lý sản phẩm</title>
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
                width: 600px;
                height: auto;
                font-family: serif;
                margin: 0px 450px;
            }
            h2{
                color: #339900;
                font-family: serif;
                text-align: center;
            }

            .inputX{
                width: 400px;
                height: 40px;
                border-radius: 5px;
                border: 1px solid grey
            }

            .tt{
                margin-left: 70px;
            }
            button{
                width: 220px;
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
                    <div class="row" >
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__left" style="margin-top: 25px">
                                <ul>
                                    <li><i class="fa fa-envelope"></i> hello@bubu.com</li>                                   
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6">

                            <div class="header__top__right">

                                <%
                            if(request.getAttribute("taikhoan") != null){
                               Account a = (Account) request.getAttribute("taikhoan");
                                    if(a.getRole().equals("Customer")){
                                %>
                                <div class="header__top__right__auth" style="margin-right:10px">
                                    <a href="profile"><i class="fa fa-user"></i><%=a.getFullname()%></a>
                                </div>
                                <div class="header__top__right__auth" style="margin-right:10px">
                                    <a href="#" onclick="doLogout()"><i class="fa fa-sign-out" ></i>Đăng xuất</a>
                                </div>
                                <% }
                                
                                  else{%>

                                <div class="header__top__right__auth" style="margin-right:10px">
                                    <a href="profile"><i class="fa fa-user"></i><%=a.getFullname()%></a>
                                </div>
                                <div class="header__top__right__auth" style="margin-right:10px">
                                    <a href="#" onclick="doLogout()"><i class="fa fa-sign-out" ></i>Đăng xuất</a>
                                </div>
                                <div class="header__top__right__auth" style="font-family: serif">
                                    <nav class="header__menu">
                                        <ul><li><i class="fa fa-user-secret"> Quản lý</i>
                                                <ul class="header__menu__dropdown" style="width: 150px">
                                                    <li><a style="margin-right: 25px;" href="manageaccount">Tài khoản</a></li>
                                                    <li><a style="margin-right: 25px;" href="manageproduct">Sản phẩm</a></li>
                                                    <li><a style="margin-right: 25px;" href="manageorder">Đơn hàng</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                                <%}
                                    }
                                 else{
                                %>
                                <div class="header__top__right__auth" style="margin-right:10px">
                                    <a href="login"><i class="fa fa-user"></i>Đăng nhập</a>
                                </div>
                                <div class="header__top__right__auth" style="margin-right:10px">
                                    <a href="register"><i class="fa fa-registered"></i>Đăng ký</a>
                                </div>
                                <%
                                    }
                                %>

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
                                <li class="active"><a href="home">Trang chủ</a></li>
                                <li><a href="shop">Cửa hàng</a></li>
                                <li><a href="contact">Liên hệ</a></li>
                                <li><a href="#">Trang khác</a>
                                    <ul class="header__menu__dropdown">
                                        <li><a href="shoppingcart">Giỏ hàng</a></li>
                                        <li><a href="vieworder">Đơn hàng</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">
                        <div class="header__cart">
                            <ul>
                                <li><a href="shoppingcart"><i class="fa fa-shopping-bag"></i> <span>${sessionScope.cart.items.size()}</span></a></li>
                            </ul>


                        </div>
                    </div>
                </div>
                <div class="humberger__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <div class="profile">
            <h2>Thông tin sản phẩm</h2>
            <form action="deletecate" method="POST">
                <div class="tt">
                    <c:set var="c" value="${requestScope.cate}"/>
                    Mã danh mục: <br>
                    <input class="inputX" type="text" name="id" value="${c.id}" readonly/><br><br>
                    Tên danh mục: <br>
                    <input class="inputX" type="text" name="name" value="${c.name}" readonly/><br><br>
                    Mô tả: <br>
                    <textarea style="width: 400px; " name="description" readonly>${c.description}</textarea><br><br>
                    <button style="margin-left: 85px;" type="submit">Xóa danh mục</button><br><br>
                </div>
            </form>
        </div>
        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
