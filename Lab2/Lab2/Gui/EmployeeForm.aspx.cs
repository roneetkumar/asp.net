using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using Lab1V2.Bussiness;

namespace Lab1V2.Gui
{
    public partial class EmployeeFrom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            Employee emp = new Employee();
            if (!emp.IsUniqueId(Convert.ToInt32(TextBoxID.Text)))
            {
                MessageBox.Show("This Employee ID already exists!", "Duplicate Employee ID", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                emp.EmployeeId = Convert.ToInt32(TextBoxID.Text);
            }
            
            emp.FirstName = TextBoxFname.Text;
            emp.LastName = TextBoxLname.Text;
            emp.JobTitle = TextBoxJobtitle.Text;
            emp.SaveData(emp);
            MessageBox.Show("Employee Record save sucessfully", "Updata Record", MessageBoxButtons.OK, MessageBoxIcon.Information);

        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            Employee emp = new Employee();
            emp.EmployeeId = Convert.ToInt32(TextBoxID.Text);
            emp.FirstName = TextBoxFname.Text;
            emp.LastName = TextBoxLname.Text;
            emp.JobTitle = TextBoxJobtitle.Text;
            emp.UpdateData(emp);
            MessageBox.Show("Employee Record updataed sucessfully", "Updata Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        protected void ButtonListView_Click(object sender, EventArgs e)
        {
            Employee emp = new Employee();
            Session["employees"] = emp.GetAllDatas();
            GridView1.DataSource = Session["employees"];
            GridView1.DataBind();
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            DialogResult dialog = MessageBox.Show("Do you want to delete the employee record?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dialog == DialogResult.Yes)
            {
                int id = Convert.ToInt32(TextBoxID.Text);
                Employee emp = new Employee();
                emp.DeleteData(id);
                MessageBox.Show("Employee Record delete sucessfully", "delete Record", MessageBoxButtons.OK, MessageBoxIcon.Information);
                TextBoxID.Text = string.Empty;
                TextBoxFname.Text = string.Empty;
                TextBoxLname.Text = string.Empty;
                TextBoxJobtitle.Text = string.Empty;

            }
            else
            {
                TextBoxID.Text = string.Empty;
                TextBoxFname.Text = string.Empty;
                TextBoxLname.Text = string.Empty;
                TextBoxJobtitle.Text = string.Empty;

            }
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            Employee emp = new Employee();
            List<Employee> listEmp = new List<Employee>();
            List<Employee> tmplist = new List<Employee>();

            int dropIndex = DropDownList1.SelectedIndex;
            string text = TextBoxinput.Text.Trim();

            switch (dropIndex)
            {
                case 1:
                    emp.EmployeeId = Convert.ToInt32(text);
                    emp = emp.SearchByid(emp.EmployeeId);
                    if (emp != null)
                    {
                        TextBoxinput.Text = string.Empty;
                        TextBoxID.Text = emp.EmployeeId.ToString();
                        TextBoxFname.Text = emp.FirstName;
                        TextBoxLname.Text = emp.LastName;
                        TextBoxJobtitle.Text = emp.JobTitle;
                    }
                    else
                    {
                        MessageBox.Show("Employee record not found", "Error", MessageBoxButtons.OK);
                    }
                    break;
                case 2:
                    listEmp = emp.SearchbyName(text);
                    if(listEmp != null)
                    {
                        foreach(Employee one in listEmp)
                        {
                            tmplist.Add(one);
                            Session["list"] = tmplist;
                            GridView1.DataSource = Session["list"];
                            GridView1.DataBind();
                        }
                    }
                    else
                    {
                        MessageBox.Show("Employee record not found", "Error", MessageBoxButtons.OK);
                    }
                    break;
                case 3:
                    listEmp = emp.SearchbyName(text);
                    if (listEmp != null)
                    {
                        foreach (Employee one in listEmp)
                        {
                            tmplist.Add(one);
                            Session["list"] = tmplist;
                            GridView1.DataSource = Session["list"];
                            GridView1.DataBind();
                        }
                    }
                    else
                    {
                        MessageBox.Show("Employee record not found", "Error", MessageBoxButtons.OK);
                    }
                    break;


            }
        }
    }
}