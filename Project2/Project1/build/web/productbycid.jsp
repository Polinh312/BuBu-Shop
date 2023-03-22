<%-- 
    Document   : home
    Created on : Oct 9, 2022, 1:49:29 PM
    Author     : Phuong-Linh
--%>
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
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

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
                                <li><a href="./shop-grid.html">Shop</a></li>
                                <li><a href="#">Pages</a>
                                    <ul class="header__menu__dropdown">
                                        <li><a href="./shop-details.html">Shop Details</a></li>
                                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                        <li><a href="./checkout.html">Check Out</a></li>
                                        <li><a href="./blog-details.html">Blog Details</a></li>
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
                                if(request.getAttribute("taikhoan") != null){
                                   Account a = (Account) request.getAttribute("taikhoan");
                                    
                                %>
                                <a href="profile"><span><%=a.getFullname()%></span></a>

                                &nbsp; 
                                <a href="#" onclick="doLogout()"><span>Đăng xuất</span></a>
                                <%
                                    }
                                 else{
                                %>
                                <a href="login"><span>Đăng nhập</span></a>
                                &nbsp; 
                                <a href="register"><span>Đăng ký</span></a>
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
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <form action="sort">
                                        <span>Sắp xếp theo</span>
                                        <select name="sort">
                                            <option value="1">Giá tăng dần</option>
                                            <option value="2">Giá giảm dần</option>
                                            <option value="3">Ngày sản xuất mới nhất</option>    
                                        </select>
                                        <input style="width: 70px; height: 30px;" type="submit" value="Sắp xếp">
                                    </form>
                                </div>
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

                        <div class="product">
                            <%
                                if(request.getAttribute("listsort") == null){
                            %>
                            <c:forEach items="${requestScope.products}" var="c">
                                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood" >

                                    <div class="featured__item">

                                        <div class="featured__item__pic set-bg" data-setbg="image/${c.image}">
                                            <ul class="featured__item__pic__hover" >
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="featured__item__text">
                                            <h6><a href="detail?id=${c.id}">${c.name}</a></h6>
                                            <h5>${c.price}</h5>
                                        </div>
                                    </div>
                                </div>  
                            </c:forEach>  
                            <%}
                             else{
                            %>
                            <c:forEach items="${requestScope.listsort}" var="c">
                                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood" >

                                    <div class="featured__item">

                                        <div class="featured__item__pic set-bg" data-setbg="image/${c.image}">
                                            <ul class="featured__item__pic__hover" >
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="featured__item__text">
                                            <h6><a href="detail?id=${c.id}">${c.name}</a></h6>
                                            <h5>${c.price}</h5>
                                        </div>
                                    </div>
                                </div>  
                            </c:forEach>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->



        <!-- Featured Section Begin -->
        <section class="featured spad" >
            <div class="container">
                <div class="row" style="">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2>Sản phẩm nổi bật</h2>
                        </div>
                        <div class="image">
                            <c:forEach items="${requestScope.list4P}" var="c">
                                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood" >

                                    <div class="featured__item">

                                        <div class="featured__item__pic set-bg" data-setbg="image/${c.image}">
                                            <ul class="featured__item__pic__hover" >
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="featured__item__text">
                                            <h6><a href="detail?id=${c.id}">${c.name}</a></h6>
                                            <h5>${c.price}</h5>
                                        </div>

                                    </div>

                                </div>  
                            </c:forEach>          
                        </div></div>
                </div>
            </div>
            <div class="container">
                <div class="row" style="">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2>Sản phẩm bán chạy</h2>
                        </div>
                        <div class="image">
                            <c:forEach items="${requestScope.list4bP}" var="c">
                                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood" >

                                    <div class="featured__item">

                                        <div class="featured__item__pic set-bg" data-setbg="image/${c.image}">
                                            <ul class="featured__item__pic__hover" >
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="featured__item__text">
                                            <h6><a href="detail?id=${c.id}">${c.name}</a></h6>
                                            <h5>${c.price}</h5>
                                        </div>

                                    </div>

                                </div>  
                            </c:forEach>          
                        </div></div>
                </div>
            </div>
        </section>

        <!-- Featured Section End -->

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