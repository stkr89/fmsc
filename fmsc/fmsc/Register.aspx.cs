using fmsc.DAO;
using fmsc.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fmsc
{
    public partial class Register : System.Web.UI.Page
    {
        private string operation = "REGISTER";
        public string user = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            User sessionUser = (User) Session["user"];

            if(sessionUser != null)
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                user = serializer.Serialize(sessionUser);

                email.Text = sessionUser.email;
                email.ReadOnly = true;

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

                string role = "";

                if(sessionUser != null)
                {
                    role = sessionUser.email.Equals("sumit.tokkar@gmail.com") ? "ADMIN" : "VISITOR";
                }
                else
                {
                    role = "VISITOR";
                }

                User user = new User(fName.Text, lName.Text, email.Text, password.Text, mobile.Text, address1.Text, address2.Text,
                                     country, state, city, zip.Text, role);

                if (operation == "REGISTER")
                {
                    user = new LoginDao().register(user);
                    //Session["user"] = user;
                    Response.Redirect("Login.aspx");
                }
                else if (operation == "UPDATE")
                {
                    user = new LoginDao().update(user);
                    //Session["user"] = user;
                    //Response.Redirect("Default.aspx");
                    Response.Redirect("Logout.aspx");
                }
            }
        }
    }
}