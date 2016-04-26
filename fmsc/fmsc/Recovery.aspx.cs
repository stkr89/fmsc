using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mail;
using System.Net.Mail;
using System.Net.Mime;
using System.Data.SqlClient;
using System.Drawing;
using System.Net;
using fmsc.DAO;

namespace fmsc
{
    public partial class Recovery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                LoginDao loginDao = new LoginDao();
                loginDao.sendPassword(email.Text);
            }
        }
    }
}