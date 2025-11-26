<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DashboardSite.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Operations Dashboard</title>
    <!-- Bootstrap CSS (optional) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { padding: 20px; }
        .table { width: 100%; }
        .note { font-size: 0.9rem; color: #666; margin-top: 10px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="mb-3">Operations Dashboard</h1>
            <asp:GridView ID="GridTasks" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover">
                <Columns>
                    <asp:BoundField HeaderText="Task" DataField="Name" />
                    <asp:BoundField HeaderText="Frequency / Note" DataField="Frequency" />
                    <asp:TemplateField HeaderText="Folder">
                        <ItemTemplate>
                            <%# GetFileLink(Eval("FolderPath")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button runat="server" Text="Open" CssClass="btn btn-sm btn-outline-primary" OnClientClick='<%# "openFolder(\"" + Eval("FolderPath") + "\"); return false;" %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="note">
                Note: Some browsers block <code>file://</code> links from a page served over HTTP. If clicking the link doesn't open File Explorer, copy the path and paste it into File Explorer's address bar. See troubleshooting steps below.
            </div>
        </div>
    </form>

    <script>
        // Try to open a file:// link (browser may block)
        function openFolder(path) {
            // Replace backslashes with forward slashes and create file URL:
            var p = path.replace(/\\/g, '/');
            if (p.indexOf(':') !== -1 && p[0] !== '/') p = '/' + p; // C:/ -> /C:/
            var fileUrl = 'file://' + p;
            // open in new tab (may be blocked)
            window.open(fileUrl, '_blank');
        }
    </script>
</body>
</html>