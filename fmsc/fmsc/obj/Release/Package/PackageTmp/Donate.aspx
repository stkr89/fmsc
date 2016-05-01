<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Donate.aspx.cs" Inherits="fmsc.Donate" %>
<%@ Register TagPrefix="uc" TagName="Nav" Src="~/nav.ascx" %>
<%@ Register TagPrefix="CuteWebUI" Namespace="CuteWebUI" Assembly="CuteWebUI.AjaxUploader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMSC | Donate</title>    
    <% Response.WriteFile("~/views/header.html"); %>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-resource.js"></script>
    <script src="js_resources/donate.js"></script>
    <uc:Nav id="Nav" runat="server" />
    
<script type="text/javascript">
<!--
var userId = '<%= userId %>';

function mindonation(form,minprice)
{
  var price=form.amount.value;
  price=price.trim();
  price=price.replace(",",".");
  if ((isNaN(parseFloat(price))) || (!isFinite(price)))
  {
    alert ( "Please enter a valid amount of at least "+minprice);
    form.amount.focus();
    return(false);
  }
  if (price<minprice)
  {
    alert ( "Please enter a minimum donation of "+minprice);
    form.amount.focus();
    return(false);
  }
  price=Number(price);
  var currency=form.currency_code.value;
  if ((currency=="JPY") || (currency=="HUF") || (currency=="TWD"))
   form.amount.value=price.toFixed(0);
  else  
      form.amount.value = price.toFixed(2);
  return(true);
}
//-->
</script>
</head>
<body ng-cloak ng-app="DonateModule", ng-controller="DonateController">
    <%--<form id="form1" runat="server" action="Donate.aspx">--%>
    <div class="container">
    <form runat="server" id="form1" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top" 
        onSubmit="return mindonation(this,2.2)">
    <div class="container padding-top-20">
        <h3>Donate</h3>
        <div class="row">
            <div class="col-md-8 row">
                <fieldset class="form-group col-md-3">
                    <label>Display Name</label>
                    <asp:TextBox ng-model="displayName" type="text" ID="displayName" runat="server" required ng-keyup="checkProfanity()"
                        class="form-control form-control-sm" placeholder="Enter display name"></asp:TextBox>
                </fieldset>
                <div class="col-lg-12"></div>
                <div class="col-lg-12"></div>
                <fieldset class="form-group col-md-3">
                    <label>Amount</label>
                    <asp:TextBox name="amount" ng-model="amount" type="number" ID="amount" runat="server"
                        class="form-control form-control-sm" placeholder="Enter amount"></asp:TextBox>
                </fieldset> 
                <div class="col-md-9" style="padding-top: 35px">
                    <h3 ng-show="amount">
                        is equivalent to {{amount/0.22 | number:0}} meals
                    </h3>
                </div>                          
                <div class="col-md-12">
                    <%--<button type="submit" class="btn btn-primary-outline btn-sm">Donate</button>--%>
                    <input type="hidden" name="cmd" value="_donations">
                    <input type="hidden" name="business" value="sktokka@ilstu.edu">
                    <input type="hidden" name="lc" value="US">
                    <input type="hidden" name="item_name" value="Feed My Starving Children">
                    <input type="hidden" name="no_note" value="0">
                    <input type="hidden" name="currency_code" value="USD">
                    <input type="hidden" name="return" value="http://iis.it.ilstu.edu/368spr16/it3680113/App7/Donate.aspx?displayName={{displayName}}&id={{userId}}&amount={{amount}}">
                    <input type="hidden" name="cancel_return" value="http://iis.it.ilstu.edu/368spr16/it3680113/App7/Donate.aspx">
                    <input type="hidden" name="bn" value="PP-DonationsBF:btn_donateCC_LG.gif:NonHostedGuest">
                    <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                    <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
                </div>                
            </div>
        </div>
    </div>
    <%--</form>--%>
    </form>
    </div>

</body>
</html>
