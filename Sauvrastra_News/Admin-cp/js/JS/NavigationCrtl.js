var app = angular.module('myApp', ['ngAnimate', 'ngSanitize', 'ui.bootstrap']);
app.controller('navigationCtrl', function ($scope, $http, $uibModal) {
    debugger
    $scope.getCategory = function () {
        var data = { };
        $http.post("Home.aspx/GetCategory", { responseType: 'json' })
        .then(function (response) {
            $scope.category = angular.fromJson(response.data.d);
        });
        console.log($scope.category);
        $scope.getNews();
        //$scope.getLinks();
    }
    $scope.getNews = function () {
        debugger
        var data = {};
        $http.post("Home.aspx/GetHomePageNews", { responseType: 'json' })
        .then(function (response) {
            $scope.News = angular.fromJson(response.data.d);
        });
        console.log($scope.News);
        $scope.getLinks();
    }
    // add by : Harshad Koradiya
    $scope.getLinks = function () {
        debugger
        var data = {};
        $http.post("Home.aspx/GetYouTubeLinks", { responseType: 'json' })
        .then(function (response) {
            $scope.Links = angular.fromJson(response.data.d);

        });
        console.log($scope.Links);
    }
    $scope.FetchNews = function(news)
    {debugger
        var News = news;
        
        $scope.OpenModel(News);

    }

    

    $scope.getNewsByCate = function (cat_ID) {
        debugger
        var data = {
            Cat_ID: cat_ID
        };
        $http.post("Home.aspx/GetNewsByCategory", data)
        .then(function (response) {
            $scope.News = angular.fromJson(response.data.d);

        });
        console.log($scope.News);
    }

    $scope.OpenModel = function (datanews) {
        debugger;
        $uibModal.open({
            templateUrl: '/Client-cp/News_Model.aspx',
            animation: 'am-flip-x',
            show: true,
            size: 'lg',
            windowTopClass: 'modelsize90 am-flip-x',
            controller: function ($scope, $uibModalInstance, $sce) {
                $scope.MainNews = datanews;
                animation: 'slide-in-up'
                $scope.ok = function () {
                    $uibModalInstance.close();
                }
                $scope.trustSrc = function (src) {
                    return $sce.trustAsResourceUrl(src);
                }
            }
        })
    }
});
