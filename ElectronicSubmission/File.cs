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
    
    public partial class File
    {
        public int File_Id { get; set; }
        public string File_Name { get; set; }
        public string File_Path { get; set; }
        public Nullable<System.DateTime> DateCreation { get; set; }
        public Nullable<int> Student_Id { get; set; }
        public Nullable<int> Type { get; set; }
    
        public virtual Student Student { get; set; }
    }
}
