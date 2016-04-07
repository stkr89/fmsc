using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace fmsc.src
{
    public class DBConfig
    {
        private static SqlConnection con;

        DBConfig()
        {
            con = new SqlConnection("Data Source=itksqlexp8;Integrated Security=true"); //new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        }

        public static SqlConnection getConnection()
        {
            if(con == null)
            {
                con = new SqlConnection("Data Source=itksqlexp8;Integrated Security=true");
                con.Open();
                try
                {                    
                    con.ChangeDatabase("sktokka_ConservationSchool");

                }
                catch (Exception exception)
                {
                    SqlCommand sqlCommand = new SqlCommand("CREATE DATABASE sktokka_ConservationSchool", con);
                    sqlCommand.ExecuteNonQuery();
                    con.ChangeDatabase("sktokka_ConservationSchool");
                }
                finally
                {
                    Console.Write("Successfully selected the database");
                }
            }

            con = new SqlConnection("Data Source=itksqlexp8;Integrated Security=true");

            return con;
        }
    }
}