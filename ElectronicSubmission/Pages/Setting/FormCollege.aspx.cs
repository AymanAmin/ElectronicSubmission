using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace ElectronicSubmission.Pages.Setting
{
    public partial class FormCollege : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            bool result = AddGroup(txtCollege_Name.Text, txtCollege_Name_En.Text);
            if (result)
            {
                clearform();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Item was Sucessfully saved in system ! ');", true);
            }
        }

        void clearform()
        {
            txtCollege_Name.Text = string.Empty;
            txtCollege_Name_En.Text = string.Empty;
        }

        private bool AddGroup(string arabic_name, string english_name)
        {
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                Collage group = db.Collages.Create();
                group.Collage_Name_Ar = arabic_name;
                group.Collage_Name_En = english_name;
                db.Collages.Add(group);
                db.SaveChanges();
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(group, logFileModule.settings);
                logFileModule.logfile(10, "إنشاء كلية جديدة", "create new Colleges", LogData);
                //PriorityDataSource.DataBind();
            }
            catch { return false; }
            return true;
        }


        private void Change_LablesName_BasedOn_Language()
        {
            try
            {
                CollegeGridView.Columns[0].Caption = FieldNames.getFieldName("FormCollege-ID", "ID");
                CollegeGridView.Columns[1].Caption = FieldNames.getFieldName("FormCollege-ArabicName", "Arabic Name");
                CollegeGridView.Columns[2].Caption = FieldNames.getFieldName("FormCollege-Action", "Action");
                CollegeGridView.Columns[3].Caption = FieldNames.getFieldName("FormCollege-EnglishName", "English Name");
            }
            catch { }
        }


    }
}