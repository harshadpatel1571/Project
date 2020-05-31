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
    }
    $scope.getNews = function () {
        debugger
        var data = {};
        $http.post("Home.aspx/GetHomePageNews", { responseType: 'json' })
        .then(function (response) {
            $scope.News = angular.fromJson(response.data.d);

        });
        console.log($scope.News);
    }
    $scope.FetchNews = function(news)
    {
        var News = news;
        //var data = $scope.News;
        //debugger;
        //angular.forEach(data, function (value, key) {
        //    if (value.nm_id == news) {
        //        News = data[key];
        //    }
        //});
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
            controller: function ($scope, $uibModalInstance) {
                $scope.MainNews = datanews;
                animation: 'slide-in-up'
                $scope.ok = function () {
                    $uibModalInstance.close();
                }
            }
        })
    }
    $scope.OnModalLoad = function()
    {
        alert("Hello");
    }
});
