using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace StateManagement
{
    public partial class Session : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //  TextBox1.Text = Application["myName"].ToString();
            //MessageBox.Show(ToString());

            GridView1.DataSource = Session["listEmp"];
            GridView1.DataBind();


        }
    }
}