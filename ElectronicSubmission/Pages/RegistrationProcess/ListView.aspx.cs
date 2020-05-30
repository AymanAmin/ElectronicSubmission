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
        List<Student> ListAllStudent = new List<Student>();
        List<Student> ListStudentWithStatus = new List<Student>();
        List<Sequence> ListSequence = new List<Sequence>();
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string[] Color = { "green", "orange", "blue", "red", "maroon", "purple",  "teal", "deepskyblue", "gray", "yellow", "hotpink", "blueviolet", "violet", "deepskyblue", "cyan", "olivedrab", "coral", "salmon" };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            if(!IsPostBack)
            {
                int GroupID = (int)SessionWrapper.LoggedUser.Group_Id;
                
                List<Group_Status> List_Status = db.Group_Status.Where(x => x.Group_Id == GroupID).ToList();
                
                for (int i = 0; i< List_Status.Count;i++)
                {
                    List<Student> Temp_List = List_Status[i].Status.Students.ToList();
                    ListStudentWithStatus.AddRange(Temp_List);
                }
                List<Student> TempList3 = db.Students.Where(x => x.Student_Employee_Id == SessionWrapper.LoggedUser.Employee_Id ).ToList();
                ListAllStudent = ListStudentWithStatus.Union(TempList3).ToList();

                // List Sequence
                ListSequence = db.Sequences.Where(x => x.Emp_Id == SessionWrapper.LoggedUser.Employee_Id).ToList();
            }
            LoadStudent();
        }

        private void LoadStudent()
        {
            int emp_id = (int)SessionWrapper.LoggedUser.Employee_Id;
            int index = 0;
            //txtAddMeeting.Text = "<a class='btn btn-success btn-round' href='#' > </a>";
            

            //Start Statistic
            string total = txtFirst.Text = ListAllStudent.Count().ToString();
            string current = txtSecond.Text = ListStudentWithStatus.Count().ToString();
            string approved = txtThird.Text = ListSequence.Where(x => x.Status_Id != 4 && x.Status_Id != 9 && x.Status_Id != 15).Count().ToString();
            string rejected = txtFour.Text = ListSequence.Where(x => x.Status_Id == 4 || x.Status_Id == 9 || x.Status_Id == 15).Count().ToString();

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
            for (int i = 0; i < ListAllStudent.Count; i++)
            {
                // select the color based on status id
                index = (int)ListAllStudent[i].Status.Status_Code - 1;
                if (index >= Color.Length)
                    index = 1;

                str += "<tr>";
                str += "<td class='txt-primary'>Expand</td>";
                str += "<td> <a href= '../../../../Pages/RegistrationProcess/view.aspx?StudentID=" + ListAllStudent[i].Student_Id + "' style='color:#00c3da;'> <i class='icofont icofont-eye-alt h6'></i>&nbsp;&nbsp;&nbsp; </a>";
                str += "<a href= '../../../../Pages/RegistrationProcess/StudentInfo.aspx?StudentID=" + ListAllStudent[i].Student_Id + "' style='color:green;'> <i class='icofont icofont-ui-edit h6'> </i></a></td>";
                if (SessionWrapper.LoggedUser.Language_id == 1)
                {
                    str += "<td><label class='label label-success' style='background:" + Color[index] + " !important;'>" + ListAllStudent[i].Status.Status_Name_Ar + "</label></td>";
                    if (ListAllStudent[i].Student_Employee_Id != null) str += "<td>" + ListAllStudent[i].Employee.Employee_Name_Ar + "</td>"; else str += "<td> - </td>";
                }
                else
                {
                    str += "<td><label class='label label-success' style='background:" + Color[index] + " !important;'>" + ListAllStudent[i].Status.Status_Name_En + "</label></td>";
                    if (ListAllStudent[i].Student_Employee_Id != null) str += "<td>" + ListAllStudent[i].Employee.Employee_Name_En + "</td>"; else str += "<td> - </td>";
                }
                

                str += "<td>" + ListAllStudent[i].Student_Name_En + "</td>";
                str += "<td>" + ListAllStudent[i].Student_Name_Ar + "</td>";
                str += "<td>" + ListAllStudent[i].Student_Phone + "</td>";
                str += "<td>" + ListAllStudent[i].Student_Email + "</td>";
                str += "<td>" + ListAllStudent[i].Student_Address + "</td>";
                str += "<td>" + ListAllStudent[i].Student_CreationDate.ToString() + "</td>";
                str += "</tr>";


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