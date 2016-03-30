using fmsc.Model;
using fmsc.src;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace fmsc.DAO
{
    public class DefaultDao
    {
        public List<UserDonation> getDonations()
        {
            SqlConnection con = DBConfig.getConnection();

            string SQLString = "SELECT R.First_Name, R.Last_Name, R.Email, R.Country, R.State, R.City, D.amount, D.date "+
                               "FROM Register_FMSC R INNER JOIN Donate D ON R.Email = D.userId; ";
            SqlCommand checkIDTable = new SqlCommand(SQLString, con);
            SqlDataReader records = checkIDTable.ExecuteReader();

            if (records.HasRows)
            {
                List<UserDonation> userDonations = new List<UserDonation>();
                while(records.Read())
                {
                    User user = new User(records.GetString(0), records.GetString(1), records.GetString(2), records.GetString(3),
                                         records.GetString(4), records.GetString(5));
                    Donation donation = new Donation(Convert.ToDouble(records.GetDecimal(6)), Convert.ToDateTime(records.GetString(7)));

                    UserDonation userDonation = new UserDonation(donation, user);
                    userDonations.Add(userDonation);
                }
                records.Close();
                return userDonations;
            }
            else
            {
                records.Close();
                return null;
            }
        }

        internal List<User> search(string s, string p)
        {
            SqlConnection con = DBConfig.getConnection();

            StringBuilder SQLString = new StringBuilder();
            if (p.Equals("all"))
            {
                SQLString.Append("SELECT * from users where userID LIKE '%" + s + "%' OR firstName LIKE '%" + s + "%' ");
                SQLString.Append("OR lastName LIKE '%" + s + "%' OR password LIKE '%" + s + "%' OR email LIKE '%" + s + "%'");
            }
            else
            {
                SQLString.Append("SELECT * from users where " + p + " LIKE '%" + s + "%'");
            }
            SqlCommand sqlCommand = new SqlCommand(SQLString.ToString(), con);
            SqlDataReader reader = sqlCommand.ExecuteReader();

            if (reader.HasRows)
            {
                List<User> results = new List<User>();
                while (reader.Read())
                {
                    
                }
                reader.Close();
                con.Close();
                return results;
            }
            else
            {
                reader.Close();
                con.Close();
                return null;
            }
        }
    }
}