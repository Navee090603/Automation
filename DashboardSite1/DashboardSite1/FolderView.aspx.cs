using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DashboardSite1
{
    public partial class FolderView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the path sent from the Dashboard
                string path = Request.QueryString["path"];
                LoadFolder(path);
            }
        }

        private void LoadFolder(string path)
        {
            LblError.Visible = false;

            // CHECK 1: Is the path empty?
            if (string.IsNullOrWhiteSpace(path))
            {
                LblError.Text = "No folder path was provided.";
                LblError.Visible = true;
                return;
            }

            // CHECK 2: Does the folder actually exist on THIS computer?
            if (!Directory.Exists(path))
            {
                LblError.Text = $"Folder not found: {path} <br/> Please check if this folder exists on your C: drive.";
                LblError.Visible = true;
                return;
            }

            LblCurrentPath.Text = path;

            // Show "Up" button if path is long enough
            LinkUp.Visible = path.Length > 3;
            LinkUp.CommandArgument = Directory.GetParent(path)?.FullName;

            try
            {
                DirectoryInfo dirInfo = new DirectoryInfo(path);
                List<FileItem> items = new List<FileItem>();

                // Get Folders
                foreach (var d in dirInfo.GetDirectories())
                {
                    items.Add(new FileItem
                    {
                        Name = d.Name,
                        FullPath = d.FullName,
                        FileSystemType = "Folder",
                        Size = "",
                        LastModified = d.LastWriteTime.ToString("yyyy-MM-dd HH:mm")
                    });
                }

                // Get Files
                foreach (var f in dirInfo.GetFiles())
                {
                    items.Add(new FileItem
                    {
                        Name = f.Name,
                        FullPath = f.FullName,
                        FileSystemType = "File",
                        Size = FormatBytes(f.Length),
                        LastModified = f.LastWriteTime.ToString("yyyy-MM-dd HH:mm")
                    });
                }

                GridFiles.DataSource = items;
                GridFiles.DataBind();
            }
            catch (Exception ex)
            {
                LblError.Text = "Error reading folder: " + ex.Message;
                LblError.Visible = true;
            }
        }

        protected void GridFiles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string targetPath = e.CommandArgument.ToString();

            if (e.CommandName == "OpenFolder")
            {
                // Reload page with new path
                Response.Redirect("FolderView.aspx?path=" + Server.UrlEncode(targetPath));
            }
            else if (e.CommandName == "DownloadFile")
            {
                // Download file
                FileInfo file = new FileInfo(targetPath);
                if (file.Exists)
                {
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AppendHeader("Content-Disposition", "filename=" + file.Name);
                    Response.TransmitFile(file.FullName);
                    Response.End();
                }
            }
        }

        protected void LinkUp_Click(object sender, EventArgs e)
        {
            string parent = ((LinkButton)sender).CommandArgument;
            if (!string.IsNullOrEmpty(parent))
                Response.Redirect("FolderView.aspx?path=" + Server.UrlEncode(parent));
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        public bool IsFolder(object type)
        {
            return type.ToString() == "Folder";
        }

        private string FormatBytes(long bytes)
        {
            string[] suffixes = { "B", "KB", "MB", "GB", "TB" };
            int counter = 0;
            decimal number = (decimal)bytes;
            while (Math.Round(number / 1024) >= 1)
            {
                number = number / 1024;
                counter++;
            }
            return string.Format("{0:n1} {1}", number, suffixes[counter]);
        }
    }

    // Helper class for data binding
    public class FileItem
    {
        public string Name { get; set; }
        public string FullPath { get; set; }
        public string FileSystemType { get; set; }
        public string Size { get; set; }
        public string LastModified { get; set; }
    }
}