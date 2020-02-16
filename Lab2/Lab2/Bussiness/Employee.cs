using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Lab1V2.DataAccess;

namespace Lab1V2.Bussiness
{
    public class Employee
    {
        int employeeId;
        string firstName;
        string lastName;
        string jobTitle;

        public int EmployeeId { get => employeeId; set => employeeId = value; }
        public string FirstName { get => firstName; set => firstName = value; }
        public string LastName { get => lastName; set => lastName = value; }
        public string JobTitle { get => jobTitle; set => jobTitle = value; }

        public void SaveData(Employee emp)
        {
            EmployeeDB.SaveData(emp);
        }

        public bool IsUniqueId(int id)
        {
            return (EmployeeDB.IsUniqueId(id));
        }

        public List<Employee> GetAllDatas()
        {
            return (EmployeeDB.GetRecordList());
        }

        public Employee SearchByid(int id)
        {
            return (EmployeeDB.SearchById(id));
        }

        public List<Employee> SearchbyName(string name)
        {
            return (EmployeeDB.SearchByString(name));
        }
        public void UpdateData(Employee emp)
        {
            EmployeeDB.UpdateData(emp);
        }
        public void DeleteData(int id)
        {
            EmployeeDB.DeleteData(id);
        }
    }
}