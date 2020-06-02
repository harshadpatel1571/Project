﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Client-cp/client_mst.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Client_cp_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .modal.fade.in {
            opacity: 1;
            padding-top: 200px;
        }

        /*.modalPopup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 300px;
            height: 140px;
        }*/

        /*.modal.in .modal-dialog {
            transform: translate(0, 0);
            object-position:center;
        }

        .modal-backdrop.in {
            opacity: 0.5;
            
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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
                    <div class="footer-add">
                        <a href="#">
                            <img src="img/bg-img/footer-add.gif" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

