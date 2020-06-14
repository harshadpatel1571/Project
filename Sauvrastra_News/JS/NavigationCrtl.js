var app = angular.module('myApp', ['ngAnimate', 'ngSanitize', 'ui.bootstrap']);
app.controller('navigationCtrl', function ($scope, $http, $uibModal) {
    $scope.getCategory = function () {
        var data = {};
        $http.post("Home.aspx/firstPageData", { responseType: 'json' })
        .then(function (response) {
            $scope.getFirstData = angular.fromJson(response.data.d);
            $scope.category = $scope.getFirstData.Table1;
            $scope.News = $scope.getFirstData.Table;
            $scope.Links = $scope.getFirstData.Table2;
            $scope.TopAdd = $scope.getFirstData.Table3;
            $scope.FooterAdd = $scope.getFirstData.Table4;
        });
    }
    $scope.FetchNews = function (news) {
        var News = news;
        $scope.OpenModel(News);
    }
    $scope.getNewsByCate = function (cat_ID) {
        var data = {
            Cat_ID: cat_ID
        };
        $http.post("Home.aspx/GetNewsByCategory", data)
        .then(function (response) {
            $scope.News = angular.fromJson(response.data.d);
        });
    }
    $scope.OpenModel = function (datanews) {
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
