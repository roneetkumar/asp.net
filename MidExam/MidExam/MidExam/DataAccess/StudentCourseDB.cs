using MidExam.Business;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MidExam.DataAccess
{
    public class StudentCourseDB
    {
        public static List<Course> GetStudentCourses(int id)
        {
            List<Course> listOfCourses = new List<Course>();
            Course course;
            string sql = String.Format("SELECT * FROM Courses WHERE CourseNumber IN (SELECT CourseNumber FROM StudentCourse WHERE StudentID = {0})",id);

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

        public static void SelectCourse(Course course, int stuID)
        {
            string sql = String.Format("INSERT INTO StudentCourse VALUES('{0}','{1}')",stuID,course.CourseNumber);

            using (SqlConnection conn = UtilityDB.ConnDB())
            {
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.ExecuteNonQuery();
                }

                conn.Close();
            }
        }
    }
}