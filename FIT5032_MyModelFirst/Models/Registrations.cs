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
    
    public partial class Registrations
    {
        public int Id { get; set; }
        public string createdAt { get; set; }
        public int StudentsId { get; set; }
        public int ClassesId { get; set; }
        public int ServicesId { get; set; }
    
        public virtual Students Students { get; set; }
        public virtual Classes Classes { get; set; }
        public virtual Services Services { get; set; }
    }
}
