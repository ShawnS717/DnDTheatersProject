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
    public class HomeController : Controller
    {
        private DnDTheatersEntities db = new DnDTheatersEntities();

        public ActionResult Index()
        {
            return View(db.Movies.ToList());
        }

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
