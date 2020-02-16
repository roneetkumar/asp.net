using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ReviewExersice.DataAccess;
using ReviewExersice.Business;


namespace ReviewExersice.GUI
{
    public partial class LoginFormTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            User user = new User();

           

            if (TextBox1.Text != "" && TextBox2.Text != "")
            {
                user.UserID = TextBox1.Text;
                user.Password = TextBox2.Text;
                
                user = user.CheckUser(user);

                if (user != null)
                {
                    Session["user"] = user;
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    MessageBox.Show("Invalid user name or password.Please enter valid info");
                }

            }

            // MessageBox.Show(UtilityDB.ConnectDB().State.ToString());
        }
    }
}