using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShawnSnyderFinalProject.MVC.UI.Models
{
    public class ContactViewModel
    {
        [Required(ErrorMessage = "**Name is Required")]//<-this sets name to required and makes a error mesage
        public string Name { get; set; }
        [Required(ErrorMessage = "**Email is Required")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        public string Subject { get; set; }
        [Required(ErrorMessage = "**Message is required")]
        [UIHint("MultilineText")]//<-makes a text area element rather than an input
        public string Message { get; set; }
    }
}