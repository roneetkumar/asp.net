using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ReviewExersice.Business;
using System.Web.UI;
using System.Data.SqlClient;

namespace ReviewExersice.DataAccess
{
    public class UserDB
    {
        public static User VerifyUser(User user)
        {
            //Connect database
            SqlConnection conn = UtilityDB.ConnectDB();

            // create and customize an SqlCommand object 
            SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE UserID = @UserID AND Password = @Password AND Status = @Status",conn);

            cmd.Parameters.AddWithValue("@UserID", user.UserID);
            cmd.Parameters.AddWithValue("@Password", user.Password);
            cmd.Parameters.AddWithValue("@Status", "A");
          
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    user.FirstName = reader["FirstName"].ToString();
                    user.LastName = reader["LastName"].ToString();
                    user.Status = reader["Status"].ToString().Trim();
                }
            }
            else
            {
                user = null;
            }

            conn.Close();
            return user;
        }
    }
}