//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ElectronicSubmission
{
    using System;
    using System.Collections.Generic;
    
    public partial class Sequence
    {
        public int Sequence_Id { get; set; }
        public Nullable<int> Emp_Id { get; set; }
        public Nullable<int> Status_Id { get; set; }
        public Nullable<int> Student_Id { get; set; }
        public Nullable<System.DateTime> DateCreation { get; set; }
        public string Note { get; set; }
    
        public virtual Employee Employee { get; set; }
        public virtual Status Status { get; set; }
        public virtual Student Student { get; set; }
    }
}
