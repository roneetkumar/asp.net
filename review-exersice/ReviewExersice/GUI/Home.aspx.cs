using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ReviewExersice.Business;


namespace ReviewExersice.GUI
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["user"];

            Label1.Text = "Welcome " + user.FirstName + " " + user.LastName;

        }
    }
}