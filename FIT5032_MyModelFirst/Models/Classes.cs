//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FIT5032_MyModelFirst.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Classes
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Classes()
        {
            this.Registrations = new HashSet<Registrations>();
        }
    
        public int Id { get; set; }
        public string startDate { get; set; }
        public string endDate { get; set; }
        public string createdAt { get; set; }
        public int TutorsId { get; set; }
        public int CoursesId { get; set; }
    
        public virtual Tutors Tutors { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Registrations> Registrations { get; set; }
        public virtual Courses Courses { get; set; }
    }
}