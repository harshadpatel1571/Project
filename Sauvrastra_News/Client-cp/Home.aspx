<%@ Page Title="" Language="C#" MasterPageFile="~/Client-cp/client_mst.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Client_cp_Home" %>
  
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .modal.fade.in {
            opacity: 1;
            padding-top: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            //Disable cut copy paste
            $('body').bind('cut copy paste', function (e) {
                e.preventDefault();
            });

            //Disable mouse right click
            $("body").on("contextmenu", function (e) {
                return false;
            });
        });
    </script>

    <div class="featured-post-area">
        <div class="container">
            <div class="row">
                <div class="col-4" ng-repeat="new in News">

                    <div class="single-blog-post featured-post-2">
                        <div class="post-thumb">
                            <asp:Image runat="server" ImageUrl="../Admin-cp/img/news_image/{{new.nm_image}}" alt="" ng-click="FetchNews(new)" Width="340" Height="200" />
                        </div>
                        <div class="post-data">
                            <div class="row">
                                <div class="col-7">
                                    <a class="post-catagory" ng-click="FetchNews(new)">{{new.cat_name}}</a>
                                </div>
                                <div class="col-5">
                                    <b class="text-danger"><span class="fa fa-calendar">&nbsp; {{new.nm_date}}   </span></b>
                                </div>
                            </div>
                            <a class="post-title" ng-click="FetchNews(new)">
                                <h3>{{new.nm_head_line}}</h3>
                            </a>
                            <div class="post-meta" ng-click="FetchNews(new)">
                                <b>{{new.nm_short_desc}} </b>
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
                        <asp:Image runat="server" src="../Admin-cp/img/buttons/Capture.png" alt="" Height="250" />

                        <div class="videobtn">
                            <a href="{{Links[0].ym_link}}" class="videoPlayer"><i class="fa fa-play" aria-hidden="true"></i></a>
                        </div>
                    </div>
                    <b class="text-white">Daily News || <span class="fa fa-calendar">&nbsp; {{Links[0].ym_date}}   </span></b>
                </div>

                <div class="col-12 col-sm-6 col-md-4">
                    <div class="single-video-post">
                        <asp:Image runat="server" src="../Admin-cp/img/buttons/Capture.png" alt="" Height="250" />

                        <div class="videobtn">
                            <a href="{{Links[1].ym_link}}" class="videoPlayer"><i class="fa fa-play" aria-hidden="true"></i></a>
                        </div>
                    </div>
                    <b class="text-white">Daily News || <span class="fa fa-calendar">&nbsp; {{Links[1].ym_date}}   </span></b>
                </div>

                <div class="col-12 col-sm-6 col-md-4">
                    <div class="single-video-post">
                        <asp:Image runat="server" src="../Admin-cp/img/buttons/Capture.png" alt="" Height="250" />

                        <div class="videobtn">
                            <a href="{{Links[2].ym_link}}" class="videoPlayer"><i class="fa fa-play" aria-hidden="true"></i></a>
                        </div>
                    </div>
                    <b class="text-white">Daily News || <span class="fa fa-calendar">&nbsp; {{Links[2].ym_date}}   </span></b>
                </div>
            </div>
        </div>
    </div>

    <div class="footer-add-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div id="internationalTicker" class="ticker">
                        <ul>
                            <li ng-if="FooterAdd.length >= 1">
                                <a href="{{FooterAdd[0].add_link}}">
                                    <asp:Image runat="server" ImageUrl="../Admin-cp/img/add_image/{{FooterAdd[0].add_image}}" alt="" Width="1150" Height="150" /></a>
                            </li>
                            <li ng-if="FooterAdd.length >= 2">
                                <a href="{{FooterAdd[1].add_link}}">
                                    <asp:Image runat="server" ImageUrl="../Admin-cp/img/add_image/{{FooterAdd[1].add_image}}" alt="" Width="1150" Height="150" /></a>
                            </li>
                            <li ng-if="FooterAdd.length >= 3">
                                <a href="{{FooterAdd[2].add_link}}">
                                    <asp:Image runat="server" ImageUrl="../Admin-cp/img/add_image/{{FooterAdd[2].add_image}}" alt="" Width="1150" Height="150" /></a>
                            </li>
                            <li ng-if="FooterAdd.length >= 4">
                                <a href="{{FooterAdd[3].add_link}}">
                                    <asp:Image runat="server" ImageUrl="../Admin-cp/img/add_image/{{FooterAdd[3].add_image}}" alt="" Width="1150" Height="150" /></a>
                            </li>
                            <li ng-if="FooterAdd.length >= 5">
                                <a href="{{FooterAdd[4].add_link}}">
                                    <asp:Image runat="server" ImageUrl="../Admin-cp/img/add_image/{{FooterAdd[4].add_image}}" alt="" Width="1150" Height="150" /></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
        </div>
    </div>

</asp:Content>

