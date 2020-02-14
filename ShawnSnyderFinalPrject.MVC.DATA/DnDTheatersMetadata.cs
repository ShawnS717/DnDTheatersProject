using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace ShawnSnyderFinalPrject.MVC.DATA
{
    public class DnDTheatersMetadata
    {
        public class MovyMetadata
        {
            [Required(ErrorMessage = "*")]
            [StringLength(100)]
            public string Name { get; set; }
            [StringLength(1000)]
            public string Description { get; set; }
            [StringLength(4)]
            public string esrbRating { get; set; }
            [Range(0,100)]
            public Nullable<byte> PercentRating { get; set; }
            [StringLength(50)]
            public string ImagePath { get; set; }
        }
        [MetadataType(typeof(MovyMetadata))]
        public partial class Movy { }

        public class ShowtimeMetadata
        {
            [Required(ErrorMessage ="*")]
            [Range(0,2359)]
            public short Time { get; set; }
        }
        [MetadataType(typeof(ShowtimeMetadata))]
        public partial class Showtime { }

        public class TheaterMetadata
        {
            [Required(ErrorMessage ="*")]
            [StringLength(75)]
            public string TheaterName { get; set; }
            [Required(ErrorMessage = "*")]
            [StringLength(200)]
            public string Address { get; set; }
            [Required(ErrorMessage = "*")]
            [StringLength(50)]
            public string City { get; set; }
            [Required(ErrorMessage = "*")]
            [StringLength(2)]
            public string State { get; set; }
            [Required(ErrorMessage = "*")]
            [StringLength(5)]
            public string ZipCode { get; set; }
        }
        [MetadataType(typeof(TheaterMetadata))]
        public partial class Theater { }

        public class TheaterMovyMetadata
        {
            [Required(ErrorMessage ="*")]
            [Range(0,127)]
            public byte ReservationLimit { get; set; }
            [Required(ErrorMessage ="*")]
            [DisplayFormat(DataFormatString = "{0:d}")]
            public DateTime Date { get; set; }
        }
        [MetadataType(typeof(TheaterMovyMetadata))]
        public partial class TheaterMovy { }

        public class UserDetailsMetadata
        {
            [Required(ErrorMessage = "*")]
            [StringLength(50)]
            public string FirstName { get; set; }
            [Required(ErrorMessage = "*")]
            [StringLength(50)]
            public string LastName { get; set; }
        }
        [MetadataType(typeof(UserDetailsMetadata))]
        public partial class UserDetail { }
    }
}
