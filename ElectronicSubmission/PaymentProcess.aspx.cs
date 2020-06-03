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
    public partial class PaymentProcess : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string Trackingkey = "0";
        bool PageValid = false;
        //bool PaymentDone = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Trackingkey"] != null)
            {
                Trackingkey = Request["Trackingkey"];
                Payment_Process payment = db.Payment_Process.Where(x => x.Payment_Trackingkey == Trackingkey).FirstOrDefault();
                if(payment != null)
                {
                    if (payment.Payment_URL_IsValid != true)
                    {
                        Div_Sucess.Visible = true;
                        Div_invalid.Visible = false;
                        PageValid = false;
                    }
                    else{
                        Div_Sucess.Visible = false;
                        Div_payment.Visible = true;
                        Div_invalid.Visible = false;
                        PageValid = true;
                    }
                    
                }
                else
                {
                    Div_Sucess.Visible = false;
                    Div_payment.Visible = false;
                    Div_invalid.Visible = true;
                }
            }
            else
            {
                Div_payment.Visible = false;
                Div_invalid.Visible = true;
            }
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            if (PageValid)
            {
                Trackingkey = Request["Trackingkey"];
                Payment_Process payment = db.Payment_Process.Where(x => x.Payment_Trackingkey == Trackingkey && x.Payment_URL_IsValid == true).FirstOrDefault();
                if (payment != null)
                {
                    int student_id = (int)payment.Student_Id;
                    string entityId = payment.Send_EntityId;// "8a8294174d0595bb014d05d82e5b01d2";
                    string amount = payment.Send_Amount.ToString();// "92.00";
                    string currency = payment.Send_Currency;// "RS";
                    string paymentType = payment.Send_PaymentType; //"DB";

                    Dictionary<string, dynamic> responseData = Request2(entityId, amount, currency, paymentType);
                    /*string code = responseData["result"]["code"];
                    string description = responseData["result"]["description"];
                    string buildNumber = responseData["buildNumber"];
                    string timestamp = responseData["timestamp"];
                    string ndc = responseData["ndc"];
                    string id = responseData["id"];*/

                    payment.Payment_URL_IsValid = false;
                    db.Entry(payment);
                    db.SaveChanges();

                    PageValid = false;
                    Run_Checkpayment();

                    Response.Redirect("~//PaymentProcess.aspx?Trackingkey=" + Trackingkey);
                }
            }
        }


        public Dictionary<string, dynamic> Request2(string entityId, string amount, string currency, string paymentType)
        {
            string Result = "{'result':{'code':'000.200.100','description':'successfully created checkout'},'buildNumber':'8157609e6e0eada1aa110d0a82ee3af66f6009d5@2020-05-29 07:32:36 +0000','timestamp':'2020-06-02 12:24:42+0000','ndc':'27E0DBE4D0D8465CC94B5862C4EE05D2.uat01-vm-tx02','id':'27E0DBE4D0D8465CC94B5862C4EE05D2.uat01-vm-tx02'}";
            Dictionary<string, dynamic> responseData;
            string data = "entityId="+ entityId +
                "&amount="+ amount +
                "&currency="+ currency +
                "&paymentType="+ paymentType;
            string url = "https://test.oppwa.com/v1/checkouts";
            /*byte[] buffer = Encoding.ASCII.GetBytes(data);
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
            request.Method = "POST";
            request.Headers["Authorization"] = "Bearer OGE4Mjk0MTc0ZDA1OTViYjAxNGQwNWQ4MjllNzAxZDF8OVRuSlBjMm45aA==";
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
            }*/

            responseData = new JavaScriptSerializer().Deserialize<Dictionary<string, dynamic>>(Result);
            return responseData;
        }

        public void Run_Checkpayment()
        {
            CheckPaymentRef.CheckPaymentService payment = new CheckPaymentRef.CheckPaymentService();
            string res = payment.CheckPayment();
        }
    }
}