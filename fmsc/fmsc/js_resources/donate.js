var DonateModule = angular.module('DonateModule', ['ngResource']);

DonateModule.controller('DonateController', function ($scope) {
    $scope.amount = 2.2;

    $scope.checkAmount = checkAmount;
    $scope.checkProfanity = checkProfanity;

    //********************************************

    function checkProfanity() {
        angular.forEach(profane, function (val, key) {
            
            if(val["2g1c"] == $scope.displayName) {
                alert('Kindly use appropriate words.');
                $scope.displayName = '';
            }
        });
    }

    function checkAmount() {
        if ($scope.amount < 2.2) {

            $scope.amount = 2.2;
        }
    }
});