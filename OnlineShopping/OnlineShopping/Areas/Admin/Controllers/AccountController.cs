using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using OnlineShopping.Models;

namespace OnlineShopping.Areas.Admin.Controllers
{
    public class AccountController : Controller
    {
        SalesEntities db = new SalesEntities();
        // GET: Admin/Account/Login
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string LoginName, string Password)
        {
            var emp = db.Employees.Where(x => x.LoginName.Equals(LoginName)).SingleOrDefault();
            if (emp != null)
            {
                if (emp.Password.Equals(MySecurity.EncryptPass(Password)))
                {
                    FormsAuthentication.SetAuthCookie(emp.Id.ToString(), false);
                    return RedirectToAction("Index", "Dashboard");
                }
                else
                {
                    ViewBag.Message = "Password is wrong!!!";

                }
            }
            else
            {
                ViewBag.Message = "Login Name is not exist!!!";
            }
            return View();
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}