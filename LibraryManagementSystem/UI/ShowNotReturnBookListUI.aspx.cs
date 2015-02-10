using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibraryManagementSystem.BLL;

namespace LibraryManagementSystem.UI
{
    public partial class ShowNotReturnBookListUI : System.Web.UI.Page
    {
        BookManager aBookManager = new BookManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            string memberNo = Request.QueryString["number"];
            showGridView.DataSource = aBookManager.GetBooks(memberNo);
            showGridView.DataBind();
        }
    }
}