using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using LibraryManagementSystem.DAL.DAO;

namespace LibraryManagementSystem.DAL.DBGateway
{
    public class BookDBGateway : DBGateway
    {
        public List<Book> GetAllBook()
        {
            aSqlConnection = new SqlConnection(connectionString);
            aSqlConnection.Open();
            string query = "SELECT * FROM t_book";
            SqlCommand aCommand = new SqlCommand(query, aSqlConnection);
            SqlDataReader aReader = aCommand.ExecuteReader();

            List<Book> bookList = new List<Book>();
            while (aReader.Read())
            {
                Book aBook = new Book();
                aBook.id = (int)aReader["id"];
                aBook.title = aReader["title"].ToString();
                aBook.author = aReader["author"].ToString();
                aBook.publisher = aReader["publisher"].ToString();
                bookList.Add(aBook);
            }
            aReader.Close();
            aSqlConnection.Close();
            return bookList;
        }

        public Book FindBook(string title)
        {
            aSqlConnection = new SqlConnection(connectionString);
            aSqlConnection.Open();
            string query = "SELECT * FROM t_book WHERE title = '" + title + "' ";
            SqlCommand aSqlCommand = new SqlCommand(query, aSqlConnection);
            SqlDataReader aSqlDataReader = aSqlCommand.ExecuteReader();

            if (aSqlDataReader.HasRows)
            {
                Book aBook = new Book();
                aSqlDataReader.Read();
               aBook.id = Convert.ToInt32(aSqlDataReader["id"]);
               aBook.title = aSqlDataReader["title"].ToString();
               aBook.author= aSqlDataReader["author"].ToString();
               aBook.publisher= aSqlDataReader["publisher"].ToString();
                aSqlDataReader.Close();
                aSqlConnection.Close();
                return aBook;
            }
            else
            {
                aSqlConnection.Close();
                return null;
            }
        }
        internal Book GetBook(int bookId)
        {
            aSqlConnection = new SqlConnection(connectionString);
            aSqlConnection.Open();
            string query;

            query = "SELECT * FROM t_book WHERE id = '" + bookId + "'";


            SqlCommand command = new SqlCommand(query, aSqlConnection);
            SqlDataReader reader = command.ExecuteReader();
            Book aBook;

            if (reader.HasRows)
            {
                aBook = new Book();
                reader.Read();

                aBook.id = (int)reader["id"];
                aBook.title = reader["title"].ToString();
                aBook.author = reader["author"].ToString();
                aBook.publisher = reader["publisher"].ToString();
                reader.Close();
                aSqlConnection.Close();
                return aBook;

            }
            else
            {
                aSqlConnection.Close();
                return null;
            }
        }
        internal void Save(Book aBook)
        {
            aSqlConnection.Open();
            string query = "INSERT INTO t_Book VALUES('" + aBook.title + "','" + aBook.author + "','" + aBook.publisher + "')";
            aSqlCommand = new SqlCommand(query, aSqlConnection);
            aSqlCommand.ExecuteNonQuery();
            aSqlConnection.Close();
        }

        internal List<ViewBook> GetBooks(string number)
        {
            aSqlConnection = new SqlConnection(connectionString);
            aSqlConnection.Open();
            string query = "SELECT * FROM v_book where number = '"+ number +"' AND book_return = '"+ false +"'";
            SqlCommand aCommand = new SqlCommand(query, aSqlConnection);
            SqlDataReader aReader = aCommand.ExecuteReader();

            List<ViewBook> bookList = new List<ViewBook>();
            while (aReader.Read())
            {
                ViewBook aBook = new ViewBook();
              
                aBook.title = aReader["title"].ToString();
                aBook.author = aReader["author"].ToString();
                aBook.publisher = aReader["publisher"].ToString();
                aBook.bookReturn = (bool)aReader["book_return"];
                aBook.memberNo = aReader["number"].ToString();
                aBook.borrowId = Convert.ToInt32(aReader["id"]);
                bookList.Add(aBook);
            }
            aReader.Close();
            aSqlConnection.Close();
            return bookList;
        }
    }
}