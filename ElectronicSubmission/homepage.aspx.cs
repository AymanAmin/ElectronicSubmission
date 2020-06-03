using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission
{
    public partial class homepage : System.Web.UI.Page
    {
        int collegeId = 0;
        string txtSearch = "";
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        List<Permission> List_permission = new List<Permission>();

        string Error_message = " Incorrect email or password entered. Please try again.";

        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        public int langId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (int.TryParse(Request["lang"], out langId) && langId > 0)
                {
                    Session["lang"] = langId;
                }
                else
                {
                    if (Session["lang"] == null)
                    {
                        langId = 2;
                        Session["lang"] = langId;
                    }
                    else
                    {
                        langId = int.Parse(Session["lang"].ToString());
                    }
                }
                SessionWrapper.Language = db.Lanuage_Detials.Where(x => x.Language_Master_Id == langId).ToList();
                loadFillDrop();
                loadSpecialization();
            }
            else
            {
                if (Session["lang"] == null)
                {
                    langId = 2;
                    Session["lang"] = langId;
                }
                else
                {
                    langId = int.Parse(Session["lang"].ToString());
                }
            }
        }

        private void loadFillDrop()
        {
            try
            {
                using (REU_RegistrationEntities db = new REU_RegistrationEntities())
                {
                    List<Collage> listCollage = db.Collages.ToList();
                    if(langId == 1)
                        ddlFiller.dropDDL(CollegesUniv, "Collage_ID", "Collage_Name_Ar", listCollage, "كل الكليات");
                    else
                        ddlFiller.dropDDL(CollegesUniv, "Collage_ID", "Collage_Name_En", listCollage, "All Colleges");
                }
            }
            catch (Exception esw) { }
        }

        private void loadSpecialization()
        {
            using (REU_RegistrationEntities db = new REU_RegistrationEntities())
            {
                try
                {
                    string yourHTMLstring = "<ul>";
                    Specialization.Controls.Add(new LiteralControl(yourHTMLstring));
                    List<Specialization> listSpecialization = new List<Specialization>();

                    if(collegeId == 0 && txtSearch == "")
                        listSpecialization = db.Specializations.ToList();
                    else if(collegeId == 0)
                        listSpecialization = db.Specializations.Where(x => x.Specialization_Name_En.Contains(txtSearch) || x.Specialization_Name_Ar.Contains(txtSearch)).ToList();
                    else if (txtSearch == "")
                        listSpecialization = db.Specializations.Where(x => x.Collage_Id == collegeId).ToList();
                    else listSpecialization = db.Specializations.Where(x => x.Collage_Id == collegeId && (x.Specialization_Name_En.Contains(txtSearch) || x.Specialization_Name_Ar.Contains(txtSearch))).ToList();
                    string SpecializationLangName = "";
                    for (int i = 0; i < listSpecialization.Count; i++)
                    {
                        if(langId == 1)
                            SpecializationLangName = listSpecialization[i].Specialization_Name_Ar;
                        else
                            SpecializationLangName = listSpecialization[i].Specialization_Name_En;
                        yourHTMLstring = "<li>"+
                                            "<div class='wm-box-service-wrap wm-bgcolor'>"+
                                                "<a href='Bachelors.aspx?SpecializationId=" + listSpecialization[i].Specialization_Id + "'><i class='" + listSpecialization[i].Specialization_Icon + "'></i></a>" +
                                                "<h6><a href='Bachelors.aspx?SpecializationId="+listSpecialization[i].Specialization_Id+"'>" + SpecializationLangName + " </a></h6>" +
                                            "</div>"+
                                        "</li>";
                        Specialization.Controls.Add(new LiteralControl(yourHTMLstring));
                    }
                    yourHTMLstring = "</ul>";
                    Specialization.Controls.Add(new LiteralControl(yourHTMLstring));
                }
                catch (Exception eee) {  }
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            Specialization.Controls.Clear();
            collegeId = int.Parse(CollegesUniv.SelectedValue);
            txtSearch = BachelorName.Value;
            loadSpecialization();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "scrollToElement();", true);
        }

        protected void SearchkeyWord_Click1(object sender, EventArgs e)
        {

            Specialization.Controls.Clear();
            collegeId = 0;
            txtSearch = keywordBachelors.Value;
            loadSpecialization();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "scrollToElement();", true);
        }

        protected void LoginAcc_Click(object sender, EventArgs e)
        {
            bool result = auth_Login(txtEmail.Text, txtPassword.Text);
            if (result)
                Response.Redirect("~/default.aspx");
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-check', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Validation : ','  " + Error_message + " ! ');", true);
            }
        }


        private bool auth_Login(string username, string password)
        {
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                List<Employee> emp_list = db.Employees.ToList();
                for (int i = 0; i < emp_list.Count; i++)
                {
                    if (username.ToUpper() == emp_list[i].Employee_Email.ToUpper())
                    {
                        string DecryptedPassword = StringCipher.Decrypt(emp_list[i].Employee_Password, "Password");
                        if (password == DecryptedPassword && (bool)emp_list[i].Employee_Active)
                        {
                            Employee emp = emp_list[i];
                            SessionWrapper.LoggedUser = emp;
                            SessionWrapper.IsLocked = false;
                            SessionWrapper.Language = db.Lanuage_Detials.Where(x => x.Language_Master_Id == emp.Language_id).ToList();
                            List<Permission_Group> Per_group = db.Permission_Group.Where(x => x.Group_Id == emp.Group_Id).ToList();
                            List_permission.Clear();
                            for (int j = 0; j < Per_group.Count; j++)
                            {
                                int per_id = (int)Per_group[j].Permission_Id;
                                Permission per = db.Permissions.Where(x => x.Permission_Id == per_id && x.System_Id != 3).FirstOrDefault();
                                if (per != null)
                                    List_permission.Add(per);
                            }
                            // Set User info in session
                            SessionWrapper.LoggedUser = emp;

                            // Set LockScreen as false in session
                            SessionWrapper.IsLocked = false;

                            // Selecet Language Based on User language and set in session
                            SessionWrapper.Language = db.Lanuage_Detials.Where(x => x.Language_Master_Id == emp.Language_id).ToList();

                            // Set Permission List in session
                            SessionWrapper.Permssions = List_permission;

                            Employee Log_Emp = new Employee();
                            Log_Emp.Employee_Id = emp.Employee_Id;
                            Log_Emp.Employee_Name_Ar = emp.Employee_Name_Ar;
                            Log_Emp.Employee_Name_En = emp.Employee_Name_En;
                            Log_Emp.Employee_Email = emp.Employee_Email;
                            Log_Emp.Employee_Phone = emp.Employee_Phone;
                            /* Add it to log file */
                            LogData = "data:" + JsonConvert.SerializeObject(Log_Emp, logFileModule.settings);
                            logFileModule.logfile(10, "تسجيل دخول", "login to system", LogData);
                        }
                        else
                            continue;

                        return true;
                    }
                }
                return false;
            }
            catch (Exception er) { Session.Abandon(); return false; }
        }

        protected void SubmitMessage_Click(object sender, EventArgs e)
        {
            if (SaveStudentMessage(StudentName.Text, StudentPhone.Text, StudentEmail.Text, StudentMessage.Text))
            {
                if (langId == 2)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "SuccessEn();", true);
                else
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "SuccessAr();", true);
            }
            else
            {
                if (langId == 2)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "WarningEn();", true);
                else
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "WarningAr();", true);

            }
        }

        private bool SaveStudentMessage(string stdName, string stdPhone, string stdEmail, string stdMessage)
        {
            using (REU_RegistrationEntities db = new REU_RegistrationEntities())
            {
                try
                {
                    Specialization Specl = new Specialization();
                    Specl.Condition_Ar = stdName;
                    Specl.Condition_En = stdPhone;
                    Specl.Condition_Ar = stdEmail;
                    Specl.Condition_En = stdMessage;
                    db.Specializations.Add(Specl);
                    db.SaveChanges();
                    LogData = "data:" + JsonConvert.SerializeObject(Specl, logFileModule.settings);
                    logFileModule.logfile(10, "الاتصال", "Contact As", LogData);
                    return true;
                }
                catch (Exception eee)
                {
                    return false;
                }
            }
        }

        protected void SubmitStep_Click(object sender, EventArgs e)
        {
            if (SaveStudentMessage(StudentName.Text, StudentPhone.Text, StudentEmail.Text, StudentMessage.Text))
            {
                if (langId == 2)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "SuccessEn();", true);
                else
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "SuccessAr();", true);
            }
            else
            {
                if (langId == 2)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "WarningEn();", true);
                else
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "WarningAr();", true);

            }
        }
    }
}