<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News_Model.aspx.cs" Inherits="Client_cp_News_Model" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" />
    <script src="JS/angular.min.js"></script>
    <script src="JS/NavigationCrtl.js"></script>

    <script src="JS/jquery/jquery-2.2.4.min.js"></script>
    <script src="JS/plugins.js"></script>
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
    <style type="text/css">
        .iframe-container {
            overflow: hidden;
            padding-top: 56.25%; /* 16:9*/
            position: relative;
        }

            .iframe-container iframe {
                border: 0;
                height: 100%;
                left: 0;
                position: absolute;
                top: 0;
                width: 100%;
            }

        /* Large desktop */
        @media (min-width: 1200px) {
            #div_mobile {
                display: none;
                visibility: hidden;
            }

            #div_desctop {
                visibility: visible;
            }
        }

        /* Portrait tablet to landscape and desktop */
        @media (min-width: 768px) and (max-width: 979px) {
            #div_mobile {
                visibility: hidden;
                display: none;
            }

            #div_desctop {
                visibility: visible;
            }
        }

        /* Landscape phone to portrait tablet */
        @media (max-width: 767px) {
            #div_mobile {
                visibility: visible;
            }

            #div_desctop {
                display: none;
                visibility: hidden;
            }
        }

        /* Landscape phones and down */
        @media (max-width: 480px) {
            #div_mobile {
                visibility: visible;
            }

            #div_desctop {
                display: none;
                visibility: hidden;
            }
        }
    </style>

</head>
<body ng-app="myApp" ng-controller="navigationCtrl">
    <br />
    <div class="featured-post-area" style="display: block; align-content: center">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="single-blog-post featured-post-2">
                        <div class="row">
                            <div class="col-3">
                                <b class="fa fa-eye text-primary">&nbsp; {{Update_Views.nm_views_count + 1}}</b>
                            </div>
                            <div class="col-5">
                                <div class="logo">
                                    <asp:Image runat="server" ImageUrl="~/Admin-cp/img/buttons/DesctopLogo.png" Height="40" />
                                </div>
                            </div>
                            <div class="col-4" style="text-align: right;">
                                <a href="whatsapp://send?text=http://localhost:50444/news.aspx?id={{MainNews.nm_id}}" data-action="share/whatsapp/share" id="div_mobile" target="_blank">
                                    <label class="fa fa-whatsapp bg-danger btn rounded text-white">M</label>
                                </a>
                                <a href="https://web.whatsapp.com/send?text=http://localhost:50444/News.aspx?id={{MainNews.nm_id}}" data-action="share/whatsapp/share" id="div_desctop" target="_blank">
                                    <label class="fa fa-whatsapp bg-danger btn rounded text-white">D</label>
                                </a>
                                <label class="fa fa-close bg-danger btn rounded text-white" id="btnClose" ng-click="ok()"></label>
                            </div>
                        </div>

                        <div class="post-thumb iframe-container" ng-if="MainNews.nm_video_link  != NULL">
                            <a>
                                <iframe width="770" height="400" class="youtube-player" ng-src="{{trustSrc(MainNews.nm_video_link)}}" allowfullscreen></iframe>
                            </a>
                        </div>

                        <div ng-if="MainNews.nm_video_link  == NULL">
                            <center>
                                <a>
                                    <asp:Image runat="server" ImageUrl="../Admin-cp/img/news_image/{{MainNews.nm_image}}" alt="" Width="400" Height="400" />
                                </a>
                            </center>

                        </div>
                        <div class="post-data">
                            <div class="row">
                                <div class="col-4">
                                    <a class="post-catagory">{{MainNews.cat_name}}</a>
                                </div>
                                <div class="col-4">
                                    <a class="post-catagory">{{MainNews.nm_city}}</a>
                                </div>
                                <div class="col-4" style="text-align: right">
                                    <b class="text-danger"><span class="fa fa-calendar">&nbsp; {{MainNews.nm_date}}   </span></b>
                                </div>
                            </div>
                            <a class="post-title text-primary">
                                <h5 class="text-primary">{{MainNews.nm_head_line}}</h5>
                            </a>
                            <div class="post-meta" style="overflow-y: scroll; height: 250px;">
                                <b>{{MainNews.nm_full_desc}} </b>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
