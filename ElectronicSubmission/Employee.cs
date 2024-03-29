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
    
    public partial class Employee
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Employee()
        {
            this.Log_File = new HashSet<Log_File>();
            this.Notification_Employee = new HashSet<Notification_Employee>();
            this.Sequences = new HashSet<Sequence>();
            this.Students = new HashSet<Student>();
        }
    
        public int Employee_Id { get; set; }
        public string Employee_Name_Ar { get; set; }
        public string Employee_Name_En { get; set; }
        public string Employee_Email { get; set; }
        public string Employee_Phone { get; set; }
        public Nullable<int> Group_Id { get; set; }
        public string Employee_Profile { get; set; }
        public string Employee_Password { get; set; }
        public Nullable<bool> Employee_Active { get; set; }
        public Nullable<int> Language_id { get; set; }
    
        public virtual Group Group { get; set; }
        public virtual LanguageMaster LanguageMaster { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Log_File> Log_File { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Notification_Employee> Notification_Employee { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Sequence> Sequences { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Student> Students { get; set; }
    }
}
