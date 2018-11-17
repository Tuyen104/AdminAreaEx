using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using OnlineShopping.Models;
using PagedList;

namespace OnlineShopping.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin, Manager")]

    public class ProductsController : Controller
    {
        private SalesEntities db = new SalesEntities();

        // GET: Admin/Products
        public ActionResult Index(int? page)
        {
            int pageNumber = page ?? 1;
            int pageSize = 10;
            var products = db.Products.OrderBy(x=>x.Id).Include(p => p.Category).Include(p => p.Picture);
            return View(products.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }
        private void UploadPicture(int id)
        {
            string path = Server.MapPath("~/Uploads/Products/") + id;
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            for (int i = 0; i < Request.Files.Count; i++) //quét qua từng file đc chọn
            {
                HttpPostedFileBase file = Request.Files[i];
                string filename = file.FileName.Split('\\').Last();

                try
                {
                    file.SaveAs(path + "\\" + filename); //lưu xuống ổ cứng
                    Picture p = new Picture()
                    {
                        ProductId = id,
                        Url = filename

                    };
                    db.Pictures.Add(p);
                }
                catch { }
                
            }
            db.SaveChanges();
        }

        public ActionResult DeletePicture(int id)
        {
            try
            {
                var picture = db.Pictures.Find(id);
                //xóa trên ổ cứng
                string path = Server.MapPath("~/Uploads/Products/") + picture.ProductId;
                string f = path + "\\"  + picture.Url;
                if (System.IO.File.Exists(f))
                {
                    System.IO.File.Delete(f);
                }
                //xóa trên database
                db.Pictures.Remove(picture);
                db.SaveChanges();
                return Content("OK"); //phải giống bên <script> ajax
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
        }
        // GET: Admin/Products/Create
        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "CategoryName");
            ViewBag.PictureId = new SelectList(db.Pictures, "Id", "Url");
            return View();
        }

        // POST: Admin/Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,ProductName,CategoryId,Unit,UnitPrice,Description,PictureId")] Product product)
        {
            if (ModelState.IsValid)
            {
                //
                db.Products.Add(product);
                db.SaveChanges();

                //add pictures
                UploadPicture(product.Id);
               
                return RedirectToAction("Index");
            }

            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "CategoryName", product.CategoryId);
            ViewBag.PictureId = new SelectList(db.Pictures, "Id", "Url", product.PictureId);
            return View(product);
        }

        // GET: Admin/Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "CategoryName", product.CategoryId);
            ViewBag.PictureId = new SelectList(db.Pictures.Where(x=>x.ProductId==id), "Id", "Url", product.PictureId); //combobox chọn hình
            return View(product);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,ProductName,CategoryId,Unit,UnitPrice,Description,PictureId")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();

                UploadPicture(product.Id);
                return RedirectToAction("Index");
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "CategoryName", product.CategoryId);
            ViewBag.PictureId = new SelectList(db.Pictures, "Id", "Url", product.PictureId);
            return View(product);
        }
        [Authorize(Roles = "Admin")]
        // GET: Admin/Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Admin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
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
