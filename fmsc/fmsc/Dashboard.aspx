<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="fmsc.Dashboard" %>
<%@ Register TagPrefix="uc" TagName="Nav" Src="~/nav.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMSC | Dashboard</title>
    <% Response.WriteFile("~/views/header.html"); %>
    <uc:Nav id="Nav" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    hello
    </div>
    </form>
</body>
</html>
