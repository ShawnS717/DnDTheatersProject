using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShawnSnyderFinalPrject.MVC.DATA;

namespace ShawnSnyderFinalProject.MVC.UI.Controllers
{
    [Authorize(Roles = "Admin")]
    public class TheatersController : Controller
    {
        private DnDTheatersEntities db = new DnDTheatersEntities();

        // GET: Theaters
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View(db.Theaters.ToList());
        }

        // GET: Theaters/Details/5
        [AllowAnonymous]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Theater theater = db.Theaters.Find(id);
            if (theater == null)
            {
                return HttpNotFound();
            }
            return View(theater);
        }

        // GET: Theaters/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Theaters/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TheaterID,TheaterName,Address,City,State,ZipCode,Longitude,Latitude")] Theater theater)
        {
            if (ModelState.IsValid)
            {
                db.Theaters.Add(theater);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(theater);
        }

        // GET: Theaters/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Theater theater = db.Theaters.Find(id);
            if (theater == null)
            {
                return HttpNotFound();
            }
            return View(theater);
        }

        // POST: Theaters/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TheaterID,TheaterName,Address,City,State,ZipCode,Longitude,Latitude")] Theater theater)
        {
            if (ModelState.IsValid)
            {
                db.Entry(theater).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(theater);
        }

        // GET: Theaters/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Theater theater = db.Theaters.Find(id);
            if (theater == null)
            {
                return HttpNotFound();
            }
            return View(theater);
        }

        // POST: Theaters/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Theater theater = db.Theaters.Find(id);
            db.Theaters.Remove(theater);
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
