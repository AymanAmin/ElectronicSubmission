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
        bool PageValid = false;
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
                    int student_Id = 0;
                    int.TryParse(payment.Student_Id.ToString(),out student_Id);
                    var student = db.Students.FirstOrDefault(x => x.Student_Id == student_Id);
                    if (student != null)
                    {
                        StudentName.Text = student.Student_Name_En;
                        StudentEmail.Text = student.Student_Email;
                    }
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
            string Entity_ID = "";
            try { 
            /*  Start Prepare the checkout  */
            Payment_Process checkout_payment = db.Payment_Process.Where(x => x.Payment_Trackingkey == Trackingkey && x.Payment_URL_IsValid == true && x.Payment_IsPaid == false).FirstOrDefault();
                if (checkout_payment != null)
                {
                    if (PaymentType.SelectedValue == "1" || PaymentType.SelectedValue == "2") Entity_ID = "8ac7a4c87284f6c901728e6183ff150e"; else Entity_ID = "8ac7a4c87284f6c901728e633a371512";
                    Dictionary<string, dynamic> responseData =
                        Prepare_Check_Payment_Request(Entity_ID, checkout_payment.Send_Amount.ToString(), checkout_payment.Send_Currency, checkout_payment.Send_PaymentType, StudentName.Text, Studentsurname.Text, StudentEmail.Text, StudentCountry.Text, StudentState.Text, StudentCity.Text, StudentAddress.Text, StudentPostcode.Text);
                    if (responseData["result"]["code"] == "000.200.100")
                    {
                        checkout_payment.Result_Code = responseData["result"]["code"];
                        checkout_payment.Result_Description = responseData["result"]["description"];
                        checkout_payment.Result_BuildNumber = responseData["buildNumber"];
                        checkout_payment.Result_Timestamp = responseData["timestamp"];
                        checkout_payment.Result_Ndc = responseData["ndc"];
                        checkout_payment.Result_Id = responseData["id"];
                        checkout_payment.Send_EntityId = Entity_ID;
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

                LogData = "data:" + JsonConvert.SerializeObject(er, logFileModule.settings);
                logFileModule.logfile(10, "خطأ جديد التجهيز للدفع", "New Exception in Checkout", LogData);
            }
            /* End Prepare the checkout */
        }

        public Dictionary<string, dynamic> Prepare_Check_Payment_Request(string entityId, string amount, string currency, string paymentType,string Name, string surname, string Email, string Country, string State, string City, string Address, string Postcode)
        {
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
            return responseData;
        }

        protected void confirm_Click(object sender, EventArgs e)
        {
            confirm_To_Payment();
        }
    }

}