'use strict';

angular.module('linkToMyApp').controller('MainCtrl', function ($scope, $http) {

    $scope.chartReady = function (){

    };

    function createTableData(){

        var tableData = {
                      "type": "Table",
                      "displayed": true,
                      "cssStyle": "height:300px; width:100%; margin-top: 20px;",
                      "data": {
                        "cols": [],
                        "rows": [],
                      },
                      "options": {
                        "title": "Installs & Clicks",
                        "isStacked": "true",
                        "fill": 20,
                        "displayExactValues": true
                        },
                      "formatters": {}
                    };

            var cols = [{
                            "id": "name",
                            "label": "Name",
                            "type": "string"
                          },
                          {
                            "id": "clicks",
                            "label": "Clicks",
                            "type": "number"
                          },
                          {
                            "id": "installs",
                            "label": "Installs",
                            "type": "number"
                          }];

            var rows = [];

            var length = $scope.referers.length,element = null;
            for (var i = 0; i < length; i++) {
              element = $scope.referers[i];

              var object = {
                            "c": [
                              {
                                "f": element.referal
                              },
                              {
                                "v": element.link_clicks_count
                              },
                              {
                                "v": element.installs_count
                              }
                            ]
                          };
                rows.push(object);
            }

            tableData.data.cols = cols;
            tableData.data.rows = rows;

            return tableData;
        }

    $scope.showType = "Click";

    function createGraphData(){

        var graphData = {
                      "type": "AreaChart",
                      "displayed": true,
                      "cssStyle": "height:600px; width:100%;",
                      "data": {
                        "cols": [],
                        "rows": []
                      },
                      "options": {
                        "title": $scope.showType,
                        "isStacked": "true",
                        "fill": 20,
                        "displayExactValues": true,
                        "vAxis": {
                          "title": $scope.showType,
                          "gridlines": {
                            "count": 5
                          }
                        },
                        "hAxis": {
                          "title": "Date"
                        }
                      },
                      "formatters": {}
                    };

            var cols = [{"id":"date","label":"date","type":"string"}];
            var rows = [];
            var order = ["date"];

            for (var col in $scope.graphData) {

                var element = $scope.graphData[col];
                var ref = null;

                for (var index = element.length - 1; index >= 0; index--) {
                    ref = element[index];
                    var indexOrder = order.indexOf(ref.referal);
                    if (indexOrder == -1) {
                        order.push(ref.referal);
                        indexOrder = order.indexOf(ref.referal);
                        cols[indexOrder] = {"id":ref.referal,"label":ref.referal,"type":"number"};
                    };
                };
            }

            graphData.data.cols = cols;

            for (var col in $scope.graphData) {

                var element = $scope.graphData[col];
                var ref = null;
                var object = {
                            "c": [
                              {
                                "f": col
                              }]
                          };

                for (var i = order.length - 1; i > 0; i--) {
                    object.c.push({"v":0});
                };

                for (var index = element.length - 1; index >= 0; index--) {
                    ref = element[index];
                    var indexOrder = order.indexOf(ref.referal);

                    object.c[indexOrder] = {"v":ref.link_clicks_count};
                };

                rows.push(object);
            }

            graphData.data.rows = rows;

            return graphData;
        }
    

    /**************************** Dummy Data **************************/

        $http({method: 'GET', url: 'http://linktomyapp.herokuapp.com/api/app_links'}).
          success(function(data, status, headers, config) {

            $scope.referers = data;
            $scope.table = createTableData();
        }).
        error(function(data, status, headers, config) {
    
        });

        $http({method: 'GET', url: 'http://linktomyapp.herokuapp.com/api/app_links/clicks'}).
          success(function(data, status, headers, config) {
            console.log(JSON.stringify(data));
            $scope.graphData = data;
            $scope.graph = createGraphData();
        }).
        error(function(data, status, headers, config) {
    
        });

    /************************** Creation **************************/

  });