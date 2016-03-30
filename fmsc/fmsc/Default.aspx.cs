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
using System.Text;

namespace fmsc
{
    public partial class Default : System.Web.UI.Page
    {
        public string allDonations = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            allDonations = convertToJson(new DefaultDao().getDonations());

            if (IsPostBack)
            {
                string s = search.Text;
                string p = param.SelectedValue;

                List<User> searchResults = new DefaultDao().search(s, p);

                StringBuilder table = new StringBuilder();

                table.Append("<table class='table'><thead><th>User Id</th><th>First Name</th>");
                table.Append("<th>Last Name</th><th>Password</th><th>Email</th>");
                table.Append("<th>Question</th><th>Answer</th></thead>");

                try
                {
                    for (int i = 0; i < searchResults.Count; i++)
                    {
                        table.Append("<tr>");
                        table.Append("<td>" + searchResults[i].firstName + "</td>");
                        table.Append("<td>" + searchResults[i].lastName + "</td>");
                        table.Append("<td>" + searchResults[i].password + "</td>");
                        table.Append("<td>" + searchResults[i].email + "</td>");
                        table.Append("</tr>");
                    }
                }
                catch (Exception exception) { }

                table.Append("</table>");
                PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });
            }
        }

        private string convertToJson(List<Donation> list)
        {
            JavaScriptSerializer jss = new JavaScriptSerializer();

            return jss.Serialize(list);
        }
    }
}