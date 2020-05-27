using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.RegistrationProcess
{
    public partial class ListView : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string[] Color = { "blue", "purple", "green", "black", "red", "orange", "maroon", "teal", "deepskyblue", "gray", "yellow", "hotpink", "blueviolet", "violet", "deepskyblue", "cyan", "olivedrab", "coral", "salmon" };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            int student_record_id = 2;
            LoadStudent(student_record_id);
        }

        private void LoadStudent(int StatusID)
        {
            int emp_id = (int)SessionWrapper.LoggedUser.Employee_Id;
            int counter = 0;
            //txtAddMeeting.Text = "<a class='btn btn-success btn-round' href='#' > </a>";
            List<Student> ListStudent = db.Students.ToList();

            List<Sequence> ListSequence = db.Sequences.ToList();

            //Start Statistic
            string total = txtFirst.Text = ListStudent.Count().ToString();
            string current = txtSecond.Text = ListStudent.Where(x => x.Student_Status_Id == StatusID).Count().ToString();
            string approved = txtThird.Text = ListStudent.Where(x => x.Student_Status_Id > StatusID).Count().ToString();
            string rejected = txtFour.Text = ListStudent.Where(x => x.Student_Status_Id < StatusID).Count().ToString();

            txtFirstPercentage.Text = CalcPercentage(double.Parse(total) , double.Parse(total)) + "%";
            txtSecondPercentage.Text = CalcPercentage(double.Parse(current), double.Parse(total)) + "%";
            txtThirdPercentage.Text = CalcPercentage(double.Parse(approved), double.Parse(total)) + "%";
            txtFourPercentage.Text = CalcPercentage(double.Parse(rejected), double.Parse(total)) + "%";

            txtFirstPercentageCss.Text = "<div class='progress-bar bg-c-green' style='width: " + CalcPercentage(double.Parse(total), double.Parse(total)) + "%'></div>";
            txtSecondPercentageCss.Text = "<div class='progress-bar bg-c-lite-green' style='width: " + CalcPercentage(double.Parse(current), double.Parse(total)) + "%'></div>";
            txtThirdPercentageCss.Text = "<div class='progress-bar bg-c-pink' style='width: " + CalcPercentage(double.Parse(approved), double.Parse(total)) + "%'></div>";
            txtFourPercentageCss.Text = "<div class='progress-bar bg-c-yellow' style='width: " + CalcPercentage(double.Parse(rejected), double.Parse(total)) + "%'></div>";

            //End Statistic

            string str = string.Empty;
            for (int i = 0; i < ListStudent.Count; i++)
            {

                if (counter >= ListStudent.Count)
                    counter = 0;
                str += "<tr>";
                str += "<td class='txt-primary'>Expand</td>";
                str += "<td> <a href= '../../../../Pages/RegistrationProcess/view.aspx?StudentID=" + ListStudent[i].Student_Id + "' style='color:#00c3da;'> <i class='icofont icofont-eye-alt h6'></i>&nbsp;&nbsp;&nbsp; </a>";
                str += "<a href= '../../../../Pages/RegistrationProcess/view?StudentID=" + ListStudent[i].Student_Id + "' style='color:green;'> <i class='icofont icofont-ui-edit h6'> </i></a></td>";
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    str += "<td><label class='label label-success' style='background-color:" + Color[counter] + "'>" + ListStudent[i].Status.Status_Name_Ar + "</label></td>";
                else
                    str += "<td> <label class='label label-success' style='background-color:" + Color[counter] + "'>" + ListStudent[i].Status.Status_Name_En + "</label></td>";

                str += "<td>" + ListStudent[i].Student_Name_En + "</td>";
                str += "<td>" + ListStudent[i].Student_Name_Ar + "</td>";
                str += "<td>" + ListStudent[i].Student_Phone + "</td>";
                str += "<td>" + ListStudent[i].Student_Email + "</td>";
                str += "<td>" + ListStudent[i].Student_Address + "</td>";
                str += "<td>" + ListStudent[i].Student_CreationDate.ToString() + "</td>";
                str += "</tr>";

                counter++;
            }
            txtStudentList.Text = str;
        }

        private double CalcPercentage(double sub, double Total)
            {
            double result = 0;
            result = (sub / Total) * 100;
            return Math.Round(result, 1);
            }
    }
}