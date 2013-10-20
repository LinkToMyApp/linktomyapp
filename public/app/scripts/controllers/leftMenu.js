'use strict';

angular.module('linkToMyApp')
  .controller('LeftmenuCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];

    $scope.referers = ["",""];
    $scope.app_icon = "http://a4.mzstatic.com/us/r30/Purple/v4/ff/42/bb/ff42bbec-132d-3722-6218-bec51eb43e5e/mzl.clfucble.175x175-75.jpg";
    $scope.app_link = "http://"+window.location.host+"/app_links/follow";
  });
