using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LibraryManagementSystem.DAL.DAO
{
    public class Borrow
    {
        public int id { set; get; }
        public int memberId { set; get; }
        public int bookId { set; get; }
        public bool bookReturn { set; get; }
    }
}