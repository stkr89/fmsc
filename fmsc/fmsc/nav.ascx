<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="nav.ascx.cs" Inherits="fmsc.header1" %>


    <div class="container">
    <h3>Feed My Starving Children</h3>
    <nav class="navbar navbar-light bg-faded">
        <ul class="nav navbar-nav">
            <li class="nav-item" runat="server" id="liHome">
                <asp:HyperLink ID="home" class="nav-link" NavigateUrl="~/Default.aspx" runat="server">Home</asp:HyperLink>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../Donate.aspx">Donate</a>
            </li>
            <li class="nav-item">
                <asp:HyperLink ID="dashboard" class="nav-link" NavigateUrl="~/Login.aspx" runat="server" Visible="true">Dashboard</asp:HyperLink>
            </li>
        </ul>
        <div class="form-inline pull-xs-right">
            <asp:HyperLink ID="login" class="btn btn-success-outline btn-sm" NavigateUrl="~/Login.aspx" runat="server" Visible="false">Login</asp:HyperLink>
            <asp:HyperLink ID="logout" class="btn btn-success-outline btn-sm" NavigateUrl="~/Logout.aspx" runat="server" Visible="false">Logout</asp:HyperLink>           
        </div>
        
    </nav>
</div>