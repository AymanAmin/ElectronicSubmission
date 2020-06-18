using Newtonsoft.Json;
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
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        // GET: api/Rosom
        public string Get(string Rosom)
        {
            /*var s = new JavaScriptSerializer();
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
            string ServiceType = responseData["ServiceType"];*/

            return "";
        }

        // GET: api/Rosom/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Rosom
        public string Post([FromBody]Rosom_Response Rosom)
        {
            Rosom_Request rosom_resquest = db.Rosom_Request.Where(x => x.Response_SADADNumber == Rosom.SADADNumber).FirstOrDefault();
            if(rosom_resquest != null )
            {
                Rosom.Trackingkey = rosom_resquest.Trackingkey;
                Rosom.Payment_Process_Id = rosom_resquest.Payment_Process_Id;
                Rosom.Rosom_Request_Id = rosom_resquest.Id;
                db.Rosom_Response.Add(Rosom);
                db.SaveChanges();

                Payment_Process Pay_process = rosom_resquest.Payment_Process;
                Pay_process.Payment_IsPaid = true;
                Pay_process.Payment_URL_IsValid = false;
                db.Entry(Pay_process).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();

                Student std = Pay_process.Student;
                int new_Status_Id = (int)std.Student_Status_Id + 1;
                std.Student_Status_Id = new_Status_Id;
                db.Entry(std).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();

                // isnert new Sequences record to paid
                Sequence seq = db.Sequences.Create();
                seq.Emp_Id = 1;
                seq.Status_Id = new_Status_Id;
                seq.Student_Id = std.Student_Id;
                seq.Note = "Auto payment";
                seq.DateCreation = DateTime.Now;
                db.Sequences.Add(seq);
                db.SaveChanges();


                db.Configuration.LazyLoadingEnabled = false;
                /* Add it to log file */
                Student stdLogFile = db.Students.Find(std.Student_Id);
                stdLogFile.Employee = db.Employees.Find(seq.Emp_Id);
                stdLogFile.Status = db.Status.Find(seq.Status_Id);

                LogData = "data:" + JsonConvert.SerializeObject(stdLogFile, logFileModule.settings);
                logFileModule.logfile(10, "تغير الحالة تلقائي", "Update Status Automatic", LogData);

                Payment_Process paymentLogFile = db.Payment_Process.Find(Pay_process.Payment_Id);
                LogData = "data:" + JsonConvert.SerializeObject(paymentLogFile, logFileModule.settings);
                logFileModule.logfile(10, "اضافة عملية دفع", "add payment process", LogData);

                return "{'Status': {'Code': 0,'Description': 'Success','Severity': 'Info'}}";
            }

            return "{'Status': {'Code': 2000,'Description': 'Bill not found','Severity': 'Info'}}";

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
