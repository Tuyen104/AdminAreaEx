using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using OnlineShopping.Models;
namespace OnlineShopping.Controllers
{
    public class CustomerController : Controller
    {
        SalesEntities db = new SalesEntities();
        // GET: Customer
        [HttpPost]
        public ActionResult Login(string Email, string Password)
        {
            string ms = "";
            var cus = db.Customers.Where(x => x.Email.Equals(Email)).SingleOrDefault();
            if(cus != null)
            {
                if (cus.Password.Equals(Password))
                {
                    FormsAuthentication.SetAuthCookie(cus.Id.ToString(), false);
                    ms = "OK";
                }
                else
                {
                    ms = "Password is wrong!!!";
                }
            }
            else
            {
                ms = "Email is not exist!!!!";
            }
            return Content(ms);
        }
    }
}