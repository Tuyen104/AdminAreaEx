using Newtonsoft.Json;
using OnlineShopping.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShopping.Controllers
{
    public class CartController : Controller
    {
        SalesEntities db = new SalesEntities();
        // GET: Cart
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Checkout(string data)
        {
            //băm dữ liệu từ hàm post string data ra
            var cart_items = JsonConvert.DeserializeObject<List<CartItem>>(data);
            if (cart_items == null || cart_items.Count == 0) return Content("Something is wrong!!!");
            Order o = new Order()
            {
                OrderDate = DateTime.Now,
                StatusId = 1
            };
            db.Orders.Add(o);
            db.SaveChanges();

            foreach(var item in cart_items)
            {
                OrderDetail od = new OrderDetail()
                {
                    OrderId = o.Id,
                    ProductId = item.productid,
                    Unit = item.unit,
                    UnitPrice = item.price,
                    Quantity = item.quantity,
                    Discount = 0,
                    Tax = 0
                };
                db.OrderDetails.Add(od);
                
            }
            db.SaveChanges();
            return Content("OK");
        }
    }
}