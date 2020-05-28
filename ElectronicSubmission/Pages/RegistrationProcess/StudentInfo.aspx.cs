using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ElectronicSubmission.Enums;

namespace ElectronicSubmission.Pages.RegistrationProcess
{
    public partial class StudentInfo : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        int StudentID = 0;
        int StatusId = 0;
        //LogFile Data
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        List<Employee> ALLEmployees = new List<Employee>();


        protected void Page_Load(object sender, EventArgs e)
        {
             if (SessionWrapper.LoggedUser == null)
                 Response.Redirect("~/Pages/Auth/Login.aspx");

            if (Request["StudentID"] != null)
            {
                int.TryParse(Request["StudentID"],out StudentID);
            }
            else
            {
                Status_ID.SelectedValue = ""+1;
                Student_ID.Text = "New";
            }

            if (!IsPostBack)
            {
                FillDropDownLists();
                treatmentDate.Text = DateTime.Now.Date.ToString();
                if(StudentID !=0) ViewDataStudent(StudentID);
            }

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int Stu_ID, Emp_id, Spec_id, Nat_id = 0;
            DateTime RegDate = DateTime.Now;
            float HighSchoolDeg, CapabilitiesDeg, MyAchievementDeg = 0;
            
            int.TryParse(Student_ID.Text, out Stu_ID);
            int.TryParse(Employee_ID.SelectedValue, out Emp_id);
            int.TryParse(Specialization_ID.SelectedValue, out Spec_id);
            int.TryParse(Nationality_ID.SelectedValue, out Nat_id);

            if (StudentID == 0) StatusId = 1; else int.TryParse(Status_ID.Text, out StatusId);
            float.TryParse(HighSchoolDegree.Text, out HighSchoolDeg);
            float.TryParse(CapabilitiesDegree.Text, out CapabilitiesDeg);
            float.TryParse(MyAchievementDegree.Text, out MyAchievementDeg); 

            DateTime.TryParse(treatmentDate.Text, out RegDate);

            bool result = IU_Student(StudentID,  StudentNameAr.Text, StudentNameEn.Text,stuProfile, StudentEmail.Text,StudentPhone.Text,Address.Text, RegDate, Student_SSN.Text,  HighSchoolDeg,  CapabilitiesDeg,  MyAchievementDeg, StatusId , Emp_id,Spec_id, Nat_id, Note.InnerText);

            if (result)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The  Employee was Sucessfully saved in system ! ');", true);
                if (StudentID == 0) ClearForm();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','Error');", true);
            }
        }

        public bool IU_Student(int StudentID, string ArabicName, string EnglishName,FileUpload StProfile,string Email, string Phone,string StuAddress, DateTime RegistrationDate,string StudentSSN, float HighSchoolDeg,float CapabilitiesDeg,float MyAchievementDeg,int StatusID, int EmployeeID,int SpecializationID,int NationalityID,string Notes)
        {

            try
            {
                int Student_Id = 0;
                db.Configuration.LazyLoadingEnabled = false;
                Student Stu = db.Students.Create();
                if (StudentID != 0) Stu = db.Students.First(x => x.Student_Id == StudentID);
                Stu.Student_Name_Ar = ArabicName;
                Stu.Student_Name_En = EnglishName;
                Stu.Student_Email = Email;
                Stu.Student_Phone = Phone;
                Stu.Student_Address = StuAddress;
                Stu.Student_CreationDate = RegistrationDate;
                Stu.Student_SSN = StudentSSN;
                Stu.Student_Status_Id = StatusID;
                Stu.Student_High_School_Degree = HighSchoolDeg.ToString();
                Stu.Student_Capabilities_Degree = CapabilitiesDeg.ToString();
                Stu.Student_My_Achievement_Degree = MyAchievementDeg.ToString();
                Stu.Student_Employee_Id = EmployeeID;
                Stu.Student_Specialization_Id = SpecializationID;
                Stu.Student_Nationality_Id = NationalityID;
                Stu.Notes = Notes;
                string ImegProfile = UploadFile(StProfile, @"~\media\Profile\");
                if (ImegProfile != "") Stu.Student_Image_Profile = ImegProfile; else if (StudentID == 0) ImegProfile = "Profile.JPG";

                if (StudentID != 0)
                {
                    db.Entry(Stu).State = System.Data.EntityState.Modified;
                }
                else
                {
                    db.Students.Add(Stu);
                }
                db.SaveChanges();
                if (StudentID != 0) {
                    Student_Id = StudentID;
                }
                else
                {
                    Student_Id = Stu.Student_Id;
                }

                string HSFile = UploadFile(HighSchoolDegreeFile, @"~\media\StudentAttachments\");
                if(HSFile!="") StudentFile(Student_Id,(int)FileType.High_School, HSFile);

                string CAFile = UploadFile(CapabilitiesDegreeFile, @"~\media\StudentAttachments\");
                if (CAFile != "") StudentFile(Student_Id, (int)FileType.Capabilities, CAFile);

                string MAfile = UploadFile(MyAchievementDegreeFile, @"~\media\StudentAttachments\");
                if(MAfile != "")StudentFile(Student_Id, (int)FileType.My_Achievement, MAfile);

                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(Stu, logFileModule.settings);
                if (StudentID != 0)
                {
                    logFileModule.logfile(10, "تعديل بيانات الطالب", "Update Student", LogData);
                }
                else
                {
                    logFileModule.logfile(10, "إضافة طالب", "Add Student", LogData);
                }
            }
            catch { return false; }
            return true;
        }

     

           public string UploadFile(FileUpload Uplofile,string Path)
         {
             string Imagepath = "";
       
                     if (this.Page.IsValid)
                     {
                         if (!UtilityClass.UploadFileIsValid(ref Uplofile, UtilityClass.ValidImagesExtentions))
                         {
                             Imagepath = "false";
                         }
                         Imagepath = string.Empty;

                         Imagepath = UtilityClass.UploadFileWithExtention(ref Uplofile, Server.MapPath(Path));
                     }
   
             return Imagepath;
         }

        public void StudentFile(int StudentID,int type,string ImagePath)
        {
            try
            {
                File Fil = db.Files.Create();
                    Fil.Student_Id = StudentID;
                    Fil.File_Name = ImagePath;
                    Fil.File_Path = ImagePath;
                    Fil.Type = type;
                    Fil.DateCreation = DateTime.Now;
                db.Files.Add(Fil);
                db.SaveChanges();
            } catch (Exception e) { }
        }

         public void ViewDataStudent(int StudentId)
         {
             if (StudentId > 0)
             {
                 var Student = db.Students.First(x => x.Student_Id == StudentId);
                 Stu_Profile.ImageUrl = "../../../../media/Profile/" + Student.Student_Image_Profile;
                 Student_ID.Text = Student.Student_Id.ToString();
                 StudentNameAr.Text = Student.Student_Name_Ar;
                 StudentNameEn.Text = Student.Student_Name_En;
                 StudentEmail.Text = Student.Student_Email;
                 StudentPhone.Text = Student.Student_Phone;
                 Address.Text = Student.Student_Address;
                 Student_SSN.Text = Student.Student_SSN;
                 HighSchoolDegree.Text = Student.Student_High_School_Degree;
                 CapabilitiesDegree.Text = Student.Student_Capabilities_Degree;
                 MyAchievementDegree.Text = Student.Student_My_Achievement_Degree;
                 Status_ID.SelectedValue = Student.Student_Status_Id.ToString();
                 Employee_ID.SelectedValue = Student.Student_Employee_Id.ToString();
                 Nationality_ID.SelectedValue = Student.Student_Nationality_Id.ToString();
                 Specialization_ID.SelectedValue = Student.Student_Specialization_Id.ToString();
                 Note.InnerText = Student.Notes;
                treatmentDate.Text = Student.Student_CreationDate.ToString();
             }
         }

        public void ClearForm()
        {
                Stu_Profile.ImageUrl = "../../../../media/Profile/Profile.JPG";
                Student_ID.Text = "New";
                StudentNameAr.Text = "";
                StudentNameEn.Text = "";
                StudentEmail.Text = "";
                StudentPhone.Text = "";
                Address.Text = "";
                Student_SSN.Text = "";
                HighSchoolDegree.Text = "";
                CapabilitiesDegree.Text = "";
                MyAchievementDegree.Text = "";
                Status_ID.SelectedValue = null;
                Employee_ID.SelectedValue = null;
                Nationality_ID.SelectedValue = null;
                Specialization_ID.SelectedValue = null;
                Note.InnerText = "";
                treatmentDate.Text = DateTime.Now.Date.ToString();
                StatusId = 0;
                StudentID = 0;
         }

     

        private void FillDropDownLists()
         {
            // Group dropdown
            List<Status> StatusList = db.Status.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(Status_ID, "Status_Id", "Status_Name_Ar", StatusList, " - إختر الحالة -");
            else
                ddlFiller.dropDDL(Status_ID, "Status_Id", "Status_Name_En", StatusList, " - select Status -");

            // Group dropdown
            List<Employee> EmployeeList = db.Employees.ToList();
             if (SessionWrapper.LoggedUser.Language_id == 1)
                 ddlFiller.dropDDL(Employee_ID, "Employee_Id", "Employee_Name_Ar", EmployeeList, " - إختر الموظف -");
             else
                 ddlFiller.dropDDL(Employee_ID, "Employee_Id", "Employee_Name_En", EmployeeList, " - Select Employee -");

             // Group dropdown
             List<Specialization> SpecializationList = db.Specializations.ToList();
             if (SessionWrapper.LoggedUser.Language_id == 1)
                 ddlFiller.dropDDL(Specialization_ID, "Specialization_Id", "Specialization_Name_Ar", SpecializationList, " - إختر التخصص -");
             else
                 ddlFiller.dropDDL(Specialization_ID, "Specialization_Id", "Specialization_Name_En", SpecializationList, " - Select Specialization -");
           
             // Group dropdown
            List<Nationality> NationalityList = db.Nationalities.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(Nationality_ID, "Nationality_Id", "Nationality_Name_Ar", NationalityList, " - إختر الجنسية -");
            else
                ddlFiller.dropDDL(Nationality_ID, "Nationality_Id", "Nationality_Name_En", NationalityList, " - Select Nationality -");


        }
    }
}