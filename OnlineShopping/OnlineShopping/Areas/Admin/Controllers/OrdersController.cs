using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using OnlineShopping.Models;

namespace OnlineShopping.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin, Manager")]

    public class OrdersController : Controller
    {
        private SalesEntities db = new SalesEntities();

        // GET: Admin/Orders
        public ActionResult Index()
        {
            var orders = db.Orders.Include(o => o.Customer).Include(o => o.Employee).Include(o => o.PaymentMethod).Include(o => o.Shipping).Include(o => o.Status);
            return View(orders.ToList());
        }

        // GET: Admin/Orders/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // GET: Admin/Orders/Create
        public ActionResult Create()
        {
            ViewBag.CustomerId = new SelectList(db.Customers, "Id", "CustomerName");
            ViewBag.EmployeeId = new SelectList(db.Employees, "Id", "LoginName");
            ViewBag.PaymentMethodId = new SelectList(db.PaymentMethods, "Id", "MethodName");
            ViewBag.ShippingId = new SelectList(db.Shippings, "Id", "ShippingName");
            ViewBag.StatusId = new SelectList(db.Statuses, "Id", "StatusName");
            return View();
        }

        // POST: Admin/Orders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,OrderCode,OrderDate,CustomerId,ShippingId,Discount,Tax,ShippingFee,PaymentMethodId,EmployeeId,StatusId")] Order order)
        {
            if (ModelState.IsValid)
            {
                db.Orders.Add(order);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CustomerId = new SelectList(db.Customers, "Id", "CustomerName", order.CustomerId);
            ViewBag.EmployeeId = new SelectList(db.Employees, "Id", "LoginName", order.EmployeeId);
            ViewBag.PaymentMethodId = new SelectList(db.PaymentMethods, "Id", "MethodName", order.PaymentMethodId);
            ViewBag.ShippingId = new SelectList(db.Shippings, "Id", "ShippingName", order.ShippingId);
            ViewBag.StatusId = new SelectList(db.Statuses, "Id", "StatusName", order.StatusId);
            return View(order);
        }

        // GET: Admin/Orders/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            ViewBag.CustomerId = new SelectList(db.Customers, "Id", "CustomerName", order.CustomerId);
            ViewBag.EmployeeId = new SelectList(db.Employees, "Id", "LoginName", order.EmployeeId);
            ViewBag.PaymentMethodId = new SelectList(db.PaymentMethods, "Id", "MethodName", order.PaymentMethodId);
            ViewBag.ShippingId = new SelectList(db.Shippings, "Id", "ShippingName", order.ShippingId);
            ViewBag.StatusId = new SelectList(db.Statuses, "Id", "StatusName", order.StatusId);
            return View(order);
        }

        // POST: Admin/Orders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,OrderCode,OrderDate,CustomerId,ShippingId,Discount,Tax,ShippingFee,PaymentMethodId,EmployeeId,StatusId")] Order order)
        {
            if (ModelState.IsValid)
            {
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CustomerId = new SelectList(db.Customers, "Id", "CustomerName", order.CustomerId);
            ViewBag.EmployeeId = new SelectList(db.Employees, "Id", "LoginName", order.EmployeeId);
            ViewBag.PaymentMethodId = new SelectList(db.PaymentMethods, "Id", "MethodName", order.PaymentMethodId);
            ViewBag.ShippingId = new SelectList(db.Shippings, "Id", "ShippingName", order.ShippingId);
            ViewBag.StatusId = new SelectList(db.Statuses, "Id", "StatusName", order.StatusId);
            return View(order);
        }

        // GET: Admin/Orders/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // POST: Admin/Orders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Order order = db.Orders.Find(id);
            db.Orders.Remove(order);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
