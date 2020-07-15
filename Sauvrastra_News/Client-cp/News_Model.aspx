<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News_Model.aspx.cs" Inherits="Client_cp_News_Model" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <link href="../JS/bootstrap.min.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" />
    <script src="../JS/angular.min.js"></script>
    <script src="../JS/NavigationCrtl.js"></script>

</head>
<body ng-app="myApp" ng-controller="navigationCtrl" ng-init="OnModalLoad()">
    <br />
    <div class="featured-post-area" style="display: block; align-content: center">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="single-blog-post featured-post-2">
                        <div class="row" style="padding-bottom: 7px;">
                            <div class="col-sm-10">
                            </div>
                            <div class="col-sm-2" style="text-align: right;">
                                <input type="button" id="btnClose" value="Close" ng-click="ok()" style="color: red" />
                                <%--<label class="text-danger" ng-click="ok()">Close</label>--%>
                            </div>
                        </div>

                        <div class="post-thumb" ng-if="MainNews.nm_video_link  != NULL">
                            <a>
                                <%--<iframe class="youtube-player" type="text/html" width="640" height="385" ng-src="{{trustSrc(MainNews.nm_video_link)}}" allowfullscreen frameborder="0">--%>
                                <iframe width="770" height="400" class="youtube-player" ng-src="{{trustSrc(MainNews.nm_video_link)}}" allowfullscreen></iframe>
                            </a>
                        </div>

                        <div ng-if="MainNews.nm_video_link  == NULL">
                            <%--class="post-thumb" style="padding-left: 17.5%;"--%>
                            <a>
                                <asp:Image runat="server" ImageUrl="../Admin-cp/img/news_image/{{MainNews.nm_image}}" alt="" Width="800" Height="300" />
                            </a>

                        </div>
                        <div class="post-data">
                            <div class="row">
                                <div class="col-7">
                                    <a class="post-catagory">{{MainNews.cat_name}}</a>
                                </div>
                                <div class="col-5" style="text-align: right">
                                    <b class="text-danger"><span class="fa fa-calendar">&nbsp; {{MainNews.nm_date}}   </span></b>
                                </div>
                            </div>
                            <a class="post-title">
                                <h3>{{MainNews.nm_head_line}}</h3>
                            </a>
                            <div class="post-meta">
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
