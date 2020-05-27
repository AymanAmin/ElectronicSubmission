using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ElectronicSubmission.Enums;

namespace ElectronicSubmission.Pages.RegistrationProcess
{
    public partial class View : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string[] Color = { "blue", "purple", "green", "black", "red", "orange", "maroon", "teal", "deepskyblue", "gray", "yellow", "hotpink", "blueviolet", "violet", "deepskyblue", "cyan", "olivedrab", "coral", "salmon" };
        protected void Page_Load(object sender, EventArgs e)
        {
            int student_record_id = 1;
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            if (Request["StudentID"] == null)
                Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx");
            else
                student_record_id = int.Parse(Request["StudentID"].ToString());

            
            //List<> Status_List = db.Status.Where(x => x.)

            if (!IsPostBack)
            {
                int UserID = SessionWrapper.LoggedUser.Employee_Id;

                LoadActivity(student_record_id);
                LoadStudentInfo(student_record_id);
                LoadStudentFiles(student_record_id);

                btnApprove.Text = FieldNames.getFieldName("View-Approve", "Approve");
                btnReject.Text = FieldNames.getFieldName("View-Reject", "Reject");
            }
        }

        private void LoadStudentInfo(int Id)
        {
            try
            {
                Student std = db.Students.Find(Id);
                if (std != null)
                {
                    txtStudent_Id.Text = std.Student_Id.ToString();
                    txtStudent_SSN.Text = std.Student_SSN;
                    txtStudent_Name.Text = std.Student_Name_En;
                    txtStudent_Phone.Text = std.Student_Phone;
                    txtStudent_Email.Text = std.Student_Email;
                    txtStudent_Address.Text = std.Student_Address;

                    txtStatus.Text = std.Status.Status_Name_En;
                    txtStudent_Nationality.Text = std.Nationality.Nationality_Name_En;
                    txtStudent_Resource.Text = std.Resource.Resource_Name_En;

                    txtStudent_Capabilities_Degree.Text = " " + std.Student_Capabilities_Degree + "%";
                    txtStudent_High_School_Degree.Text = " " + std.Student_High_School_Degree + "%";
                    txtStudent_My_Achievement_Degree.Text = " " + std.Student_My_Achievement_Degree + "%";
                    txtStudent_Total.Text = " " + std.Student_Total + "%";

                    DateTime date = DateTime.Parse(std.Student_CreationDate.ToString());
                    txtStudent_CreationDate.Text = date.ToShortDateString();
                }
            }
            catch { }
        }

        private void LoadStudentFiles(int Id)
        {
            try
            {
                string str = string.Empty;
                List<File> List_File = db.Files.Where(x => x.Student_Id == Id).ToList();
                for (int i = 0; i < List_File.Count; i++)
                {
                    string fileType = string.Empty;
                    if (List_File[i].Type == (int)FileType.ProfileImage) { txtProfileImage.ImageUrl = List_File[i].File_Path; continue; }
                    else if (List_File[i].Type == (int)FileType.Nationality) fileType = "Nationality";
                    else if (List_File[i].Type == (int)FileType.Capabilities) fileType = "Capabilities";
                    else if (List_File[i].Type == (int)FileType.High_School) fileType = "High_School";
                    else if (List_File[i].Type == (int)FileType.My_Achievement) fileType = "My_Achievement";
                    str += "<tr>" +
                           "<td>" +
                           "<h6>"+ fileType + "</h6>" +
                           "<p> "+ List_File[i].File_Name + " </p>" +
                           "</td>" +
                           "<td><a href = '#' target='_blank' style ='font-size: x-large; color: green;' ><i class='icofont icofont-ui-edit'></i></a></td>" +
                           "<td><a href = '#' target='_blank' style='font-size: x-large; color: red;'><i class='icofont icofont-ui-delete'></i></a></td>" +
                           "<td><a href = '"+ List_File[i].File_Path+ "' target='_blank' style='font-size: x-large; color: blue;'><i class='icofont icofont-eye-alt'></i></a></td>" +
                           "</tr>";
                }
                txtFiles.Text = str;
            }
            catch { }
        }


