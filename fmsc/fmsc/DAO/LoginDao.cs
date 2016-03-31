using fmsc.Model;
using fmsc.src;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace fmsc.DAO
{
    public class LoginDao
    {
        public User register(User user)
        {
            SqlConnection con = DBConfig.getConnection();

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
            SqlConnection con = DBConfig.getConnection();
            
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
    }
}