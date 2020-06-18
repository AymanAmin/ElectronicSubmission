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
    
    public partial class Rosom_Request
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Rosom_Request()
        {
            this.Rosom_Response = new HashSet<Rosom_Response>();
        }
    
        public int Id { get; set; }
        public string Trackingkey { get; set; }
        public Nullable<int> Payment_Process_Id { get; set; }
        public Nullable<int> PaymentType { get; set; }
        public Nullable<System.DateTime> DateCreation { get; set; }
        public string UUID { get; set; }
        public string Timestamp { get; set; }
        public string MerchantId { get; set; }
        public string Invoice_Students_Id { get; set; }
        public string Invoice_Students_FirstName { get; set; }
        public string Invoice_Students_LastName { get; set; }
        public string InvoiceId { get; set; }
        public string PayeeId { get; set; }
        public string InvoiceStatus { get; set; }
        public string BillType { get; set; }
        public string DisplayInfo { get; set; }
        public string AmountDue { get; set; }
        public string CreateDate { get; set; }
        public string ExpiryDate { get; set; }
        public string PaymentRange_MinPartialAmount { get; set; }
        public string PaymentRange_MinAdvanceAmount { get; set; }
        public string PaymentRange_MaxAdvanceAmount { get; set; }
        public Nullable<bool> IsPaid { get; set; }
        public string Result_JSON { get; set; }
        public string Response_InvoiceId { get; set; }
        public string Response_SADADNumber { get; set; }
        public string Response_Status_Code { get; set; }
        public string Response_Status_Description { get; set; }
    
        public virtual Payment_Process Payment_Process { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Rosom_Response> Rosom_Response { get; set; }
    }
}
