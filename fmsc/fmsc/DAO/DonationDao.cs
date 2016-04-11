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
                string SQLString = "INSERT INTO Donate(amount, date, userId) VALUES ("+donation.amount+", '"+donation.date+"', '"+donation.userId+"')";
                SqlCommand sqlCommand = new SqlCommand(SQLString, con);
                sqlCommand.ExecuteNonQuery();

                //sendReceipt(donation);              

                return donation;
            }
            catch (Exception exception) {
                return null;
            }
        }

        private void sendReceipt(Donation donation)
        {
            MailAddress messageFrom = new MailAddress("pshriva@ilstu.edu", "Pushpjeet");
            MailMessage emailMessage = new MailMessage();
            emailMessage.From = messageFrom;
            MailAddress messageTo = new MailAddress(donation.userId);
            emailMessage.To.Add(messageTo.Address);
            emailMessage.Subject = "Welcome to Assignment 4 Sample App";
            //emailMessage.Body = "Your registration was successfull.";
            SmtpClient mailClient = new SmtpClient();
            AlternateView av = AlternateView.CreateAlternateViewFromString(
            "<html><body>Thank you for donating $ "+donation.amount+"</body></html>",
            null, MediaTypeNames.Text.Html);

            emailMessage.AlternateViews.Add(av);
            emailMessage.IsBodyHtml = true;

            mailClient.UseDefaultCredentials = true;// false;
            mailClient.Send(emailMessage);
        }
    }
}