using MidExam.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MidExam.Business
{
    public class Student
    {
       

        public int StudentNumber { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public string Phone { get; set; }


        public Student(int studentNumber, string firstName, string lastName, string email, string phone, string password)
        {
            this.StudentNumber = studentNumber;
            this.FirstName = firstName;
            this.LastName = lastName;
            this.Email = email;
            this.Password = password;
            this.Phone = phone;
        }

        public Student()
        {

        }

        public void Register()
        {
            StudentDB.Register(this);
        }

        public Student Login(int id, string pass)
        {
            return (StudentDB.Login(id, pass));
        }

        //public Student GetStudent(int id)
        //{
        //    return (StudentDB.GetStudent(id));
        //}

        public List<Course> GetCourses()
        {
            return (StudentCourseDB.GetStudentCourses(this.StudentNumber));
        }

        public void SelectCourse(Course course)
        {
            StudentCourseDB.SelectCourse(course,this.StudentNumber);
        }
       
    }
}