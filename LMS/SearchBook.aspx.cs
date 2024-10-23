using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace LMS
{
    public partial class SearchBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString;

            string query = "SELECT * FROM Books WHERE 1=1"; // 1=1 ensures we can dynamically add AND conditions

            // Add filters based on user input
            if (!string.IsNullOrEmpty(txtTitle.Text))
                query += " AND Title LIKE '%' + @Title + '%'";
            if (!string.IsNullOrEmpty(txtAuthor.Text))
                query += " AND Author LIKE '%' + @Author + '%'";
            if (!string.IsNullOrEmpty(txtGenre.Text))
                query += " AND Genre LIKE '%' + @Genre + '%'";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // Add parameters for safer queries (prevents SQL injection)
                    if (!string.IsNullOrEmpty(txtTitle.Text))
                        cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                    if (!string.IsNullOrEmpty(txtAuthor.Text))
                        cmd.Parameters.AddWithValue("@Author", txtAuthor.Text);
                    if (!string.IsNullOrEmpty(txtGenre.Text))
                        cmd.Parameters.AddWithValue("@Genre", txtGenre.Text);
                    conn.Open();

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    GridViewBooks.DataSource = dt;
                    GridViewBooks.DataBind();
                }
            }
        }
    }
}