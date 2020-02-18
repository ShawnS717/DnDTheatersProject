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
    [Authorize(Roles = "Manager, Admin")]
    public class SeatIDsController : Controller
    {
        private DnDTheatersEntities db = new DnDTheatersEntities();

        // GET: SeatIDs
        public ActionResult Index()
        {
            var seatIDs = db.SeatIDs.Include(s => s.TheaterMovy).Include(s => s.Ticket);
            return View(seatIDs.ToList());
        }

        // GET: SeatIDs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SeatID seatID = db.SeatIDs.Find(id);
            if (seatID == null)
            {
                return HttpNotFound();
            }
            return View(seatID);
        }

        // GET: SeatIDs/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.TMID = new SelectList(db.TheaterMovies, "TMID", "TMID");
            ViewBag.TicketID = new SelectList(db.Tickets, "TicketID", "UserID");
            return View();
        }

        // POST: SeatIDs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "SeatID1,TMID,TicketID")] SeatID seatID)
        {
            if (ModelState.IsValid)
            {
                db.SeatIDs.Add(seatID);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TMID = new SelectList(db.TheaterMovies, "TMID", "TMID", seatID.TMID);
            ViewBag.TicketID = new SelectList(db.Tickets, "TicketID", "UserID", seatID.TicketID);
            return View(seatID);
        }

        // GET: SeatIDs/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SeatID seatID = db.SeatIDs.Find(id);
            if (seatID == null)
            {
                return HttpNotFound();
            }
            ViewBag.TMID = new SelectList(db.TheaterMovies, "TMID", "TMID", seatID.TMID);
            ViewBag.TicketID = new SelectList(db.Tickets, "TicketID", "UserID", seatID.TicketID);
            return View(seatID);
        }

        // POST: SeatIDs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "SeatID1,TMID,TicketID")] SeatID seatID)
        {
            if (ModelState.IsValid)
            {
                db.Entry(seatID).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TMID = new SelectList(db.TheaterMovies, "TMID", "TMID", seatID.TMID);
            ViewBag.TicketID = new SelectList(db.Tickets, "TicketID", "UserID", seatID.TicketID);
            return View(seatID);
        }

        // GET: SeatIDs/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SeatID seatID = db.SeatIDs.Find(id);
            if (seatID == null)
            {
                return HttpNotFound();
            }
            return View(seatID);
        }

        // POST: SeatIDs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            SeatID seatID = db.SeatIDs.Find(id);
            db.SeatIDs.Remove(seatID);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult MyTickets()
        {
            if (User.Identity.IsAuthenticated)
            {
                string id = User.Identity.GetUserId();
                return View(db.SeatIDs.Where(x => x.Ticket.UserID == id).ToList());
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
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
