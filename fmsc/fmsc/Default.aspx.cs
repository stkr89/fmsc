using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using fmsc.Model;
using fmsc.DAO;
using System.Web.Script.Serialization;

namespace fmsc
{
    public partial class Default : System.Web.UI.Page
    {
        public string allDonations = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            allDonations = convertToJson(new DefaultDao().getDonations());           
        }

        private string convertToJson(List<Donation> list)
        {
            JavaScriptSerializer jss = new JavaScriptSerializer();

            return jss.Serialize(list);
        }
    }
}