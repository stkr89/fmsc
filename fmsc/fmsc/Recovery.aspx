<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recovery.aspx.cs" Inherits="fmsc.Recovery" %>
<%@ Register TagPrefix="uc" TagName="Nav" Src="~/nav.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMSC | Login</title>
    <% Response.WriteFile("~/views/header.html"); %>
    <uc:Nav id="Nav" runat="server" />
</head>
<body>
    <form id="form1" runat="server" method="post" action="Recovery.aspx">
    <div class="container padding-top-20">
      <div class="row">
            <div class="col-md-4">
                <fieldset class="form-group">
                    <label>Email address</label>
                    <asp:TextBox required type="text" ID="email" runat="server" class="form-control form-control-sm" placeholder="Enter email"></asp:TextBox>
                </fieldset>
                <button type="submit" class="btn btn-primary-outline btn-sm">Send</button>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
