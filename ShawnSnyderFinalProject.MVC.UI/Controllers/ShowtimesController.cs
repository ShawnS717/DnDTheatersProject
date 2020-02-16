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
    [Authorize(Roles ="Admin Manager")]
    public class ShowtimesController : Controller
    {
        private DnDTheatersEntities db = new DnDTheatersEntities();

        // GET: Showtimes
        public ActionResult Index()
        {
            return View(db.Showtimes.ToList());
        }

        // GET: Showtimes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Showtime showtime = db.Showtimes.Find(id);
            if (showtime == null)
            {
                return HttpNotFound();
            }
            return View(showtime);
        }

        // GET: Showtimes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Showtimes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ShowtimeID,Time")] Showtime showtime)
        {
            if (ModelState.IsValid)
            {
                db.Showtimes.Add(showtime);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(showtime);
        }

        // GET: Showtimes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Showtime showtime = db.Showtimes.Find(id);
            if (showtime == null)
            {
                return HttpNotFound();
            }
            return View(showtime);
        }

        // POST: Showtimes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ShowtimeID,Time")] Showtime showtime)
        {
            if (ModelState.IsValid)
            {
                db.Entry(showtime).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(showtime);
        }

        // GET: Showtimes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Showtime showtime = db.Showtimes.Find(id);
            if (showtime == null)
            {
                return HttpNotFound();
            }
            return View(showtime);
        }

        // POST: Showtimes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Showtime showtime = db.Showtimes.Find(id);
            db.Showtimes.Remove(showtime);
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
