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

                User user = new User(fName.Text, lName.Text, email.Text, password.Text, mobile.Text, address1.Text, address2.Text,
                                     parts[2], parts[1], parts[0], zip.Text, "VISITOR");

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