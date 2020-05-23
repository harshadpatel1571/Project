<%@ Page Language="VB" AutoEventWireup="false" CodeFile="NewsPage.aspx.vb" Inherits="Client_cp_NewsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="style.css" rel="stylesheet" />
    <script src="../JS/angular.min.js"></script>

    <%--<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-animate.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-sanitize.js"></script>
    
    <script src="//angular-ui.github.io/bootstrap/ui-bootstrap-tpls-2.5.0.js"></script>--%>
    <script src="../JS/NavigationCrtl.js"></script>
    <title></title>
</head>
<body ng-app="myApp" ng-controller="navigationCtrl" ng-init="OnModalLoad()">
     <div class="featured-post-area" style="display:block">
        <div class="container">
            <div class="row"> 
                <%--<div class="col-12 col-md-6 col-lg-8">
                    <div class="row">

                        <div class="col-12 col-lg-7">
                            <div class="single-blog-post featured-post">
                                <div class="post-thumb">
                                    <a href="#">
                                        <img src="img/bg-img/16.jpg" alt=""></a>
                                </div>
                                <div class="post-data">
                                    <a href="#" class="post-catagory">Finance</a>
                                    <a href="#" class="post-title">
                                        <h6>Financial news: A new company is born today at the stock market</h6>
                                    </a>
                                    <div class="post-meta">
                                        <p class="post-author">By <a href="#">Christinne Williams</a></p>
                                        <p class="post-excerp">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu metus sit amet odio sodales placerat. Sed varius leo ac leo fermentum, eu cursus nunc maximus. Integer convallis nisi nibh, et ornare neque ullamcorper ac. Nam id congue lectus, a venenatis massa. Maecenas justo libero, vulputate vel nunc id, blandit feugiat sem. </p>

                                        <div class="d-flex align-items-center">
                                            <a href="#" class="post-like">
                                                <img src="img/core-img/like.png" alt="">
                                                <span>392</span></a>
                                            <a href="#" class="post-comment">
                                                <img src="img/core-img/chat.png" alt="">
                                                <span>10</span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                        <div class="col-12 col-lg-5">

                            <div class="single-blog-post featured-post-2">
                                <div class="post-thumb">
                                    <a>
                                        <img src="../Admin-cp/img/news_image/{{MainNews.nm_image}}" alt=""></a>
                                </div>
                                <div class="post-data">
                                    <a class="post-catagory">{{MainNews.cat_name}}</a>
                                    <div class="post-meta">
                                        <a class="post-title">
                                            <h6>{{MainNews.nm_head_line}}</h6>
                                        </a>

                                        <%--<div class="d-flex align-items-center">
                                            <a href="#" class="post-like">
                                                <img src="img/core-img/like.png" alt="">
                                                <span>392</span></a>
                                            <a href="#" class="post-comment">
                                                <img src="img/core-img/chat.png" alt="">
                                                <span>10</span></a>
                                        </div>--%>
                                    </div>
                                </div>
                            </div>

                            <%--<div class="single-blog-post featured-post-2">
                                <div class="post-thumb">
                                    <a href="#">
                                        <img src="img/bg-img/18.jpg" alt=""></a>
                                </div>
                                <div class="post-data">
                                    <a href="#" class="post-catagory">Finance</a>
                                    <div class="post-meta">
                                        <a href="#" class="post-title">
                                            <h6>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu metus sit amet odio sodales placerat. Sed varius leo ac...</h6>
                                        </a>

                                        <div class="d-flex align-items-center">
                                            <a href="#" class="post-like">
                                                <img src="img/core-img/like.png" alt="">
                                                <span>392</span></a>
                                            <a href="#" class="post-comment">
                                                <img src="img/core-img/chat.png" alt="">
                                                <span>10</span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
                <%--<div class="col-12 col-md-6 col-lg-4">

                    <div class="single-blog-post small-featured-post d-flex">
                        <div class="post-thumb">
                            <a href="#">
                                <img src="img/bg-img/19.jpg" alt=""></a>
                        </div>
                        <div class="post-data">
                            <a href="#" class="post-catagory">Finance</a>
                            <div class="post-meta">
                                <a href="#" class="post-title">
                                    <h6>Pellentesque mattis arcu massa, nec fringilla turpis eleifend id.</h6>
                                </a>
                                <p class="post-date"><span>7:00 AM</span> | <span>April 14</span></p>
                            </div>
                        </div>
                    </div>

                    <div class="single-blog-post small-featured-post d-flex">
                        <div class="post-thumb">
                            <a href="#">
                                <img src="img/bg-img/20.jpg" alt=""></a>
                        </div>
                        <div class="post-data">
                            <a href="#" class="post-catagory">Politics</a>
                            <div class="post-meta">
                                <a href="#" class="post-title">
                                    <h6>Sed a elit euismod augue semper congue sit amet ac sapien.</h6>
                                </a>
                                <p class="post-date"><span>7:00 AM</span> | <span>April 14</span></p>
                            </div>
                        </div>
                    </div>

                    <div class="single-blog-post small-featured-post d-flex">
                        <div class="post-thumb">
                            <a href="#">
                                <img src="img/bg-img/21.jpg" alt=""></a>
                        </div>
                        <div class="post-data">
                            <a href="#" class="post-catagory">Health</a>
                            <div class="post-meta">
                                <a href="#" class="post-title">
                                    <h6>Pellentesque mattis arcu massa, nec fringilla turpis eleifend id.</h6>
                                </a>
                                <p class="post-date"><span>7:00 AM</span> | <span>April 14</span></p>
                            </div>
                        </div>
                    </div>

                    <div class="single-blog-post small-featured-post d-flex">
                        <div class="post-thumb">
                            <a href="#">
                                <img src="img/bg-img/22.jpg" alt=""></a>
                        </div>
                        <div class="post-data">
                            <a href="#" class="post-catagory">Finance</a>
                            <div class="post-meta">
                                <a href="#" class="post-title">
                                    <h6>Augue semper congue sit amet ac sapien. Fusce consequat.</h6>
                                </a>
                                <p class="post-date"><span>7:00 AM</span> | <span>April 14</span></p>
                            </div>
                        </div>
                    </div>

                    <div class="single-blog-post small-featured-post d-flex">
                        <div class="post-thumb">
                            <a href="#">
                                <img src="img/bg-img/23.jpg" alt=""></a>
                        </div>
                        <div class="post-data">
                            <a href="#" class="post-catagory">Travel</a>
                            <div class="post-meta">
                                <a href="#" class="post-title">
                                    <h6>Pellentesque mattis arcu massa, nec fringilla turpis eleifend id.</h6>
                                </a>
                                <p class="post-date"><span>7:00 AM</span> | <span>April 14</span></p>
                            </div>
                        </div>
                    </div>

                    <div class="single-blog-post small-featured-post d-flex">
                        <div class="post-thumb">
                            <a href="#">
                                <img src="img/bg-img/24.jpg" alt=""></a>
                        </div>
                        <div class="post-data">
                            <a href="#" class="post-catagory">Politics</a>
                            <div class="post-meta">
                                <a href="#" class="post-title">
                                    <h6>Augue semper congue sit amet ac sapien. Fusce consequat.</h6>
                                </a>
                                <p class="post-date"><span>7:00 AM</span> | <span>April 14</span></p>
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
</body>
</html>
