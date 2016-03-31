using fmsc.DAO;
using fmsc.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fmsc
{
    public partial class Dashboard : System.Web.UI.Page
    {

        public string allDonations = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["user"];

            if(user == null)
            {
                Response.Redirect("Login.aspx");
            }

            allDonations = convertToJson(new DefaultDao().getDonations());
        }

        private string convertToJson(List<UserDonation> list)
        {
            JavaScriptSerializer jss = new JavaScriptSerializer();

            return jss.Serialize(list);
        }
    }
}