using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace LMS
{
    public partial class ViewBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString))
            {
                string query = "Select Title, Author, Genre, BookImage from Books";
                SqlCommand cmd = new SqlCommand(query, conn);
                {
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    conn.Open();
                    sda.Fill(dt);
                    dlBook.DataSource = dt;
                    dlBook.DataBind();
                    conn.Close();
                }
            }
        }
    }
}