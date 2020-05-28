﻿using System;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadFillDrop();
                loadSpecialization();
            }
        }

        private void loadFillDrop()
        {
            try
            {
                using (REU_RegistrationEntities db = new REU_RegistrationEntities())
                {
                    List<Collage> listCollage = db.Collages.ToList();

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
                        listSpecialization = db.Specializations.Where(x => x.Specialization_Name_En.Contains(txtSearch)).ToList();
                    else if (txtSearch == "")
                        listSpecialization = db.Specializations.Where(x => x.Collage_Id == collegeId).ToList();
                    else listSpecialization = db.Specializations.Where(x => x.Collage_Id == collegeId && x.Specialization_Name_En.Contains(txtSearch)).ToList();

                    for (int i = 0; i < listSpecialization.Count; i++)
                    {
                        yourHTMLstring = "<li>"+
                                            "<div class='wm-box-service-wrap wm-bgcolor'>"+
                                                "<i class='" + listSpecialization[i].Specialization_Icon + "'></i>" +
                                                "<h6><a href='Bachelors.aspx?SpecializationId="+listSpecialization[i].Specialization_Id+"'>" + listSpecialization[i].Specialization_Name_En + " </a></h6>" +
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
    }
}