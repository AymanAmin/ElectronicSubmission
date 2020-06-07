using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Payment
{
    public partial class PaymentProcess : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string Trackingkey = "", PaymentId = "";
        bool PageValid = false;
        //bool PaymentDone = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Trackingkey"] != null)
            {
                if (Request["PaymentId"] != null)
                {
                    Trackingkey = Request["Trackingkey"];
                    Payment_Process payment = db.Payment_Process.Where(x => x.Payment_Trackingkey == Trackingkey && x.Payment_URL_IsValid == true && x.Payment_IsPaid == false).FirstOrDefault();
                    if (payment != null)
                    {
                        bool payment_result = CheckPaymentStatus(Trackingkey, payment.Result_Id, payment.Send_EntityId);
                        if (payment_result)
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DisplayDiv(2);", true);
                        else
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DisplayDiv(4);", true);
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DisplayDiv(3);", true);
                    }
                        
                }
                else
                {
                    Trackingkey = Request["Trackingkey"];
                    Payment_Process payment = db.Payment_Process.Where(x => x.Payment_Trackingkey == Trackingkey && x.Payment_URL_IsValid == true && x.Payment_IsPaid == false).FirstOrDefault();
                    if (payment != null)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DisplayDiv(1);", true);
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DisplayDiv(4);", true);
                    }
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DisplayDiv(4);", true);
            }

        }

        public bool CheckPaymentStatus(string Trackingkey, string Id,string entityId)
        {
            bool result = false;
            try
            {
                Dictionary<string, dynamic> responseData = CheckStatusPaymentRequest(Id, entityId);
                if (responseData["result"]["code"] == "000.200.100")
                {
                    Payment_Process PaymentProcess_update = db.Payment_Process.Find(Trackingkey);
                    PaymentProcess_update.Payment_IsPaid = true;
                    PaymentProcess_update.Payment_URL_IsValid = false;
                    PaymentProcess_update.Result_Code = responseData["result"]["code"];
                    PaymentProcess_update.Result_Description = responseData["result"]["description"];
                    PaymentProcess_update.Result_BuildNumber = responseData["buildNumber"];
                    PaymentProcess_update.Result_Timestamp = responseData["timestamp"];
                    PaymentProcess_update.Result_Ndc = responseData["ndc"];
                    PaymentProcess_update.Result_Id = responseData["id"];
                    PaymentProcess_update.Payment_Date = DateTime.Now;
                    db.Entry(PaymentProcess_update).State = System.Data.EntityState.Modified;
                    db.SaveChanges();
                    result = true;
                }
            }
            catch { }
            return result;
        }

        public Dictionary<string, dynamic> CheckStatusPaymentRequest(string Id,string entityId)
        {
            //string Result = "{'result':{'code':'000.200.100','description':'successfully created checkout'},'buildNumber':'8157609e6e0eada1aa110d0a82ee3af66f6009d5@2020-05-29 07:32:36 +0000','timestamp':'2020-06-02 12:24:42+0000','ndc':'27E0DBE4D0D8465CC94B5862C4EE05D2.uat01-vm-tx02','id':'27E0DBE4D0D8465CC94B5862C4EE05D2.uat01-vm-tx02'}";
            Dictionary<string, dynamic> responseData;
           
                string data = "entityId="+ entityId;
                string url = "https://test.oppwa.com/v1/checkouts/"+Id+"/payment?" + data;
                HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
                request.Method = "GET";
                request.Headers["Authorization"] = "Bearer OGFjN2E0Yzg3Mjg0ZjZjOTAxNzI4ZTYxMTI5YjE1MGF8TldCblpGNUdUYg==";
                using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    Stream dataStream = response.GetResponseStream();
                    StreamReader reader = new StreamReader(dataStream);
                    var s = new JavaScriptSerializer();
                    responseData = s.Deserialize<Dictionary<string, dynamic>>(reader.ReadToEnd());
                    reader.Close();
                    dataStream.Close();
                }
            
          
            //responseData = new JavaScriptSerializer().Deserialize<Dictionary<string, dynamic>>(Result);  
           
            return responseData;
        }

        public void Run_Checkpayment()
        {
            CheckPaymentRef.CheckPaymentService payment = new CheckPaymentRef.CheckPaymentService();
            string res = payment.CheckPayment();
        }
    }
}