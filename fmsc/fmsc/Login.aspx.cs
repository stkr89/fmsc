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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                User user = new LoginDao().login(Request.Form["email"], Request.Form["password"]);

                if (user != null)
                {
                    Session["user"] = user;
                    Response.Redirect("Donate.aspx");
                }
                else
                {
                    statusDiv.Visible = true;
                }
            }
        }
    }
}