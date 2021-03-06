﻿var app = angular.module('myApp', ['ngAnimate', 'ngSanitize', 'ui.bootstrap']);
app.config(['$compileProvider', function ($compileProvider) {
    //$compileProvider.aHrefSanitizationWhitelist([/^\s*(whatsapp):/]);
    $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|whatsapp|https):/);
}])

app.controller('navigationCtrl', function ($scope, $http, $uibModal) {

    $scope.homepage = 'મુખ્ય પાનું';
    $scope.breakingNews = 'બ્રેકિંગ ન્યુઝ';
    $scope.date = new Date();

    $scope.getCategory = function () {
        var data = {};
        $http.post("index.aspx/firstPageData", { responseType: 'json' })
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
        $scope.Update_Views(News.nm_views_count, News.nm_id, news);
    }
    $scope.getNewsByCate = function (cat_ID) {
        var data = {
            Cat_ID: cat_ID
        };
        $http.post("index.aspx/GetNewsByCategory", data)
        .then(function (response) {
            $scope.News = angular.fromJson(response.data.d);
        });
    }

    $scope.Update_Views = function (view_count, news_id, News) {
        var data = {
            'old_view': view_count,
            'id': news_id
        }
        $http.post("index.aspx/update_views", data, { responseType: 'json' })
        .then(function (response) {
            var update_user_view = angular.fromJson(response.data.d);
            $scope.OpenModel(News, update_user_view);
        });
    };
    $scope.OpenModel = function (datanews, update_user_view) {
        $uibModal.open({
            templateUrl: '/News_Model.aspx',
            animation: 'am-flip-x',
            show: true,
            size: 'lg',
            windowTopClass: 'modelsize90 am-flip-x',
            controller: function ($scope, $uibModalInstance, $sce) {
                $scope.MainNews = datanews;
                $scope.update_user_view = update_user_view;
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

    $scope.OpenModelSingleNews = function () {
        var getURL = window.location.pathname;
        var url = window.location.href;
        var split = url.split('?')[1];
        var id = parseInt(split.split('=')[1]);
        $http.post("index.aspx/GetNewsByID", { nm_ID: id }, { responseType: 'json' })
       .then(function (response) {
           var SingleNews = angular.fromJson(response.data.d);
           $scope.OpenSingleModel(SingleNews);
           //return $scope.img = SingleNews;
       });
    }
    $scope.OpenSingleModel = function (datanews) {
        $uibModal.open({
            templateUrl: '/Single_news_model.aspx',
            animation: 'am-flip-x',
            show: true,
            backdrop: 'static',
            size: 'lg',
            windowTopClass: 'modelsize90 am-flip-x',
            controller: function ($scope, $uibModalInstance, $sce) {
                $scope.SingleNews = datanews[0];
                animation: 'slide-in-up'
                $scope.ok = function () {
                    $uibModalInstance.close();
                    window.location.href = "http://www.saurashtramirror.com";
                }
                $scope.trustSrc = function (src) {
                    return $sce.trustAsResourceUrl(src);
                }
            }
        })
    }

});
