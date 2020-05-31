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

            StudentList = db.Students.ToList();
            SequenceList = db.Sequences.ToList();
            Treatment_Status();
            lineChart();
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

        private void lineChart()
        {
            string Status = "[";
            string Data = "[";
            string AvgDelay = "[";
            List<Status> StatusList = db.Status.ToList();
            for (int i = 0; i < StatusList.Count; i++)
                StatusList[i].Status_Color = "0";

            List<Sequence> list_sequence = db.Sequences.ToList();
            DateTime date_two = DateTime.Now;
            int student_id = 0;
            for (int i = 0; i < list_sequence.Count; i++)
            {
                try
                {
                    DateTime date_one = (DateTime)list_sequence[i].DateCreation;
                    student_id = (int)list_sequence[i].Student_Id;
                    Sequence nextDate = list_sequence.Where(x => x.Student_Id == student_id && x.DateCreation > date_one).FirstOrDefault();
                    if (nextDate != null)
                        date_two = (DateTime)nextDate.DateCreation;

                    int status_id = (int)list_sequence[i].Status_Id;
                    StatusList[status_id].Status_Color = (double.Parse(StatusList[status_id].Status_Color) + (date_two - date_one).TotalHours).ToString();

                }
                catch { }
            }

            for (int i = 0; i < StatusList.Count; i++)
            {
                List<Student> students = StatusList[i].Students.ToList();

                Status += "'" + StatusList[i].Status_Name_En + "'";
                Data += students.Count.ToString();
                AvgDelay += Math.Round(double.Parse(StatusList[i].Status_Color),1);

                if (i < StatusList.Count - 1)
                {
                    Status += ",";
                    Data += ",";
                    AvgDelay += ",";
                }
            }
            Status += "]";
            Data += "]";
            AvgDelay += "]";

            string Pie_Function = "Pie_Chart(" + Data + "," + Status + ");";
            /* Pie Chart */
            string lineChartfun = "lineChart(" + AvgDelay + "," + Status + ");";

            /* Treatment Per mounth Chart */
            DateTime date_today = DateTime.Now;
            int day = date_today.Day;
            date_today = date_today.AddDays(-day + 1);
            List<DateTime> DateList = new List<DateTime>();
            for (int i = 0; i < 12; i++)
            {
                DateList.Add(date_today);
                date_today = date_today.AddMonths(-1);
            }

            string Total = "[";
            string categories = "[";

            for (int i = DateList.Count - 1; i >= 0; i--)
            {
                Total += StudentList.Where(x => x.Student_CreationDate >= DateList[i] && x.Student_CreationDate <= DateList[i].AddDays(30)).Count().ToString();

                string mounth = DateList[i].ToString("MMM", CultureInfo.InvariantCulture);
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    mounth = ArabicDate(mounth);
                categories += "'" + mounth + "'";
                if (i > 0)
                {
                    Total += ",";
                    categories += ",";
                }
            }
            Total += "]";
            categories += "]";
            string Treatment_Per_Mounth_Function = "Pie_ChartColumn(" + Total + "," + categories + ");";
            /* End Treatment Per mounth Chart */

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", Pie_Function + " " + lineChartfun + " " + Treatment_Per_Mounth_Function, true);
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