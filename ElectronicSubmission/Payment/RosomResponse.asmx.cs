using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace ElectronicSubmission.Payment
{
    /// <summary>
    /// Summary description for RosomResponse
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class RosomResponse : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public string HelloWorld(string value)
        {
            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.Write("Hello World");

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

        [WebMethod]
        public string OrderstatusUpdate(OrderStatus orderStatus)
        {
            //do what ever
            return "Success";
        }
    }

    [Serializable]
    public class OrderStatus
    {
        public int Id { get; set; }
        public string Reference { get; set; }
    }
}
