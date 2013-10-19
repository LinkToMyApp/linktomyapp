'use strict';

angular.module('linkToMyApp').controller('MainCtrl', function ($scope, $http) {

    $scope.chartReady = function (){

    };

    function createTableData(){

        var tableData = {
                      "type": "Table",
                      "displayed": true,
                      "cssStyle": "height:100px; width:100%; margin-top: 20px;",
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
                      "type": "LineChart",
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
                            "count": 10
                          }
                        },
                        "hAxis": {
                          "title": "Date"
                        }
                      },
                      "formatters": {}
                    };

            var cols = [{"id":"date","label":"date","type":"string"}];

            var length = $scope.graphData.length,element = null;
            for (var i = 0; i < length; i++) {
              element = $scope.graphData[i];

              var object = {"id":element.date,"label":element.date,"type":"number"};

                cols.push(object);
            }


            var rows = [];

            var length = $scope.graphData.length,element = null;
            for (var i = 0; i < length; i++) {
              element = $scope.graphData[i];

              var object = {
                    "c": [
                      {
                        "v": element.date
                      }
                    ]
                  };
                var ref = null;
                for (var index = element.values.length - 1; index >= 0; index--) {
                    ref = element.values[index];
                    var value = {"v":ref.value,"f":ref.name};
                    object.c.push(value);
                };

                //console.log(JSON.stringify(object));
                rows.push(object);
            }

            console.log(JSON.stringify(cols));
            console.log(JSON.stringify(rows));
            graphData.data.cols = cols;
            graphData.data.rows = rows;

            return graphData;
        }
    

    /**************************** Dummy Data **************************/

        $scope.referers = [
    {
        "referal": "toto",
        "link_clicks_count": 10,
        "installs_count": 8
    },
    {
        "referal": "titi",
        "link_clicks_count": 20,
        "installs_count": 5
    }
];


        $scope.graphData = [
        {
            "date": "10/10",
            "values": [
                {
                    "name": "toto",
                    "value": 2
                },
                {
                    "name": "titi",
                    "value": 1
                }
            ]
        },
        {
            "date": "11/10",
            "values": [
                {
                    "name": "toto",
                    "value": 1
                },
                {
                    "name": "titi",
                    "value": 3
                }
            ]
        },
        {
            "date": "12/10",
            "values": [
                {
                    "name": "toto",
                    "value": 1
                },
                {
                    "name": "titi",
                    "value": 3
                }
            ]
        },
        {
            "date": "13/10",
            "values": [
                {
                    "name": "toto",
                    "value": 2
                },
                {
                    "name": "titi",
                    "value": 2
                }
            ]
        },
        {
            "date": "14/10",
            "values": [
                {
                    "name": "toto",
                    "value": 3
                },
                {
                    "name": "titi",
                    "value": 1
                }
            ]
        }
    ];

    /************************** Creation **************************/

    $scope.table = createTableData();
    $scope.graph = createGraphData();

  });