<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
         .modal.fade.in {
            opacity: 1;
            padding-top: 200px;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" />
    <script src="JS/angular.min.js"></script>
    <script src="../JS/angular-animate.js"></script>
    <script src="../JS/angular-sanitize.js"></script>
    <script src="../JS/ui-bootstrap-tpls-2.5.0.js"></script>
    
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

    <style>
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

            #myClass {
    background: linear-gradient(65deg, #b00a2d, #a30743, #6c0a99, #b606a7, #8c055d);
    background-size: 1000% 1000%;

    -webkit-animation: AnimationName 7s ease infinite;
    -moz-animation: AnimationName 7s ease infinite;
    -o-animation: AnimationName 7s ease infinite;
    animation: AnimationName 7s ease infinite;
}

@-webkit-keyframes AnimationName {
    0%{background-position:0% 50%}
    50%{background-position:100% 50%}
    100%{background-position:0% 50%}
}
@-moz-keyframes AnimationName {
    0%{background-position:0% 50%}
    50%{background-position:100% 50%}
    100%{background-position:0% 50%}
}
@-o-keyframes AnimationName {
    0%{background-position:0% 50%}
    50%{background-position:100% 50%}
    100%{background-position:0% 50%}
}
@keyframes AnimationName {
    0%{background-position:0% 50%}
    50%{background-position:100% 50%}
    100%{background-position:0% 50%}
}
    </style>
    <title></title>
</head>
<body ng-app="myApp" ng-controller="navigationCtrl" ng-init="OpenModelSingleNews()" class="css-selector">
    <div id="myClass">

    </div>
</body>
</html>
