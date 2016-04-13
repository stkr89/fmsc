<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="fmsc.Default" %>
<%@ Register TagPrefix="uc" TagName="Nav" Src="~/nav.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMSC | Home</title>
    <% Response.WriteFile("~/views/header.html"); %>
    <uc:Nav id="Nav" runat="server" />
    <script src="js/default.js"></script>
</head>
<body ng-cloak ng-app="DefaultModule", ng-controller="DefaultController", ng-init='showCanvas()', ng-show='showCanvas'>
    <div class="container">
            <div class="padding-top-20">
                <div class="alert alert-success" role="alert">
                    Total donations: $ {{totalAmount}} = {{totalMeals}} meals
                </div>
            </div>
            <div align='center'>
                <div class="container-fluid canvas">
                    <img src="images/logo.jpg", id='original', ng-show='false'/>
                </div>
                <canvas id="myCanvas", width='1000', height='1000'>
                    
                </canvas>
                <div id="popuup_div" class="popup_msg"></div>
            </div>              
    </div>
</body>
<script>
    var allDonations = '<%= allDonations %>';

    var don = eval("(" + allDonations + ")");

    $('#myCanvas').mouseout(function (e) {
        $('#popuup_div').hide();
    });
    
    $('#myCanvas').mousemove(function (e) {        
        var pos = findPos(this);
        var x = e.pageX - pos.x;
        var y = e.pageY - pos.y;
        var thisPixel = (y * 999 + x);
        
        var ttl = 0;
        var doner = {};        
        for (var i = 0; i < don.length; i++) {
            ttl = ttl + don[i].donation.amount;            
            if (Math.round(ttl / 0.22) >= thisPixel) {                
                doner = don[i];
                break;
            } else {
                $('#popuup_div').hide();
            }
        }

        showPopup(e, doner);
    });

    function showPopup(e, doner) {

        var height = $('#popuup_div').height();
        var width = $('#popuup_div').width();

        leftVal = e.pageX - (width / 2) + "px";
        topVal = e.pageY - (height / 2) - 30 + "px";

        if (typeof doner != 'undefined' && typeof doner.user != 'undefinded' && typeof doner.user.email != 'undefined') {

            var str = '<p>This pixel is donated by ';
            str += '<strong>' + doner.user.firstName + ' ' + doner.user.lastName + '</strong> ';
            str += 'from '
            if (typeof doner.user.city != 'undefined') {
                str += '' + doner.user.city + ', ';
            }
            str += doner.user.state + ', ' + doner.user.country + '</p>';
            
            $('#popuup_div').css({ left: leftVal, top: topVal })
                        .html(str)
                        .show();
        } 
    }

    function findPos(obj) {
        var curleft = 0, curtop = 0;
        if (obj.offsetParent) {
            do {
                curleft += obj.offsetLeft;
                curtop += obj.offsetTop;
            } while (obj = obj.offsetParent);
            return { x: curleft, y: curtop };
        }
        return undefined;
    }
</script>
</html>
