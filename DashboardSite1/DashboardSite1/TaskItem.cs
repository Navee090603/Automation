//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;

//namespace DashboardSite1
//{
//    public class TaskItem
//    {
//        public int Id { get; set; }
//        public string Name { get; set; }
//        public string Frequency { get; set; }
//        public string FolderPath { get; set; }
//        public string DocPath { get; set; } 
//    }

//}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DashboardSite1
{
    public class TaskItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Frequency { get; set; }
        public string FolderPath { get; set; }
        public string DocPath { get; set; }
        public string Status { get; set; } // The new Status property
    }
}