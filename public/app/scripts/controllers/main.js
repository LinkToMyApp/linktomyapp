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
                                "f": element.name
                              },
                              {
                                "v": element.clicks
                              },
                              {
                                "v": element.installs
                              }
                            ]
                          };
                rows.push(object);
            }

            tableData.data.cols = cols;
            tableData.data.rows = rows;

            return tableData;
        }

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
                        "title": "Sales per month",
                        "isStacked": "true",
                        "fill": 20,
                        "displayExactValues": true,
                        "vAxis": {
                          "title": "Sales unit",
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

            var cols = [
                          {
                            "id": "month",
                            "label": "Month",
                            "type": "string"
                          },
                          {
                            "id": "laptop-id",
                            "label": "Laptop",
                            "type": "number"
                          },
                          {
                            "id": "desktop-id",
                            "label": "Desktop",
                            "type": "number"
                          },
                          {
                            "id": "server-id",
                            "label": "Server",
                            "type": "number"
                          },
                          {
                            "id": "cost-id",
                            "label": "Shipping",
                            "type": "number"
                          }];

    var rows = [
                  {
                    "c": [
                      {
                        "v": "January"
                      },
                      {
                        "v": 19,
                        "f": "42 items"
                      },
                      {
                        "v": 12,
                        "f": "Ony 12 items"
                      },
                      {
                        "v": 7,
                        "f": "7 servers"
                      },
                      {
                        "v": 4
                      }
                    ]
                  },
                  {
                    "c": [
                      {
                        "v": "February"
                      },
                      {
                        "v": 13
                      },
                      {
                        "v": 1,
                        "f": "1 unit (Out of stock this month)"
                      },
                      {
                        "v": 12
                      },
                      {
                        "v": 2
                      }
                    ]
                  },
                  {
                    "c": [
                      {
                        "v": "March"
                      },
                      {
                        "v": 24
                      },
                      {
                        "v": 5
                      },
                      {
                        "v": 11
                      },
                      {
                        "v": 6
                      }
                    ]
                  }
                ];

            /*var length = $scope.referers.length,element = null;
            for (var i = 0; i < length; i++) {
              element = $scope.referers[i];

              var object = {
                            "c": [
                              {
                                "f": element.name
                              },
                              {
                                "v": element.clicks
                              },
                              {
                                "v": element.installs
                              }
                            ]
                          };
                rows.push(object);
            }*/

            graphData.data.cols = cols;
            graphData.data.rows = rows;

            return graphData;
        }
    

    /**************************** Dummy Data **************************/

        $scope.referers = [
        {
            "name": "toto",
            "clicks": 10,
            "installs": 8
        },
        {
            "name": "titi",
            "clicks": 20,
            "installs": 5
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