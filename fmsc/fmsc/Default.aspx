﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="fmsc.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMSC | Home</title>
    <% Response.WriteFile("~/views/header.html"); %>
    <script src="js/default.js"></script>
</head>
<body ng-app="DefaultModule", ng-controller="DefaultController", ng-cloak, ng-init='showCanvas()', ng-show='showCanvas'>
    <div class="container">
            <div class="padding-top-20">
                <div class="alert alert-success" role="alert">
                    Total donations: $ {{totalAmount}}
                </div>
            </div>
            <div align='center'>
                <div class="container-fluid canvas">
                    <img src="images/logo.jpg", id='original', ng-show='false'/>
                </div>
                <canvas id="myCanvas", width='1000', height='1000'>

                </canvas>
            </div>  
            <div class="card">
              <div class="card-block">
                <h4 class="card-title">Search</h4>
                <form class="form-inline" runat="server">
                  <div class="form-group">
                    <label class="sr-only">Enter search text</label>
                    <asp:TextBox class="form-control" placeholder="Enter search text" ID="search" Size="50" runat="server"></asp:TextBox>
                  </div>
                  <div class="form-group">
                    <asp:DropDownList ID="param" runat="server" class="form-control">
                        <asp:ListItem Text="All" Value="all" />
                        <asp:ListItem Text="User Id" Value="userId" />
                        <asp:ListItem Text="First Name" Value="firstName" />
                        <asp:ListItem Text="Last Name" Value="lastName" /> 
                        <asp:ListItem Text="Email" Value="email" />
                        <asp:ListItem Text="Country" Value="country" />
                        <asp:ListItem Text="State" Value="state" />
                        <asp:ListItem Text="City" Value="city" />
                        <asp:ListItem Text="Zip" Value="zip" />
                    </asp:DropDownList>
                  </div>
                  <button type="submit" class="btn btn-primary-outline">Search</button>
                </form>
              </div>
            </div>
    </div>
</body>
<script>
    var allDonations = '<%= allDonations %>';
</script>
</html>
