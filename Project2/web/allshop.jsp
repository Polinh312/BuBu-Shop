<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Tiệm đồ ăn vặt</title>

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
        <style>
            .image{
                flex-wrap: wrap;
                display: flex;
                margin-bottom: 150px;
            }

            .product{
                text-align: center;
                display: flex;
                flex-wrap: wrap;
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
                            <div class="header__top__left">
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
                                    <c:set var="cid" value="${c.id}"/>
                                    <li><a href="product?cid=${c.id}">${c.name}</a></li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="hero__search">
                            <div class="hero__search__form">
                                <form action="search">                                   
                                    <input type="text" name="search" placeholder="Bạn muốn tìm gì?">
                                    <button type="submit" class="site-btn">Tìm kiếm</button>
                                </form>
                            </div>
                            <div class="hero__search__phone">
                                <div class="hero__search__phone__icon">
                                    <i class="fa fa-phone"></i>
                                </div>
                                <div class="hero__search__phone__text">
                                    <h5>+65 11.188.888</h5>
                                    <span>support 24/7 time</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Product Section Begin -->
        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-5">
                        <div class="sidebar">
                            <form action="searchmany">
                                <div class="sidebar__item">

                                    <h4>Loại sản phẩm</h4>
                                    <div style="text-align: left; margin-left: 60px">
                                        <c:forEach items="${requestScope.data}" var="c">
                                            <input type="radio" name="category" value="${c.id}"> ${c.name}<br>
                                        </c:forEach>
                                    </div>

                                </div>
                                <div class="sidebar__item">
                                    <h4 style="margin-right: 10px">Giá sản phẩm</h4>
                                    <div style="text-align: left; margin-left: 60px">
                                        <input type="radio" name="price" value="1">Dưới 50.000<br>
                                        <input type="radio" name="price" value="2">Từ 50.000 đến 100.000<br>
                                        <input type="radio" name="price" value="3">Từ 100.000 đến 200.000<br>
                                        <input type="radio" name="price" value="4">Trên 200.000<br>
                                    </div>
                                </div>
                                <div class="sidebar__item sidebar__item__color--option">
                                    <h4 style="margin-right: 60px">Xuất xứ</h4>
                                    <div style="text-align: left; margin-left: 60px">
                                        <c:forEach items="${requestScope.listc}" var="c">
                                  
                                        <input type="radio" name="country" value="${c.id}">${c.name}<br>
                                        
                                          </c:forEach>
                                    </div>
                                </div>

                                <div style="margin-right: 80px">
                                    <button style="background-color: #009933; color: white"type="submit">Tìm kiếm</button>
                                </div>
                            </form>

                        </div>
                    </div>
                    <div class="col-lg-9 col-md-7">

                        <%
                           if(request.getAttribute("listsearch") != null){
                        %>
                        <div class="filter__item">
                            <div class="row">
                                <div class="col-lg-4 col-md-5">
                                    <div class="filter__sort">
                                        <form action="searchmany" method="POST">
                                            <span>Sort By</span>
                                            <select name="sort">
                                                <option value="1">Giá tăng dần</option>
                                                <option value="2">Giá giảm dần</option>
                                            </select>
                                            <input type="submit" value="Sort">
                                        </form>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="filter__found">
                                        <h6><span>${requestScope.size}</span> Products found</h6>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-3">
                                    <div class="filter__option">
                                        <span class="icon_grid-2x2"></span>
                                        <span class="icon_ul"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <c:forEach items="${requestScope.listsearch}" var="c">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="image/${c.image}">

                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="detail?id=${c.id}">${c.name}</a></h6>
                                            <h5>${c.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        <div class="product__pagination">
                            <c:forEach begin="1" end="${numP}" var="i">
                                <a href="#">${i}</a>
                            </c:forEach>
                        </div>

                        <%}
              else{
                        %>
                        <div class="product__discount">
                            <div class="section-title product__discount__title">
                                <h2>Sản phẩm giảm giá</h2>
                            </div>
                            <div class="row">
                                <div class="product__discount__slider owl-carousel">
                                    <c:forEach items="${requestScope.list4bd}" var="c">

                                        <div class="col-lg-4">
                                            <div class="product__discount__item">
                                                <div class="product__discount__item__pic set-bg"
                                                     data-setbg="image/${c.image}">
                                                    <div class="product__discount__percent">-${c.discount}%</div>

                                                </div>
                                                <div class="product__discount__item__text">

                                                    <h5><a href="detail?id=${c.id}">${c.name}</a></h5>
                                                    <div class="product__item__price">${c.price} </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                        <div class="section-title product__discount__title">
                            <h2>Tất cả sản phẩm</h2>
                        </div>
                        <div class="row">
                            <c:forEach items="${requestScope.paginglist}" var="c">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="image/${c.image}">

                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="detail?id=${c.id}">${c.name}</a></h6>
                                            <h5>${c.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        <div class="product__pagination">
                            <c:forEach begin="1" end="${numP}" var="i">
                                <a href="paging?page=${i}">${i}</a>
                            </c:forEach>
                        </div>
                        <%}%>

                    </div>
                </div>
            </div>
        </section>
        <!-- Product Section End -->

        <!-- Footer Section Begin -->
        <footer class="footer spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__about">
                            <div class="footer__about__logo">
                                <a href="./index.html"><img height="100px" width="100px" src="image/logo.png" alt=""></a>
                            </div>
                            <ul>
                                <li>Address: Hà Nội, Việt Nam</li>
                                <li>Phone: +65 11.188.888</li>
                                <li>Email: hello@bubu.com</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                        <div class="footer__widget">
                            <h6>Useful Links</h6>
                            <ul>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">About Our Shop</a></li>
                                <li><a href="#">Secure Shopping</a></li>
                                <li><a href="#">Delivery infomation</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Our Sitemap</a></li>
                            </ul>
                            <ul>
                                <li><a href="#">Who We Are</a></li>
                                <li><a href="#">Our Services</a></li>
                                <li><a href="#">Projects</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Innovation</a></li>
                                <li><a href="#">Testimonials</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="footer__widget">
                            <h6>Join Our Newsletter Now</h6>
                            <p>Get E-mail updates about our latest shop and special offers.</p>
                            <form action="#">
                                <input type="text" placeholder="Enter your mail">
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>
                            <div class="footer__widget__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

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