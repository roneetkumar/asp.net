using MidExam.Business;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Windows.Forms;

namespace MidExam.DataAccess
{
    public class StudentDB
    {
        public static Student Login(int id, string pass)
        {
            Student student = null;
            string sql = String.Format("SELECT * FROM Students Where StudentID='{0}' and Pass='{1}'", id, pass);

            using (SqlConnection conn = UtilityDB.ConnDB())
            {
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                student = new Student();
                                student.StudentNumber = Convert.ToInt32(reader["StudentID"]);
                                student.FirstName = reader["FirstName"].ToString();
                                student.LastName = reader["LastName"].ToString();
                                student.Email = reader["Email"].ToString();
                                student.Phone = reader["HomePhone"].ToString();
                            }
                        }

                        reader.Close();
                    }
                }
            }
            return student;
        }

        public static List<Student> GetAllStudents()
        {
            List<Student> listOfStudents = new List<Student>();
            Student student;
            string sql = String.Format("SELECT * FROM Students");

            using (SqlConnection conn = UtilityDB.ConnDB())
            {
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                student = new Student();
                                student.StudentNumber = Convert.ToInt32(reader["StudentNumber"]);
                                student.FirstName = reader["FirstName"].ToString();
                                student.LastName = reader["LastName"].ToString();
                                student.Email = reader["Email"].ToString();
                                student.Phone = reader["HomePhone"].ToString();
                                listOfStudents.Add(student);
                            }
                        }
                        else
                        {
                            listOfStudents = null;
                        }
                        reader.Close();
                    }
                }
                conn.Close();
            }
            return listOfStudents;

        }

        public static void Register(Student st)
        {
            string sql = String.Format("insert into Students values({0},'{1}','{2}','{3}','{4}','{5}')", st.StudentNumber, st.FirstName, st.LastName, st.Email, st.Phone, st.Password);
            using (SqlConnection conn = UtilityDB.ConnDB())
            {
                using (SqlCommand cmd2 = new SqlCommand(sql, conn))
                {
                    cmd2.ExecuteNonQuery();
                    MessageBox.Show("Registered");
                }

            }
        }


        //public static Student GetStudent(int id)
        //{
        //    string sql = String.Format("Select * From Students Where StudentID={0}", id);
        //    Student student = new Student(); ;

        //    using (SqlConnection conn = UtilityDB.ConnDB())
        //    {
        //        using (SqlCommand cmd = new SqlCommand(sql, conn))
        //        {
        //            using (SqlDataReader reader = cmd.ExecuteReader())
        //            {
        //                if (reader.HasRows)
        //                {
        //                    while (reader.Read())
        //                    {
        //                        student.StudentNumber = Convert.ToInt32(reader["StudentID"]);
        //                        student.FirstName = reader["FirstName"].ToString();
        //                        student.LastName = reader["LastName"].ToString();
        //                        student.Email = reader["Email"].ToString();
        //                        student.Phone = reader["HomePhone"].ToString();
        //                    }
        //                }
        //                else
        //                {
        //                    student = null;
        //                }
        //                reader.Close();
        //            }
        //        }
        //        conn.Close();
        //    }
        //    return student;
        //}
    }
}