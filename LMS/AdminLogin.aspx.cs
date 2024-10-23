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
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString))
            {
                string username = txtname.Text;
                string password = txtpassword.Text;
                string query = "Select count(*) from Admin_Auth Where Admin_Name = @name And Password = @password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // Add parameters to prevent SQL injection
                    cmd.Parameters.AddWithValue("@name", username);
                    cmd.Parameters.AddWithValue("@password", password);

                    conn.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if (count == 1)
                    {
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Admin Not Found";
                    }
                    conn.Close();
                }
            }       
        }
    }
}