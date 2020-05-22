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
        var News;
        var data = $scope.News;
        debugger;
        angular.forEach(data, function (value, key) {
            if (value.nm_id == news) {
                News = data[key];
            }
        });
        var url = '../Client-cp/News_Model.aspx'
        $scope.OpenModel(url, News);
    }

    $scope.OpenModel = function (url, datanews) {
        debugger;
        $uibModal.open({
            templateUrl: url,
            animation: 'am-flip-x',
            show: true,
            size: 'lg',
            controller: function ($scope, $uibModalInstance) {
                $scope.MainNews = datanews;
                animation: 'slide-in-up'
                $scope.ok = function () {
                    $uibModalInstance.close();
                }
            }
        })
    }
});
