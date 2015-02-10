using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LibraryManagementSystem.DAL.DAO
{
    public class ViewBook
    {
        public string title { set; get; }
        public string author { set; get; }
        public string publisher { set; get; }
        public bool bookReturn { set; get; }
        public string memberNo { set; get; }
        public string name { set; get; }
        public int borrowId { set; get; }
        public int noOfNotReturnBook { set; get; }
    }
}