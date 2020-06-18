using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Script.Serialization;

namespace ElectronicSubmission.Controllers
{
    public class RosomController : ApiController
    {
        // GET: api/Rosom
        public string Get()
        {
            var s = new JavaScriptSerializer();
            /*Dictionary<string, dynamic> responseData = s.Deserialize<Dictionary<string, dynamic>>(value);
            string InvoiceId = responseData["InvoiceId"];
            string PaymentId = responseData["PaymentId"];
            string SADADTransactionId = responseData["SADADTransactionId"];
            string BankTransactionId = responseData["BankTransactionId"];
            string PaidAmount = responseData["PaidAmount"];
            string PaymentDate = responseData["PaymentDate"];

            string SADADNumber = responseData["SADADNumber"];
            string MerchantId = responseData["MerchantId"];
            string BankName = responseData["BankName"];
            string DistrictCode = responseData["DistrictCode"];
            string BranchCode = responseData["BranchCode"];
            string AccessChannel = responseData["AccessChannel"];

            string PmtMethod = responseData["PmtMethod"];
            string PmtType = responseData["PmtType"];
            string ServiceType = responseData["ServiceType"];*/

            return "{'Status': {'Code': 0,'Description': 'Success','Severity': 'Info'}}";
        }

        // GET: api/Rosom/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Rosom
        public string Post([FromBody]string value)
        {
            var s = new JavaScriptSerializer();
            Dictionary<string, dynamic> responseData = s.Deserialize<Dictionary<string, dynamic>>(value);
            string InvoiceId = responseData["InvoiceId"];
            string PaymentId = responseData["PaymentId"];
            string SADADTransactionId = responseData["SADADTransactionId"];
            string BankTransactionId = responseData["BankTransactionId"];
            string PaidAmount = responseData["PaidAmount"];
            string PaymentDate = responseData["PaymentDate"];

            string SADADNumber = responseData["SADADNumber"];
            string MerchantId = responseData["MerchantId"];
            string BankName = responseData["BankName"];
            string DistrictCode = responseData["DistrictCode"];
            string BranchCode = responseData["BranchCode"];
            string AccessChannel = responseData["AccessChannel"];

            string PmtMethod = responseData["PmtMethod"];
            string PmtType = responseData["PmtType"];
            string ServiceType = responseData["ServiceType"];

            return "{'Status': {'Code': 0,'Description': 'Success','Severity': 'Info'}}";

        }

        // PUT: api/Rosom/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Rosom/5
        public void Delete(int id)
        {
        }
    }
}
