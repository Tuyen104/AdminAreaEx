using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using OnlineShopping.Models;
using PagedList;

namespace OnlineShopping.Areas.Admin.Controllers
{
   [Authorize(Roles = "Admin")]
    public class CategoriesController : Controller
    {
        private SalesEntities db = new SalesEntities();

        // GET: Admin/Categories
        public ActionResult Index(int? page, string kw, string sort)
        {
            int pageNumber = page ?? 1;
            int pageSize = 5;
            //select all
            var categories = db.Categories.OrderBy(x=>x.Id).Include(c => c.Topic);
            //search
            if (!string.IsNullOrEmpty(kw))
            {
                categories = categories.Where(x => x.Id.ToString().Equals(kw) || x.CategoryName.ToLower().Contains(kw.ToLower()));
                ViewBag.kw = kw;
            }
            //sort
            if (string.IsNullOrEmpty(sort))
            {
                //mặc định
                ViewBag.sort = "id_asc";
              
            }
            else
            {
                ViewBag.sort = sort;
            }
           
                // cho từng cột
                switch (sort)
            {
                case "id_asc":
                    categories = categories.OrderBy(x => x.Id);
                    ViewBag.sortId = "id_desc";
                    break;
                case "id_desc":
                    categories = categories.OrderByDescending(x => x.Id);
                    ViewBag.sortId = "id_asc";
                    break;
                case "name_asc":
                    categories = categories.OrderBy(x => x.Id);
                    ViewBag.sortName = "name_desc";
                    break;
                case "name_desc":
                    categories = categories.OrderByDescending(x => x.Id);
                    ViewBag.sortName = "name_asc";
                    break;
            }
            //mặc định cho sortName
            ViewBag.sortId = ViewBag.sortId ?? "id_desc";

            ViewBag.sortName = ViewBag.sortName ?? "name_asc";


            return View(categories.ToPagedList(pageNumber,pageSize));
        }

        // GET: Admin/Categories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // GET: Admin/Categories/Create
        public ActionResult Create()
        {
            ViewBag.TopicId = new SelectList(db.Topics, "Id", "TopicName");
            return View();
        }

        // POST: Admin/Categories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,CategoryName,TopicId")] Category category)
        {
            if (ModelState.IsValid)
            {
                db.Categories.Add(category);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TopicId = new SelectList(db.Topics, "Id", "TopicName", category.TopicId);
            return View(category);
        }

        // GET: Admin/Categories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            ViewBag.TopicId = new SelectList(db.Topics, "Id", "TopicName", category.TopicId);
            return View(category);
        }

        // POST: Admin/Categories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,CategoryName,TopicId")] Category category)
        {
            if (ModelState.IsValid)
            {
                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TopicId = new SelectList(db.Topics, "Id", "TopicName", category.TopicId);
            return View(category);
        }

        // GET: Admin/Categories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Admin/Categories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Category category = db.Categories.Find(id);
            db.Categories.Remove(category);
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
