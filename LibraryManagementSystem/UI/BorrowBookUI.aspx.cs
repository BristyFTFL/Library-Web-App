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
    public partial class BorrowBookUI : System.Web.UI.Page
    {
        BorrowManager aManager = new BorrowManager();
        BookManager aBookManager = new BookManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bookDropDownList.DataSource = aBookManager.GetAllBook();
                bookDropDownList.DataTextField = "title";
                bookDropDownList.DataValueField = "id";
                bookDropDownList.DataBind();
                GetValue();
            }
        }
        Borrow aBorrow = new Borrow();
        MemberManager aMemberManager = new MemberManager();
        protected void borrowButton_Click(object sender, EventArgs e)
        {
            string msg="";
            aBorrow.bookId = Convert.ToInt32(bookDropDownList.SelectedValue);
            Member aMember = aMemberManager.FindMember(memberNoTextBox.Text);
            if (aMember == null)
            {
                msg = "Sorry, member number doesn't exists";
            }
            else
            {
                aBorrow.memberId = aMember.id;
                aBorrow.bookReturn = aBorrow.bookReturn;
                msg = aManager.Save(aBorrow) + ": "+aMember.number;
            }
        
            msgLabel.Text = msg;
        }
 
        private void GetValue()
        {
            int id = Convert.ToInt32(bookDropDownList.SelectedValue);
            Book aBook = aBookManager.GetBook(id);
            authorTextBox.Text = aBook.author;
            publisherTextBox.Text = aBook.publisher;
        }

        protected void bookDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetValue();
        }
    }
}