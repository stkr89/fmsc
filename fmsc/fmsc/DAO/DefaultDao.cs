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
        public List<Donation> getDonations()
        {
            SqlConnection con = DBConfig.getConnection();

            string SQLString = "SELECT * FROM Donate";
            SqlCommand checkIDTable = new SqlCommand(SQLString, con);
            SqlDataReader records = checkIDTable.ExecuteReader();

            if (records.HasRows)
            {
                List<Donation> donations = new List<Donation>();
                while(records.Read())
                {
                    Donation donation = new Donation(records.GetString(3), Convert.ToDouble(records.GetDecimal(1)), Convert.ToDateTime(records.GetString(2)));
                    donations.Add(donation);
                }
                records.Close();
                return donations;
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