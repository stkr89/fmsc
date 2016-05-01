using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using fmsc.Model;
using fmsc.src;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net.Mime;

namespace fmsc.DAO
{
    public class DonationDao
    {
        public Donation donate(Donation donation)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

            con.Open();

            try
            {
                string SQLString = "INSERT INTO Donate(amount, date, userId, displayName) VALUES "+
                                   "("+donation.amount+", '"+donation.date+"', '"+donation.userId+"', '"+donation.displayName+"')";
                SqlCommand sqlCommand = new SqlCommand(SQLString, con);
                sqlCommand.ExecuteNonQuery();

                sendReceipt(donation);              

                return donation;
            }
            catch (Exception exception) {
                return null;
            }
        }

        private void sendReceipt(Donation donation)
        {
            string message = "<img src=\"cid:imageId\" height=\"90\" width=\"80\">";
            MailAddress messageFrom = new MailAddress("pshriva@ilstu.edu", "Pushpjeet");
            MailMessage emailMessage = new MailMessage();
            emailMessage.From = messageFrom;
            MailAddress messageTo = new MailAddress(donation.userId);
            emailMessage.To.Add(messageTo.Address);
            emailMessage.Subject = "Thank you for Donating to FMSC";
            emailMessage.Body = "<HTML><BODY><br>Greetings,<p> On Behalf of Feed My Starving Children we would like to thank you for your contribution of  $" + donation.amount + "<p> Your Financial support helps us to continue our mission and assists to help our community</p>.<br><br>Thanks and best regards,</p>" + message + "  </body></html>";


            AlternateView htmlView = AlternateView.CreateAlternateViewFromString(emailMessage.Body, null, "text/html");
            LinkedResource imagelink = new LinkedResource(HttpContext.Current.Server.MapPath(".") + @"\FMSCLOGO.jpg", "image/jpg");
            imagelink.ContentId = "imageId";
            imagelink.TransferEncoding = System.Net.Mime.TransferEncoding.Base64;
            htmlView.LinkedResources.Add(imagelink);
            emailMessage.AlternateViews.Add(htmlView);



            SmtpClient mailClient = new SmtpClient();
            emailMessage.IsBodyHtml = true;

            mailClient.UseDefaultCredentials = true;// false;
            mailClient.Send(emailMessage);
        }
    }
}