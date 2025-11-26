using System;
using System.Data;
using System.IO;

namespace DashboardSite
{
    public partial class FolderViewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string path = Request.QueryString["path"];

                if (string.IsNullOrEmpty(path) || !Directory.Exists(path))
                {
                    litPath.Text = "<div style='color:red;'>Invalid folder path</div>";
                    return;
                }

                litPath.Text = $"<div class='path-box'><b>Path:</b> {path}</div>";

                LoadFolder(path);
            }
        }

        private void LoadFolder(string path)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Name");
            dt.Columns.Add("Type");
            dt.Columns.Add("FullPath");

            // Add Folders
            foreach (var dir in Directory.GetDirectories(path))
            {
                dt.Rows.Add(Path.GetFileName(dir), "Folder", dir);
            }

            // Add Files
            foreach (var file in Directory.GetFiles(path))
            {
                dt.Rows.Add(Path.GetFileName(file), "File", file);
            }

            GridFiles.DataSource = dt;
            GridFiles.DataBind();
        }
    }
}
