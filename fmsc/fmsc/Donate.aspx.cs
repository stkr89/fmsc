using fmsc.DAO;
using fmsc.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fmsc
{
    public partial class Donate : System.Web.UI.Page
    {

        public string userId;

        protected void Page_Load(object sender, EventArgs e)
        {
            //pshiva@ilstu.edu
            //pshiva@54321

            User user = (User)Session["user"];

            string displayName = Request.QueryString["displayName"];
            string id = Request.QueryString["id"];
            string amount = Request.QueryString["amount"];

            if(user == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                userId = user.email;
            }
            if (displayName != null)
            {
                form1.Visible = false;
                submitDonation(displayName, id, amount);
                Session["currentDonation"] = amount;
                Response.Redirect("DonationSuccess.aspx");
            }
        }

        private void submitDonation(string displayName, string id, string amount)
        {
            Donation donation = new Donation(id, Convert.ToDouble(amount), DateTime.Now, displayName);

            DonationDao donationDao = new DonationDao();
            donation = donationDao.donate(donation);
        }
    }
}