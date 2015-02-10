using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LibraryManagementSystem.DAL.DAO;
using LibraryManagementSystem.DAL.DBGateway;

namespace LibraryManagementSystem.BLL
{
    public class MemberManager
    {
        MemberDBGateway aMemberDbGateway = new MemberDBGateway();
        internal string Save(Member aMember)
        {
            Member findMember = FindMember(aMember.number);
            if (findMember == null)
            {
                aMemberDbGateway.Save(aMember);
                return "Successfully Saved";
            }
            else
            {
                return "Member Number Already Exist";
            }
            
        }

        public List<ViewBook> MemberwiseBookReturnList()
        {
           return aMemberDbGateway.GetBooks();
        }
        public Member FindMember(string number)
        {
            return aMemberDbGateway.FindMember(number);
        }
    }
}