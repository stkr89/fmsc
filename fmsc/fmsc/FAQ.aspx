<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="fmsc.FAQ" %>
<%@ Register TagPrefix="uc" TagName="Nav" Src="~/nav.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMSC | FAQ</title>
    <% Response.WriteFile("~/views/header.html"); %>
    <uc:Nav id="Nav" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <p class="padding-top-20">
            <strong>Q1. What is FMSC?</strong><br>
            Founded in 1987, Feed My Starving Children (FMSC) is a Christian non-profit organization committed to feeding God's children hungry in body and spirit. The approach is simple, volunteers hand-pack meals specially formulated for malnourished children, and we send them to partners around the world where they're used to operate orphanages, schools, clinics and feeding programs to break the cycle of poverty. FMSC food has reached nearly 70 countries in our history.
        </p>
        <p class="padding-top-20">
            <strong>Q2. What is the Vision of FMSC?</strong><br>
            With God’s help, Feed My Starving Children (FMSC) will strive to eliminate starvation in children throughout the world by helping to instill compassion in people to hear and respond to the cries of those in need.
Their Mission Statement:
Feeding God’s Starving Children Hungry in Body and Spirit
        </p>
        <p class="padding-top-20">
            <strong>Q3. How does FMSC determines who receives the food? </strong><br>
            We receive food aid applications daily. The distribution committee meets and reviews each application, evaluating them in several different categories, including physical condition of the children, percentage of children vs. adults served, other food available, the type of feeding program and the ability to receive and store the food safely. At the end of the discussion, the committee prays for God’s guidance and then rates each application. Food is allocated based on the rating each application receives.
        </p>
        <p class="padding-top-20">
            <strong>Q4. Where does FMSC send the food? </strong><br>
            We have sent food to nearly 70 countries in our history including Haiti, Sudan, Jamaica, Bolivia, Dominican Republic, Tanzania, Lesotho, Liberia, Ghana, Guatemala, Malawi, Cambodia, Nicaragua, Sri Lanka, India, Indonesia, Cameroon, Niger, Colombia, and El Salvador, and to Hurricane Katrina victims in Louisiana, Mississippi and many more. 
        </p>
        <p class="padding-top-20">
            <strong>Q5. Does FMSC feed children in United States?</strong><br>
            Feed My Starving Children (FMSC) targets feeding programs to children who are in the most severe circumstances, those suffering from severe malnutrition and threatened with death from starvation. The United States does not have that level of hunger on a widespread basis. In the past we have supplied food to an Indian reservation in South Dakota and to those affected by Hurricane Katrina.
        </p>
        <p class="padding-top-20">
            <strong>Q6. Does FMSC sell the food?</strong><br>
            No. All of our food is donated to the recipients. We do ask that the partnering (or recipient) organization pay for the shipping charges.
        </p>
    </div>
    </form>
</body>
</html>
