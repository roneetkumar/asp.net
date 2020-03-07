using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MidExam.DataAccess
{
    public class UtilityDB
    {
        public static SqlConnection ConnDB()
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            conn.Open();
            return conn;

        }
    }
}