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
    
    public partial class Tutors
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tutors()
        {
            this.Classes = new HashSet<Classes>();
        }
    
        public int Id { get; set; }
        public string firstname { get; set; }
        public string surname { get; set; }
        public string intro { get; set; }
        public string position { get; set; }
        public string createdAt { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Classes> Classes { get; set; }
        public virtual Users Users { get; set; }
    }
}