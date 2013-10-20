'use strict';

angular.module('linkToMyApp')
  .controller('LeftmenuCtrl', function ($scope, $http, $rootScope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];

    //api/mobile_apps/1.json
    var url = 'http://'+window.location.host+'/api/mobile_apps/1.json';
    $http({method: 'GET', url:url}).
              success(function(data, status, headers, config) {
                $scope.app_icon = data.icon_url;
                $rootScope.app_name = data.name;
            }).
            error(function(data, status, headers, config) {
        
            });

    $scope.app_link = "http://"+window.location.host+"/app_links/follow";
  });
