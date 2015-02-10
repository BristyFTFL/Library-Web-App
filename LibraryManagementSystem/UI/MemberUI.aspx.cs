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
    public partial class MemberUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        MemberManager aMemberManager = new MemberManager();
        private Member aMember;
        protected void saveButton_Click(object sender, EventArgs e)
        {
            aMember = new Member();
            aMember.number = numberTextBox.Text;
            aMember.name = nameTextBox.Text;
            string msg = aMemberManager.Save(aMember);
            msgLabel.Text = msg;
        }
    }
}