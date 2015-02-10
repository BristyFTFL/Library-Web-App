using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using LibraryManagementSystem.DAL.DAO;

namespace LibraryManagementSystem.DAL.DBGateway
{
    public class MemberDBGateway : DBGateway
    {
        public Member FindMember(string number)
        {
            aSqlConnection = new SqlConnection(connectionString);
            aSqlConnection.Open();
            string query = "SELECT * FROM t_member WHERE number = '" + number + "' ";
            SqlCommand aSqlCommand = new SqlCommand(query, aSqlConnection);
            SqlDataReader aSqlDataReader = aSqlCommand.ExecuteReader();

            if (aSqlDataReader.HasRows)
            {
                Member aMember = new Member();
                aSqlDataReader.Read();
                aMember.id = Convert.ToInt32(aSqlDataReader["id"]);
                aMember.number = aSqlDataReader["number"].ToString();
                aMember.name = aSqlDataReader["name"].ToString();
                aSqlDataReader.Close();
                aSqlConnection.Close();
                return aMember;
            }
            else
            {
                aSqlConnection.Close();
                return null;
            }
        }

        internal List<ViewBook> GetBooks()
        {
            aSqlConnection = new SqlConnection(connectionString);
            aSqlConnection.Open();
            string query = "SELECT * FROM v_not_return_book";
            SqlCommand aCommand = new SqlCommand(query, aSqlConnection);
            SqlDataReader aReader = aCommand.ExecuteReader();

            List<ViewBook> bookList = new List<ViewBook>();
            while (aReader.Read())
            {
                ViewBook aBook = new ViewBook();

                aBook.name = aReader["name"].ToString();
                aBook.memberNo = aReader["number"].ToString();
                aBook.noOfNotReturnBook = Convert.ToInt32(aReader["no_of_not_returned_books"]);
                bookList.Add(aBook);
            }
            aReader.Close();
            aSqlConnection.Close();
            return bookList;
        }
        internal void Save(Member aMember)
        {
            aSqlConnection.Open();
            string query = "INSERT INTO t_member VALUES('" + aMember.number + "','" + aMember.name + "')";
            aSqlCommand = new SqlCommand(query,aSqlConnection);
            aSqlCommand.ExecuteNonQuery();
            aSqlConnection.Close();
        }
    }
}