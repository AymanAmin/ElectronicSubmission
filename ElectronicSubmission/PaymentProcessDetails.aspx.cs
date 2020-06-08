using Newtonsoft.Json;
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

namespace ElectronicSubmission
{
    public partial class PaymentProcessDetails : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string Trackingkey = "";
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Trackingkey"] != null)
            {
                Trackingkey = Request["Trackingkey"];
                Payment_Process payment = db.Payment_Process.Where(x => x.Payment_Trackingkey == Trackingkey && x.Payment_URL_IsValid == true && x.Payment_IsPaid == false).FirstOrDefault();
                if (payment != null)
                {
                    Div_payment.Visible = true;
                }
                else
                {
                    Div_NotFound.Visible = true;
                }
            }
            else
            {
                Div_invalid.Visible = true;
            }
        }

        public void confirm_To_Payment()
        {
            try { 
            /*  Start Prepare the checkout  */
            Payment_Process checkout_payment = db.Payment_Process.Where(x => x.Payment_Trackingkey == Trackingkey && x.Payment_URL_IsValid == true && x.Payment_IsPaid == false).FirstOrDefault();
                if (checkout_payment != null)
                {
                    Dictionary<string, dynamic> responseData =
                        Prepare_Check_Payment_Request(checkout_payment.Send_EntityId, checkout_payment.Send_Amount.ToString(), checkout_payment.Send_Currency, checkout_payment.Send_PaymentType, StudentName.Text, Studentsurname.Text, StudentEmail.Text, StudentCountry.Text, StudentState.Text, StudentCity.Text, StudentAddress.Text, StudentPostcode.Text);
                    if (responseData["result"]["code"] == "000.200.100")
                    {
                        checkout_payment.Result_Code = responseData["result"]["code"];
                        checkout_payment.Result_Description = responseData["result"]["description"];
                        checkout_payment.Result_BuildNumber = responseData["buildNumber"];
                        checkout_payment.Result_Timestamp = responseData["timestamp"];
                        checkout_payment.Result_Ndc = responseData["ndc"];
                        checkout_payment.Result_Id = responseData["id"];
                        db.Entry(checkout_payment);
                        db.SaveChanges();
                        Response.Redirect("~/Payment/PaymentProcess.aspx?Trackingkey=" + Trackingkey);
                    }
                    else
                    {

                    }
                }
            }catch (Exception er)
            {
                db.Configuration.LazyLoadingEnabled = false;
                /* Add it to log file */

                LogData = "data:" + JsonConvert.SerializeObject(er.StackTrace, logFileModule.settings);
                logFileModule.logfile(10, "خطأ جديد التجهيز للدفع", "New Exception in Checkout", LogData);
            }
            /* End Prepare the checkout */
        }

        public Dictionary<string, dynamic> Prepare_Check_Payment_Request(string entityId, string amount, string currency, string paymentType,string Name, string surname, string Email, string Country, string State, string City, string Address, string Postcode)
        {
            //string Result = "{'result':{'code':'000.200.100','description':'successfully created checkout'},'buildNumber':'8157609e6e0eada1aa110d0a82ee3af66f6009d5@2020-05-29 07:32:36 +0000','timestamp':'2020-06-02 12:24:42+0000','ndc':'27E0DBE4D0D8465CC94B5862C4EE05D2.uat01-vm-tx02','id':'27E0DBE4D0D8465CC94B5862C4EE05D2.uat01-vm-tx02'}";
            Dictionary<string, dynamic> responseData;
            string data = "entityId=" + entityId +
                "&amount=" + amount +
                "&currency=" + currency +
                "&paymentType=" + paymentType;
            string url = "https://test.oppwa.com/v1/checkouts";
            byte[] buffer = Encoding.ASCII.GetBytes(data);
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
            request.Method = "POST";
            request.Headers["Authorization"] = "Bearer OGFjN2E0Yzg3Mjg0ZjZjOTAxNzI4ZTYxMTI5YjE1MGF8TldCblpGNUdUYg==";
            request.ContentType = "application/x-www-form-urlencoded";
            Stream PostData = request.GetRequestStream();
            PostData.Write(buffer, 0, buffer.Length);
            PostData.Close();
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

        protected void confirm_Click(object sender, EventArgs e)
        {
            confirm_To_Payment();
        }
    }

}