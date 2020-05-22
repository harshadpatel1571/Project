<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News_Model.aspx.cs" Inherits="Client_cp_News_Model" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="style.css" rel="stylesheet" />
    <script src="../JS/angular.min.js"></script>
    <script src="../JS/NavigationCrtl.js"></script>
</head>
<body ng-app="myApp" ng-controller="navigationCtrl">
    <div class="featured-post-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="single-blog-post featured-post-2">
                        <div class="post-thumb">
                            <a href="#">
                                <img src="../Admin-cp/img/news_image/{{MainNews.nm_image}}" alt=""></a>
                        </div>
                        <div class="post-data">
                            <a href="#" class="post-catagory">{{MainNews.cat_name}}</a>
                            <div class="post-meta">
                                <a href="#" class="post-title">
                                    <h6>{{MainNews.nm_head_line}}</h6>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
