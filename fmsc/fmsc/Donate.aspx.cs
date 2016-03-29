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
            statusDiv.Visible = false;

            if(IsPostBack)
            {
                Donation donation = new Donation(1, "sumit.tokkar@gmail.com", Convert.ToDouble(Request.Form["amount"]), new DateTime());

                DonationDao donationDao = new DonationDao();
                donation = donationDao.donate(donation);

                status.Text = "Successfully donated $ "+donation.amount+".";
                statusDiv.Visible = true;
            }
        }
    }
}