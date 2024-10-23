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
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string password = txtPass.Text;
            string userType = ddlUserType.SelectedValue;
            string email = txtEmail.Text;
            string phoneNumber = txtPhoneNumber.Text;
            string registrationDate = DateTime.Now.ToString();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString))
            {
                string query = "INSERT INTO Users (Name, Password, UserType, Email, PhoneNumber, RegistrationDate) VALUES (@Name, @Password, @UserType, @Email, @PhoneNumber, @RegistrationDate)";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@UserType", userType);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                cmd.Parameters.AddWithValue("@RegistrationDate", registrationDate);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                clearData();
            }

            lblMessage.Text = "User added successfully!";
        }
        protected void clearData()
        {
            txtName.Text = "";
            ddlUserType.Text = "";
            txtEmail.Text = "";
            txtPhoneNumber.Text = "";
           

        }
 
    }
}