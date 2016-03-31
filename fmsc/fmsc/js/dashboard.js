try {


    var DefaultModule = angular.module('DashboardModule', []);

    DefaultModule
        .controller('DashboardController', function ($scope) {


            $scope.allDonations = eval("(" + allDonations + ")");

            $scope.showDonations = showDonations;

            //****************************************************************************

            function showDonations() {
                console.log(angular.toJson($scope.allDonations));
            }


        });



} catch (e) { console.log(e); }