using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibraryManagementSystem.BLL;
using LibraryManagementSystem.DAL.DAO;

namespace LibraryManagementSystem.UI
{
    public partial class BookUI : System.Web.UI.Page
    {
        BookManager aBookManager = new BookManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private Book aBook;
        protected void saveButton_Click(object sender, EventArgs e)
        {
            aBook = new Book();
            aBook.title = titleTextBox.Text;
            aBook.author = authorTextBox.Text;
            aBook.publisher = publisherTextBox.Text;
            string msg = aBookManager.Save(aBook);
            msgLabel.Text = msg;
        }

        protected void homeButton_Click(object sender, EventArgs e)
        {

        }
    }
}