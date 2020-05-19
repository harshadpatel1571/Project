var app = angular.module('myApp', []);
app.controller('newsCrtl', function ($scope, $http) {
    debugger
    $scope.getNews = function () {
        var data = {};
        $http.post("Home.aspx/GetHomePageNews", { responseType: 'json' })
        .then(function (response) {
            $scope.category = angular.fromJson(response.data.d);

        });
        console.log($scope.category);

    }
});