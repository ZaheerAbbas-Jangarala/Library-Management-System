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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString))
            {
                string username = txtEmailPhone.Text;
                string password = txtPassword.Text;
                string query = "Select count(*) from Users Where Name = @username And Password = @password";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                conn.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count == 1)
                {
                    Response.Redirect("website.aspx");
                }
                else
                {
                    lblMessage.Text = "User Not Found";
                }
                conn.Close();
            }
        }
    }
}