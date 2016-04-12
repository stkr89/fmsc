<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="fmsc.Dashboard" %>
<%@ Register TagPrefix="uc" TagName="Nav" Src="~/nav.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMSC | Dashboard</title>
    <% Response.WriteFile("~/views/header.html"); %>
    <uc:Nav id="Nav" runat="server" />
    <script src="js/dashboard.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>    
</head>
<body ng-cloak ng-app="DashboardModule", ng-controller="DashboardController", ng-show='true'>
    <form id="form1" runat="server">
    <div class="container">
        <div id="chart_div" class="marginn-top-20" ng-init="showMap()"></div>        
        <div class="padding-top-20">
            <label>Search</label>
            <input type="text" class="form-control form-control-sm" ng-model="search" />
        </div>
        <table class="table marginn-top-20">
          <thead class="thead-inverse">
            <tr>
              <th>#</th>
              <th>Name</th>
              <th>Country</th>
              <th>State</th>
              <th>City</th>
              <th>Amount</th>
              <th>Date</th>
            </tr>
          </thead>
          <tbody>
            <tr ng-repeat="donation in allDonations | filter:search">
              <th scope="row">{{$index+1}}</th>
              <td>{{donation.user.firstName}} {{donation.user.lastName}}</td>
              <td>{{donation.user.country}}</td>
              <td>{{donation.user.state}}</td>
              <td>{{donation.user.city}}</td>
              <td>$ {{donation.donation.amount}}.00</td>
              <td>{{donation.donation.date | amDateFormat:'MM.DD.YYYY'}}</td>
            </tr>
          </tbody>
        </table>
    </div>
    </form>
</body>
<script>
    var allDonations = '<%= allDonations %>';    
</script>
</html>
