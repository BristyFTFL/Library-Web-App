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
    public partial class ReturnBookUI : System.Web.UI.Page
    {
        BookManager aBookManager = new BookManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

    
        protected void showButton_Click(object sender, EventArgs e)
        {
            GetValue();
        }

        private void GetValue()
        {
            string memberNo = memberNoTextBox.Text;
            bookDropDownList.DataSource = aBookManager.GetBooks(memberNo);
            bookDropDownList.DataTextField = "title";
            bookDropDownList.DataValueField = "borrowId";
            bookDropDownList.DataBind();
        }

        BorrowManager aBorrowManager = new BorrowManager();
        
        protected void returnButton_Click(object sender, EventArgs e)
        {
            int borrowId = Convert.ToInt32(bookDropDownList.SelectedValue);
            string msg = aBorrowManager.Update(borrowId);
            msgLabel.Text = msg;
            GetValue();
        }

        protected void bookDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
    }
}