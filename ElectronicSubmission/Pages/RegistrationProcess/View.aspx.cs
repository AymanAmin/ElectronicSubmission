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
        string[] Color = { "green", "orange", "blue", "red", "maroon", "purple", "teal", "deepskyblue", "gray", "yellow", "hotpink", "blueviolet", "violet", "deepskyblue", "cyan", "olivedrab", "coral", "salmon" };
        int student_record_id = 0;
        bool EnableEditActions = false, EnableEditAssign = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            if (Request["StudentID"] == null)
                Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx");
            else
                student_record_id = int.Parse(Request["StudentID"].ToString());


            if (!IsPostBack)
            {
                //Fill Employee DropDown List
                FillEmployeeDropDown();

                //Get Current student Record
                Student student = db.Students.Find(student_record_id);

                //Get Current student information
                LoadStudentInfo(student);

                //Rename button names
                btnAssign.Text = FieldNames.getFieldName("View-Assign", "Assign");
                btnApprove.Text = FieldNames.getFieldName("View-Approve", "Approve");
                btnReject.Text = FieldNames.getFieldName("View-Reject", "Reject");
            }
        }

        private void FillEmployeeDropDown()
        {
            Status status = db.Status.Where(x => x.Status_Code == 3).FirstOrDefault();
            if (status == null)
                return;

            List<Group_Status> Group_Status_List = status.Group_Status.ToList();

            List<Employee> EmpList = new List<Employee>();
            for(int i =0; i < Group_Status_List.Count; i++)
            {
                List<Employee> Temp_List = Group_Status_List[i].Group.Employees.ToList();
                EmpList.AddRange(Temp_List);
            }
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(txtEmployees, "Employee_Id", "Employee_Name_Ar", EmpList, "أختر الموظف");
            else
                ddlFiller.dropDDL(txtEmployees, "Employee_Id", "Employee_Name_En", EmpList, "Select Employee");

        }

        private void LoadStudentInfo(Student std)
        {
            try
            {
                if (std != null)
                {
                    // select the color based on status id
                    int index = (int)std.Student_Status_Id - 1;
                    if (index > Color.Length) index = 1;

                    // Set profile image
                    txtProfileImage.ImageUrl = "~/media/Profile/" + std.Student_Image_Profile_Id;

                    // load other data
                    txtStudent_Id.Text = std.Student_Id.ToString();
                    txtStudent_SSN.Text = std.Student_SSN;
                    txtStudent_Name.Text = std.Student_Name_En;
                    txtStudent_Phone.Text = std.Student_Phone;
                    txtStudent_Email.Text = std.Student_Email;
                    txtStudent_Address.Text = std.Student_Address;

                    txtStatus.Text = "<span class='label label-warning' style='background:" + Color[index] + " !important;'>" + std.Status.Status_Name_En + "</span>";
                    txtStudent_Nationality.Text = std.Nationality.Nationality_Name_En;
                    txtStudent_Resource.Text = std.Resource.Resource_Name_En;

                    txtStudent_Capabilities_Degree.Text = " " + std.Student_Capabilities_Degree + "%";
                    txtStudent_High_School_Degree.Text = " " + std.Student_High_School_Degree + "%";
                    txtStudent_My_Achievement_Degree.Text = " " + std.Student_My_Achievement_Degree + "%";
                    txtStudent_Total.Text = " " + std.Student_Total + "%";

                    DateTime date = DateTime.Parse(std.Student_CreationDate.ToString());
                    txtStudent_CreationDate.Text = date.ToShortDateString();

                    // Change status to pendding if it's new
                    if (std.Status.Status_Code == 1)
                    {
                        std.Student_Status_Id = 2;
                        db.Entry(std).State = System.Data.EntityState.Modified;

                        Sequence seq = db.Sequences.Create();

                        seq.Emp_Id = SessionWrapper.LoggedUser.Employee_Id;
                        seq.Status_Id = 2;
                        seq.Student_Id = std.Student_Id;
                        seq.DateCreation = DateTime.Now;

                        db.Sequences.Add(seq);
                        db.SaveChanges();
                    }
                    // Set action if it's allow
                    IsAllowToTakeAction((int)std.Student_Status_Id, student_record_id);

                    //Set Action
                    SetActions();

                    // Load Files
                    LoadStudentFiles(std.Student_Id);

                    //Load sequence
                    LoadSequence(std.Student_Id);

                }
            }
            catch { }
        }

        private void SetActions()
        {
            if (EnableEditActions)
                DivAction.Visible = true;

            if (EnableEditAssign)
                DivAssign.Visible = true;
        }

        private void LoadStudentFiles(int Student_Id)
        {
            try
            {
                string str = string.Empty;
                List<File> List_File = db.Files.Where(x => x.Student_Id == Student_Id).OrderBy(x => x.Type).ToList();
                for (int i = 0; i < List_File.Count; i++)
                {
                    string fileType = string.Empty;
                    if (List_File[i].Type == (int)FileType.ProfileImage) { txtProfileImage.ImageUrl = List_File[i].File_Path; continue; }
                    else if (List_File[i].Type == (int)FileType.Nationality) fileType = FieldNames.getFieldName("View-Nationality", "Nationality");
                    else if (List_File[i].Type == (int)FileType.Capabilities) fileType = FieldNames.getFieldName("View-Capabilities", "Capabilities");
                    else if (List_File[i].Type == (int)FileType.High_School) fileType = FieldNames.getFieldName("View-HighSchool", "High School");
                    else if (List_File[i].Type == (int)FileType.My_Achievement) fileType = FieldNames.getFieldName("View-MyAchievement", "My Achievement");
                    str += "<tr>" +
                           "<td>" +
                           "<h6>" + fileType + "</h6>" +
                           "</td>" +
                           "<td> " + List_File[i].File_Name + " </td>" +
                           "<td><a href = '#' target='_blank' style ='font-size: x-large; color: green;' ><i class='icofont icofont-ui-edit'></i></a></td>" +
                           "<td><a href = '../../../../media/StudentAttachment/" + List_File[i].File_Path + "' target='_blank' style='font-size: x-large; color: blue;'><i class='icofont icofont-eye-alt'></i></a></td>" +
                           "</tr>";
                }
                txtFiles.Text = str;
            }
            catch { }
        }

        public void IsAllowToTakeAction(int Current_Status_Id, int StatusId)
        {
            Group_Status GS = db.Group_Status.Where(x => x.Group_Id == SessionWrapper.LoggedUser.Group_Id && x.Status_Id == StatusId).FirstOrDefault();
            if (GS != null)
                EnableEditActions = true;
            else
                EnableEditActions = false;

            if (Current_Status_Id == 1 || Current_Status_Id == 2)
            {
                EnableEditAssign = true;
                EnableEditActions = false;
            }
            else
            {
                EnableEditAssign = false;
            }

        }


        public void LoadSequence(int Student_Id)
        {
            string CssClass = "icofont icofont-exchange";//string.Empty;
            string str = string.Empty;
            List<Sequence> sequence = db.Sequences.Where(x => x.Student_Id == Student_Id).ToList();
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

                // select the color based on status id
                int index = (int)sequence[i].Status_Id - 1;
                if (index > Color.Length) index = 1;

                str += "<div class='row m-b-25'>" +
                                "<div class='col-auto p-r-0' style='margin-top:3%;'>" +
                                "<a class='btn btn-lg txt-muted btn-icon' href='#' role='button' style='font-size:150%;border-color:" + Color[index] + ";color: " + Color[index] + " !important;" + marginRight_RTL + "'>" + space + "<i class='" + CssClass + "'></i></a>" +
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

        protected void Refresh_Click(object sender, EventArgs e)
        {
            /*int UserID = SessionWrapper.LoggedUser.Employee_Id;
            LoadSequence(UserID);*/
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            int student_record_id = int.Parse(Request["StudentID"].ToString());
            Student std = db.Students.Find(student_record_id);
            if (std != null)
            {
                int newStatus = (int)std.Student_Status_Id + 1;
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

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            Student std = db.Students.Find(student_record_id);
            if (std != null)
            {
                std.Student_Status_Id = int.Parse(txtEmployees.SelectedValue);
                db.Entry(std).State = System.Data.EntityState.Modified;

                Sequence seq = db.Sequences.Create();

                seq.Emp_Id = SessionWrapper.LoggedUser.Employee_Id;
                seq.Status_Id = 3; // Assigned
                seq.Student_Id = student_record_id;
                seq.DateCreation = DateTime.Now;

                db.Sequences.Add(seq);
                db.SaveChanges();
            }

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


    }
}