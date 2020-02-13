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
    public class TheaterMoviesController : Controller
    {
        private DnDTheatersEntities db = new DnDTheatersEntities();

        // GET: TheaterMovies
        public ActionResult Index()
        {
            var theaterMovies = db.TheaterMovies.Include(t => t.Movy).Include(t => t.Showtime).Include(t => t.Theater);
            return View(theaterMovies.ToList());
        }

        // GET: TheaterMovies/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TheaterMovy theaterMovy = db.TheaterMovies.Find(id);
            if (theaterMovy == null)
            {
                return HttpNotFound();
            }
            return View(theaterMovy);
        }

        // GET: TheaterMovies/Create
        public ActionResult Create()
        {
            ViewBag.MovieID = new SelectList(db.Movies, "MovieId", "Name");
            ViewBag.ShowtimeID = new SelectList(db.Showtimes, "ShowtimeID", "ShowtimeID");
            ViewBag.TheaterID = new SelectList(db.Theaters, "TheaterID", "TheaterName");
            return View();
        }

        // POST: TheaterMovies/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TMID,TheaterID,MovieID,ShowtimeID,ReservationLimit")] TheaterMovy theaterMovy)
        {
            if (ModelState.IsValid)
            {
                db.TheaterMovies.Add(theaterMovy);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MovieID = new SelectList(db.Movies, "MovieId", "Name", theaterMovy.MovieID);
            ViewBag.ShowtimeID = new SelectList(db.Showtimes, "ShowtimeID", "ShowtimeID", theaterMovy.ShowtimeID);
            ViewBag.TheaterID = new SelectList(db.Theaters, "TheaterID", "TheaterName", theaterMovy.TheaterID);
            return View(theaterMovy);
        }

        // GET: TheaterMovies/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TheaterMovy theaterMovy = db.TheaterMovies.Find(id);
            if (theaterMovy == null)
            {
                return HttpNotFound();
            }
            ViewBag.MovieID = new SelectList(db.Movies, "MovieId", "Name", theaterMovy.MovieID);
            ViewBag.ShowtimeID = new SelectList(db.Showtimes, "ShowtimeID", "ShowtimeID", theaterMovy.ShowtimeID);
            ViewBag.TheaterID = new SelectList(db.Theaters, "TheaterID", "TheaterName", theaterMovy.TheaterID);
            return View(theaterMovy);
        }

        // POST: TheaterMovies/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TMID,TheaterID,MovieID,ShowtimeID,ReservationLimit")] TheaterMovy theaterMovy)
        {
            if (ModelState.IsValid)
            {
                db.Entry(theaterMovy).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MovieID = new SelectList(db.Movies, "MovieId", "Name", theaterMovy.MovieID);
            ViewBag.ShowtimeID = new SelectList(db.Showtimes, "ShowtimeID", "ShowtimeID", theaterMovy.ShowtimeID);
            ViewBag.TheaterID = new SelectList(db.Theaters, "TheaterID", "TheaterName", theaterMovy.TheaterID);
            return View(theaterMovy);
        }

        // GET: TheaterMovies/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TheaterMovy theaterMovy = db.TheaterMovies.Find(id);
            if (theaterMovy == null)
            {
                return HttpNotFound();
            }
            return View(theaterMovy);
        }

        // POST: TheaterMovies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TheaterMovy theaterMovy = db.TheaterMovies.Find(id);
            db.TheaterMovies.Remove(theaterMovy);
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