        public void LoadActivity(int Id)
        {
            string CssClass = "icofont icofont-exchange";//string.Empty;
            string str = string.Empty;
            int counter = 0;
            List<Sequence> sequence = db.Sequences.Where(x => x.Student_Id == Id).ToList();
            sequence = sequence.OrderByDescending(x => x.DateCreation).Take(100).ToList();
            List<Status> Status_List = db.Status.ToList();

            for (int i = 0; i < sequence.Count; i++)
            {
                string activity_verb = FieldNames.getFieldName("View-ChangeStatusTo", "Change Status To") + " ";

                // get data based on language
                string Log_Name = sequence[i].Status.Status_Name_En;
                if (SessionWrapper.LoggedUser.Language_id == 1)
                {
                    Log_Name = sequence[i].Status.Status_Name_Ar;
                }

                if (Log_Name == null || Log_Name == "")
                    Log_Name = "Unknow";

                
                string space = string.Empty, per_name = string.Empty;
                string marginRight_RTL = string.Empty;

                per_name = sequence[i].Employee.Employee_Name_En;
                if (SessionWrapper.LoggedUser.Language_id != 1)
                {
                    space = "&nbsp;";

                }
                else
                {
                    marginRight_RTL = "margin-right:20% !important;";
                }
                counter++;
                if (counter >= Color.Length)
                    counter = counter - Color.Length;

                str += "<div class='row m-b-25'>" +
                                "<div class='col-auto p-r-0' style='margin-top:3%;'>" +
                                "<a class='btn btn-lg txt-muted btn-icon' href='#' role='button' style='font-size:150%;border-color:" + Color[counter] + ";color: " + Color[counter] + " !important;" + marginRight_RTL + "'>" + space + "<i class='" + CssClass + "'></i></a>" +
                                "</div>" +
                                "<div class='col'>" +
                                "<h6 class='m-b-5'>" + per_name + "</h6>" +
                                "<p class='text-muted m-b-0'>" + "<span style='color:green'>" + activity_verb + "</span>" + Log_Name + " </p>" +
                                "<p class='text-muted m-b-0'> <i class='feather icon-clock m-r-10'></i> " + Date_Different((DateTime)sequence[i].DateCreation) + "</p>" +
                                "</div>" +
                            "</div>";
            }
            Activity.Text = str;
        }

        public string Date_Different(DateTime ReveviedDate)
        {

            string Different = "Unkown time";
            if (SessionWrapper.LoggedUser.Language_id == 1)
                Different = "غير معروف";
            try
            {
                // Get the current DateTime.
                DateTime now = DateTime.Now;

                // Get the TimeSpan of the difference.
                TimeSpan elapsed = now.Subtract(ReveviedDate);


                // Get number of days ago.
                int Ago = (int)elapsed.TotalDays;

                if (Ago > 366)
                {
                    if (SessionWrapper.LoggedUser.Language_id == 2)
                        Different = Ago / 366 + " Years";
                    else
                        Different = "منذ " + Ago / 366 + " سنة";
                }
                else if (Ago >= 30)
                {
                    if (SessionWrapper.LoggedUser.Language_id == 2)
                        Different = Ago / 30 + " Mounths";
                    else
                        Different = "منذ " + Ago / 30 + " شهر";
                }
                else if (Ago >= 7)
                {
                    if (SessionWrapper.LoggedUser.Language_id == 2)
                        Different = Ago / 7 + " Weeks";
                    else
                        Different = "منذ " + Ago / 7 + " اسبوع";
                }
                else if (Ago < 1)
                {
                    Ago = (int)elapsed.TotalHours;

                    if (Ago < 1)
                    {
                        Ago = (int)elapsed.TotalMinutes;
                        if (Ago < 1)
                        {
                            Ago = (int)elapsed.Seconds;
                            if (SessionWrapper.LoggedUser.Language_id == 2)
                                Different = Ago + " Seconds";
                            else
                                Different = "منذ " + Ago + " ثانية";
                        }
                        else if (SessionWrapper.LoggedUser.Language_id == 2)
                            Different = Ago + " Minutes";
                        else
                            Different = "منذ " + Ago + " دقيقة";
                    }
                    else if (SessionWrapper.LoggedUser.Language_id == 2)
                        Different = Ago + " Hours";
                    else
                        Different = "منذ " + Ago + " ساعة";

                }
                else if (SessionWrapper.LoggedUser.Language_id == 2)
                    Different = Ago + " days";
                else
                    Different = "منذ " + Ago + " يوم";
            }
            catch { }

            return Different;
        }

        protected void Refresh_Click(object sender, EventArgs e)
        {
            int UserID = SessionWrapper.LoggedUser.Employee_Id;
            LoadActivity(UserID);
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            int student_record_id = int.Parse(Request["StudentID"].ToString());
            Student std = db.Students.Find(student_record_id);
            if(std!= null)
            {
                int newStatus =(int) std.Student_Status_Id + 1;
                std.Student_Status_Id = newStatus;
                db.Entry(std).State = System.Data.EntityState.Modified;

                Sequence seq = db.Sequences.Create();
                
                seq.Emp_Id = SessionWrapper.LoggedUser.Employee_Id;
                seq.Status_Id = newStatus;
                seq.Student_Id = student_record_id;
                seq.DateCreation = DateTime.Now;

                db.Sequences.Add(seq);
                db.SaveChanges();
            }

        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            int student_record_id = int.Parse(Request["StudentID"].ToString());
            Student std = db.Students.Find(student_record_id);
            if (std != null)
            {
                int newStatus = (int)std.Student_Status_Id - 1;
                if (newStatus < 1)
                    return;

                std.Student_Status_Id = newStatus;
                db.Entry(std).State = System.Data.EntityState.Modified;

                Sequence seq = db.Sequences.Create();

                seq.Emp_Id = SessionWrapper.LoggedUser.Employee_Id;
                seq.Status_Id = newStatus;
                seq.Student_Id = student_record_id;
                seq.DateCreation = DateTime.Now;

                db.Sequences.Add(seq);
                db.SaveChanges();
            }
        }
    }
}