using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab1.Business
{
    public class Employee
    {
        int employeeID;
        string firstName;
        string lastName;

        public int EmployeeID { get => employeeID; set => employeeID = value; }
        public string FirstName { get => firstName; set => firstName = value; }
        public string LastName { get => lastName; set => lastName = value; }
        public string JobTitle { get; set; }
    }
}