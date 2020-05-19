/// <reference path="../Client-cp/Home.aspx" />
var app = angular.module('myApp', []);
app.controller('navigationCtrl', function ($scope, $http) {
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
});
