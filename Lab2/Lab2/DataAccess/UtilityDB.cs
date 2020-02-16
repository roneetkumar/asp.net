using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace Lab1V2.DataAccess
{
    public class UtilityDB
    {
        public static SqlConnection ConnDB()
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["connectEmpDB"].ConnectionString;
            conn.Open();
            return conn;
        }
    }
}