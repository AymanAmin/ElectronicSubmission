using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace ElectronicSubmission.Pages.Setting
{
    public partial class FormNationality : System.Web.UI.Page
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
            bool result = AddGroup(txtNationality_Name.Text, txtNationality_Name_En.Text);
            if (result)
            {
                clearform();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Item was Sucessfully saved in system ! ');", true);
            }
        }

        void clearform()
        {
            txtNationality_Name.Text = string.Empty;
            txtNationality_Name_En.Text = string.Empty;
        }

        private bool AddGroup(string arabic_name, string english_name)
        {
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                Nationality group = db.Nationalities.Create();
                group.Nationality_Name_Ar = arabic_name;
                group.Nationality_Name_En = english_name;
                db.Nationalities.Add(group);
                db.SaveChanges();
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(group, logFileModule.settings);
                logFileModule.logfile(10, "إنشاء جنسية جديدة", "create new Nationalitys", LogData);
                //PriorityDataSource.DataBind();
            }
            catch { return false; }
            return true;
        }


        private void Change_LablesName_BasedOn_Language()
        {
            try
            {
                NationalityGridView.Columns[0].Caption = FieldNames.getFieldName("FormNationality-ID", "ID");
                NationalityGridView.Columns[1].Caption = FieldNames.getFieldName("FormNationality-ArabicName", "Arabic Name");
                NationalityGridView.Columns[2].Caption = FieldNames.getFieldName("FormNationality-Action", "Action");
                NationalityGridView.Columns[3].Caption = FieldNames.getFieldName("FormNationality-EnglishName", "English Name");
            }
            catch { }
        }


    }
}