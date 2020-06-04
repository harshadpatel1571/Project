<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News_Model.aspx.cs" Inherits="Client_cp_News_Model" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
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
                                <label class="text-danger">Close</label>
                            </div>
                        </div>

                        <div class="post-thumb">
                            <a>
                                <iframe width="770" height="300"
                                    src="https://www.youtube.com/embed/tgbNymZ7vqY">
                                </iframe>
                            </a>
                        </div>

                        <div class="post-thumb">
                            <a>
                                <asp:Image runat="server" ImageUrl="../Admin-cp/img/news_image/{{MainNews.nm_image}}" alt="" Width="800" Height="300" />
                            </a>
                        </div>
                        <div class="post-data">
                            <div class="row">
                                <div class="col-10">
                                    <a class="post-catagory">{{MainNews.cat_name}}</a>
                                </div>
                                <div class="col-2">
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
