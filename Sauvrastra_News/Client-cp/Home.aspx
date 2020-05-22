<%@ Page Title="" Language="C#" MasterPageFile="~/Client-cp/client_mst.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Client_cp_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="featured-post-area">
        <div class="container">
            <div class="row">

                <div class="col-4" ng-repeat="new in News">
                    <div class="single-blog-post featured-post-2">
                        <div class="post-thumb">
                            <asp:Image runat="server" ImageUrl="../Admin-cp/img/news_image/{{new.nm_image}}" alt="" ng-click="FetchNews(new.nm_id)" Width="300" Height="200" />
                        </div>
                        <div class="post-data">
                            <a class="post-catagory" ng-click="FetchNews(new.nm_id)">{{new.cat_name}}</a>
                            <div class="post-meta">
                                <a class="post-title" ng-click="FetchNews(new.nm_id)">
                                    <h6>{{new.nm_head_line}}</h6>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="video-post-area bg-img bg-overlay" style="background-image: url(img/bg-img/bg1.jpg);">
        <div class="container">
            <div class="row justify-content-center">

                <div class="col-12 col-sm-6 col-md-4">
                    <div class="single-video-post">
                        <img src="img/bg-img/video1.jpg" alt="">

                        <div class="videobtn">
                            <a href="https://www.youtube.com/watch?v=5BQr-j3BBzU" class="videoPlayer"><i class="fa fa-play" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-md-4">
                    <div class="single-video-post">
                        <img src="img/bg-img/video2.jpg" alt="">

                        <div class="videobtn">
                            <a href="https://www.youtube.com/watch?v=5BQr-j3BBzU" class="videoPlayer"><i class="fa fa-play" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-md-4">
                    <div class="single-video-post">
                        <img src="img/bg-img/video3.jpg" alt="">

                        <div class="videobtn">
                            <a href="https://www.youtube.com/watch?v=5BQr-j3BBzU" class="videoPlayer"><i class="fa fa-play" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer-add-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="footer-add">
                        <a href="#">
                            <img src="img/bg-img/footer-add.gif" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

