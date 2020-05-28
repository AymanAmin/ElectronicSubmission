using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission
{
    public partial class Bachelors : System.Web.UI.Page
    {
        int SpecializationId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request["SpecializationId"], out SpecializationId) && SpecializationId > 0)
            {
                using (REU_RegistrationEntities db = new REU_RegistrationEntities())
                {
                    Specialization oneSpecialization = db.Specializations.FirstOrDefault(x => x.Specialization_Id == SpecializationId);
                    if (oneSpecialization != null)
                    {
                        headerBachelors.InnerHtml = oneSpecialization.Specialization_Name_En;
                        detailedBachelors.InnerHtml = oneSpecialization.Specialization_Name_En;
                        //bachelorsReque.InnerHtml = oneSpecialization.Condition;
                        headerBody.InnerHtml = "<i class='" + oneSpecialization.Specialization_Icon + "'></i> " + oneSpecialization.Specialization_Name_En;
                    }
                    else
                    {
                        Response.Redirect("~/homepage.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("~/homepage.aspx");
            }
            
        }
    }
}