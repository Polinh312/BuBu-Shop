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
                                <span>Danh mục <a href="addcategory"style="margin-left: 30px;"><i class="fa fa-plus-square" aria-hidden="true"></i></a> <a href="inputdeletecate.jsp"><i class="fa fa-minus-square" aria-hidden="true"></i></a></span>
                            </div>
                            <ul>
                                <c:forEach items="${requestScope.data}" var="c">
                                    <li style="display: flex"><a style="margin-right: 20px" href="updatecate?cid=${c.id}"><i class="fa fa-refresh" aria-hidden="true"></i></a><a href="mnproduct?cid=${c.id}">${c.name}</a> 
                                        <a href="addproduct?cid=${c.id}"style="margin-left: 20px;"><i class="fa fa-plus-square" aria-hidden="true"></i></a></li> 

                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="hero__search">
                            <div class="hero__search__form">
                                <form action="searchproduct">                                   
                                    <input type="text" name="search" placeholder="Nhập tên sản phẩm">
                                    <button type="submit" class="site-btn">Tìm kiếm &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3" style="float: right">
                        <div class="hero__categories">
                            <div class="hero__categories__all">
                                <i class="fa fa-bars"></i>
                                <span>Xuất xứ <a href="addcountry"style="margin-left: 40px;"><i class="fa fa-plus-square" aria-hidden="true"></i></a> <a href="inputdeletecountry.jsp"><i class="fa fa-minus-square" aria-hidden="true"></i></a><span>
                                        </div>
                                        <ul>
                                            <c:forEach items="${requestScope.listc}" var="c">
                                                <li style="display: flex"><a style="margin-right: 20px" href="updatecountry?country=${c.id}"><i class="fa fa-refresh" aria-hidden="true"></i></a><a href="mnproduct?country=${c.id}">${c.name}</a></li>

                                            </c:forEach>
                                        </ul>
                                        </div>
                                        </div>                   
                                        </div>
                                        </div>
                                        </section>
                                        <!-- Hero Section End -->
                                        <%
                                             if(request.getAttribute("listp") != null){
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


                                                <c:forEach items="${requestScope.listp}" var="c">
                                                    <c:set var="id" value="${c.id}"/>
                                                    <tr>
                                                        <td>${c.id}</td>
                                                        <td>${c.name}</td>
                                                        <td>${c.price}</td>
                                                        <td>${c.discount}</td>
                                                        <td>${c.stock}</td>
                                                        <td>${c.description}</td>
                                                        <td><img width="100px" height="100px" src="image/${c.image}"/>
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

                                            <% } %>   

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
                                            <% } %> 

                                            <%
                                            if(request.getAttribute("listbycountry") != null){
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


                                                    <c:forEach items="${requestScope.listbycountry}" var="c">
                                                        <c:set var="id" value="${c.id}"/>
                                                        <tr>
                                                            <td>${c.id}</td>
                                                            <td>${c.name}</td>
                                                            <td>${c.price}</td>
                                                            <td>${c.discount}</td>
                                                            <td>${c.stock}</td>
                                                            <td>${c.description}</td>
                                                            <td><img width="100px" height="100px" src="image/${c.image}"/>
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

                                                <% } %>   
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
