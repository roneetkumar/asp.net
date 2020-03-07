using MidExam.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MidExam.GUI
{
    public partial class StudentWebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (DropDownList1.Items.Count <= 1)
            {
                Course course = new Course();

                var i = 0;
                foreach (var c in course.GetAllCourses())
                {
                    DropDownList1.Items.Add(new ListItem(c.Title, c.CourseNumber));
                    i++;
                }
            }

  
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            Student student = (Student)Session["user"];
            Course course = new Course();

            string selectedCourse = DropDownList1.SelectedValue;

            course =  course.GetCourse(selectedCourse);

            student.SelectCourse(course);

            BtnView_Click(sender, e);

        }

        protected void BtnView_Click(object sender, EventArgs e)
        {
            Student student = (Student)Session["user"];

            GridView1.DataSource = student.GetCourses();
            GridView1.DataBind();

        }
    }
}