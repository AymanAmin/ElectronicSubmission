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
    
    public partial class Nationality
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Nationality()
        {
            this.Students = new HashSet<Student>();
        }
    
        public int Nationality_Id { get; set; }
        public string Country_code { get; set; }
        public string Country_Name_En { get; set; }
        public string Country_Name_Ar { get; set; }
        public string Nationality_Name_En { get; set; }
        public string Nationality_Name_Ar { get; set; }
    
        public virtual Nationality Nationality1 { get; set; }
        public virtual Nationality Nationality2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Student> Students { get; set; }
    }
}
