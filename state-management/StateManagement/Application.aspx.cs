﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StateManagement
{
    public partial class Application : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            Application["myName"] = TextBox1.Text;
            Response.Redirect("Session.aspx");
        }
    }
}