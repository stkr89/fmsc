﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="fmsc.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMSC | Login</title>
    <% Response.WriteFile("~/views/header.html"); %>
</head>
<body>    
    <form id="form1" runat="server">
    <div class="container padding-top-20">
        <h3>Log In</h3>
        <div class="row">
            <div class="col-md-4">
                <fieldset class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control input-sm" id="exampleInputEmail1" placeholder="Enter email">
                </fieldset>
                <fieldset class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control input-sm" id="password" placeholder="Enter password">
                </fieldset>
                <button type="submit" class="btn btn-primary">Login</button>
                or
                <a href="Register.aspx" class="pull-right">Sign Up</a>
            </div>
        </div>                
    </div>
    </form>
</body>
</html>