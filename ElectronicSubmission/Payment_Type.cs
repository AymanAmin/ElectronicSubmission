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
    
    public partial class Payment_Type
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Payment_Type()
        {
            this.Payment_Process = new HashSet<Payment_Process>();
        }
    
        public int Payment_Type_Id { get; set; }
        public string Payment_Name_Ar { get; set; }
        public string Payment_Name_En { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Payment_Process> Payment_Process { get; set; }
    }
}
