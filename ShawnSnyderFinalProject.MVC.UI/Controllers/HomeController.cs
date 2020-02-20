using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using ShawnSnyderFinalPrject.MVC.DATA;
using ShawnSnyderFinalProject.MVC.UI.Models;

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
            return View();
        }

        [HttpPost]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (!ModelState.IsValid)
            {
                return View(cvm);
            }

            string message = $"Message From DnD Theaters To Customer support.<br/>Customer Name: {cvm.Name}<br/>Email: {cvm.Email}<br/>{cvm.Message}";

            mm.IsBodyHtml = true;
            mm.Priority = MailPriority.High;
            mm.ReplyToList.Add(cvm.Email);


            try
            {
                client.Send(mm);
            }
            catch (Exception ex)
            {
                ViewBag.CustomerMessage = $"we're sorry, your request could not be completed at this time. please try again later Error: <br/>{ex.StackTrace}";
                return View(cvm);
            }

            return View("EmailConfirmation");
        }
    }
}
