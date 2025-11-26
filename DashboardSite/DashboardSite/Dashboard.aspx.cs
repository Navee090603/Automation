using System;
using System.Collections.Generic;
using System.Web.UI;

namespace DashboardSite
{
    public partial class Dashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTasks();
            }
        }

        private void LoadTasks()
        {
            var tasks = new List<TaskItem>()
            {
                new TaskItem { Name = "SharePointSQL Monitoring", Frequency = "", FolderPath = @"C:\Users\naveent\OneDrive - Infinite Computer Solutions (India) Limited\Desktop\Automation" },
                new TaskItem { Name = "PAL & SUP report preparation", Frequency = "Weekly Once - Tue", FolderPath = @"C:\Operations\PAL & SUP report preparation" },
                new TaskItem { Name = "NCPDP report preparation", Frequency = "Daily", FolderPath = @"C:\Operations\NCPDP report preparation" },
                new TaskItem { Name = "SQL Monitoring", Frequency = "", FolderPath = @"C:\Operations\SQL Monitoring" },
                new TaskItem { Name = "Tidal Report - Daily", Frequency = "Daily", FolderPath = @"C:\Operations\Tidal Report" },
                new TaskItem { Name = "Email monitoring / Splunk Alert & Route Failure & XES Manager monitoring", Frequency = "", FolderPath = @"C:\Operations\Email Splunk XES" },
                new TaskItem { Name = "ODM validation", Frequency = "Daily", FolderPath = @"C:\Operations\ODM validation" },
                new TaskItem { Name = "834 Rejection report preparation", Frequency = "Morning - Daily", FolderPath = @"C:\Operations\834 Rejection report preparation" },
                new TaskItem { Name = "835 Checkwriter reporting", Frequency = "Weekly Twice Wed & Sat", FolderPath = @"C:\Operations\835 Checkwriter reporting" },
                new TaskItem { Name = "Batch files monitoring", Frequency = "", FolderPath = @"C:\Operations\Batch files monitoring" },
                new TaskItem { Name = "ST Route Location monitoring", Frequency = "", FolderPath = @"C:\Operations\ST Route Location monitoring" }
            };

            GridTasks.DataSource = tasks;
            GridTasks.DataBind();
        }

        // This helper returns a link that opens FolderViewer.aspx with the folder path
        protected string GetFileLink(object folderPathObj)
        {
            var path = Convert.ToString(folderPathObj ?? "");
            if (string.IsNullOrWhiteSpace(path)) return string.Empty;

            var display = Server.HtmlEncode(path);

            // Pass folder path to FolderViewer.aspx
            return $"<a href='FolderViewer.aspx?path={Server.UrlEncode(path)}' target='_blank'>{display}</a>";
        }
    }
}
