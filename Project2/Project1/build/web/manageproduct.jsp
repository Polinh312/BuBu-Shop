<%-- 
    Document   : manageproduct
    Created on : Oct 22, 2022, 5:04:17 PM
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
        <title>Quản lý sản phẩm</title>

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
                                <span>Danh mục sản phẩm</span>
                            </div>
                            <ul>
                                <c:forEach items="${requestScope.data}" var="c">
                                    <li><a href="mnproduct?cid=${c.id}">${c.name}</a></li>
                                    </c:forEach>
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
                                            <li><a href="addproduct">Thêm sản phẩm</a></li>
                                            <li><a href="inputupdate.jsp">Chỉnh sửa sản phẩm</a></li>
                                            <li><a href="inputdelete.jsp">Xóa sản phẩm</a></li>
                                        </ul>
                                        </div>
                                        </div>                   
                                        </div>
                                        </div>
                                        </section>
                                        <!-- Hero Section End -->

                                        <%
                                           if(request.getAttribute("products") != null){
                                        %>
                                        <div style="margin: 20px; text-align: center">
                                            <table border = "1px">
                                                <tr>
                                                    <th>Mã sp</th>
                                                    <th>Tên</th>
                                                    <th>Giá</th>
                                                    <th>Giảm</th>
                                                    <th>Kho</th>
                                                    <th>Mô tả</th>
                                                    <th>Link ảnh</th>
                                                    <th>Trọng lượng</th>
                                                    <th>Quốc gia</th>
                                                    <th>Tùy chọn</th>
                                                </tr>

                                                <%
                                                   }
                                                %>
                                                <c:forEach items="${requestScope.products}" var="c">
                                                    <c:set var="id" value="${c.id}"/>
                                                    <tr>
                                                        <td>${c.id}</td>
                                                        <td>${c.name}</td>
                                                        <td>${c.price}</td>
                                                        <td>${c.discount}</td>
                                                        <td>${c.stock}</td>
                                                        <td>${c.description}</td>
                                                        <td><img width="100px" height="100px" src="image/${c.image}" alt="alt"/>
                                                            ${c.image}
                                                        </td>
                                                        <td>${c.weight}</td>
                                                        <td>${c.country}</td>
                                                        <td>
                                                            <a href="deleteproduct?id=${c.id}" >Xóa</a>
                                                            &nbsp;&nbsp;&nbsp;
                                                            <a href="updateproduct?id=${c.id}">Chỉnh sửa</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach> 
                                            </table>
                                        </div>
                                        </body>
                                        </html>
