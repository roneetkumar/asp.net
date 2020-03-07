using MidExam.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MidExam.Business
{
    public class Course
    {
        public string CourseNumber { get; set; }
        public string Title { get; set; }
        public string Duration { get; set; }
        public string Prerequisite { get; set; }

        public List<Course> GetAllCourses()
        {
            return (CourseDB.GetAllCourses());
        }

        public Course GetCourse(string id)
        {
            return (CourseDB.GetCourse(id));
        }

    }
}