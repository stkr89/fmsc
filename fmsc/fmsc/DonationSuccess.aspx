<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DonationSuccess.aspx.cs" Inherits="fmsc.DonationSuccess" %>
<%@ Register TagPrefix="uc" TagName="Nav" Src="~/nav.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMSC | Donation Successfull</title>
    <% Response.WriteFile("~/views/header.html"); %>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-resource.js"></script>
    <uc:Nav id="Nav" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h2 class="padding-top-20">Thank you!</h2>
        <div class="padding-top-20 alert alert-success" role="alert">
            <asp:Label ID="status" runat="server" Text=""></asp:Label>
        </div>
        <div id="fb-root"></div>
        <script>(function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6&appId=242607472761038";
          fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
        <div class="fb-share-button" data-href="http://fmsc.org/home" 
            data-layout="button_count" data-mobile-iframe="true">
        </div>
    </div>
    </form>
</body>
</html>
