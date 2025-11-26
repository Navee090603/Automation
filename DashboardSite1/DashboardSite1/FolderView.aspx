<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FolderView.aspx.cs" Inherits="DashboardSite1.FolderView" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>File Explorer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        body { padding: 20px; background-color: #f8f9fa; font-family: 'Segoe UI', sans-serif; }
        .file-icon { width: 20px; text-align: center; margin-right: 10px; color: #555; }
        .folder-icon { color: #f0ad4e; } /* Orange folder color */
        .row-item { cursor: pointer; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container bg-white p-4 shadow-sm rounded">
            
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4 class="text-primary"><i class="fa fa-folder-open me-2"></i>File Explorer</h4>
                <asp:Button ID="BtnBack" runat="server" Text="← Back to Dashboard" CssClass="btn btn-secondary btn-sm" OnClick="BtnBack_Click" />
            </div>

            <div class="alert alert-light border small">
                <strong>Current Path:</strong> <asp:Label ID="LblCurrentPath" runat="server" Text=""></asp:Label>
            </div>

            <asp:LinkButton ID="LinkUp" runat="server" CssClass="btn btn-light border mb-2 btn-sm" OnClick="LinkUp_Click" Visible="false">
                <i class="fa fa-level-up-alt me-2"></i> Up one level
            </asp:LinkButton>

            <asp:Label ID="LblError" runat="server" CssClass="text-danger d-block mb-2" Visible="false"></asp:Label>

            <asp:GridView ID="GridFiles" runat="server" AutoGenerateColumns="false" CssClass="table table-hover table-striped" OnRowCommand="GridFiles_RowCommand" GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <i class='<%# IsFolder(Eval("FileSystemType")) ? "fa fa-folder folder-icon file-icon" : "fa fa-file file-icon" %>'></i>
                            
                            <asp:LinkButton ID="LinkItem" runat="server" 
                                CommandName='<%# IsFolder(Eval("FileSystemType")) ? "OpenFolder" : "DownloadFile" %>' 
                                CommandArgument='<%# Eval("FullPath") %>' 
                                Text='<%# Eval("Name") %>' 
                                CssClass="text-decoration-none text-dark fw-bold"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Size" HeaderText="Size" ItemStyle-CssClass="text-muted small" />
                    <asp:BoundField DataField="LastModified" HeaderText="Date Modified" ItemStyle-CssClass="text-muted small" />
                </Columns>
                <EmptyDataTemplate>
                    <div class="text-center text-muted p-3">This folder is empty.</div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </form>
</body>
</html>