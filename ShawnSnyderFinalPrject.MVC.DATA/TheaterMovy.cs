//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShawnSnyderFinalPrject.MVC.DATA
{
    using System;
    using System.Collections.Generic;
    
    public partial class TheaterMovy
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TheaterMovy()
        {
            this.SeatIDs = new HashSet<SeatID>();
        }
    
        public int TMID { get; set; }
        public int TheaterID { get; set; }
        public int MovieID { get; set; }
        public int ShowtimeID { get; set; }
        public byte ReservationLimit { get; set; }
        public System.DateTime Date { get; set; }
    
        public virtual Movy Movy { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SeatID> SeatIDs { get; set; }
        public virtual Showtime Showtime { get; set; }
        public virtual Theater Theater { get; set; }
    }
}
