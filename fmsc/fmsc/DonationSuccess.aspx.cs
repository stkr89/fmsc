using fmsc.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fmsc
{
    public partial class DonationSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Double amount = Convert.ToDouble(Session["currentDonation"]);                        

            status.Text = "Successfully donated $" + amount;

            User user = (User)Session["user"];
        }
    }
}