using MidExam.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace MidExam.GUI
{
    public partial class LoginWebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            Student student = new Student(); ;
            int id = Convert.ToInt32(TextBoxId.Text);
            string pass = TextBoxPsw.Text;

            student  = student.Login(id, pass);
            
            if (student != null)
            {
                Session["user"] = student.Login(id, pass);
                Response.Redirect("StudentWebForm.aspx");
            }
            else
            {
                MessageBox.Show("Please Correct your Id, and Password");
            }
           
        }

        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            

            int stuid = Convert.ToInt32(txtId.Text);
            
            Student student = new Student(stuid,txtFname.Text, txtLname.Text, txtEmail.Text, txtPhone.Text, txtPassword.Text);

            

            student.Register();


        }
    }
}