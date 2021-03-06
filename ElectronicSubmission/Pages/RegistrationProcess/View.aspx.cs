﻿using Newtonsoft.Json;
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
using static ElectronicSubmission.Enums;

namespace ElectronicSubmission.Pages.RegistrationProcess
{
    public partial class View : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string[] Color = { "green", "orange", "blue", "red", "maroon", "purple", "teal", "deepskyblue", "gray", "hotpink", "blueviolet", "violet", "deepskyblue", "cyan", "olivedrab", "coral", "salmon", "yellow" };
        int student_record_id = 0;
        bool EnableEditActions = false, EnableEditAssign = false;
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
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
                    //Check If He Has Permission
                    CheckIfHeHasPermission(std);

                    // select the color based on status id
                    int index = (int)std.Student_Status_Id - 1;
                    if (index > Color.Length) index = 1;

                    // Set profile image
                    if(std.Student_Image_Profile == null || std.Student_Image_Profile == "")
                        txtProfileImage.ImageUrl = "~/media/StudentProfile/Profile.jpg";
                    else
                        txtProfileImage.ImageUrl = "~/media/StudentProfile/" + std.Student_Image_Profile;
                    

                    // load other data
                    txtStudent_Id.Text = std.Student_Id.ToString();
                    txtStudent_SSN.Text = std.Student_SSN;
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        txtStudent_Name.Text = std.Student_Name_Ar;
                    else
                        txtStudent_Name.Text = std.Student_Name_En;
                    txtStudent_Phone.Text = std.Student_Phone;
                    txtStudent_Email.Text = std.Student_Email;
                    txtStudent_Address.Text = std.Student_Address;
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        txtSpecialization.Text = std.Specialization.Specialization_Name_Ar;
                    else
                        txtSpecialization.Text = std.Specialization.Specialization_Name_En;
                    if (SessionWrapper.LoggedUser.Language_id ==1)
                        txtStatus.Text = "<span class='label label-warning' style='background:" + Color[index] + " !important;'>" + std.Status.Status_Name_Ar + "</span>";
                    else
                    txtStatus.Text = "<span class='label label-warning' style='background:" + Color[index] + " !important;'>" + std.Status.Status_Name_En + "</span>";
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        txtStudent_Nationality.Text = std.Nationality.Nationality_Name_Ar;
                    else
                        txtStudent_Nationality.Text = std.Nationality.Nationality_Name_En;

                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        txtStudent_Resource.Text = std.Resource.Resource_Name_Ar;
                    else
                        txtStudent_Resource.Text = std.Resource.Resource_Name_En;

                    txtStudent_Capabilities_Degree.Text = " " + std.Student_Capabilities_Degree + "";
                    txtStudent_High_School_Degree.Text = " " + std.Student_High_School_Degree + "";
                    txtStudent_My_Achievement_Degree.Text = " " + std.Student_My_Achievement_Degree + "";

                    int str_index = (std.Student_Total.ToString()).IndexOf('.');
                    if (str_index != -1)
                        txtStudent_Total.Text = (std.Student_Total.ToString()).Substring(0, str_index + 2);
                    else
                    {
                        str_index = (std.Student_Total.ToString()).IndexOf(',');
                        if (str_index != -1)
                            txtStudent_Total.Text = (std.Student_Total.ToString()).Substring(0, str_index + 2);
                        else
                            txtStudent_Total.Text = std.Student_Total + "%";
                    }

                    DateTime date = DateTime.Parse(std.Student_CreationDate.ToString());
                    txtStudent_CreationDate.Text = date.ToShortDateString();

                    if (std.Student_Status_Id == 7 || std.Student_Status_Id == 9)
                    {
                        txtURL_Video.Visible = true;
                        txtURL_Video_Label.Visible = true;
                    }

