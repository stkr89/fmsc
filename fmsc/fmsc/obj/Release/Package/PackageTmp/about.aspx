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
        <h3 class="marginn-top-20">About FMSC:</h3>
        <p>Feed My Starving Children® is a non-benefit Christian Organization  that is  focused on 
            providing  food  to  God's youngsters hungry in body and soul. The approach  is straightforward and simple:
             kids and grown-ups hand-pack food  particularly prepared  for malnourished kids, and we deliver
             these suppers to our appropriation accomplices. FMSC suppers have come to about 70 nations around
             the globe in our history. Take in more about how you can get to be included.</p>
        <h3 class="marginn-top-20">About the team:</h3>
        <p>
        Sumit Tokkar:  I have three and half year of experience as a software engineer and  an incisive professional with passion towards technology.
        <br><br>Pushpjeet Shrivastava : I am an IT professional with 3 years of experience. These days I am working as A DBA in Illinois State University. I have professional experience in software development life cycle, developing web forms, custom control and WCF services using ASP.Net, C#, HTML, CSS. I have worked with some major clients like Microsoft as a technical consultant in Wipro BPS and have been recognized by several achievements in my career. My colleagues know me because of quick learning ability and good decision-making skills as I resolved various issues in Wipro BPS during my tenure. I can (and often do) work well alone, but I’m at my best collaborating with others        
        <br><br>Sanjul Jain: Presently a Master’s Student at Illinois State University in Information Systems, my experience includes three and half years of work in banking and finance industry. I am currently enjoying my journey into the field of technology.</p>
    </div>
    </form>
</body>
</html>
