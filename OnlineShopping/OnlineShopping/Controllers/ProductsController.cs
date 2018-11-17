using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OnlineShopping.Models;

namespace OnlineShopping.Controllers
{
    public class ProductsController : Controller
    {
        SalesEntities db = new SalesEntities();
        // GET: Products
        public ActionResult Index()
        {
            var products = db.Products.ToList();
            return View(products);
        }
        //GET Products/Category/Id
        public ActionResult Category(int id)
        {
            var product = db.Products.Where(x => x.CategoryId == id);
            return View(product.ToList());
        }
        public ActionResult Search(string kw)
        {

            return View();
        }
    }
    
}