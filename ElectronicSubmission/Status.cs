//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ElectronicSubmission
{
    using System;
    using System.Collections.Generic;
    
    public partial class Status
    {
        public Status()
        {
            this.Group_Status = new HashSet<Group_Status>();
            this.Sequences = new HashSet<Sequence>();
            this.Students = new HashSet<Student>();
        }
    
        public int Status_Id { get; set; }
        public Nullable<int> Status_Code { get; set; }
        public string Status_Name_Ar { get; set; }
        public string Status_Name_En { get; set; }
        public Nullable<int> Suspended { get; set; }
    
        public virtual ICollection<Group_Status> Group_Status { get; set; }
        public virtual ICollection<Sequence> Sequences { get; set; }
        public virtual ICollection<Student> Students { get; set; }
    }
}
