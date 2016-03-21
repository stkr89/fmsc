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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                User user = new User(fName.Text, lName.Text, email.Text, password.Text, mobile.Text, address1.Text, address2.Text,
                                     country.Text, state.Text, city.Text, zip.Text);

                user = new LoginDao().register(user);


            }
        }
    }
}