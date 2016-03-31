<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="fmsc.Dashboard" %>
<%@ Register TagPrefix="uc" TagName="Nav" Src="~/nav.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMSC | Dashboard</title>
    <% Response.WriteFile("~/views/header.html"); %>
    <uc:Nav id="Nav" runat="server" />
    <script src="js/dashboard.js"></script>
</head>
<body ng-cloak ng-app="DashboardModule", ng-controller="DashboardController", ng-init='showDonations()', ng-show='true'>
    <form id="form1" runat="server">
    <div class="container">
        <table class="table marginn-top-20">
          <thead class="thead-inverse">
            <tr>
              <th>#</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Country</th>
              <th>State</th>
              <th>City</th>
              <th>Amount</th>
              <th>Date</th>
            </tr>
          </thead>
          <tbody>
            <tr ng-repeat="donation in allDonations">
              <th scope="row">{{$index+1}}</th>
              <td>{{donation.user.firstName}}</td>
              <td>{{donation.user.lastName}}</td>
              <td>{{donation.user.country}}</td>
              <td>{{donation.user.state}}</td>
              <td>{{donation.user.city}}</td>
              <td>$ {{donation.donation.amount}}.00</td>
              <td>{{donation.donation.date}}</td>
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