                    // Change status to pendding if it's new
                    if (std.Status.Status_Code == 1)
                    {
                        std.Student_Status_Id = 2;
                        db.Entry(std).State = System.Data.Entity.EntityState.Modified;

                        Sequence seq = db.Sequences.Create();

                        seq.Emp_Id = SessionWrapper.LoggedUser.Employee_Id;
                        seq.Status_Id = 2;
                        seq.Student_Id = std.Student_Id;
                        seq.DateCreation = DateTime.Now;

                        if (SessionWrapper.LoggedUser.Language_id == 1)
                            txtStatus.Text = "<span class='label label-warning' style='background:" + Color[index + 1] + " !important;'>" + std.Status.Status_Name_Ar + "</span>";
                        else
                            txtStatus.Text = "<span class='label label-warning' style='background:" + Color[index + 1] + " !important;'>" + std.Status.Status_Name_En + "</span>";

                        db.Sequences.Add(seq);
                        db.SaveChanges();


                        db.Configuration.LazyLoadingEnabled = false;
                        /* Add it to log file */
                        Student stdLogFile = db.Students.Find(std.Student_Id);
                        stdLogFile.Employee = db.Employees.Find(seq.Emp_Id);
                        stdLogFile.Status = db.Status.Find(seq.Status_Id);

                        LogData = "data:" + JsonConvert.SerializeObject(stdLogFile, logFileModule.settings);
                        logFileModule.logfile(10, "تغير الحالة", "Update Status", LogData);
                    }

                    // Set action if it's allow
                    int emp_id = 0;
                    if (std.Student_Employee_Id != null)
                        emp_id = (int)std.Student_Employee_Id;
                    IsAllowToTakeAction((int)std.Student_Status_Id, emp_id, std);

                    //Set Action
                    SetActions();

                    // Load Files
                    LoadStudentFiles(std.Student_Id);

                    //Load sequence
                    LoadSequence(std.Student_Id);

