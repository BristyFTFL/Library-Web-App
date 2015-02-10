using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LibraryManagementSystem.DAL.DAO
{
    public class Book
    {
        public int id { set; get; }
        public string title { set; get; }
        public string author { set; get; }
        public string publisher { set; get; }
    }
}