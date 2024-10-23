using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace LMS
{
    public partial class BookList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString))
            {
                string query = "SELECT BookId, Title, Author, Genre, ISBN, AvailableCopies FROM Books";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                gvBooks.DataSource = cmd.ExecuteReader();
                gvBooks.DataBind();
                conn.Close();
            }
        }
    }
}