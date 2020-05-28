using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.RegistrationProcess
{
    /// <summary>
    /// Summary description for DeleteStudent
    /// </summary>
    public class DeleteStudent : IHttpHandler
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        public void ProcessRequest(HttpContext context)
        {
            if (context.Request["StudentID"] == null)
                context.Response.Redirect("~/homepage.aspx");

            int StudentID = int.Parse(context.Request["TopicId"].ToString());

            if (StudentID > 0) DeleteStudents(StudentID);

            context.Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public bool DeleteStudents(int StudentID)
        {
            LogFileModule logFileModule = new LogFileModule();
            String LogData = "";
            try
            {
                Student Stu = db.Students.First(x => x.Student_Id == StudentID);
                Stu.Suspended = 1;
                db.Entry(Stu).State = System.Data.EntityState.Modified;
                db.SaveChanges();
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(Stu, logFileModule.settings);
                logFileModule.logfile(10, "حذف طالب", "Delete Student", LogData);

            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }
    }
}