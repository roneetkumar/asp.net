using MidExam.Business;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MidExam.DataAccess
{
    public class CourseDB
    {
        public static List<Course> GetAllCourses()
        {
            List<Course> listOfCourses = new List<Course>();
            Course course;
            string sql = String.Format("SELECT * FROM Courses");

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
                                course = new Course();
                                course.CourseNumber = reader["CourseNumber"].ToString();
                                course.Title = reader["CourseTitle"].ToString();
                                course.Duration = reader["Duration"].ToString();
                                course.Prerequisite = reader["Prerequisite"].ToString();
                                listOfCourses.Add(course);
                            }
                        }
                        else
                        {
                            listOfCourses = null;
                        }
                        reader.Close();
                    }
                }
                conn.Close();
            }
            return listOfCourses;
        }

        public static Course GetCourse(string id)
        {
            string sql = String.Format("Select * From Courses Where CourseNumber='{0}'", id);
            Course course = null;

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
                                course = new Course();
                                course.CourseNumber = reader["CourseNumber"].ToString();
                                course.Title = reader["CourseTitle"].ToString();
                                course.Duration = reader["Duration"].ToString();
                                course.Prerequisite = reader["Prerequisite"].ToString();
                            }
                        }
                        reader.Close();
                    }
                }
                conn.Close();
            }
            return course;
        }
    }
}