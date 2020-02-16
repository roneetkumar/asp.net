using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ReviewExersice.DataAccess;

namespace ReviewExersice.Business
{
    public class User
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserID { get; set; }
        public string Password { get; set; }
        public string Status { get; set; }

        public User CheckUser(User user)
        {
            return UserDB.VerifyUser(user);
        }
    }
}