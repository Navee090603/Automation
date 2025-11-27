//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace DashboardSite1
//{
//    public partial class Dashboard : Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                LoadData();
//            }
//        }

//        private void LoadData()
//        {
//            // 1. Define Data
//            var tasks = new List<TaskItem>
//            {
//                new TaskItem { Id=1, Name="SharePoint & SQL Monitoring", Frequency="Monitoring", FolderPath=@"C:\Users\naveent\OneDrive - Infinite Computer Solutions (India) Limited\Desktop\OpsFiles\SharePoint & SQL Monitoring", DocPath=@"C:\Docs\SharePoint" },
//                new TaskItem { Id=2, Name="PAL & SUP Report Preparation", Frequency="Weekly Once", FolderPath=@"C:\Users\naveent\OneDrive - Infinite Computer Solutions(India) Limited\Desktop\OpsFiles\PAL & SUP report preparation", DocPath =@"C:\Docs\PAL_SUP" },
//                new TaskItem { Id=3, Name="NCPDP Report Preparation", Frequency="Daily", FolderPath=@"C:\Operations\NCPDP", DocPath=@"C:\Docs\NCPDP" },
//                //new TaskItem { Id=4, Name="SQL Monitoring", Frequency="Monitoring", FolderPath=@"C:\Operations\SQL_Mon", DocPath=@"C:\Docs\SQL" },
//                new TaskItem { Id=5, Name="Tidal Report - Daily", Frequency="Daily", FolderPath=@"C:\Operations\Tidal", DocPath=@"C:\Docs\Tidal" },
//                new TaskItem { Id=6, Name="Email / Splunk / XES Monitoring", Frequency="Monitoring", FolderPath=@"C:\Operations\Alerts", DocPath=@"C:\Docs\Alerts" },
//                new TaskItem { Id=7, Name="ODM Validation", Frequency="Daily", FolderPath=@"C:\Operations\ODM", DocPath=@"C:\Docs\ODM" },
//                new TaskItem { Id=8, Name="834 Rejection Report", Frequency="Daily", FolderPath=@"C:\Operations\834", DocPath=@"C:\Docs\834" },
//                new TaskItem { Id=9, Name="835 Checkwriter Reporting", Frequency="Weekly Twice", FolderPath=@"C:\Operations\835", DocPath=@"C:\Docs\835" },
//                new TaskItem { Id=10, Name="Batch Files Monitoring", Frequency="Daily", FolderPath=@"C:\Operations\Batch", DocPath=@"C:\Docs\Batch" },
//                new TaskItem { Id=11, Name="ST Route Location Monitoring", Frequency="Daily", FolderPath=@"C:\Operations\ST_Route", DocPath=@"C:\Docs\ST_Route" }
//            };

//            // 2. Bind Tasks Grid
//            GridTasks.DataSource = tasks;
//            GridTasks.DataBind();

//            // 3. Bind Docs Grid
//            GridDocs.DataSource = tasks;
//            GridDocs.DataBind();

//            // 4. Calculate Stats for Top Cards
//            lblTotal.Text = tasks.Count.ToString();
//            lblDaily.Text = tasks.Count(x => x.Frequency.Contains("Daily")).ToString();
//            lblWeekly.Text = tasks.Count(x => x.Frequency.Contains("Weekly")).ToString();
//            lblMonitor.Text = tasks.Count(x => x.Frequency.Contains("Monitoring")).ToString();
//        }

//        // --- Sidebar Navigation Logic ---

//        protected void BtnNavTasks_Click(object sender, EventArgs e)
//        {
//            MainMultiView.ActiveViewIndex = 0; // Show Tasks
//            liTasks.Attributes["class"] = "active";
//            liDocs.Attributes["class"] = "";
//        }

//        protected void BtnNavDocs_Click(object sender, EventArgs e)
//        {
//            MainMultiView.ActiveViewIndex = 1; // Show Docs
//            liTasks.Attributes["class"] = "";
//            liDocs.Attributes["class"] = "active";
//        }

//        // --- Helper for Links (Uses your FolderView) ---

//        protected string GetFolderLink(object pathObj, string btnText = "Open Folder")
//        {
//            var path = Convert.ToString(pathObj ?? "");
//            if (string.IsNullOrWhiteSpace(path)) return "";

//            // Encode path for URL safety
//            var encodedPath = Server.UrlEncode(path);

//            // Determine Button Style based on context
//            string btnClass = btnText == "Open Folder" ? "btn btn-outline-primary btn-sm" : "btn btn-secondary btn-sm";

//            // Links to the FolderView.aspx we created earlier
//            return $"<a href='FolderView.aspx?path={encodedPath}' target='_blank' class='{btnClass}'>{btnText}</a>";
//        }
//    }
//}
//=====================================================================================================

