using ElectronicSubmission.Classes;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
//using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
//using Treatment.Classes;
//using Treatment.Entity;
//using Website.Classes;


namespace ElectronicSubmission.Pages.Setting
{
    public partial class FormSpecialization : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        int EmployeeId = 0;

        int SpecializationId = 0;
        //LogFile Data
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        List<Specialization> listSpecialization = new List<Specialization>();
        public string name { get; set; }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["IsECMS"] != null)
                if (!(bool)Session["IsECMS"])
                    this.MasterPageFile = "~/EminutesMaster.Master";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            if (!IsPostBack)
            {
                FillDropDownLists();
            }
            listSpecialization = new List<Specialization>();
            listSpecialization = db.Specializations.ToList();
            UserCard();
            Emp_Language();
        }

        public void Emp_Language()
        {
            if (SessionWrapper.LoggedUser.Language_id == 1)
            {
                Collage_Id.DataTextField = "Collage_Name_Ar";
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int collegeId = 0;
            int.TryParse(Collage_Id.SelectedValue, out collegeId);
            int.TryParse(SpecId.Value, out SpecializationId);
            bool result = AU_Specialization(Specialization_Name_Ar.Text, Specialization_Name_En.Text, collegeId, Specialization_Icon.Text, High_School_Percent.Text, Capabilities_Percent.Text, My_Achievement_Percent.Text, Weighted_Ratio_Percent.Text, Specialization_Description_Ar.Text, Specialization_Description_En.Text, speech.Text, Minutes.Text);

            if (result)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The  Specialization was Sucessfully saved in system ! ');", true);
                clearForm();
                listSpecialization = new List<Specialization>();
                listSpecialization = db.Specializations.ToList();
                UserCard();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','Error');", true);
            }
        }

        public bool AU_Specialization(string SpecializationNameAr, string SpecializationNameEn, int collegeId, string SpecializationIcon, string HighSchoolPercent, string CapabilitiesPercent, string MyAchievementPercent, string WeightedRatioPercent, string SpecializationDescriptionAr, string SpecializationDescriptionEn, string Speech, string Minutes)
        {
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                Specialization Specl = db.Specializations.Create();
                if (SpecializationId != 0) Specl = db.Specializations.First(x => x.Specialization_Id == SpecializationId);
                Specl.Specialization_Name_Ar = SpecializationNameAr;
                Specl.Specialization_Name_En = SpecializationNameEn;
                Specl.Collage_Id = collegeId;
                Specl.Specialization_Icon = SpecializationIcon;
                Specl.High_School_Percent = HighSchoolPercent;
                Specl.Capabilities_Percent = CapabilitiesPercent;
                Specl.My_Achievement_Percent = MyAchievementPercent;
                Specl.Weighted_Ratio_Percent = WeightedRatioPercent;
                Specl.Specialization_Description_Ar = SpecializationDescriptionAr;
                Specl.Specialization_Description_En = SpecializationDescriptionEn;
                Specl.Condition_Ar = Speech;
                Specl.Condition_En = Minutes;
                string ImagepathProfile = UploadFile(1);
                if (ImagepathProfile != "")
                    Specl.Specialization_Image = ImagepathProfile;
                else if (SpecializationId == 0)
                    ImagepathProfile = "blue-and-silver.jpg";

                if (SpecializationId != 0)
                {
                    db.Entry(Specl).State = System.Data.EntityState.Modified;
                }
                else
                {
                    db.Specializations.Add(Specl);
                }
                db.SaveChanges();

                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(Specl, logFileModule.settings);
                if (SpecializationId != 0)
                {
                    logFileModule.logfile(10, "تعديل بيانات تخصص", "Update Specialization", LogData);
                }
                else
                {
                    logFileModule.logfile(10, "إضافة تخصص جديد", "Add New Specialization", LogData);
                }
                SpecializationId = Specl.Specialization_Id;
            }
            catch { return false; }
            return true;
        }

        public string UploadFile(int Type)
        {
            string Imagepath = " ";
            switch (Type)
            {
                case 1:
                    if (this.Page.IsValid)
                    {
                        if (!UtilityClass.UploadFileIsValid(ref addAttachments1, UtilityClass.ValidImagesExtentions))
                        {
                            Imagepath = "false";
                        }
                        Imagepath = string.Empty;

                        Imagepath = UtilityClass.UploadFileWithExtention(ref addAttachments1, Server.MapPath(@"~\Template\extra-images\"));
                    }
                    break;
            }
            return Imagepath;
        }

        private void clearForm()
        {
            Specialization_Name_Ar.Text = "";
            Specialization_Name_En.Text = "";
            Specialization_Icon.Text = "";
            High_School_Percent.Text = "";
            Capabilities_Percent.Text = "";
            My_Achievement_Percent.Text = "";
            Weighted_Ratio_Percent.Text = "";
            Specialization_Description_Ar.Text = "";
            Specialization_Description_En.Text = "";
            speech.Text = "";
            Minutes.Text = "";
        }
        private void Fillter()
        {
            string val_Fillter = string.Empty;
            listSpecialization = new List<Specialization>();
            listSpecialization = db.Specializations.ToList();
            if (CollegeF.SelectedIndex != 0)
            {
                int id = int.Parse(CollegeF.SelectedValue.ToString());
                listSpecialization = listSpecialization.Where(x => x.Collage_Id == id).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("FormSpecialization-College", "College") + " : </strong>" + CollegeF.SelectedItem + " , ";
            }
            if (Keyword.Text.Trim() != "")
            {
                listSpecialization = listSpecialization.Where(x => (x.Specialization_Name_Ar != null && x.Specialization_Name_Ar.Contains(Keyword.Text.Trim())) || (x.Specialization_Name_En != null && x.Specialization_Name_En.Contains(Keyword.Text.Trim()))).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("FormSpecialization-Keyword", "Keyword") + " : </strong>" + Keyword.Text + " , ";
            }

            // Create the details of fillter text
            if (val_Fillter != string.Empty)
            {
                val_Fillter = val_Fillter.Substring(0, val_Fillter.Length - 3);
                FilterUsed.Text = val_Fillter + "";
            }
            else
                FilterUsed.Text = "";

            UserCard();
        }


        public void UserCard()
        {
            int i = 0;
            string ImgTag = "";
            string img = "";
            string yourHTMLstring = "";
            string Emp_Name = "";
            UCard.Controls.Clear();
            while (i < listSpecialization.Count)
            {

                if (listSpecialization[i].Specialization_Image != "" && listSpecialization[i].Specialization_Image != null)
                {
                    img = listSpecialization[i].Specialization_Image.ToString();
                }
                else
                {
                    img = "blue-and-silver.jpg";
                }
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Emp_Name = listSpecialization[i].Specialization_Name_Ar.ToString();
                else
                    Emp_Name = listSpecialization[i].Specialization_Name_En.ToString();
                ImgTag = "<img class='img-fluid img-radius'" + "src='../../../../Template/extra-images/" + img + "'alt='" + img + "' style='height: 180px;'>";
                yourHTMLstring = "<div class='col-lg-6 col-xl-3 col-md-6'>" +
                                               "<div class='card rounded-card user-card'>" +
                                                   "<div class='card-block'>" +
                                                          " <div class='img-hover'>" +
                                                               ImgTag +
                                                               "<div class='img-overlay img-radius'>" +
                                                                "   <span>" +
                                                                      " <a class='btn btn-primary btn-outline-primary btn-icon'  id='" + listSpecialization[i].Specialization_Id.ToString() + "'OnClick='showmodel(this)'><i class='icofont icofont-ui-edit text-info h5'></i></a> " +
                                                                      " <a class='btn btn-danger btn-outline-danger btn-icon'  id='" + listSpecialization[i].Specialization_Id.ToString() + "'OnClick='DeleteEmplooye(this)'><i class='icofont icofont-ui-delete text-danger h5'></i></a> " +
                                                                   "</span>" +
                                                               "</div>" +
                                                           "</div>" +
                                                           "<div class='user-content'>" +
                                                               "<h4 class=''>" + Emp_Name + "</h4> " +
                                                          " </div> " +
                                                  " </div>" +
                                              " </div> " +
                                        "</div>";
                UCard.Controls.Add(new LiteralControl(yourHTMLstring));
                i += 1;
            }
        }

        [WebMethod]
        public static string ViewUserCard(int AjaxSpecialization_Id)
        {

            using (var dbcont = new REU_RegistrationEntities())
            {
                var Emplo = dbcont.Specializations.Where(d => d.Specialization_Id == AjaxSpecialization_Id).Select(x => new SpecializationDTO
                {
                    Specialization_Id = x.Specialization_Id,
                    Specialization_Name_Ar = x.Specialization_Name_Ar,
                    Specialization_Name_En = x.Specialization_Name_En,
                    Collage_Id = x.Collage_Id,
                    Specialization_Icon = x.Specialization_Icon,
                    High_School_Percent = x.High_School_Percent,
                    Capabilities_Percent = x.Capabilities_Percent,
                    My_Achievement_Percent = x.My_Achievement_Percent,
                    Weighted_Ratio_Percent = x.Weighted_Ratio_Percent,
                    Specialization_Image = x.Specialization_Image,
                    Specialization_Description_Ar = x.Specialization_Description_Ar,
                    Specialization_Description_En = x.Specialization_Description_En,
                    Condition_Ar = x.Condition_Ar,
                    Condition_En = x.Condition_En,
                }).FirstOrDefault();

                return JsonConvert.SerializeObject(Emplo);
            }
        }

        [WebMethod]
        public static void DeleteEmplooye(int AjaxSpecialization_Id)
        {
            LogFileModule logFileModule = new LogFileModule();
            String LogData = "";
            try
            {
                REU_RegistrationEntities db = new REU_RegistrationEntities();

                var DelSep = db.Specializations.First(x => x.Specialization_Id == AjaxSpecialization_Id);
                db.Specializations.Remove(DelSep);
                db.SaveChanges();
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(DelSep, logFileModule.settings);
                logFileModule.logfile(10, "حذف التخصص", "Delete Specialization", LogData);

            }
            catch (Exception e)
            {
            }

        }

        private void FillDropDownLists()
        {
            List<Collage> listCollage = db.Collages.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(CollegeF, "Collage_ID", "Collage_Name_Ar", listCollage, " - الكل -");
            else
                ddlFiller.dropDDL(CollegeF, "Collage_ID", "Collage_Name_En", listCollage, " - All -");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Fillter();
        }
    }
}