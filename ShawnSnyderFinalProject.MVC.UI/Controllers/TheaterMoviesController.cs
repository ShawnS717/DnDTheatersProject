using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
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
        [Authorize(Roles = "Admin, Manager")]
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
        [Authorize(Roles = "Admin, Manager")]
        public ActionResult Create([Bind(Include = "TMID,TheaterID,MovieID,ShowtimeID,ReservationLimit")] TheaterMovy theaterMovy,int Day,int Month,int Year)
        {
            if (ModelState.IsValid)
            {
                theaterMovy.Date = new DateTime(Year, Month, Day);
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
        [Authorize(Roles = "Admin, Manager")]
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
        [Authorize(Roles = "Admin, Manager")]
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
        [Authorize(Roles = "Admin, Manager")]
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
        [Authorize(Roles = "Admin, Manager")]
        public ActionResult DeleteConfirmed(int id)
        {
            TheaterMovy theaterMovy = db.TheaterMovies.Find(id);
            db.TheaterMovies.Remove(theaterMovy);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult GetReservation(int? theaterID, int? movieID)
        {
            Session["selectedTheater"] = theaterID;
            Session["selectedMovie"] = movieID;

            if (theaterID == null || movieID == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var theaterMovies = db.TheaterMovies.Include(t => t.Movy).Include(t => t.Showtime).Include(t => t.Theater).Include(t => t.SeatIDs);
            var movies = theaterMovies.Where(x => (x.ReservationLimit - x.SeatIDs.Count) > 0 && x.TheaterID == theaterID && x.MovieID == movieID && x.Date > DateTime.Now).ToList();
            return View(movies);

        }

        [HttpPost]
        public ActionResult MakeReservation(int? numOfTickets, int? tmid)
        {
            if (numOfTickets < 1 || numOfTickets == null || tmid == null || tmid == 0)
            {
                var theaterMovies = db.TheaterMovies.Include(x => x.Movy).Include(x => x.Showtime).Include(x => x.Theater).Include(x => x.SeatIDs);

                TheaterMovy tm = db.TheaterMovies.Where(x => x.TMID == tmid).SingleOrDefault();
                Session["error"] = "you missed something. Double check you chose a time AND how many tickets you want";
                return RedirectToAction("GetReservation", new { theaterID = (int)Session["selectedTheater"], movieID = (int)Session["selectedMovie"] });
            }
            string userID;
            if (Request.IsAuthenticated)
            {
                userID = User.Identity.GetUserId();
            }
            else
            {
                userID = "761aa9be-9849-4596-a8e7-d30611343cb9";
            }
            for (int i = 0; i < numOfTickets; i++)
            {
                Ticket t = new Ticket();

                t.UserID = userID;

                db.Tickets.Add(t);
            }
            db.SaveChanges();

            var purchasedTickets = db.Tickets.Where(x => x.UserID == userID).OrderBy(x => x.TicketID).Take((int)numOfTickets).ToList();
            foreach (var item in purchasedTickets)
            {
                SeatID s = new SeatID();
                s.TMID = (int)tmid;
                s.TicketID = item.TicketID;
                db.SeatIDs.Add(s);
            }
            db.SaveChanges();

            return View();
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
