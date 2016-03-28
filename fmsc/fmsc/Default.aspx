<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="fmsc.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMSC | Home</title>
    <% Response.WriteFile("~/views/header.html"); %>
    <script src="js/default.js"></script>
</head>
<body ng-app="DefaultModule", ng-controller="DefaultController", ng-cloak, ng-init='showCanvas()', ng-show='true'>
    <form id="form1" runat="server">
    <div align='center'>
        Total donations: 
        <strong class="text-success">
            $ {{totalAmount}}
        </strong>
        <div class="container-fluid canvas">
            <img src="images/logo.jpg", id='original', ng-show='false'/>
        </div>
        <canvas id="myCanvas", width='1000', height='1000'>

        </canvas>
    </div>        
    </form>
</body>
<script>
    var allDonations = '<%= allDonations %>';
</script>
</html>