//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace DashboardSite1
//{
//    public partial class Dashboard : Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                LoadData();
//            }
//        }

//        private void LoadData()
//        {
//            // IMPORTANT: 
//            // For the OneDrive folders, go to your browser, open the folder, copy the URL from the address bar (starts with https://), 
//            // and paste it into "FolderPath" below.

//            var tasks = new List<TaskItem>
//            {
//                // EXAMPLE 1: Using a OneDrive Web Link (Recommended for Shared Folders)
//                // Replace the string below with your actual https://onedrive... link
//                new TaskItem {
//                    Id=1,
//                    Name="SharePoint & SQL Monitoring",
//                    Frequency="Monitoring",
//                    FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FSharePoint%20%26%20SQL%20Monitoring&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1",
//                    DocPath=@"C:\Docs\SharePoint"
//                },

//                // EXAMPLE 2: Another OneDrive Link
//                new TaskItem {
//                    Id=2,
//                    Name="PAL & SUP Report Preparation",
//                    Frequency="Weekly Once",
//                    FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FPAL%20%26%20SUP%20Report%20Preparation&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1",
//                    DocPath =@"C:\Docs\PAL_SUP"
//                },

//                // EXAMPLE 3: Standard Local Network/Folder Paths (Keep these as they were if they work)
//                new TaskItem { Id=3, Name="NCPDP Report Preparation", Frequency="Daily", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FNCPDP%20report%20preparation&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\NCPDP" },
//                new TaskItem { Id=5, Name="Tidal Report - Daily", Frequency="Daily", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FTidal%20Report&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\Tidal" },
//                new TaskItem { Id=6, Name="Email / Splunk / XES Monitoring", Frequency="Monitoring", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FEmail%20or%20Splunk%20or%20XES%20Monitoring&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\Alerts" },
//                new TaskItem { Id=7, Name="ODM Validation", Frequency="Daily", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FODM%20Validation&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\ODM" },
//                new TaskItem { Id=8, Name="834 Rejection Report", Frequency="Daily", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2F834%20Rejection%20Report&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\834" },
//                new TaskItem { Id=9, Name="835 Checkwriter Reporting", Frequency="Weekly Twice", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2F835%20Check%20Writer%20Reporting&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\835" },
//                new TaskItem { Id=10, Name="Batch Files Monitoring", Frequency="Daily", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FBatch%20Files%20Monitoring&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\Batch" },
//                new TaskItem { Id=11, Name="ST Route Location Monitoring", Frequency="Daily", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FST%20Route%20Location%20Monitoring&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\ST_Route" }
//            };

//            // 2. Bind Tasks Grid
//            GridTasks.DataSource = tasks;
//            GridTasks.DataBind();

//            // 3. Bind Docs Grid
//            GridDocs.DataSource = tasks;
//            GridDocs.DataBind();

//            // 4. Calculate Stats for Top Cards
//            lblTotal.Text = tasks.Count.ToString();
//            lblDaily.Text = tasks.Count(x => x.Frequency.Contains("Daily")).ToString();
//            lblWeekly.Text = tasks.Count(x => x.Frequency.Contains("Weekly")).ToString();
//            lblMonitor.Text = tasks.Count(x => x.Frequency.Contains("Monitoring")).ToString();
//        }

//        // --- Sidebar Navigation Logic ---

//        protected void BtnNavTasks_Click(object sender, EventArgs e)
//        {
//            MainMultiView.ActiveViewIndex = 0; // Show Tasks
//            liTasks.Attributes["class"] = "active";
//            liDocs.Attributes["class"] = "";
//        }

//        protected void BtnNavDocs_Click(object sender, EventArgs e)
//        {
//            MainMultiView.ActiveViewIndex = 1; // Show Docs
//            liTasks.Attributes["class"] = "";
//            liDocs.Attributes["class"] = "active";
//        }

//        // --- SMART LINK HELPER ---
//        // This detects if the link is a Web URL (OneDrive) or a Local Folder
//        protected string GetFolderLink(object pathObj, string btnText = "Open Folder")
//        {
//            var path = Convert.ToString(pathObj ?? "");
//            if (string.IsNullOrWhiteSpace(path)) return "";

//            // Determine Button Style based on context
//            string btnClass = btnText == "Open Folder" ? "btn btn-outline-primary btn-sm" : "btn btn-secondary btn-sm";

