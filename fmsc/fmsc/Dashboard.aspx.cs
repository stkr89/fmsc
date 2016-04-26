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
        public string groupedDonations = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["user"];

            if(user == null)
            {
                Response.Redirect("Login.aspx");
            }

            DefaultDao defaultDao = new DefaultDao();

            allDonations = convertToJson(defaultDao.getDonations());
            groupedDonations = convertToJson(defaultDao.getGroupedDonations());
        }

        private string convertToJson(List<GroupedDonation> list)
        {
            JavaScriptSerializer jss = new JavaScriptSerializer();

            return jss.Serialize(list);
        }

        private string convertToJson(List<UserDonation> list)
        {
            JavaScriptSerializer jss = new JavaScriptSerializer();

            return jss.Serialize(list);
        }
    }
}