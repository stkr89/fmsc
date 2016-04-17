using fmsc.DAO;
using fmsc.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fmsc
{
    public partial class Donate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["user"];

            if(user == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (IsPostBack)
            {
                Donation donation = new Donation(user.email, Convert.ToDouble(Request.Form["amount"]), DateTime.Now, Request.Form["displayName"]);

                DonationDao donationDao = new DonationDao();
                donation = donationDao.donate(donation);

                status.Text = "Successfully donated $ "+donation.amount+".";
                statusDiv.Visible = true;
            }
        }
    }
}