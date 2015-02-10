using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibraryManagementSystem.BLL;

namespace LibraryManagementSystem.UI
{
    public partial class NotReturnBookUI : System.Web.UI.Page
    {
        MemberManager aMemberManager = new MemberManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            showGridView.DataSource = aMemberManager.MemberwiseBookReturnList();
            showGridView.DataBind();
        }
    }
}