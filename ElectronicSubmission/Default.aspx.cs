using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission
{
    public partial class Default : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        List<Student> StudentList = new List<Student>();
        List<Sequence> SequenceList = new List<Sequence>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            lineChart();

            int UserID = SessionWrapper.LoggedUser.Employee_Id;

            StudentList = db.Students.ToList();
            SequenceList = db.Sequences.ToList();
            Treatment_Status();
            Charts();
        }
        private void Treatment_Status()
        {
            txtAllStudents.Text = StudentList.Count().ToString();
            txtInProgress.Text = StudentList.Where(x => x.Student_Status_Id < 14).Count().ToString();
            txtSuccessfully.Text = StudentList.Where(x => x.Student_Status_Id == 14).Count().ToString();
            txtFailure.Text = StudentList.Where(x => x.Student_Status_Id == 15).Count().ToString();
            string str = FieldNames.getFieldName("Default-Update", "Update") + " : ";

            txtLastUpdateOne.Text = str + DateTime.Now.ToShortTimeString();
            txtLastUpdateTwo.Text = str + DateTime.Now.ToShortTimeString();
            txtLastUpdateThree.Text = str + DateTime.Now.ToShortTimeString();
            txtLastUpdateFour.Text = str + DateTime.Now.ToShortTimeString();
        }
        private void Charts()
        {
            //List<Treatment_Master> FullMaster_Treatment = db.Treatment_Master.ToList();
            /* Pie Chart */
            /*int new_treatment = DetialList.Where(x => x.Assignment_Status_Id == 1 && x.Is_Delete == false).Count();
            int under_process_treatment = DetialList.Where(x => x.Assignment_Status_Id == 2 && x.Is_Delete == false).Count() + MasterList.Where(x => x.Treatment_Status_Id == 1).Count();
            int finished_treatment = DetialList.Where(x => x.Assignment_Status_Id == 3 && x.Is_Delete == false).Count();
            int deleted_treatment = DetialList.Where(x => x.Is_Delete == true).Count() * 0;

            string New = FieldNames.getFieldName("Default-New", "New");
            string Under_Process = FieldNames.getFieldName("Default-UnderProcess", "Under Process");
            string Finised = FieldNames.getFieldName("Default-Finised", "Finised");
            string Deleted = FieldNames.getFieldName("Default-Deleted", "Deleted"); 

            string data = "[" + new_treatment + ", " + under_process_treatment + ", " + finished_treatment + ", " + deleted_treatment + "]";
            string names = "['"+New+"', '"+Under_Process+"', '"+Finised+"', '"+Deleted+"']";
            string Pie_Function = "Pie_Chart(" + data + "," + names + ");";*/
            /*  End of Pie Chart */


            /* Treatment Per mounth Chart */
            /*DateTime date_today = DateTime.Now;
            int day = date_today.Day;
            date_today = date_today.AddDays(-day + 1);
            List<DateTime> DateList = new List<DateTime>();
            for (int i = 0; i < 6; i++)
            {
                DateList.Add(date_today);
                date_today = date_today.AddMonths(-1);
            }

            string Total = "[";
            string Recived = "[";
            string Sent = "[";
            string categories = "[";

            for (int i = DateList.Count - 1; i >= 0; i--)
            {
                int sent = MasterList.Where(x => x.Create_Date > DateList[i] && x.Create_Date < DateList[i].AddDays(30) && x.Treatment_Status_Id == 1).Count();
                int recived = 0;
                for (int k = 0; k < DetialList.Count; k++)
                {
                    recived += FullMaster_Treatment.Where(x => x.Create_Date > DateList[i] && x.Create_Date < DateList[i].AddDays(30) && x.Treatment_Id == DetialList[k].Treatment_Id).Count();
                }

                Total += (sent + recived).ToString();
                Recived += recived.ToString();
                Sent += sent.ToString();
                string mounth = DateList[i].ToString("MMM", CultureInfo.InvariantCulture);
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    mounth = ArabicDate(mounth);
                categories += "'" + mounth + "'";
                if (i > 0)
                {
                    Total += ",";
                    Recived += ",";
                    Sent += ",";
                    categories += ",";
                }
            }
            Total += "]";
            Recived += "]";
            Sent += "]";
            categories += "]";
            string Treatment_Per_Mounth_Function = "Pie_ChartColumn(" + Total + "," + Recived + "," + Sent + "," + categories + ");";*/
            /* End Treatment Per mounth Chart */

            /* Call javascript funcations   */
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", Pie_Function + "  " + Treatment_Per_Mounth_Function, true);
        }

        private void lineChart()
        {
            string Status = "[";
            string Data = "[";
            List<Status> StatusList = db.Status.ToList();
            for(int i = 0; i < StatusList.Count; i++)
            {
                List<Student> students = StatusList[i].Students.ToList();
                Status += StatusList[i].Status_Name_En;
                Data += students.Count.ToString();
                if (i > 0 && i < StatusList.Count - 1)
                {
                    Status += ",";
                    Data += ",";
                }
            }
            Status += "]";
            Data += "]";
            string lineChartfun = "lineChart(" + Data + "," + Status + ")";

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", lineChartfun, true);
        }

        private string ArabicDate(string DateName)
        {
            if (DateName == "Jan")
                DateName = "يناير";
            else if (DateName == "Feb")
                DateName = "فبراير";
            else if (DateName == "Mar")
                DateName = "مارس";
            else if (DateName == "Apr")
                DateName = "ابريل";
            else if (DateName == "May")
                DateName = "مايو";
            else if (DateName == "Jun")
                DateName = "يونيو";
            else if (DateName == "Jul")
                DateName = "يوليو";
            else if (DateName == "Aug")
                DateName = "أغسطس";
            else if (DateName == "Sep")
                DateName = "سبتمبر";
            else if (DateName == "Oct")
                DateName = "اكتوبر";
            else if (DateName == "Nov")
                DateName = "نوفمبر";
            else if (DateName == "Dec")
                DateName = "ديسمبر";

            return DateName;
        }
    }
}