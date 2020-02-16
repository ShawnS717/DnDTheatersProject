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
    public class MoviesController : Controller
    {
        private DnDTheatersEntities db = new DnDTheatersEntities();

        // GET: Movies
        public ActionResult Index()
        {
            return View(db.Movies.ToList());
        }

        // GET: Movies/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Movy movy = db.Movies.Find(id);
            if (movy == null)
            {
                return HttpNotFound();
            }
            return View(movy);
        }

        // GET: Movies/Create
        [Authorize(Roles ="Admin")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: Movies/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "MovieId,Name,Description,esrbRating,PercentRating,ImagePath")] Movy movy,HttpPostedFileBase UploadFileImage)
        {
            if (ModelState.IsValid)
            {
                string imagename = "noimage.jpg";
                if (UploadFileImage != null)
                {
                    imagename = UploadFileImage.FileName;
                    string ext = UploadFileImage.FileName.Substring(imagename.LastIndexOf("."));
                    string[] goodExts = new string[] { ".jpg", ".jpeg", ".png", ".gif" };
                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imagename = Guid.NewGuid() + ext;
                        UploadFileImage.SaveAs(Server.MapPath("~/Content/img/" + imagename));
                    }
                    else
                    {
                        imagename = "noimage.jpg";
                    }
                }

                movy.ImagePath = imagename;
                db.Movies.Add(movy);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(movy);
        }

        // GET: Movies/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Movy movy = db.Movies.Find(id);
            if (movy == null)
            {
                return HttpNotFound();
            }
            return View(movy);
        }

        // POST: Movies/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "MovieId,Name,Description,esrbRating,PercentRating,ImagePath")] Movy movy,HttpPostedFileBase UploadFileImage)
        {
            if (ModelState.IsValid)
            {
                if (UploadFileImage != null)
                {
                    string imageName = UploadFileImage.FileName;
                    string ext = imageName.Substring(imageName.LastIndexOf("."));
                    string[] goodExts = new string[] { ".jpg", ".jpeg", ".png", ".gif" };

                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext;
                        UploadFileImage.SaveAs(Server.MapPath("~/Content/img/" + imageName));
                        if (movy.ImagePath != "noimage.jpg")
                        {
                            System.IO.File.Delete(Server.MapPath("~/Content/img/" + movy.ImagePath));
                        }
                        movy.ImagePath = imageName;
                    }
                }
                db.Entry(movy).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(movy);
        }

        // GET: Movies/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Movy movy = db.Movies.Find(id);
            if (movy == null)
            {
                return HttpNotFound();
            }
            return View(movy);
        }

        // POST: Movies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            Movy movie = db.Movies.Find(id);
            if (movie.ImagePath != null && movie.ImagePath != "noimage.jpg")
            {
                System.IO.File.Delete(Server.MapPath("~/Content/img/" + movie.ImagePath));
                db.Movies.Remove(movie);
                db.SaveChanges();
            }
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
