using fmsc.Model;
using fmsc.src;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace fmsc.DAO
{
    public class LoginDao
    {
        public User register(User user)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            con.Open();

            string SQLString = "INSERT INTO Register_FMSC (First_Name, Last_Name, Email, Password, Mobile, Address1, Address2, "+
            "Country, State, City, Zip) VALUES "+
            "('" + user.firstName + "', '" + user.lastName + "', '" + user.email+ "', '"+user.password+"', '"+user.mobile+"', "+
            "'"+user.address1+"', '"+user.address2+"', '"+user.country+"', '"+user.state+"', '"+user.city+"', '"+user.zip+"')";
            SqlCommand sqlCommand = new SqlCommand(SQLString, con);
            sqlCommand.ExecuteNonQuery();

            con.Close();

            return user;
        }

        internal User login(string email, string password)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            con.Open();
            string SQLString = "SELECT * FROM Register_FMSC WHERE email = '"+email+"' AND password = '"+password+"'";
            SqlCommand checkIDTable = new SqlCommand(SQLString, con);
            SqlDataReader records = checkIDTable.ExecuteReader();

            if (records.HasRows)
            {
                User user = null;
                while (records.Read())
                {
                    user = new User(records.GetString(1), records.GetString(2), records.GetString(3),
                    records.GetString(4), records.GetString(5), records.GetString(6), records.GetString(7), records.GetString(8),
                    records.GetString(9), records.GetString(10), records.GetString(11), records.GetString(12));
                }
                records.Close();
                return user;
            }
            else
            {
                records.Close();
                return null;
            }
        }

        public User update(User user)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

            con.Open();
            string SQLString = "UPDATE Register_FMSC SET First_Name = '"+ user.firstName + "' , Last_Name = '"+user.lastName+"', " +
                               "Email='"+user.email+"', Password='"+user.password+"', Mobile='"+user.mobile+"', "+
                               "Address1='"+user.address1+"', Address2='"+user.address2+"', " +
                               "Country='"+user.country+"', State='"+user.state+"', City='"+user.city+"' where Email = '"+user.email+"'";

            SqlCommand cmd = new SqlCommand(SQLString, con);

            cmd.ExecuteNonQuery();

            con.Close();

            return user;
        }

        public int sendPassword(String email)
        {
            //SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            string username = string.Empty;
            string password = string.Empty;

            string constr = "Data Source=itksqlexp8;Integrated Security=true; Database =sktokka_ConservationSchool ";
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT email, password FROM Register_FMSC WHERE email = @emailID"))
                {
                    cmd.Parameters.AddWithValue("@emailID", email.Trim());
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.Read())
                        {
                            username = sdr["email"].ToString();
                            password = sdr["password"].ToString();
                        }
                    }
                    con.Close();
                }
            }
            if (!string.IsNullOrEmpty(password))
            {
                System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
                mailMessage.To.Add(email);
                mailMessage.From = new MailAddress("pshriva@ilstu.edu");
                mailMessage.Subject = "Password Recovery";
                //mailMessage.Body = "hi";
                //mailMessage.Body = string.Format("Hi {0},<br /><br />Your password is {1}.<br /><br />Thank You.<br />", username, password);

                mailMessage.Body = string.Format("Hi {0},<br /><br />Your password is {1}.<br /><br />Thank You.<br /><br /> <img src=cid:myImageID width=\"80\" height=\"80\">", username, password);
                mailMessage.IsBodyHtml = true;
                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(mailMessage.Body, null, "text/html");
                //Add Image
                LinkedResource theEmailImage = new LinkedResource(HttpContext.Current.Server.MapPath(".") + @"\FMSCLOGO.jpg", "image/jpg");
                theEmailImage.ContentId = "myImageID";


                //Add the Image to the Alternate view
                htmlView.LinkedResources.Add(theEmailImage);

                //Add view to the Email Message
                mailMessage.AlternateViews.Add(htmlView);
                SmtpClient smtpClient;
                try
                {
                    smtpClient = new SmtpClient();
                    smtpClient.Send(mailMessage);
                }
                catch (Exception exx)
                {
                    System.Diagnostics.Debug.WriteLine("error" + exx.Message);
                }
                // SmtpClient smtpClient = new SmtpClient("smtp.ilstu.edu");
                //smtpClient.Send(mailMessage);
                // smtp.Send(mm);
                //lblMessage.ForeColor = Color.Green;
                //lblMessage.Text = "Password has been sent to your email address.";
                return 1;
            }
            else
            {
                //lblMessage.ForeColor = Color.Red;
                //lblMessage.Text = "This email address does not match our records.";
                return 0;
            }
        }
    }
}