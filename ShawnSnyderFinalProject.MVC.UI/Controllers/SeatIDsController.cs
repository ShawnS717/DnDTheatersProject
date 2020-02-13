﻿using System;
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
        public ActionResult DeleteConfirmed(int id)
        {
            SeatID seatID = db.SeatIDs.Find(id);
            db.SeatIDs.Remove(seatID);
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