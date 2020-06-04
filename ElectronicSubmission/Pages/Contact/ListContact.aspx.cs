using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.Contact
{
    public partial class ListContact : System.Web.UI.Page
    {
        List<Student_Concat> ListContact = new List<Student_Concat>();
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string[] Color = { "green", "orange", "blue", "red", "maroon", "purple", "teal", "deepskyblue", "gray", "hotpink", "blueviolet", "violet", "deepskyblue", "cyan", "olivedrab", "coral", "salmon", "yellow" }; 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");
            ListContact = db.Student_Concat.ToList();

        }

        private void LoadStudent()
        {
            try
            {
                int emp_id = (int)SessionWrapper.LoggedUser.Employee_Id;
                int index = 0;
                //txtAddMeeting.Text = "<a class='btn btn-success btn-round' href='#' > </a>";


                //Start Statistic
                string total = txtFirst.Text = ListContact.Count().ToString();
                string current = txtSecond.Text = ListContact.Count(x => x.Student_Concat_Status != 14 && x.Student_Concat_Status != 15).ToString();
                string approved = txtThird.Text = ListContact.Where(x => x.Student_Concat_Status == 14).Count().ToString();
                string rejected = txtFour.Text = ListContact.Where(x => x.Student_Concat_Status == 15).Count().ToString();

                txtFirstPercentage.Text = CalcPercentage(double.Parse(total), double.Parse(total)) + "%";
                txtSecondPercentage.Text = CalcPercentage(double.Parse(current), double.Parse(total)) + "%";
                txtThirdPercentage.Text = CalcPercentage(double.Parse(approved), double.Parse(total)) + "%";
                txtFourPercentage.Text = CalcPercentage(double.Parse(rejected), double.Parse(total)) + "%";

                txtFirstPercentageCss.Text = "<div class='progress-bar bg-c-lite-green' style='width: " + CalcPercentage(double.Parse(total), double.Parse(total)) + "%'></div>";
                txtSecondPercentageCss.Text = "<div class='progress-bar bg-c-yellow' style='width: " + CalcPercentage(double.Parse(current), double.Parse(total)) + "%'></div>";
                txtThirdPercentageCss.Text = "<div class='progress-bar bg-c-green' style='width: " + CalcPercentage(double.Parse(approved), double.Parse(total)) + "%'></div>";
                txtFourPercentageCss.Text = "<div class='progress-bar bg-c-pink' style='width: " + CalcPercentage(double.Parse(rejected), double.Parse(total)) + "%'></div>";

                //End Statistic

                string str = string.Empty;
                for (int i = 0; i < ListContact.Count; i++)
                {
                    // select the color based on status id
                    index = (int)ListContact[i].Status.Status_Code - 1;
                    if (index >= Color.Length)
                        index = 1;

                    str += "<tr>";
                    str += "<td class='txt-primary'>Expand</td>";
                    str += "<td> <a href= '../../../../Pages/RegistrationProcess/view.aspx?StudentID=" + ListContact[i].Student_Concat_Id + "' style='color:#00c3da;'>&nbsp;&nbsp; <i class='icofont icofont-eye-alt h5'></i>&nbsp;&nbsp;</a>";
                    str += "<td>" + ListContact[i].Status.Status_Name_En + "</td>";
                    str += "<td>" + ListContact[i].Student_Concat_Name + "</td>";
                    str += "<td>" + ListContact[i].Student_Concat_Phone + "</td>";
                    str += "<td>" + ListContact[i].Student_Concat_Email + "</td>";
                    str += "<td>" + ListContact[i].Student_Concat_CreationDate.ToString() + "</td>";
                    str += "<td>" + ListContact[i].Student_Concat_Message + "</td>";
                    str += "</tr>";


                }
                txtStudentList.Text = str;
            }
            catch { Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx"); }
        }

        private double CalcPercentage(double sub, double Total)
        {
            double result = 0;
            result = (sub / Total) * 100;
            return Math.Round(result, 1);
        }

    }
}