<%-- 
    Document   : manageaccount
    Created on : Oct 23, 2022, 11:24:18 AM
    Author     : Phuong-Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.Account"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Quản lý tài khoản</title>

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

        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="hero__categories">
                            <div class="hero__categories__all">
                                <i class="fa fa-bars"></i>
                                <span>Tài khoản</span>
                            </div>
                            <ul>
                                <c:set var="role"/>
                                <li><a href="mnaccount?role=Admin">Admin</a></li>
                                <li><a href="mnaccount?role=Staff">Nhân viên</a></li>
                                <li><a href="mnaccount?role=Customer">Khách hàng</a></li> 
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3" style="float: right">
                        <div class="hero__categories">
                            <div class="hero__categories__all">
                                <i class="fa fa-bars"></i>
                                <span>Tùy chọn<span>
                                        </div>
                                        <ul>
                                            <li><a href="addaccount">Thêm tài khoản</a></li>
                                            <li><a href="inputupdateacc.jsp">Chỉnh sửa tài khoản</a></li>
                                            <li><a href="inputdeleteacc.jsp">Xóa tài khoản</a></li>
                                        </ul>
                                        </div>
                                        </div>                   
                                        </div>
                                        </div>
                                        </section>
                                        <!-- Hero Section End -->


                                        <table border = "1px">
                                            <tr>
                                                <th>Tên đăng nhập</th>
                                                <th>Mật khẩu</th>
                                                <th>Họ và tên</th>
                                                <th>Email</th>
                                                <th>Giới tính</th>
                                                <th>Ngày sinh</th>
                                                <th>Địa chỉ</th>
                                                <th>Số điện thoại</th>
                                                <th>Tùy chọn </th>
                                            </tr>
                                            <c:forEach items="${requestScope.data}" var="c">
                                                <c:set var="loginname" value="${c.loginName}"/>
                                                <tr>
                                                    <td>${c.loginName}</td>
                                                    <td>${c.pass}</td>
                                                    <td>${c.fullname}</td>
                                                    <td>${c.email}</td>
                                                    <td>${c.gender}</td>
                                                    <td>${c.dob}</td>
                                                    <td>${c.address}</td>
                                                    <td>${c.phone}</td>
                                                    <td>
                                                        <a href="deleteaccount?loginname=${c.loginName}" >Xóa</a>
                                                        &nbsp;&nbsp;&nbsp;
                                                        <a href="updateaccount?loginname=${c.loginName}">Chỉnh sửa</a>
                                                    </td>
                                                </tr>
                                            </c:forEach> 
                                        </table>

                                        </body>
                                        </html>
