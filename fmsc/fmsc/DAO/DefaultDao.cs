using fmsc.Model;
using fmsc.src;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
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
    }
}