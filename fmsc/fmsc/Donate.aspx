<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Donate.aspx.cs" Inherits="fmsc.Donate" %>
<%@ Register TagPrefix="uc" TagName="Nav" Src="~/nav.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMSC | Donate</title>    
    <% Response.WriteFile("~/views/header.html"); %>
    <script src="js/donate.js"></script>
    <uc:Nav id="Nav" runat="server" />
</head>
<body ng-cloak ng-app="DonateModule", ng-controller="DonateController">
    <form id="form1" runat="server" action="Donate.aspx">
    <div class="container padding-top-20">
        <h3>Donate</h3>
        <div class="row">
            <div class="col-md-8 row">
                <fieldset class="form-group col-md-3">
                    <label for="fName">Amount</label>
                    <asp:TextBox ng-model="amount" type="text" ID="amount" runat="server" class="form-control form-control-sm" placeholder="Enter amount"></asp:TextBox>
                </fieldset> 
                <div class="col-md-9" style="padding-top: 35px">
                    <h3 ng-show="amount">
                        is equivalent to {{amount/0.22 | number:2}} meals
                    </h3>
                </div>                          
                <div class="col-md-12"><button type="submit" class="btn btn-primary-outline btn-sm">Donate</button></div>
                <div class="col-md-12 padding-top-20" id="statusDiv" runat="server" visible="false">
                    <div class="alert alert-success" role="alert">
                        <asp:Label ID="status" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
