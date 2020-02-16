using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Lab1V2.Bussiness;

namespace Lab1V2.DataAccess
{
    public class EmployeeDB
    {
      
            public static void SaveData(Employee emp)
            {

                using (SqlConnection conn = UtilityDB.ConnDB())
                {
                    string query = "INSERT INTO Employees " +
                                    "VALUES (" + emp.EmployeeId +
                                    ", '" +
                                    emp.FirstName +
                                    "','" +
                                    emp.LastName +
                                    "','" +
                                    emp.JobTitle +
                                    "')";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {

                        cmd.ExecuteNonQuery();
                    }
                    conn.Close();
                }

            }

            public static bool IsUniqueId(int id)
            {
                using (SqlConnection conn = UtilityDB.ConnDB())
                {
                    string query = "SELECT * FROM Employees WHERE EmployeeID = " + id;
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        int i = Convert.ToInt32(cmd.ExecuteScalar());
                        if (i != 0)
                        {
                            conn.Close();
                            return false;
                        }
                        else
                        {
                            conn.Close();
                            return true;
                        }

                    }
                }
            }

            public static List<Employee> GetRecordList()
            {
                Employee emp;
                List<Employee> listEmp = new List<Employee>();
                string query = "SELECT * FROM Employees";
                using (SqlConnection conn = UtilityDB.ConnDB())
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                emp = new Employee();
                                emp.EmployeeId = Convert.ToInt32(reader["EmployeeID"]);
                                emp.FirstName = reader["FirstName"].ToString();
                                emp.LastName = reader["LastName"].ToString();
                                emp.JobTitle = reader["JobTitle"].ToString();
                                listEmp.Add(emp);
                            }
                            reader.Close();
                        }
                    }

                    conn.Close();
                }
                return listEmp;
            }


            public static Employee SearchById(int id)
            {
                string query = "SELECT * FROM Employees WHERE EmployeeID = @EmployeeID ";
                Employee emp = new Employee();

                using (SqlConnection conn = UtilityDB.ConnDB())
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@EmployeeID", id);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {

                                emp.EmployeeId = Convert.ToInt32(reader["EmployeeID"]);
                                emp.FirstName = reader["FirstName"].ToString();
                                emp.LastName = reader["LastName"].ToString();
                                emp.JobTitle = reader["JobTitle"].ToString();
                            }
                            reader.Close();
                        }

                        conn.Close();
                    }
                    return emp;
                }
            }

            public static List<Employee> SearchByString(string text)
            {

                List<Employee> empList = new List<Employee>();
                List<Employee> emptemplist = new List<Employee>();
                Employee emptemp = new Employee();
                emptemplist = emptemp.GetAllDatas();
                if (emptemplist != null)
                {
                    foreach (Employee oneemp in emptemplist)
                    {
                        if (text.ToLower() == oneemp.FirstName.ToLower() || text.ToLower() == oneemp.LastName.ToLower() || text.ToLower() == oneemp.JobTitle.ToLower())
                        {
                            empList.Add(oneemp);

                        }

                    }
                }
                return empList;


            }

            public static void UpdateData(Employee emp)
            {
                string str = "Update Employees " +
                              "SET FirstName= @FirstName, " +
                              "LastName= @LastName, " +
                              "JobTitle= @JobTitle " +
                              "WHERE EmployeeID=@EmployeeID";

                using (SqlConnection conn = UtilityDB.ConnDB())
                {
                    using (SqlCommand cmd = new SqlCommand(str, conn))
                    {
                        cmd.Parameters.AddWithValue("@FirstName", emp.FirstName);
                        cmd.Parameters.AddWithValue("@LastName", emp.LastName);
                        cmd.Parameters.AddWithValue("@JobTitle", emp.JobTitle);
                        cmd.Parameters.AddWithValue("@EmployeeID", emp.EmployeeId);
                        cmd.ExecuteNonQuery();

                    }
                    conn.Close();
                }
            }

            public static void DeleteData(int id)
            {
                string qurey = "DELETE FROM Employees WHERE EmployeeID=@EmployeeID";

                using (SqlConnection conn = UtilityDB.ConnDB())
                {
                    using (SqlCommand cmd = new SqlCommand(qurey, conn))
                    {
                        cmd.Parameters.AddWithValue("@EmployeeID", id);
                        cmd.ExecuteNonQuery();
                    }
                    conn.Close();
                }

            }
        }
    }