                    //Button Names
                    btnReject.Text = GetRejectStatusName((int)std.Student_Status_Id);
                    btnApprove.Text = GetApproveStatusName((int)std.Student_Status_Id);

                }
            }
            catch { Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx"); }
        }

        private void CheckIfHeHasPermission(Student std)
        {
            if (std.Student_Employee_Id == SessionWrapper.LoggedUser.Employee_Id)
                return;
            else
            {
                List<Group_Status> List_group_status = db.Group_Status.Where(x => x.Group_Id == SessionWrapper.LoggedUser.Group_Id).ToList();
                for(int i =0; i < List_group_status.Count; i++)
                {
                    if (List_group_status[i].Status_Id == std.Student_Status_Id)
                        return;
                    else
                    {
                        int Temp_Status_Id = (int)List_group_status[i].Status_Id;
                        List<Sequence> list_sequence = db.Sequences.Where(x => x.Student_Id == std.Student_Id && x.Status_Id == Temp_Status_Id).ToList();
                        if (list_sequence.Count > 0)
                            return;
                    }
                }
            }

            Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx");
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
                string str = string.Empty, FileName = string.Empty;
                int Nationality_Counter = 0, Capabilities_Counter = 0, High_School_Counter = 0, My_Achievement_Counter = 0;
                int Current_Counter = 1;
                List<File> List_File = db.Files.Where(x => x.Student_Id == Student_Id).OrderBy(x => x.Type).ToList();
                for (int i = 0; i < List_File.Count; i++)
                {
                    string fileType = string.Empty;
                    if (List_File[i].Type == (int)FileType.ProfileImage) { txtProfileImage.ImageUrl = List_File[i].File_Path; continue; }
                    else if (List_File[i].Type == (int)FileType.Nationality) { fileType = FieldNames.getFieldName("View-Nationality", "Nationality"); Current_Counter = Nationality_Counter = Nationality_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.Capabilities) { fileType = FieldNames.getFieldName("View-Capabilities", "Capabilities"); Current_Counter = Capabilities_Counter = Capabilities_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.High_School) { fileType = FieldNames.getFieldName("View-HighSchool", "High School"); Current_Counter = High_School_Counter = High_School_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.My_Achievement) { fileType = FieldNames.getFieldName("View-MyAchievement", "My Achievement"); Current_Counter = My_Achievement_Counter = My_Achievement_Counter + 1; }
                    str += "<tr>" +
                           "<td>" +
                           "" + fileType + " " + Current_Counter + "" +
                           "</td>" +
                           "<td>" + fileType + " </td>";
                    if (EnableEditActions)
                        str += "<td><a href='#' data-href='../../../Pages/RegistrationProcess/DeleteFile.ashx?FileID=" + List_File[i].File_Id + "&StudentID=" + List_File[i].Student_Id + "' data-toggle='modal' data-target='#confirm-delete' style ='font-size: x-large; color: red;' ><i class='icofont icofont-ui-delete'></i></a></td>";
                    else
                        str += "<td><a href = '#' disabled='disabled' style ='font-size: x-large; color: red;' ><i class='icofont icofont-ui-delete'></i></a></td>";
                    str += "<td><a href = '../../../../media/StudentAttachments/" + List_File[i].File_Path + "' target='_blank' style='font-size: x-large; color: blue;'><i class='icofont icofont-eye-alt'></i></a></td>" +
                           "</tr>";
                }
                txtFiles.Text = str;
            }
            catch { }
        }

        public void IsAllowToTakeAction(int StatusId, int emp_id,Student std)
        {
            Group_Status GS = db.Group_Status.Where(x => x.Group_Id == SessionWrapper.LoggedUser.Group_Id && x.Status_Id == StatusId).FirstOrDefault();
            if (GS != null && (GS.Status_Id != 3 || (GS.Status_Id == 3 && emp_id == SessionWrapper.LoggedUser.Employee_Id)))
            {
                EnableEditActions = true;
            }
            else
                EnableEditActions = false;

            if (StatusId == 1 || StatusId == 2)
            {
                EnableEditAssign = true;
                EnableEditActions = false;
            }
            else
            {
                EnableEditAssign = false;
            }

            if ((std.Student_Employee_Id != SessionWrapper.LoggedUser.Employee_Id && (std.Student_Status_Id == 3 || std.Student_Status_Id == 4)))
            {
                EnableEditActions = false;
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

                per_name = sequence[i].Employee.Employee_Name_Ar;
                if (SessionWrapper.LoggedUser.Language_id != 1)
                {
                    space = "&nbsp;";
                    per_name = sequence[i].Employee.Employee_Name_En;

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
                                "<p class='text-muted m-b-0'>" + "<span style='font-weight: bold;'>" + activity_verb + "</span>" + Log_Name + " </p>";
                if (sequence[i].Note != null && sequence[i].Note != "")
                    str += "<p class='text-muted m-b-0'>" + "<span style='color:" + Color[index] + "'>" + sequence[i].Note + "</span></p>";

                str += "<p class='text-muted m-b-0'> <i class='feather icon-clock m-r-10'></i> " + Date_Different((DateTime)sequence[i].DateCreation) + "</p>" +
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

        private bool Can_I_Update_Record(Student Currnet_std)
        {
            Student Last_std = db.Students.Where(x => x.Student_Id == Currnet_std.Student_Id).FirstOrDefault();
            if (Currnet_std.Student_Status_Id == Last_std.Student_Status_Id)
                return true;
            else
                return false;
        }
        protected void btnApprove_Click(object sender, EventArgs e)
        {
            int newStatus = 0, restore_id = 15;
            int student_record_id = int.Parse(Request["StudentID"].ToString());
            Student std = db.Students.Find(student_record_id);
            if (std != null)
            {
                if (!Can_I_Update_Record(std))
                    return;
                
                if (std.Student_Status_Id == 15)
                {
                    List<Sequence> list_seq = db.Sequences.Where(x => x.Student_Id == student_record_id).OrderBy(x => x.DateCreation).ToList();
                    if(list_seq.Count > 1)
                    {
                        restore_id = (int)list_seq[list_seq.Count - 2].Status_Id;
                    }
                        
                }
                switch (std.Student_Status_Id)
                {
                    case 1: newStatus = 2; break; // 1- New
                    case 2: newStatus = 2; break; // 2- Pending
                    case 3: newStatus = 5; break; // 3- Assigned
                    case 4: newStatus = 5; break; // 4- Not Complete
                    case 5: newStatus = 6; break; // 5- Data Completed
                    case 6: newStatus = 7; break; // 6- Pay the Registration Fees
                    case 7: newStatus = 8; break; // 7- Registration Fee Paid
                    case 8: newStatus = 10; break; // 8- Book a Test Date
                    case 9: newStatus = 8; break; // 9- Failure in the Test
                    case 10: newStatus = 11; break; // 10- Success in the Test
                    case 11: newStatus = 12; break; // 11- Pay the Tuition Fees
                    case 12: newStatus = 13; break; // 12- Tuition Fees Paid
                    case 13: newStatus = 14; break; // 13- Issuance University ID
                    case 14: newStatus = 15; break; // 14- File Completed Successfully
                    case 15: newStatus = restore_id; break; // 15- File Complete with Failure
                    default: newStatus = 15; break; // Defalut Set To 15 File Complete with Failure
                }

                if (std.Student_Status_Id == 7)
                {
                    std.Student_URL_Video = txtURL_Video.Text;
                }

                std.Student_Status_Id = newStatus;
                db.Entry(std).State = System.Data.Entity.EntityState.Modified;

                Sequence seq = db.Sequences.Create();

                seq.Emp_Id = SessionWrapper.LoggedUser.Employee_Id;
                seq.Status_Id = newStatus;
                seq.Student_Id = student_record_id;
                seq.Note = txtNote.Text;
                seq.DateCreation = DateTime.Now;

                db.Sequences.Add(seq);
                db.SaveChanges();



                //Ready to apay
                if (std.Student_Status_Id == 6 || std.Student_Status_Id == 11)
                {
                    ReadyToPay(std); 
                }

                db.Configuration.LazyLoadingEnabled = false;
                /* Add it to log file */
                Student stdLogFile = db.Students.Find(std.Student_Id);
                stdLogFile.Employee = db.Employees.Find(seq.Emp_Id);
                stdLogFile.Status = db.Status.Find(seq.Status_Id);

                LogData = "data:" + JsonConvert.SerializeObject(stdLogFile, logFileModule.settings);
                logFileModule.logfile(10, "تغير الحالة", "Update Status", LogData);

                Response.Redirect("~/Pages/RegistrationProcess/view.aspx?StudentID=" + (int)seq.Student_Id);
            }

        }

        public bool sendEamil(Student std)
        {
            string sever_name = Request.Url.Authority.ToString();
            SendEmail send = new SendEmail();
            string Text = " <Strong>You have new student file  </Strong><br /><Strong>TrackId : </Strong> " + std.Student_Id + " <br /> <Strong>Current Status:</Strong> " + std.Status.Status_Name_En+ " <br /> <Strong>Note:</Strong> " + txtNote.Text;
            //bool result = send.TextEmail("Student File : #"+ std.Student_Id,SessionWrapper.LoggedUser.Employee_Email, Text, sever_name);
            return false;
        }

        public bool send_ReadyToPay(Student std, Payment_Process payment, string Payment_For)
        {
            string sever_name = Request.Url.Authority.ToString();
            string URL = sever_name + "/Payment/PaymentProcessDetails.aspx?Trackingkey=" + payment.Payment_Trackingkey;
            if (URL.Substring(0, 4).ToLower() != "http".ToLower())
                URL = "http://" + URL;
            string StudentEmail = std.Student_Email; // "ayman@softwarecornerit.com";//
            SendEmail send = new SendEmail();

            string Text = " <Strong style='font-size:18;'>Dear " + std.Student_Name_En + "</Strong><br /><br /><Strong>Now you can pay the fees of " + Payment_For + ": </Strong> " + URL + " <br /> <Strong>Current Status:</Strong> " + std.Status.Status_Name_En + " <br /> <Strong>Date:</Strong> " + DateTime.Now.ToShortDateString() + "<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ";
            bool result = send.TextEmail("Ready To Pay", StudentEmail, Text, sever_name);

            return result;
        }

        public bool send_DatNotCompleted(Student std)
        {
            string sever_name = Request.Url.Authority.ToString();
            string URL = sever_name + "/StudentSubmitting.aspx?Student_Id=" + std.Student_Id;
            if (URL.Substring(0, 4).ToLower() != "http".ToLower())
                URL = "http://" + URL;

            string StudentEmail = std.Student_Email; // "ayman@softwarecornerit.com";//
            SendEmail send = new SendEmail();
            string Text = " <Strong style='font-size:18;'>Dear " + std.Student_Name_En + "</Strong><br /><br /><Strong>Your Data is not completed Please complete as soon as posible </Strong> " + URL + " <br /> <Strong>Current Status:</Strong> " + std.Status.Status_Name_En + " <br /> <Strong>Note:</Strong> " + txtNote.Text + " <br /> <Strong>Date:</Strong> " + DateTime.Now.ToShortDateString() + "<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ";
            bool result = send.TextEmail("Data Not Complete", StudentEmail, Text, sever_name);

            return result;
        }

        private string GetApproveStatusName(int CurrentStatus_Id)
        {
            if (SessionWrapper.LoggedUser.Language_id != 1)
            {
                switch (CurrentStatus_Id)
                {
                    case 1: return db.Status.Find(2).Status_Name_En;// 1- New
                    case 2: return db.Status.Find(3).Status_Name_En;// 2- Pending
                    case 3: return db.Status.Find(5).Status_Name_En;// 3- Assigned
                    case 4: return db.Status.Find(5).Status_Name_En;// 4- Not Complete
                    case 5: return db.Status.Find(6).Status_Name_En;// 5- Data Completed
                    case 6: return db.Status.Find(7).Status_Name_En;// 6- Pay the Registration Fees
                    case 7: return db.Status.Find(8).Status_Name_En;// 7- Registration Fee Paid
                    case 8: return db.Status.Find(10).Status_Name_En;// 8- Book a Test Date
                    case 9: return db.Status.Find(8).Status_Name_En;// 9- Failure in the Test
                    case 10: return db.Status.Find(11).Status_Name_En;// 10- Success in the Test
                    case 11: return db.Status.Find(12).Status_Name_En;// 11- Pay the Tuition Fees
                    case 12: return db.Status.Find(13).Status_Name_En;// 12- Tuition Fees Paid
                    case 13: return db.Status.Find(14).Status_Name_En;// 13- Issuance University ID
                    case 14: return db.Status.Find(15).Status_Name_En;// 14- File Completed Successfully
                    case 15: return "Restore the last Status";// 15- File Complete with Failure
                    default: return db.Status.Find(4).Status_Name_En;// Defalut Set To 4 Not Complate
                }
            }
            else
            {
                switch (CurrentStatus_Id)
                {
                    case 1: return db.Status.Find(2).Status_Name_Ar;// 1- New
                    case 2: return db.Status.Find(3).Status_Name_Ar;// 2- Pending
                    case 3: return db.Status.Find(5).Status_Name_Ar;// 3- Assigned
                    case 4: return db.Status.Find(5).Status_Name_Ar;// 4- Not Complete
                    case 5: return db.Status.Find(6).Status_Name_Ar;// 5- Data Completed
                    case 6: return db.Status.Find(7).Status_Name_Ar;// 6- Pay the Registration Fees
                    case 7: return db.Status.Find(8).Status_Name_Ar;// 7- Registration Fee Paid
                    case 8: return db.Status.Find(10).Status_Name_Ar;// 8- Book a Test Date
                    case 9: return db.Status.Find(8).Status_Name_Ar;// 9- Failure in the Test
                    case 10: return db.Status.Find(11).Status_Name_Ar;// 10- Success in the Test
                    case 11: return db.Status.Find(12).Status_Name_Ar;// 11- Pay the Tuition Fees
                    case 12: return db.Status.Find(13).Status_Name_Ar;// 12- Tuition Fees Paid
                    case 13: return db.Status.Find(14).Status_Name_Ar;// 13- Issuance University ID
                    case 14: return db.Status.Find(15).Status_Name_Ar;// 14- File Completed Successfully
                    case 15: return "الرجوع للحالة السابقة";// 15- File Complete with Failure
                    default: return db.Status.Find(4).Status_Name_Ar;// Defalut Set To 4 Not Complate
                }
            }
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            int newStatus = 0;
            int student_record_id = int.Parse(Request["StudentID"].ToString());
            Student std = db.Students.Find(student_record_id);
            if (std != null)
            {
                if (!Can_I_Update_Record(std))
                    return;

                switch (std.Student_Status_Id)
                {
                    case 1: newStatus = 4; break; // 1- New
                    case 2: newStatus = 4; break; // 2- Pending
                    case 3: newStatus = 4; break; // 3- Assigned
                    case 4: newStatus = 15; break; // 4- Not Complete
                    case 5: newStatus = 4; break; // 5- Data Completed
                    case 6: newStatus = 15; break; // 6- Pay the Registration Fees
                    case 7: newStatus = 15; break; // 7- Registration Fee Paid
                    case 8: newStatus = 9; break; // 8- Book a Test Date
                    case 9: newStatus = 15; break; // 9- Failure in the Test
                    case 10: newStatus = 15; break; // 10- Success in the Test
                    case 11: newStatus = 15; break; // 11- Pay the Tuition Fees
                    case 12: newStatus = 15; break; // 12- Tuition Fees Paid
                    case 13: newStatus = 15; break; // 13- Issuance University ID
                    case 14: newStatus = 15; break; // 14- File Completed Successfully
                    case 15: newStatus = 15; return; // 15- File Complete with Failure
                    default: newStatus = 15; break; // Defalut Set To 15 File Complete with Failure
                }
               

                std.Student_Status_Id = newStatus;
                db.Entry(std).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();

                bool IsNotCompleted = false;
                if (std.Student_Status_Id == 4)
                    IsNotCompleted = true;

                Sequence seq = db.Sequences.Create();

                seq.Emp_Id = SessionWrapper.LoggedUser.Employee_Id;
                seq.Status_Id = newStatus;
                seq.Student_Id = student_record_id;
                seq.Note = txtNote.Text;
                seq.DateCreation = DateTime.Now;

                db.Sequences.Add(seq);
                db.SaveChanges();

                //Send Email
                sendEamil(std);

                // Send Not Complete data
                if(IsNotCompleted)
                    send_DatNotCompleted(std);

                db.Configuration.LazyLoadingEnabled = false;
                /* Add it to log file */
                Student stdLogFile = db.Students.Find(std.Student_Id);
                stdLogFile.Employee = db.Employees.Find(seq.Emp_Id);
                stdLogFile.Status = db.Status.Find(seq.Status_Id);

                LogData = "data:" + JsonConvert.SerializeObject(stdLogFile, logFileModule.settings);
                logFileModule.logfile(10, "تغير الحالة", "Update Status", LogData);

                Response.Redirect("~/Pages/RegistrationProcess/view.aspx?StudentID=" + (int)seq.Student_Id);
            }
        }

        private void ReadyToPay(Student std)
        {
            string amount = string.Empty, Payment_For = string.Empty;
            int payment_type_id = 1;
            Specialization spec = db.Specializations.Find(std.Student_Specialization_Id);
            if (std.Student_Status_Id == 6)
            {
                amount = spec.Specialization_Registeration_Payment.ToString();
                Payment_For = "Registration";
                payment_type_id = 1;
            }
            else
            {
                amount = spec.Specialization_Study_Payment.ToString();
                Payment_For = "Study";
                payment_type_id = 2;
            }

            int student_id = std.Student_Id;
            string entityId = "";
            string currency = "SAR";
            string paymentType = "DB";

            Payment_Process payment = db.Payment_Process.Create();
            payment.Student_Id = student_id;
            payment.Send_Amount = float.Parse(amount);
            payment.Send_Currency = currency;
            payment.Send_EntityId = entityId;
            payment.Send_PaymentType = paymentType;
            payment.Payment_IsPaid = false;
            payment.Payment_Type_Id = payment_type_id;
            payment.DateCreation = DateTime.Now;
            payment.Comment = Payment_For+ " Fees";
            payment.Payment_Trackingkey = StringCipher.RandomString(5) + student_id + StringCipher.RandomString(3) + DateTime.Now.GetHashCode()+ StringCipher.RandomString(5);
            payment.Payment_URL_IsValid = true;
            db.Payment_Process.Add(payment);
            db.SaveChanges();

            //Send Email 
            send_ReadyToPay(std, payment, Payment_For);

            // Send SMS
            SendSMS send_sms = new SendSMS();
            string sever_name = Request.Url.Authority.ToString();
            string URL = sever_name + "/Payment/PaymentProcessDetails.aspx?Trackingkey=" + payment.Payment_Trackingkey;
            if (URL.Substring(0, 4).ToLower() != "http".ToLower())
                URL = "http://" + URL;

            string Text = "Dear " + std.Student_Name_En + "\nNow you can pay the fees of " + Payment_For + "\nPlease use this link: "+ URL;
            string number_Phone = std.Student_Phone;
            string reslt_message = send_sms.SendMessage(Text, number_Phone);


        }

        private string GetRejectStatusName(int CurrentStatus_Id)
        {
            if (SessionWrapper.LoggedUser.Language_id != 1)
            {
                switch (CurrentStatus_Id)
                {
                    case 1: return db.Status.Find(4).Status_Name_En;// 1- New
                    case 2: return db.Status.Find(4).Status_Name_En;// 2- Pending
                    case 3: return db.Status.Find(4).Status_Name_En;// 3- Assigned
                    case 4: return db.Status.Find(15).Status_Name_En;// 4- Not Complete
                    case 5: return db.Status.Find(4).Status_Name_En;// 5- Data Completed
                    case 6: return db.Status.Find(15).Status_Name_En;// 6- Pay the Registration Fees
                    case 7: return db.Status.Find(15).Status_Name_En;// 7- Registration Fee Paid
                    case 8: return db.Status.Find(9).Status_Name_En;// 8- Book a Test Date
                    case 9: return db.Status.Find(15).Status_Name_En;// 9- Failure in the Test
                    case 10: return db.Status.Find(15).Status_Name_En;// 10- Success in the Test
                    case 11: return db.Status.Find(15).Status_Name_En;// 11- Pay the Tuition Fees
                    case 12: return db.Status.Find(15).Status_Name_En;// 12- Tuition Fees Paid
                    case 13: return db.Status.Find(15).Status_Name_En;// 13- Issuance University ID
                    case 14: return db.Status.Find(15).Status_Name_En;// 14- File Completed Successfully
                    case 15: return db.Status.Find(15).Status_Name_En;// 15- File Complete with Failure
                    default: return db.Status.Find(15).Status_Name_En;// Defalut Set To 15 Not Complate
                }
            }else
            {
                switch (CurrentStatus_Id)
                {
                    case 1: return db.Status.Find(4).Status_Name_Ar;// 1- New
                    case 2: return db.Status.Find(4).Status_Name_Ar;// 2- Pending
                    case 3: return db.Status.Find(4).Status_Name_Ar;// 3- Assigned
                    case 4: return db.Status.Find(15).Status_Name_Ar;// 4- Not Complete
                    case 5: return db.Status.Find(4).Status_Name_Ar;// 5- Data Completed
                    case 6: return db.Status.Find(15).Status_Name_Ar;// 6- Pay the Registration Fees
                    case 7: return db.Status.Find(15).Status_Name_Ar;// 7- Registration Fee Paid
                    case 8: return db.Status.Find(9).Status_Name_Ar;// 8- Book a Test Date
                    case 9: return db.Status.Find(15).Status_Name_Ar;// 9- Failure in the Test
                    case 10: return db.Status.Find(15).Status_Name_Ar;// 10- Success in the Test
                    case 11: return db.Status.Find(15).Status_Name_Ar;// 11- Pay the Tuition Fees
                    case 12: return db.Status.Find(15).Status_Name_Ar;// 12- Tuition Fees Paid
                    case 13: return db.Status.Find(15).Status_Name_Ar;// 13- Issuance University ID
                    case 14: return db.Status.Find(15).Status_Name_Ar;// 14- File Completed Successfully
                    case 15: return db.Status.Find(15).Status_Name_Ar;// 15- File Complete with Failure
                    default: return db.Status.Find(15).Status_Name_Ar;// Defalut Set To 15 Not Complate
                }
            }
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            Student std = db.Students.Find(student_record_id);
            if (std != null)
            {
                std.Student_Employee_Id = int.Parse(txtEmployees.SelectedValue);
                std.Student_Status_Id = 3; // Assigned
                db.Entry(std).State = System.Data.Entity.EntityState.Modified;

                Sequence seq = db.Sequences.Create();

                seq.Emp_Id = SessionWrapper.LoggedUser.Employee_Id;
                seq.Status_Id = 3; // Assigned
                seq.Student_Id = student_record_id;
                seq.DateCreation = DateTime.Now;

                db.Sequences.Add(seq);
                db.SaveChanges();

                db.Configuration.LazyLoadingEnabled = false;
                /* Add it to log file */
                Student stdLogFile = db.Students.Find(std.Student_Id);
                stdLogFile.Employee = db.Employees.Find(seq.Emp_Id);
                stdLogFile.Status = db.Status.Find(seq.Status_Id);

                LogData = "data:" + JsonConvert.SerializeObject(stdLogFile, logFileModule.settings);
                logFileModule.logfile(10, "اسناد ملف لموظف مركز الاتصالات", "File assigned to Call Center", LogData);

                Response.Redirect("~/Pages/RegistrationProcess/view.aspx?StudentID=" + (int)seq.Student_Id);
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