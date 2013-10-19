'use strict';

angular.module('linkToMyAppApp',['googlechart']).controller('MainCtrl', function ($scope) {

/*
    var chart1 = {};
    chart1.type = "AreaChart";
    chart1.displayed = false;
    chart1.cssStyle = "height:600px; width:100%;";
    chart1.data = {"cols": [
        {id: "month", label: "Month", type: "string"},
        {id: "laptop-id", label: "Laptop", type: "number"},
        {id: "desktop-id", label: "Desktop", type: "number"},
        {id: "server-id", label: "Server", type: "number"},
        {id: "cost-id", label: "Shipping", type: "number"}
    ], "rows": [
        {c: [
            {v: "January"},
            {v: 19, f: "42 items"},
            {v: 12, f: "Ony 12 items"},
            {v: 7, f: "7 servers"},
            {v: 4}
        ]},
        {c: [
            {v: "February"},
            {v: 13},
            {v: 1, f: "1 unit (Out of stock this month)"},
            {v: 12},
            {v: 2}
        ]},
        {c: [
            {v: "March"},
            {v: 24},
            {v: 5},
            {v: 11},
            {v: 6}

        ]}
    ]};

    chart1.options = {
        "title": "Sales per month",
        "isStacked": "true",
        "fill": 20,
        "displayExactValues": true,
        "vAxis": {
            "title": "Sales unit", "gridlines": {"count": 10}
        },
        "hAxis": {
            "title": "Date"
        }
    };
    

    var formatCollection = [
      {
        name: "color",
        format: [
          {
            columnNum: 4,
            formats: [
              {
                from: 0,
                to: 3,
                color: "white",
                bgcolor: "red"
              },
              {
                from: 3,
                to: 5,
                color: "white",
                fromBgColor: "red",
                toBgColor: "blue"
              },
              {
                from: 6,
                to: null,
                color: "black",
                bgcolor: "#33ff33"
              }
            ]
          }
        ]
      },
      {
        name: "arrow",
        checked:false,
        format: [
          {
            columnNum: 1,
            base: 19
          }
        ]
      },
      {
        name: "date",
        format: [
          {
            columnNum: 5,
            formatType: 'long'
          }
        ]
      },
      {
        name: "number",
        format: [
          {
            columnNum: 4,
            prefix: '$'
          }
        ]
      },
      {
        name: "bar",
        format: [
          {
            columnNum: 1,
            width: 100
          }
        ]
      }
    ];

    chart1.formatters = {};

    $scope.chart = chart1;
*/
    $scope.chartReady = function (){

        alert("ready");

    };

  });
