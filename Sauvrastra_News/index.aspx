<%@ Page Title="" Language="C#" MasterPageFile="~/News_Master.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .modal.fade.in {
            opacity: 1;
            padding-top: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="JS/jquery/jquery-2.2.4.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('body').bind('cut copy paste', function (e) {
                e.preventDefault();
            })
            $('body').on("contextmenu", function (e) {
                return false;
            })
        })
    </script>
    <div class="featured-post-area">
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-6 col-md-4" ng-repeat="new in News">
                    <div class="single-blog-post featured-post-2">
                        <div class="post-thumb">
                            <center>
                                <asp:Image runat="server" CssClass="img-responsive" ImageUrl="Admin-cp/img/news_image/{{new.nm_image}}" alt="" ng-click="FetchNews(new)" Width="355" Height="300"/>
                            </center>
                        </div>
                        <div class="post-data">
                            <div class="row">
                                <div class="col-4">
                                    <a class="post-catagory" ng-click="FetchNews(new)">{{new.cat_name}} </a>
                                </div>
                                <%-- <div class="col-4" style="text-align: inherit;">
                                    <a class="post-catagory" ng-click="FetchNews(new)">Rajkot </a>
                                </div>--%>
                                <div class="col-4" style="text-align: right">
                                    <b class="text-danger"><span class="fa fa-calendar">&nbsp; {{new.nm_date}}   </span></b>
                                </div>
                            </div>
                            <a class="post-title" ng-click="FetchNews(new)">
                                <h5 class="text-primary">{{new.nm_head_line}}</h5>
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
                        <asp:Image runat="server" src="Admin-cp/img/buttons/Capture.png" alt="" Height="250" />

                        <div class="videobtn">
                            <a href="{{Links[0].ym_link}}" class="videoPlayer"><i class="fa fa-play" aria-hidden="true"></i></a>
                        </div>
                    </div>
                    <b class="text-white">Daily News || <span class="fa fa-calendar">&nbsp; {{Links[0].ym_date}}   </span></b>
                </div>

                <div class="col-12 col-sm-6 col-md-4">
                    <div class="single-video-post">
                        <asp:Image runat="server" src="Admin-cp/img/buttons/Capture.png" alt="" Height="250" />

                        <div class="videobtn">
                            <a href="{{Links[1].ym_link}}" class="videoPlayer"><i class="fa fa-play" aria-hidden="true"></i></a>
                        </div>
                    </div>
                    <b class="text-white">Daily News || <span class="fa fa-calendar">&nbsp; {{Links[1].ym_date}}   </span></b>
                </div>

                <div class="col-12 col-sm-6 col-md-4">
                    <div class="single-video-post">
                        <asp:Image runat="server" src="Admin-cp/img/buttons/Capture.png" alt="" Height="250" />

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
                    <div class="footer-add">
                        <div id="internationalTicker" class="ticker">
                            <ul>
                                <li ng-if="FooterAdd.length >= 1">
                                    <a href="{{FooterAdd[0].add_link}}">
                                        <asp:Image runat="server" ImageUrl="Admin-cp/img/add_image/{{FooterAdd[0].add_image}}" alt="" Width="1150" Height="150" /></a>
                                </li>
                                <li ng-if="FooterAdd.length >= 2">
                                    <a href="{{FooterAdd[1].add_link}}">
                                        <asp:Image runat="server" ImageUrl="Admin-cp/img/add_image/{{FooterAdd[1].add_image}}" alt="" Width="1150" Height="150" /></a>
                                </li>
                                <li ng-if="FooterAdd.length >= 3">
                                    <a href="{{FooterAdd[2].add_link}}">
                                        <asp:Image runat="server" ImageUrl="Admin-cp/img/add_image/{{FooterAdd[2].add_image}}" alt="" Width="1150" Height="150" /></a>
                                </li>
                                <li ng-if="FooterAdd.length >= 4">
                                    <a href="{{FooterAdd[3].add_link}}">
                                        <asp:Image runat="server" ImageUrl="Admin-cp/img/add_image/{{FooterAdd[3].add_image}}" alt="" Width="1150" Height="150" /></a>
                                </li>
                                <li ng-if="FooterAdd.length >= 5">
                                    <a href="{{FooterAdd[4].add_link}}">
                                        <asp:Image runat="server" ImageUrl="Admin-cp/img/add_image/{{FooterAdd[4].add_image}}" alt="" Width="1150" Height="150" /></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </div>

</asp:Content>

