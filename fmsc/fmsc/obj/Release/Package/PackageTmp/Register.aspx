<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="fmsc.Register" %>
<%@ Register TagPrefix="uc" TagName="Nav" Src="~/nav.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMSC | Register</title>
    <% Response.WriteFile("~/views/header.html"); %>
    <uc:Nav id="Nav" runat="server" />
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places&language=en"></script>
</head>
<body>
    <form id="form1" runat="server" method="post" action="Register.aspx"> 
    <div class="container padding-top-20">
        <h3>Register</h3>
        <div class="row">
            <div class="col-md-8 row">
                <fieldset class="form-group col-md-6">
                    <label for="fName">First Name</label>
                    <asp:TextBox required type="text" ID="fName" runat="server" class="form-control form-control-sm" placeholder="Enter first name"></asp:TextBox>
                </fieldset>
                <fieldset class="form-group col-md-6">
                    <label for="lName">Last Name</label>
                    <asp:TextBox required type="text" ID="lName" runat="server" class="form-control form-control-sm" placeholder="Enter last name"></asp:TextBox>
                </fieldset>
                <fieldset class="form-group  col-md-12">
                    <label for="email">Email</label>
                    <asp:TextBox required type="email" ID="email" runat="server" class="form-control form-control-sm" placeholder="Enter email"></asp:TextBox>
                </fieldset>
                <fieldset class="form-group col-md-6">
                    <label for="password">Password</label>
                    <asp:TextBox required type="password" ID="password" runat="server" class="form-control form-control-sm" placeholder="Enter password"></asp:TextBox>
                </fieldset>
                <fieldset class="form-group col-md-6">
                    <label for="confirmPassword">Confirm Password</label>
                    <asp:TextBox required type="password" ID="confirmPassword" runat="server" class="form-control form-control-sm" placeholder="Confirm password"></asp:TextBox>
                </fieldset>
                <fieldset class="form-group col-md-12">
                    <label for="mobile">Mobile</label>
                    <asp:TextBox required type="text" ID="mobile" runat="server" class="form-control form-control-sm" placeholder="Enter mobile number"></asp:TextBox>
                </fieldset>
                <fieldset class="form-group col-md-6">
                    <label for="address1">Address 1</label>
                    <asp:TextBox required type="text" ID="address1" runat="server" class="form-control form-control-sm" placeholder="Enter address1"></asp:TextBox>
                </fieldset>
                <fieldset class="form-group col-md-6">
                    <label for="address2">Address 2</label>
                    <asp:TextBox required type="text" ID="address2" runat="server" class="form-control form-control-sm" placeholder="Enter address2"></asp:TextBox>
                </fieldset>
                <%--<fieldset class="form-group col-md-6">
                    <label for="country">Country</label>
                    <asp:TextBox type="text" ID="country" runat="server" class="form-control input-sm" placeholder="Enter country"></asp:TextBox>
                </fieldset>                
                <fieldset class="form-group col-md-6">
                    <label for="state">State</label>
                    <asp:TextBox type="text" ID="state" runat="server" class="form-control input-sm" placeholder="Enter state"></asp:TextBox>
                </fieldset>--%>     
                <fieldset class="form-group col-md-6">
                    <label for="city">Location</label>
                    <asp:TextBox required type="text" ID="location" runat="server" class="form-control form-control-sm" placeholder="Enter city"></asp:TextBox>
                </fieldset>           
                <fieldset class="form-group col-md-6">
                    <label for="zip">Zip</label>
                    <asp:TextBox required type="text" ID="zip" runat="server" class="form-control form-control-sm" placeholder="Enter zip"></asp:TextBox>
                </fieldset>
                <div class="col-md-12"><button type="submit" class="btn-sm btn btn-primary-outline">Register</button></div>
            </div>
        </div>                
    </div>
    </form>
</body>
<script>
    $(function () {
        var input = document.getElementById('location');
        var autocomplete = new google.maps.places.Autocomplete(input);
    });
</script>
</html>
