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
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString))
            {
                string name = txtName.Text;
                string password = txtPass.Text; // Remember to hash this before storing in production
                string userType = ddlType.SelectedValue;
                string email = txtMail.Text;
                string phone = txtPhone.Text;
                DateTime registrationDate = DateTime.Now; // Use DateTime directly instead of converting to string

                // Correct the parameter order in the query
                string query = "INSERT INTO Users (Name, Password, UserType, Email, PhoneNumber, RegistrationDate) " +
                               "VALUES (@name, @password, @userType, @email, @phone, @registration_date)";

                SqlCommand cmd = new SqlCommand(query, conn);

                // Better to use SqlParameter to avoid type guessing issues
                cmd.Parameters.Add(new SqlParameter("@name", name));
                cmd.Parameters.Add(new SqlParameter("@password", password)); // Hash this in real application
                cmd.Parameters.Add(new SqlParameter("@userType", userType));
                cmd.Parameters.Add(new SqlParameter("@email", email));
                cmd.Parameters.Add(new SqlParameter("@phone", phone));
                cmd.Parameters.Add(new SqlParameter("@registration_date", registrationDate)); // Use DateTime, not string

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                // Register success message
                Response.Write("<script>alert('Registration Successful!');</script>");
                Response.Redirect("website.aspx");
            }
        }

    }
}