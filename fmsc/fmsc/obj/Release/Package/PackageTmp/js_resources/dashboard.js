try {


    var DefaultModule = angular.module('DashboardModule', ['angularMoment']);

    DefaultModule.controller('DashboardController', function ($scope) {


            $scope.allDonations = eval("(" + allDonations + ")");

            $scope.showMap = showMap;

            //****************************************************************************

            function showMap() {
                google.charts.load('current', { 'packages': ['map'] });
                google.charts.setOnLoadCallback(drawMap);

                var arr = [['Country', 'Population']];

                angular.forEach($scope.allDonations, function (val, index) {
                    var temp = ['' + val.user.country + '', '' + val.user.country + ': $ ' + val.donation.amount];
                    arr.push(temp);
                });

                //console.log(angular.toJson(arr));

                function drawMap() {
                    var data = google.visualization.arrayToDataTable(arr);

                    var options = { showTip: true };

                    var map = new google.visualization.Map(document.getElementById('chart_div'));

                    map.draw(data, options);
                };
            }


        });



} catch (e) { console.log(e); }