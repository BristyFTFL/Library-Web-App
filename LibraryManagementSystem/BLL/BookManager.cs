using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LibraryManagementSystem.DAL.DAO;
using LibraryManagementSystem.DAL.DBGateway;

namespace LibraryManagementSystem.BLL
{
    public class BookManager
    {
        BookDBGateway aGateway = new BookDBGateway();

        public string Save(Book aBook)
        {
            Book findBook = aGateway.FindBook(aBook.title); 
           
            if (findBook == null)
            {
                aGateway.Save(aBook);
                return "Successfully Saved";
            }
            else
            {
                return "Book Title Already Exist";
            }
        }

        public Book GetBook(int bookId)
        {
          return  aGateway.GetBook(bookId);
        }
        internal List<Book> GetAllBook()
        {
            return aGateway.GetAllBook();
        }

        public List<ViewBook> GetBooks(string number)
        {
            return aGateway.GetBooks(number);
        }
    }
}