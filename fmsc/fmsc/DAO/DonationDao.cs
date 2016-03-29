using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using fmsc.Model;
using fmsc.src;
using System.Data.SqlClient;

namespace fmsc.DAO
{
    public class DonationDao
    {
        public Donation donate(Donation donation)
        {
            SqlConnection con = DBConfig.getConnection();

            try
            {
                string SQLString = "INSERT INTO Donate(amount, date, userId) VALUES ('"+donation.amount+"', '"+donation.date+"', '"+donation.userId+"')";
                SqlCommand sqlCommand = new SqlCommand(SQLString, con);
                sqlCommand.ExecuteNonQuery();

                return donation;
            }
            catch (Exception exception) {
                return null;
            }
        }
    }
}