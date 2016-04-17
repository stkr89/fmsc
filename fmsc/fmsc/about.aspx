<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="fmsc.about" %>
<%@ Register TagPrefix="uc" TagName="Nav" Src="~/nav.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <% Response.WriteFile("~/views/header.html"); %>
    <uc:Nav id="Nav" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div id="carousel-example-generic" class="carousel slide marginn-top-20" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" role="listbox">
    <div class="carousel-item active">
      <img data-src="images/c2.jpg" src="images/c2.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img data-src="images/c3.jpg" src="images/c3.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img data-src="images/c4.jpg" src="images/c4.jpg" alt="Third slide">
    </div>
  </div>
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="icon-prev" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="icon-next" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
        <h1 class="marginn-top-20">About Us:</h1>
       
       

        <p>Feed My Starving Children® is a non-benefit Christian Organization  that is  focused on 
            providing  food  to  God's youngsters hungry in body and soul. The approach  is straightforward and simple:
             kids and grown-ups hand-pack food  particularly prepared  for malnourished kids, and we deliver
             these suppers to our appropriation accomplices. FMSC suppers have come to about 70 nations around
             the globe in our history. Take in more about how you can get to be included.</p>
    </div>
    </form>
</body>
</html>
