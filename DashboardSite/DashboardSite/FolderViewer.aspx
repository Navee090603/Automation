<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FolderViewer.aspx.cs" Inherits="DashboardSite.FolderViewer" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Folder Viewer</title>

    <style>
        body {
            font-family: Arial;
            margin: 20px;
        }
        .path-box {
            margin-bottom: 15px;
            padding: 10px;
            background: #f1f1f1;
            border-radius: 5px;
            font-size: 14px;
        }
        .grid {
            width: 100%;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">

        <asp:Literal ID="litPath" runat="server"></asp:Literal>

        <asp:GridView 
    ID="GridFiles" 
    runat="server" 
    AutoGenerateColumns="False" 
    CssClass="grid" 
    GridLines="Both" 
    CellPadding="6">

    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Name" />
        <asp:BoundField DataField="Type" HeaderText="Type" />

        <asp:TemplateField HeaderText="Open">
            <ItemTemplate>
                <a href='<%# Eval("FullPath", "file:///{0}") %>' target="_blank">
                    Open
                </a>
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>

</asp:GridView>


    </form>

</body>
</html>
