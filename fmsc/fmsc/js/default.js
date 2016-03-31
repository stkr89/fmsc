try {


    var DefaultModule = angular.module('DefaultModule', []);

    DefaultModule
        .controller('DefaultController', function ($scope) {


            $scope.allDonations = allDonations;

            $scope.showCanvas = showCanvas;

            //****************************************************************************

            function getTotalAmount(donations, callback) {
                var don = eval("(" + donations + ")");
                var amount = 0;
                for (var i = 0; i < don.length; i++) {
                    amount = amount + parseInt(don[i].donation.amount);
                }
                $scope.totalAmount = amount;
                $scope.totalMeals = Math.round(amount / 0.22);
                callback(amount);
            }

            function showCanvas() {

                getTotalAmount($scope.allDonations, function (totalAmount) {

                    var c = document.getElementById("myCanvas");
                    var ctx = c.getContext("2d");
                    var img = document.getElementById("original");
                    ctx.drawImage(img, 0, 0);
                    imgData = ctx.getImageData(0, 0, c.width, c.height);
                    var w = imgData.width;
                    var h = imgData.height;

                    var l = w * h;
                    for (var i = l; i > totalAmount; i--) {
                        // get the position of pixel
                        var y = parseInt(i / w, 10);
                        var x = i - y * w;

                        ctx.fillStyle = "#F1F1F1";
                        ctx.fillRect(x, y, 1, 1);
                    }

                    $scope.showCanvas = true;

                });
            }
        });

    

} catch (e) { console.log(e); }