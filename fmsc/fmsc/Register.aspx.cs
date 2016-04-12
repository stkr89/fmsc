using fmsc.DAO;
using fmsc.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fmsc
{
    public partial class Register : System.Web.UI.Page
    {
        private string operation = "REGISTER";

        protected void Page_Load(object sender, EventArgs e)
        {
            User sessionUser = (User) Session["user"];

            if(sessionUser != null)
            {
                fName.Text = sessionUser.firstName;
                lName.Text = sessionUser.lastName;
                email.Text = sessionUser.email;
                email.ReadOnly = true;
                password.Text = sessionUser.password;
                mobile.Text = sessionUser.mobile;
                address1.Text = sessionUser.address1;
                address2.Text = sessionUser.address2;
                location.Text = sessionUser.city + ", " + sessionUser.state + ", " + sessionUser.country;
                zip.Text = sessionUser.zip;

                operation = "UPDATE";
            }

            if(IsPostBack)
            {
                string location = Request.Form["location"];
                string[] parts = location.Split(new string[] { ", " }, StringSplitOptions.None);

                string city = "", state = "", country = "";

                if(parts.Length == 3 )
                {
                    country = parts[2];
                    state = parts[1];
                    city = parts[0];
                } else if(parts.Length == 2)
                {
                    city = parts[0];
                    country = parts[1];
                } else if(parts.Length == 1)
                {
                    country = parts[0];
                }

                User user = new User(fName.Text, lName.Text, email.Text, password.Text, mobile.Text, address1.Text, address2.Text,
                                     country, state, city, zip.Text, "VISITOR");

                if (operation == "REGISTER")
                {
                    user = new LoginDao().register(user);
                    Response.Redirect("Login.aspx");
                }
                else if (operation == "UPDATE")
                {
                    user = new LoginDao().update(user);
                    Response.Redirect("Default.aspx");
                }
            }
        }
    }
}