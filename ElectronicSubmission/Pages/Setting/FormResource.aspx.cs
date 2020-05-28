using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace ElectronicSubmission.Pages.Setting
{
    public partial class FormResource : System.Web.UI.Page
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
            bool result = AddGroup(txtResource_Name.Text, txtResource_Name_En.Text);
            if (result)
            {
                clearform();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Item was Sucessfully saved in system ! ');", true);
            }
        }

        void clearform()
        {
            txtResource_Name.Text = string.Empty;
            txtResource_Name_En.Text = string.Empty;
        }

        private bool AddGroup(string arabic_name, string english_name)
        {
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                Resource group = db.Resources.Create();
                group.Resource_Name_Ar = arabic_name;
                group.Resource_Name_En = english_name;
                db.Resources.Add(group);
                db.SaveChanges();
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(group, logFileModule.settings);
                logFileModule.logfile(10, "إنشاء مصدر معرفة", "create new Resources", LogData);
                //PriorityDataSource.DataBind();
            }
            catch { return false; }
            return true;
        }


        private void Change_LablesName_BasedOn_Language()
        {
            try
            {
                ResourceGridView.Columns[0].Caption = FieldNames.getFieldName("FormResource-ID", "ID");
                ResourceGridView.Columns[1].Caption = FieldNames.getFieldName("FormResource-ArabicName", "Arabic Name");
                ResourceGridView.Columns[2].Caption = FieldNames.getFieldName("FormResource-Action", "Action");
                ResourceGridView.Columns[3].Caption = FieldNames.getFieldName("FormResource-EnglishName", "English Name");
            }
            catch { }
        }


    }
}