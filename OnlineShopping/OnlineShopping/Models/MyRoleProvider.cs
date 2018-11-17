using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace OnlineShopping.Models
{
    public class MyRoleProvider : RoleProvider
    {
        public override string ApplicationName { get; set; } //chỉnh sửa, chuyển ApplicationName thành property

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override string[] GetRolesForUser(string username) //chỉnh sửa
        {
            using (var db = new SalesEntities())
            {
                var emp = db.Employees.Find(int.Parse(username)); //username đang là User.name bên controller bên FormsAuthentication => theo Id
                return  emp.EmployeeLevels.Select(x=>x.Level.LevelName).ToArray(); //trả về danh sách tên các level của user này
            }
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string username, string roleName) //chỉnh sửa, kiểm tra đúng hay sai, xem levelName có trùng với roleName ko?
        {
            using (var db = new SalesEntities())
            {
                var emp = db.Employees.Find(int.Parse(username)); //username đang là User.name bên controller bên FormsAuthentication => theo Id
                return emp.EmployeeLevels.Select(x=>x.Level.LevelName).Contains(roleName);
            }
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}