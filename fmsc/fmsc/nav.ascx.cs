using fmsc.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fmsc
{
    public partial class header1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["user"];

            if (user != null)
            {
                logout.Visible = true;
            } else
            {
                login.Visible = true;
            }
        }
    }
}