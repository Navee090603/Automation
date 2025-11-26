<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DashboardSite1.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
    /* GLOBAL FONTS & LAYOUT */
    body { 
        font-family: 'Segoe UI', 'Roboto', Helvetica, Arial, sans-serif; 
        background-color: #f4f6f9; /* Light grey background for the main area */
        overflow-x: hidden; 
    }

    .wrapper { 
        display: flex; 
        width: 100%; 
        align-items: stretch; 
        min-height: 100vh; 
    }

    /* --- PROFESSIONAL SIDEBAR STYLES --- */
    .sidebar { 
        min-width: 260px; 
        display: none;
        max-width: 260px; 
        background: #212529; /* Dark Slate - Professional Standard */
        color: #fff; 
        transition: all 0.3s;
        box-shadow: 4px 0 15px rgba(0,0,0,0.1); /* Shadow to lift sidebar off the page */
        z-index: 1000;
    }

    /* Sidebar Header (Logo Area) */
    .sidebar .sidebar-header { 
        padding: 25px 20px; 
        background: #1b1e21; /* Slightly darker than sidebar for depth */
        border-bottom: 1px solid #32383e; 
    }
    .sidebar .sidebar-header h4 {
        font-size: 1.1rem;
        font-weight: 600;
        margin: 0;
        color: #f8f9fa;
        letter-spacing: 0.5px;
    }

    #sidebar.open {
    display: block; /* visible when class 'open' is added */
    }

    .sidebar ul.components { 
        padding: 15px 0; 
        border-bottom: none; 
    }

    /* Menu Links */
    .sidebar ul li a { 
        padding: 16px 25px; 
        font-size: 1rem; 
        display: flex; /* Flexbox aligns icons and text perfectly */
        align-items: center;
        color: #adb5bd; /* Soft gray text (easy on eyes) */
        text-decoration: none; 
        transition: all 0.3s; 
        border-left: 4px solid transparent; /* Hidden border for hover effect */
    }

    /* Hover Effect */
    .sidebar ul li a:hover { 
        color: #fff; 
        background: #2c3034; 
        border-left: 4px solid #6c757d; /* Grey accent on hover */
    }

    /* Active Item (The selected tab) */
    .sidebar ul li.active > a { 
        color: #fff; 
        /* Modern Gradient Blue Background */
        background: linear-gradient(90deg, #0d6efd 0%, #0a58ca 100%); 
        border-left: 4px solid #6610f2; /* Purple/Blue Accent line */
        box-shadow: 0 4px 6px rgba(0,0,0,0.2);
    }

    .sidebar-icon { 
        margin-right: 15px; 
        width: 20px; 
        text-align: center; 
        font-size: 1.1em;
    }

    /* --- CONTENT AREA --- */
    .content { 
        width: 100%; 
        padding: 30px; 
    }
    
    /* DASHBOARD CARDS */
    .stat-card { 
        background: #fff; 
        border-radius: 10px; /* Softer corners */
        box-shadow: 0 4px 12px rgba(0,0,0,0.05); 
        transition: transform 0.2s ease-in-out; 
        cursor: pointer; 
        border-left: 5px solid #ccc; 
    }
    .stat-card:hover { 
        transform: translateY(-5px); 
        box-shadow: 0 8px 20px rgba(0,0,0,0.1); 
    }
    .stat-card.card-daily { border-left-color: #28a745; }
    .stat-card.card-weekly { border-left-color: #ffc107; }
    .stat-card.card-monitor { border-left-color: #17a2b8; }
    
    /* TABLE STYLES */
    .custom-table { 
        background: white; 
        border-radius: 10px; 
        overflow: hidden; 
        box-shadow: 0 4px 12px rgba(0,0,0,0.05); 
        border: 1px solid #e9ecef;
    }
    .custom-table thead { 
        background-color: #f8f9fa; /* Light grey header instead of black for modern look */
        color: #495057; 
        border-bottom: 2px solid #dee2e6;
    }
    .custom-table th { font-weight: 600; text-transform: uppercase; font-size: 0.85rem; letter-spacing: 0.5px; }
    .custom-table th, .custom-table td { padding: 18px 20px; vertical-align: middle; }
    
    /* BADGES */
    .badge-soft-success { background-color: #d1e7dd; color: #0f5132; padding: 6px 12px; border-radius: 50px; font-weight: 600; font-size: 0.8em; }
    .badge-soft-warning { background-color: #fff3cd; color: #664d03; padding: 6px 12px; border-radius: 50px; font-weight: 600; font-size: 0.8em; }
    .badge-soft-info { background-color: #cff4fc; color: #055160; padding: 6px 12px; border-radius: 50px; font-weight: 600; font-size: 0.8em; }
</style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <nav class="sidebar">
                <div class="sidebar-header">
                    <h4><i class="fa fa-cogs me-2"></i>Menu</h4>
                </div>
                <ul class="list-unstyled components">
                    <li id="liTasks" runat="server" class="active">
                        <asp:LinkButton ID="BtnNavTasks" runat="server" OnClick="BtnNavTasks_Click">
                            <i class="fa fa-list-check sidebar-icon"></i> Tasks
                        </asp:LinkButton>
                    </li>
                    <li id="liDocs" runat="server">
                        <asp:LinkButton ID="BtnNavDocs" runat="server" OnClick="BtnNavDocs_Click">
                            <i class="fa fa-book sidebar-icon"></i> Documents
                        </asp:LinkButton>
                    </li>
                </ul>
            </nav>

            <div class="content">
                
                <asp:MultiView ID="MainMultiView" runat="server" ActiveViewIndex="0">
                    
                    <asp:View ID="ViewTasks" runat="server">
                        <h2 class="mb-4 text-dark">Infinite CareSource Automation</h2>

                        <div class="row mb-4">
                            <div class="col-md-3">
                                <div class="stat-card p-3" onclick="filterTable('all')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-muted text-uppercase mb-1">Total </h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblTotal" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-secondary opacity-25"><i class="fa fa-list"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-card card-daily p-3" onclick="filterTable('Daily')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-success text-uppercase mb-1">Daily</h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblDaily" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-success opacity-25"><i class="fa fa-calendar-day"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-card card-weekly p-3" onclick="filterTable('Weekly')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-warning text-uppercase mb-1">Weekly</h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblWeekly" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-warning opacity-25"><i class="fa fa-calendar-week"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-card card-monitor p-3" onclick="filterTable('Monitoring')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-info text-uppercase mb-1">Monitoring</h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblMonitor" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-info opacity-25"><i class="fa fa-desktop"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="custom-table">
                            <asp:GridView ID="GridTasks" runat="server" AutoGenerateColumns="false" CssClass="table table-hover mb-0" GridLines="None">
                                <Columns>
                                    <asp:BoundField HeaderText="Task Name" DataField="Name" ItemStyle-Font-Bold="true" />
                                    
                                    <asp:TemplateField HeaderText="Frequency">
                                        <ItemTemplate>
                                            <span class="freq-badge"><%# Eval("Frequency") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <%# GetFolderLink(Eval("FolderPath")) %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:View>


                    <asp:View ID="ViewDocs" runat="server">
                        <h2 class="mb-4 text-dark">Documentation Library</h2>
                        <div class="alert alert-secondary">
                            <i class="fa fa-info-circle me-2"></i> Standard Operating Procedures (SOPs) and Reference Guides.
                        </div>

                         <div class="custom-table">
                            <asp:GridView ID="GridDocs" runat="server" AutoGenerateColumns="false" CssClass="table table-hover mb-0" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="Document">
                                        <ItemTemplate>
                                            <i class="fa fa-file-pdf text-danger me-2"></i>
                                            <%# Eval("Name") %> SOP
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Location">
                                        <ItemTemplate>
                                            <span class="text-muted small"><%# Eval("DocPath") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Access">
                                        <ItemTemplate>
                                            <%# GetFolderLink(Eval("DocPath"), "View Docs") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:View>

                </asp:MultiView>
            </div>
        </div>
    </form>

    <script>
        function filterTable(category) {
            var table = document.getElementById('<%= GridTasks.ClientID %>');
            var rows = table.getElementsByTagName('tr');

            // Start from 1 to skip header
            for (var i = 1; i < rows.length; i++) {
                var freqCell = rows[i].cells[1]; // Frequency column
                if (freqCell) {
                    var freqText = freqCell.innerText || freqCell.textContent;

                    if (category === 'all') {
                        rows[i].style.display = "";
                    }
                    // Simple text matching
                    else if (freqText.includes(category)) {
                        rows[i].style.display = "";
                    } else {
                        rows[i].style.display = "none";
                    }
                }
            }
        }

        // Auto-Style the badges on load
        document.addEventListener("DOMContentLoaded", function () {
            var badges = document.querySelectorAll('.freq-badge');
            badges.forEach(function (b) {
                var txt = b.innerText;
                if (txt.includes("Daily")) b.className = "badge-soft-success";
                else if (txt.includes("Weekly") || txt.includes("Wed")) b.className = "badge-soft-warning";
                else b.className = "badge-soft-info";
            });
        });
    </script>

    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            var btn = document.getElementById("btnSidebarToggle");
            var sidebar = document.getElementById("sidebar");

            if (btn && sidebar) {
                btn.addEventListener("click", function () {
                    sidebar.classList.toggle("open");
                });
            }
        });
    </script>

</body>
</html>--%>


<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DashboardSite1.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Infinite CareSource Automation</title>

    <!-- Favicon (place favicon.ico in root or adjust path) -->
    <link rel="icon" type="image/x-icon" href="favicon.ico" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        /* GLOBAL FONTS & LAYOUT */
        body {
            font-family: 'Segoe UI', 'Roboto', Helvetica, Arial, sans-serif;
            background-color: #f4f6f9; /* Light grey background for the main area */
            overflow-x: hidden;
        }

        .wrapper {
            display: flex;
            width: 100%;
            align-items: stretch;
            min-height: 100vh;
        }

        /* --- PROFESSIONAL SIDEBAR STYLES --- */
        .sidebar {
            min-width: 260px;
            max-width: 260px;
            background: #212529; /* Dark Slate - Professional Standard */
            color: #fff;
            transition: all 0.3s;
            box-shadow: 4px 0 15px rgba(0,0,0,0.1); /* Shadow to lift sidebar off the page */
            z-index: 1000;
            display: none; /* hidden by default */
        }

        /* Sidebar visible when 'open' is added */
        #sidebar.open {
            display: block;
        }

        /* Sidebar Header (Logo Area) */
        .sidebar .sidebar-header {
            padding: 25px 20px;
            background: #1b1e21; /* Slightly darker than sidebar for depth */
            border-bottom: 1px solid #32383e;
        }

        .sidebar .sidebar-header h4 {
            font-size: 1.1rem;
            font-weight: 600;
            margin: 0;
            color: #f8f9fa;
            letter-spacing: 0.5px;
        }

        .sidebar ul.components {
            padding: 15px 0;
            border-bottom: none;
        }

        /* Menu Links */
        .sidebar ul li a {
            padding: 16px 25px;
            font-size: 1rem;
            display: flex; /* Flexbox aligns icons and text perfectly */
            align-items: center;
            color: #adb5bd; /* Soft gray text (easy on eyes) */
            text-decoration: none;
            transition: all 0.3s;
            border-left: 4px solid transparent; /* Hidden border for hover effect */
        }

        /* Hover Effect */
        .sidebar ul li a:hover {
            color: #fff;
            background: #2c3034;
            border-left: 4px solid #6c757d; /* Grey accent on hover */
        }

        /* Active Item (The selected tab) */
        .sidebar ul li.active > a {
            color: #fff;
            /* Modern Gradient Blue Background */
            background: linear-gradient(90deg, #0d6efd 0%, #0a58ca 100%);
            border-left: 4px solid #6610f2; /* Purple/Blue Accent line */
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
        }

        .sidebar-icon {
            margin-right: 15px;
            width: 20px;
            text-align: center;
            font-size: 1.1em;
        }

        /* --- CONTENT AREA --- */
        .content {
            width: 100%;
            padding: 30px;
        }

        /* DASHBOARD CARDS */
        .stat-card {
            background: #fff;
            border-radius: 10px; /* Softer corners */
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            transition: transform 0.2s ease-in-out;
            cursor: pointer;
            border-left: 5px solid #ccc;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .stat-card.card-daily { border-left-color: #28a745; }
        .stat-card.card-weekly { border-left-color: #ffc107; }
        .stat-card.card-monitor { border-left-color: #17a2b8; }

        /* TABLE STYLES */
        .custom-table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            border: 1px solid #e9ecef;
        }

        .custom-table thead {
            background-color: #f8f9fa; /* Light grey header instead of black for modern look */
            color: #495057;
            border-bottom: 2px solid #dee2e6;
        }

        .custom-table th { font-weight: 600; text-transform: uppercase; font-size: 0.85rem; letter-spacing: 0.5px; }
        .custom-table th, .custom-table td { padding: 18px 20px; vertical-align: middle; }

        /* BADGES */
        .badge-soft-success {
            background-color: #d1e7dd;
            color: #0f5132;
            padding: 6px 12px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.8em;
        }

        .badge-soft-warning {
            background-color: #fff3cd;
            color: #664d03;
            padding: 6px 12px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.8em;
        }

        .badge-soft-info {
            background-color: #cff4fc;
            color: #055160;
            padding: 6px 12px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.8em;
        }

        /* Header (logo + title) */
        .page-header-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.5rem;
        }

        .page-title-wrap {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .page-title-wrap img {
            height: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <!-- Sidebar with id for JS -->
            <nav class="sidebar" id="sidebar">
                <div class="sidebar-header">
                    <h4><i class="fa fa-cogs me-2"></i>Menu</h4>
                </div>
                <ul class="list-unstyled components">
                    <li id="liTasks" runat="server" class="active">
                        <asp:LinkButton ID="BtnNavTasks" runat="server" OnClick="BtnNavTasks_Click">
                            <i class="fa fa-list-check sidebar-icon"></i> Tasks
                        </asp:LinkButton>
                    </li>
                    <li id="liDocs" runat="server">
                        <asp:LinkButton ID="BtnNavDocs" runat="server" OnClick="BtnNavDocs_Click">
                            <i class="fa fa-book sidebar-icon"></i> Documents
                        </asp:LinkButton>
                    </li>
                </ul>
            </nav>

            <div class="content">

                <!-- Top bar: toggle button + logo + title -->
                <div class="page-header-bar">
                    <button type="button" id="btnSidebarToggle" class="btn btn-outline-secondary">
                        <i class="fa fa-bars"></i>
                    </button>

                    <div class="page-title-wrap">
                        <!-- Update logo path as per your project -->
                        <img src="Images/Logo1.png" alt="Logo" style="height: 50px;" />
                        
                    </div>
                </div>

                <asp:MultiView ID="MainMultiView" runat="server" ActiveViewIndex="0">

                    <asp:View ID="ViewTasks" runat="server">
                        <h2 class="mb-4 text-dark">Automation Tasks</h2>
                        <div class="row mb-4">
                            <div class="col-md-3">
                                <div class="stat-card p-3" onclick="filterTable('all')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-muted text-uppercase mb-1">Total </h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblTotal" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-secondary opacity-25"><i class="fa fa-list"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-card card-daily p-3" onclick="filterTable('Daily')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-success text-uppercase mb-1">Daily</h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblDaily" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-success opacity-25"><i class="fa fa-calendar-day"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-card card-weekly p-3" onclick="filterTable('Weekly')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-warning text-uppercase mb-1">Weekly</h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblWeekly" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-warning opacity-25"><i class="fa fa-calendar-week"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-card card-monitor p-3" onclick="filterTable('Monitoring')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-info text-uppercase mb-1">Monitoring</h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblMonitor" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-info opacity-25"><i class="fa fa-desktop"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="custom-table">
                            <asp:GridView ID="GridTasks" runat="server" AutoGenerateColumns="false" CssClass="table table-hover mb-0" GridLines="None">
                                <Columns>
                                    <asp:BoundField HeaderText="Task Name" DataField="Name" ItemStyle-Font-Bold="true" />

                                    <asp:TemplateField HeaderText="Frequency">
                                        <ItemTemplate>
                                            <span class="freq-badge"><%# Eval("Frequency") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <%# GetFolderLink(Eval("FolderPath")) %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:View>

                    <asp:View ID="ViewDocs" runat="server">
                        <h2 class="mb-4 text-dark">Documentation Library</h2>
                        <div class="alert alert-secondary">
                            <i class="fa fa-info-circle me-2"></i> Standard Operating Procedures (SOPs) and Reference Guides.
                        </div>

                        <div class="custom-table">
                            <asp:GridView ID="GridDocs" runat="server" AutoGenerateColumns="false" CssClass="table table-hover mb-0" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="Document">
                                        <ItemTemplate>
                                            <i class="fa fa-file-pdf text-danger me-2"></i>
                                            <%# Eval("Name") %> SOP
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Location">
                                        <ItemTemplate>
                                            <span class="text-muted small"><%# Eval("DocPath") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Access">
                                        <ItemTemplate>
                                            <%# GetFolderLink(Eval("DocPath"), "View Docs") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:View>

                </asp:MultiView>
            </div>
        </div>
    </form>

    <script>
        function filterTable(category) {
            var table = document.getElementById('<%= GridTasks.ClientID %>');
            var rows = table.getElementsByTagName('tr');

            // Start from 1 to skip header
            for (var i = 1; i < rows.length; i++) {
                var freqCell = rows[i].cells[1]; // Frequency column
                if (freqCell) {
                    var freqText = freqCell.innerText || freqCell.textContent;

                    if (category === 'all') {
                        rows[i].style.display = "";
                    }
                    // Simple text matching
                    else if (freqText.includes(category)) {
                        rows[i].style.display = "";
                    } else {
                        rows[i].style.display = "none";
                    }
                }
            }
        }

        // Auto-Style the badges on load
        document.addEventListener("DOMContentLoaded", function () {
            var badges = document.querySelectorAll('.freq-badge');
            badges.forEach(function (b) {
                var txt = b.innerText;
                if (txt.includes("Daily")) b.className = "badge-soft-success";
                else if (txt.includes("Weekly") || txt.includes("Wed")) b.className = "badge-soft-warning";
                else b.className = "badge-soft-info";
            });
        });
    </script>

    <!-- Sidebar toggle script -->
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            var btn = document.getElementById("btnSidebarToggle");
            var sidebar = document.getElementById("sidebar");

            if (btn && sidebar) {
                btn.addEventListener("click", function () {
                    sidebar.classList.toggle("open");
                });
            }
        });
    </script>

</body>
</html>--%>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DashboardSite1.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Infinite CareSource Automation</title>

    <!-- Favicon (place favicon.ico in root or adjust path) -->
    <link rel="icon" type="image/x-icon" href="favicon.ico" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        /* [your existing CSS -- unchanged, omitted here for brevity] */
        body {
            font-family: 'Segoe UI', 'Roboto', Helvetica, Arial, sans-serif;
            background-color: #f4f6f9;
            overflow-x: hidden;
        }
        .wrapper {
            display: flex;
            width: 100%;
            align-items: stretch;
            min-height: 100vh;
        }
        .sidebar {
            min-width: 260px;
            max-width: 260px;
            background: #212529;
            color: #fff;
            transition: all 0.3s;
            box-shadow: 4px 0 15px rgba(0,0,0,0.1);
            z-index: 1000;
            display: none;
        }
        #sidebar.open {
            display: block;
        }
        .sidebar .sidebar-header {
            padding: 25px 20px;
            background: #1b1e21;
            border-bottom: 1px solid #32383e;
        }
        .sidebar .sidebar-header h4 {
            font-size: 1.1rem;
            font-weight: 600;
            margin: 0;
            color: #f8f9fa;
            letter-spacing: 0.5px;
        }
        .sidebar ul.components {
            padding: 15px 0;
            border-bottom: none;
        }
        .sidebar ul li a {
            padding: 16px 25px;
            font-size: 1rem;
            display: flex;
            align-items: center;
            color: #adb5bd;
            text-decoration: none;
            transition: all 0.3s;
            border-left: 4px solid transparent;
        }
        .sidebar ul li a:hover {
            color: #fff;
            background: #2c3034;
            border-left: 4px solid #6c757d;
        }
        .sidebar ul li.active > a {
            color: #fff;
            background: linear-gradient(90deg, #0d6efd 0%, #0a58ca 100%);
            border-left: 4px solid #6610f2;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
        }
        .sidebar-icon {
            margin-right: 15px;
            width: 20px;
            text-align: center;
            font-size: 1.1em;
        }
        .content {
            width: 100%;
            padding: 30px;
        }
        .stat-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            transition: transform 0.2s ease-in-out;
            cursor: pointer;
            border-left: 5px solid #ccc;
        }
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        .stat-card.card-daily { border-left-color: #28a745; }
        .stat-card.card-weekly { border-left-color: #ffc107; }
        .stat-card.card-monitor { border-left-color: #17a2b8; }
        .custom-table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            border: 1px solid #e9ecef;
        }
        .custom-table thead {
            background-color: #f8f9fa;
            color: #495057;
            border-bottom: 2px solid #dee2e6;
        }
        .custom-table th { font-weight: 600; text-transform: uppercase; font-size: 0.85rem; letter-spacing: 0.5px; }
        .custom-table th, .custom-table td { padding: 18px 20px; vertical-align: middle; }
        .badge-soft-success {
            background-color: #d1e7dd;
            color: #0f5132;
            padding: 6px 12px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.8em;
        }
        .badge-soft-warning {
            background-color: #fff3cd;
            color: #664d03;
            padding: 6px 12px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.8em;
        }
        .badge-soft-info {
            background-color: #cff4fc;
            color: #055160;
            padding: 6px 12px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.8em;
        }
        .page-header-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.5rem;
        }
        .page-title-wrap {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .page-title-wrap img {
            height: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <nav class="sidebar" id="sidebar">
                <div class="sidebar-header">
                    <h4><i class="fa fa-cogs me-2"></i>Menu</h4>
                </div>
                <ul class="list-unstyled components">
                    <li id="liTasks" runat="server" class="active">
                        <asp:LinkButton ID="BtnNavTasks" runat="server" OnClick="BtnNavTasks_Click">
                            <i class="fa fa-list-check sidebar-icon"></i> Tasks
                        </asp:LinkButton>
                    </li>
                    <li id="liDocs" runat="server">
                        <asp:LinkButton ID="BtnNavDocs" runat="server" OnClick="BtnNavDocs_Click">
                            <i class="fa fa-book sidebar-icon"></i> Documents
                        </asp:LinkButton>
                    </li>
                </ul>
            </nav>
            <div class="content">
                <asp:MultiView ID="MainMultiView" runat="server" ActiveViewIndex="0">
                    
                    <asp:View ID="ViewTasks" runat="server">
                        <!-- Unified header (logo + title) -->
                        <div class="page-header-bar">
                            <button type="button" id="btnSidebarToggle" class="btn btn-outline-secondary">
                                <i class="fa fa-bars"></i>
                            </button>
                            <div class="page-title-wrap" style="text-align: left;">
                                <span style="font-size:2rem; font-weight:600; color:#222;">Automation Tasks</span>
                                <img src="Images/Logo1.png" alt="Logo" style="height: 50px;" />
                                
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col-md-3">
                                <div class="stat-card p-3" onclick="filterTable('all')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-muted text-uppercase mb-1">Total </h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblTotal" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-secondary opacity-25"><i class="fa fa-list"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-card card-daily p-3" onclick="filterTable('Daily')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-success text-uppercase mb-1">Daily</h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblDaily" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-success opacity-25"><i class="fa fa-calendar-day"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-card card-weekly p-3" onclick="filterTable('Weekly')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-warning text-uppercase mb-1">Weekly</h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblWeekly" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-warning opacity-25"><i class="fa fa-calendar-week"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-card card-monitor p-3" onclick="filterTable('Monitoring')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-info text-uppercase mb-1">Monitoring</h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblMonitor" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-info opacity-25"><i class="fa fa-desktop"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="custom-table">
                            <asp:GridView ID="GridTasks" runat="server" AutoGenerateColumns="false" CssClass="table table-hover mb-0" GridLines="None">
                                <Columns>
                                    <asp:BoundField HeaderText="Task Name" DataField="Name" ItemStyle-Font-Bold="true" />
                                    <asp:TemplateField HeaderText="Frequency">
                                        <ItemTemplate>
                                            <span class="freq-badge"><%# Eval("Frequency") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <%# GetFolderLink(Eval("FolderPath")) %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:View>
                    
                    <asp:View ID="ViewDocs" runat="server">
                        <!-- Unified header (logo + title) -->
                        <div class="page-header-bar">
                            <button type="button" id="btnSidebarToggle" class="btn btn-outline-secondary">
                                <i class="fa fa-bars"></i>
                            </button>
                            <div class="page-title-wrap">
                                <img src="Images/Logo1.png" alt="Logo" style="height: 50px;" />
                                <span style="font-size:2rem; font-weight:600; color:#222;">Documentation Library</span>
                            </div>
                        </div>
                        <div class="alert alert-secondary">
                            <i class="fa fa-info-circle me-2"></i> Standard Operating Procedures (SOPs) and Reference Guides.
                        </div>
                        <div class="custom-table">
                            <asp:GridView ID="GridDocs" runat="server" AutoGenerateColumns="false" CssClass="table table-hover mb-0" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="Document">
                                        <ItemTemplate>
                                            <i class="fa fa-file-pdf text-danger me-2"></i>
                                            <%# Eval("Name") %> SOP
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Location">
                                        <ItemTemplate>
                                            <span class="text-muted small"><%# Eval("DocPath") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Access">
                                        <ItemTemplate>
                                            <%# GetFolderLink(Eval("DocPath"), "View Docs") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:View>

                </asp:MultiView>
            </div>
        </div>
    </form>
    <script>
        function filterTable(category) {
            var table = document.getElementById('<%= GridTasks.ClientID %>');
            var rows = table.getElementsByTagName('tr');
            for (var i = 1; i < rows.length; i++) {
                var freqCell = rows[i].cells[1];
                if (freqCell) {
                    var freqText = freqCell.innerText || freqCell.textContent;
                    if (category === 'all') {
                        rows[i].style.display = "";
                    }
                    else if (freqText.includes(category)) {
                        rows[i].style.display = "";
                    } else {
                        rows[i].style.display = "none";
                    }
                }
            }
        }
        document.addEventListener("DOMContentLoaded", function () {
            var badges = document.querySelectorAll('.freq-badge');
            badges.forEach(function (b) {
                var txt = b.innerText;
                if (txt.includes("Daily")) b.className = "badge-soft-success";
                else if (txt.includes("Weekly") || txt.includes("Wed")) b.className = "badge-soft-warning";
                else b.className = "badge-soft-info";
            });
        });
    </script>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            var btn = document.getElementById("btnSidebarToggle");
            var sidebar = document.getElementById("sidebar");
            if (btn && sidebar) {
                btn.addEventListener("click", function () {
                    sidebar.classList.toggle("open");
                });
            }
        });
    </script>
</body>
</html>
--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DashboardSite1.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Infinite CareSource Automation</title>

    <!-- Favicon (place favicon.ico in root or adjust path) -->
    <link rel="icon" type="image/x-icon" href="favicon.ico" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Segoe UI', 'Roboto', Helvetica, Arial, sans-serif;
            background-color: #f4f6f9;
            overflow-x: hidden;
        }
        .wrapper {
            display: flex;
            width: 100%;
            align-items: stretch;
            min-height: 100vh;
        }
        .sidebar {
            min-width: 260px;
            max-width: 260px;
            background: #212529;
            color: #fff;
            transition: all 0.3s;
            box-shadow: 4px 0 15px rgba(0,0,0,0.1);
            z-index: 1000;
            display: none;
        }
        #sidebar.open {
            display: block;
        }
        .sidebar .sidebar-header {
            padding: 25px 20px;
            background: #1b1e21;
            border-bottom: 1px solid #32383e;
        }
        .sidebar .sidebar-header h4 {
            font-size: 1.1rem;
            font-weight: 600;
            margin: 0;
            color: #f8f9fa;
            letter-spacing: 0.5px;
        }
        .sidebar ul.components {
            padding: 15px 0;
            border-bottom: none;
        }
        .sidebar ul li a {
            padding: 16px 25px;
            font-size: 1rem;
            display: flex;
            align-items: center;
            color: #adb5bd;
            text-decoration: none;
            transition: all 0.3s;
            border-left: 4px solid transparent;
        }
        .sidebar ul li a:hover {
            color: #fff;
            background: #2c3034;
            border-left: 4px solid #6c757d;
        }
        .sidebar ul li.active > a {
            color: #fff;
            background: linear-gradient(90deg, #0d6efd 0%, #0a58ca 100%);
            border-left: 4px solid #6610f2;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
        }
        .sidebar-icon {
            margin-right: 15px;
            width: 20px;
            text-align: center;
            font-size: 1.1em;
        }
        .content {
            width: 100%;
            padding: 30px;
        }
        .stat-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            transition: transform 0.2s ease-in-out;
            cursor: pointer;
            border-left: 5px solid #ccc;
        }
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        .stat-card.card-daily { border-left-color: #28a745; }
        .stat-card.card-weekly { border-left-color: #ffc107; }
        .stat-card.card-monitor { border-left-color: #17a2b8; }
        .custom-table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            border: 1px solid #e9ecef;
        }
        .custom-table thead {
            background-color: #f8f9fa;
            color: #495057;
            border-bottom: 2px solid #dee2e6;
        }
        .custom-table th { font-weight: 600; text-transform: uppercase; font-size: 0.85rem; letter-spacing: 0.5px; }
        .custom-table th, .custom-table td { padding: 18px 20px; vertical-align: middle; }
        .badge-soft-success {
            background-color: #d1e7dd;
            color: #0f5132;
            padding: 6px 12px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.8em;
        }
        .badge-soft-warning {
            background-color: #fff3cd;
            color: #664d03;
            padding: 6px 12px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.8em;
        }
        .badge-soft-info {
            background-color: #cff4fc;
            color: #055160;
            padding: 6px 12px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.8em;
        }
        .page-header-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.5rem;
        }
        .page-title-wrap {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .page-title-wrap img {
            height: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <nav class="sidebar" id="sidebar">
                <div class="sidebar-header">
                    <h4><i class="fa fa-cogs me-2"></i>Menu</h4>
                </div>
                <ul class="list-unstyled components">
                    <li id="liTasks" runat="server" class="active">
                        <asp:LinkButton ID="BtnNavTasks" runat="server" OnClick="BtnNavTasks_Click">
                            <i class="fa fa-list-check sidebar-icon"></i> Tasks
                        </asp:LinkButton>
                    </li>
                    <li id="liDocs" runat="server">
                        <asp:LinkButton ID="BtnNavDocs" runat="server" OnClick="BtnNavDocs_Click">
                            <i class="fa fa-book sidebar-icon"></i> Documents
                        </asp:LinkButton>
                    </li>
                </ul>
            </nav>
            <div class="content">
                <asp:MultiView ID="MainMultiView" runat="server" ActiveViewIndex="0">
                    
                    <asp:View ID="ViewTasks" runat="server">
                        <!-- Header for tasks view: menu button and title at left, logo at right -->
                        <div class="page-header-bar">
                            <div style="display:flex; align-items:center; gap:15px;">
                                <button type="button" id="btnSidebarToggle" class="btn btn-outline-secondary">
                                    <i class="fa fa-bars"></i>
                                </button>
                                <span style="font-size:2rem; font-weight:600; color:#222;">Automation Tasks</span>
                            </div>
                            <img src="Images/Logo1.png" alt="Logo" style="height: 50px;" />
                        </div>
                        <div class="row mb-4">
                            <div class="col-md-3">
                                <div class="stat-card p-3" onclick="filterTable('all')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-muted text-uppercase mb-1">Total </h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblTotal" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-secondary opacity-25"><i class="fa fa-list"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-card card-daily p-3" onclick="filterTable('Daily')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-success text-uppercase mb-1">Daily</h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblDaily" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-success opacity-25"><i class="fa fa-calendar-day"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-card card-weekly p-3" onclick="filterTable('Weekly')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-warning text-uppercase mb-1">Weekly</h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblWeekly" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-warning opacity-25"><i class="fa fa-calendar-week"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-card card-monitor p-3" onclick="filterTable('Monitoring')">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="text-info text-uppercase mb-1">Monitoring</h6>
                                            <h3 class="mb-0 fw-bold"><asp:Label ID="lblMonitor" runat="server">0</asp:Label></h3>
                                        </div>
                                        <div class="fs-1 text-info opacity-25"><i class="fa fa-desktop"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="custom-table">
                            <asp:GridView ID="GridTasks" runat="server" AutoGenerateColumns="false" CssClass="table table-hover mb-0" GridLines="None">
                                <Columns>
                                    <asp:BoundField HeaderText="Task Name" DataField="Name" ItemStyle-Font-Bold="true" />
                                    <asp:TemplateField HeaderText="Frequency">
                                        <ItemTemplate>
                                            <span class="freq-badge"><%# Eval("Frequency") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <%# GetFolderLink(Eval("FolderPath")) %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:View>
                    
                    <asp:View ID="ViewDocs" runat="server">
                        <!-- Header for tasks view: menu button and title at left, logo at right -->
                        <div class="page-header-bar">
                            <div style="display:flex; align-items:center; gap:15px;">
                                <button type="button" id="btnSidebarToggle" class="btn btn-outline-secondary">
                                    <i class="fa fa-bars"></i>
                                </button>
                                <span style="font-size:2rem; font-weight:600; color:#222;">Documentation</span>
                            </div>
                            <img src="Images/Logo1.png" alt="Logo" style="height: 50px;" />
                        </div>
                        <div class="alert alert-secondary">
                            <i class="fa fa-info-circle me-2"></i> Standard Operating Procedures (SOPs) and Reference Guides.
                        </div>
                        <div class="custom-table">
                            <asp:GridView ID="GridDocs" runat="server" AutoGenerateColumns="false" CssClass="table table-hover mb-0" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="Document">
                                        <ItemTemplate>
                                            <i class="fa fa-file-pdf text-danger me-2"></i>
                                            <%# Eval("Name") %> SOP
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Location">
                                        <ItemTemplate>
                                            <span class="text-muted small"><%# Eval("DocPath") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Access">
                                        <ItemTemplate>
                                            <%# GetFolderLink(Eval("DocPath"), "View Docs") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:View>

                </asp:MultiView>
            </div>
        </div>
    </form>
    <script>
        function filterTable(category) {
            var table = document.getElementById('<%= GridTasks.ClientID %>');
            var rows = table.getElementsByTagName('tr');
            for (var i = 1; i < rows.length; i++) {
                var freqCell = rows[i].cells[1];
                if (freqCell) {
                    var freqText = freqCell.innerText || freqCell.textContent;
                    if (category === 'all') {
                        rows[i].style.display = "";
                    }
                    else if (freqText.includes(category)) {
                        rows[i].style.display = "";
                    } else {
                        rows[i].style.display = "none";
                    }
                }
            }
        }
        document.addEventListener("DOMContentLoaded", function () {
            var badges = document.querySelectorAll('.freq-badge');
            badges.forEach(function (b) {
                var txt = b.innerText;
                if (txt.includes("Daily")) b.className = "badge-soft-success";
                else if (txt.includes("Weekly") || txt.includes("Wed")) b.className = "badge-soft-warning";
                else b.className = "badge-soft-info";
            });
        });
    </script>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            var btn = document.getElementById("btnSidebarToggle");
            var sidebar = document.getElementById("sidebar");
            if (btn && sidebar) {
                btn.addEventListener("click", function () {
                    sidebar.classList.toggle("open");
                });
            }
        });
    </script>
</body>
</html>

