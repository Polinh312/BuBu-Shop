<%-- 
    Document   : manageorder
    Created on : Oct 29, 2022, 1:45:51 PM
    Author     : Phuong-Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Account"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Quản lý đơn hàng</title>

        <!-- Google Font -->
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
                            if(request.getAttribute("acc") != null){
                               Account a = (Account) request.getAttribute("acc");
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

        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="hero__categories">
                            <div class="hero__categories__all">
                                <i class="fa fa-bars"></i>
                                <span>Danh mục sản phẩm</span>
                            </div>
                            <ul>
                                <c:forEach items="${requestScope.data}" var="c">
                                    <li><a href="mnproduct?cid=${c.id}">${c.name}</a></li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="hero__search">
                            <div class="hero__search__form">
                                <form action="searchorder">                                   
                                    <input type="text" name="search" placeholder="Nhập tên đăng nhập khách hàng">
                                    <button type="submit" class="site-btn">Tìm kiếm &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <a href="statistic">Thống kê theo số lượng đơn hàng</a>
                    </div>
                </div>
            </div>
        </section>

        <%
           if(request.getAttribute("statis") == null){
        %>
        <h2 style="color: #669900; margin-left: 650px; font-family: serif">Tất cả đơn hàng</h2>
        <div style="margin-left: 540px; margin-top: 60px; text-align: center">

            <table border = "2px">
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Người đặt hàng</th>
                    <th>Ngày đặt</th>
                    <th>Tổng giá trị đơn hàng</th>
                </tr>


                <c:forEach items="${requestScope.list}" var="c">
                    <c:set var="id" value="${c.id}"/>
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.loginName}</td>
                        <td>${c.date}</td>
                        <td>${c.totalmoney}</td>
                    </tr>
                </c:forEach> 
            </table>
        </div>
        <% 
          }
       else{
        %>
        <div style="margin-left: 600px; margin-top: 60px; text-align: center">
            <table border = "2px">
                <tr>
                    <th>Người đặt hàng</th>
                    <th>Số đơn hàng</th>

                </tr>


                <c:forEach items="${requestScope.statis}" var="c">
                    <tr>
                        <td><a href="updateaccount?loginname=${c.loginName}">${c.loginName}</a></td>
                        <td>${c.num}</td>
                    </tr>
                </c:forEach> 
            </table>
        </div>
        <%
             }
        %>

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