//            // CHECK: Is this a Web URL (OneDrive/SharePoint)?
//            if (path.StartsWith("http", StringComparison.OrdinalIgnoreCase))
//            {
//                // Return a direct standard HTML link
//                return $"<a href='{path}' target='_blank' class='{btnClass}'>{btnText}</a>";
//            }
//            else
//            {
//                // It is a Local Folder (C:\ or \\Server), use the FolderView explorer
//                var encodedPath = Server.UrlEncode(path);
//                return $"<a href='FolderView.aspx?path={encodedPath}' target='_blank' class='{btnClass}'>{btnText}</a>";
//            }
//        }
//    }
//}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DashboardSite1
{
    public partial class Dashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            var tasks = new List<TaskItem>
            {
                new TaskItem {
                    Id=1,
                    Name="SharePoint & SQL Monitoring",
                    Frequency="Monitoring",
                    Status="Pending", // DEFAULT STATUS
                    FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FSharePoint%20%26%20SQL%20Monitoring&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1",
                    DocPath=@"C:\Docs\SharePoint"
                },
                new TaskItem {
                    Id=2,
                    Name="PAL & SUP Report Preparation",
                    Frequency="Weekly Once",
                    Status="Pending",
                    FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FPAL%20%26%20SUP%20Report%20Preparation&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1",
                    DocPath =@"C:\Docs\PAL_SUP"
                },
                new TaskItem { Id=3, Name="NCPDP Report Preparation", Frequency="Daily", Status="Pending", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FNCPDP%20report%20preparation&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\NCPDP" },
                new TaskItem { Id=5, Name="Tidal Report - Daily", Frequency="Daily", Status="Pending", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FTidal%20Report&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\Tidal" },
                new TaskItem { Id=6, Name="Email / Splunk / XES Monitoring", Frequency="Monitoring", Status="Pending", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FEmail%20or%20Splunk%20or%20XES%20Monitoring&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\Alerts" },
                new TaskItem { Id=7, Name="ODM Validation", Frequency="Daily", Status="Pending", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FODM%20Validation&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\ODM" },
                new TaskItem { Id=8, Name="834 Rejection Report", Frequency="Daily", Status="Pending", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2F834%20Rejection%20Report&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\834" },
                new TaskItem { Id=9, Name="835 Checkwriter Reporting", Frequency="Weekly Twice", Status="Pending", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2F835%20Check%20Writer%20Reporting&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\835" },
                new TaskItem { Id=10, Name="Batch Files Monitoring", Frequency="Daily", Status="Pending", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FBatch%20Files%20Monitoring&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\Batch" },
                new TaskItem { Id=11, Name="ST Route Location Monitoring", Frequency="Daily", Status="Pending", FolderPath=@"https://infics-my.sharepoint.com/personal/naveent_infinite_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnaveent%5Finfinite%5Fcom%2FDocuments%2FDesktop%2FOpsFiles%2FST%20Route%20Location%20Monitoring&sortField=LinkFilename&isAscending=true&viewid=be0bc77b%2Da6d7%2D428c%2D9235%2Dcc0b15fe3e4c&ga=1", DocPath=@"C:\Docs\ST_Route" }
            };

            // Bind Grids
            GridTasks.DataSource = tasks;
            GridTasks.DataBind();

            GridDocs.DataSource = tasks;
            GridDocs.DataBind();

            // Stats
            lblTotal.Text = tasks.Count.ToString();
            lblDaily.Text = tasks.Count(x => x.Frequency.Contains("Daily")).ToString();
            lblWeekly.Text = tasks.Count(x => x.Frequency.Contains("Weekly")).ToString();
            lblMonitor.Text = tasks.Count(x => x.Frequency.Contains("Monitoring")).ToString();
        }

        protected void BtnNavTasks_Click(object sender, EventArgs e)
        {
            MainMultiView.ActiveViewIndex = 0;
            liTasks.Attributes["class"] = "active";
            liDocs.Attributes["class"] = "";
        }

        protected void BtnNavDocs_Click(object sender, EventArgs e)
        {
            MainMultiView.ActiveViewIndex = 1;
            liTasks.Attributes["class"] = "";
            liDocs.Attributes["class"] = "active";
        }

        protected string GetFolderLink(object pathObj, string btnText = "Open Folder")
        {
            var path = Convert.ToString(pathObj ?? "");
            if (string.IsNullOrWhiteSpace(path)) return "";
            string btnClass = btnText == "Open Folder" ? "btn btn-outline-primary btn-sm" : "btn btn-secondary btn-sm";

            if (path.StartsWith("http", StringComparison.OrdinalIgnoreCase))
            {
                return $"<a href='{path}' target='_blank' class='{btnClass}'>{btnText}</a>";
            }
            else
            {
                var encodedPath = Server.UrlEncode(path);
                return $"<a href='FolderView.aspx?path={encodedPath}' target='_blank' class='{btnClass}'>{btnText}</a>";
            }
        }
    }

    // UPDATED CLASS WITH STATUS
    
}