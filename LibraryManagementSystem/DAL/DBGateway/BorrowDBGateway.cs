using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using LibraryManagementSystem.DAL.DAO;

namespace LibraryManagementSystem.DAL.DBGateway
{
    public class BorrowDBGateway : DBGateway
    {
        
        public void Save(Borrow aBorrow)
        {
            aSqlConnection = new SqlConnection(connectionString);
            aSqlConnection.Open();
            string query = "INSERT INTO t_borrow VALUES('" + aBorrow.memberId + "','" + aBorrow.bookId + "','" +aBorrow.bookReturn + "')";
            SqlCommand aSqlCommand = new SqlCommand(query, aSqlConnection);
            aSqlCommand.ExecuteNonQuery();
            aSqlConnection.Close();
        }





        internal void Update(int borrowId)
        {
            aSqlConnection = new SqlConnection(connectionString);
            aSqlConnection.Open();
            string query = "Update t_borrow set book_return = '" + true + "' where id ='" + borrowId + "' ";
            SqlCommand aSqlCommand = new SqlCommand(query, aSqlConnection);
            aSqlCommand.ExecuteNonQuery();
            aSqlConnection.Close();
        }

        internal Borrow FindBorrow(Borrow borrow)
        {
            aSqlConnection = new SqlConnection(connectionString);
            aSqlConnection.Open();
            string query = "SELECT * FROM t_borrow WHERE book_return = '" + false + "' AND member_id =  '" + borrow.memberId + "'AND book_id =  '" + borrow.bookId+ "' ";
            SqlCommand aSqlCommand = new SqlCommand(query, aSqlConnection);
            SqlDataReader aSqlDataReader = aSqlCommand.ExecuteReader();

            if (aSqlDataReader.HasRows)
            {
                Borrow aBorrow = new Borrow();
                aSqlDataReader.Read();
                aBorrow.id = Convert.ToInt32(aSqlDataReader["id"]);
                aBorrow.bookId = (int)aSqlDataReader["book_id"];
                aBorrow.memberId = (int) aSqlDataReader["member_id"];
                aBorrow.bookReturn = (bool) aSqlDataReader["book_return"];
                aSqlDataReader.Close();
                aSqlConnection.Close();
                return aBorrow;
            }
            else
            {
                aSqlConnection.Close();
                return null;
            }
        }
    }
}