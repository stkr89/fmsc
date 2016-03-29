<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Donate.aspx.cs" Inherits="fmsc.Donate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMSC | Donate</title>
    <% Response.WriteFile("~/views/header.html"); %>
    <script src="https://www.paypalobjects.com/js/external/dg.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" action="Donate.aspx">
    <div class="container padding-top-20">
        <h3>Donate</h3>
        <div class="row">
            <div class="col-md-8 row">
                <fieldset class="form-group col-md-6">
                    <label for="fName">Amount</label>
                    <asp:TextBox type="text" ID="amount" runat="server" class="form-control input-sm" placeholder="Enter amount"></asp:TextBox>
                </fieldset>       
                <div class="col-md-12"><button type="submit" class="btn btn-primary">Donate</button></div>
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
