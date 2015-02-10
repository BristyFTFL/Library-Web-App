using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using LibraryManagementSystem.DAL.DAO;
using LibraryManagementSystem.DAL.DBGateway;

namespace LibraryManagementSystem.BLL
{
    public class BorrowManager
    {
        BorrowDBGateway aGateway = new BorrowDBGateway();
     
        public string Save(Borrow aBorrow)
        {
            Borrow foundBorrow = aGateway.FindBorrow(aBorrow);

            if (foundBorrow != null)
            {
                return "This book is already borrowed by member whose number is";
            }
            else
            {
                aGateway.Save(aBorrow);
                return "This book is borrowed by member whose number is";

            }
        }




        internal string Update(int borrowId)
        {
            aGateway.Update(borrowId);
            return "Return the book";
        }
    }
}