<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="fmsc.Login" %>
<%@ Register TagPrefix="uc" TagName="Nav" Src="~/nav.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMSC | Login</title>
    <% Response.WriteFile("~/views/header.html"); %>
    <uc:Nav id="Nav" runat="server" />
</head>
<body>    
    <form id="form1" runat="server">
    <div class="container padding-top-20">
        <h3>Log In</h3>
        <div class="row">
            <div class="col-md-4">
                <div class="padding-top-20" id="statusDiv" runat="server" visible="false">
                    <div class="alert alert-danger" role="alert">
                        <asp:Label ID="status" runat="server" Text="Invalid credentials"></asp:Label>
                    </div>
                </div>
                <fieldset class="form-group">
                    <label>Email address</label>
                    <asp:TextBox type="text" ID="email" runat="server" class="form-control input-sm" placeholder="Enter email"></asp:TextBox>
                </fieldset>
                <fieldset class="form-group">
                    <label for="password">Password</label>
                    <asp:TextBox TextMode="Password" type="text" ID="password" runat="server" class="form-control input-sm" placeholder="Enter password"></asp:TextBox>
                </fieldset>
                <button type="submit" class="btn btn-primary-outline">Login</button>
                or
                <a href="Register.aspx" class="pull-right">Sign Up</a>
            </div>
        </div>                
    </div>
    </form>
</body>
</html>
