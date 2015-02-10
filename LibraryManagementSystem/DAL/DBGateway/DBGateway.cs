using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LibraryManagementSystem.DAL.DBGateway
{
    public class DBGateway
    {
        public string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        public SqlConnection aSqlConnection;
        public SqlCommand aSqlCommand;

        public DBGateway()
        {
            aSqlConnection = new SqlConnection(connectionString);
           
        }
    }
}