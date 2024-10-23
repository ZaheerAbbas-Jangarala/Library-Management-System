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
    public partial class Overview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString))
            {
                conn.Open();
                string query = "Select SUM(AvailableCopies) from Books";
                SqlCommand cmd = new SqlCommand(query,conn);
                object result = cmd.ExecuteScalar();
                conn.Close();
                if (result != DBNull.Value)
                {
                    int totalBooks = Convert.ToInt32(result);
                    lblTotalBooks.Text = totalBooks.ToString();
                }
                else
                {
                    lblTotalBooks.Text = "0";
                }

                conn.Open();
                string query2 = "Select count(DISTINCT Title) from Books";
                SqlCommand cmd2 = new SqlCommand(query2, conn);
                object result2 = cmd2.ExecuteScalar();
                conn.Close();
                if (result2 != DBNull.Value)
                {
                    int AvailableBooks = Convert.ToInt32(result2);
                    lblAvailable.Text = AvailableBooks.ToString();
                }
                else
                {
                    lblAvailable.Text = "0";
                }

                conn.Open();
                string query3 = "Select count(DISTINCT Name) from Users";
                SqlCommand cmd3 = new SqlCommand(query3, conn);
                object result3 = cmd3.ExecuteScalar();
                conn.Close();
                if (result3 != DBNull.Value)
                {
                    int TotalUser = Convert.ToInt32(result3);
                    lblUser.Text = TotalUser.ToString();
                }
                else
                {
                    lblUser.Text = "0";
                }
                
                conn.Open();
                string query4 = "Select count(*) from Borrowing where ReturnDate is Null";
                SqlCommand cmd4 = new SqlCommand(query4, conn);
                object result4 = cmd4.ExecuteScalar();
                conn.Close();
                if (result4 != DBNull.Value)
                {
                    int TotalBorrow = Convert.ToInt32(result4);
                    lblBorrow.Text = TotalBorrow.ToString();
                }
                else
                {
                    lblBorrow.Text = "0";
                }
             }
        }
    }
}