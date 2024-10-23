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
    public partial class BorrowBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBorrow_Click(object sender, EventArgs e)
        {

            int bookId = int.Parse(txtBookId.Text);
            int userId = int.Parse(txtUserId.Text);
            DateTime borrowDate = DateTime.Parse(txtBorrowDate.Text);
            DateTime dueDate = DateTime.Parse(txtDueDate.Text);
            string ReturnDate = DateTime.Now.ToString();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString))
            {
                        string userid = txtUserId.Text;
                        string query2 = "Select count(*) from Users Where UserId = @userid";
                        SqlCommand cmd2 = new SqlCommand(query2, conn);

                        cmd2.Parameters.AddWithValue("@userid", userid);

                        conn.Open();
                        int count = Convert.ToInt32(cmd2.ExecuteScalar());
                        if (count == 1)
                        {


                            string updateQuery = "UPDATE Books SET AvailableCopies = AvailableCopies - 1 WHERE BookId = @BookId AND AvailableCopies > 0";
                            SqlCommand updateCmd = new SqlCommand(updateQuery, conn);
                            updateCmd.Parameters.AddWithValue("@BookId", bookId);

                            int rowsAffected = updateCmd.ExecuteNonQuery();
                            if (rowsAffected == 0)
                            {
                                lblMessage.Text = "No available copies to borrow.";
                                clearData();
                            }
                            else
                            {
                                string query = "INSERT INTO Borrowing (BookId, UserId, BorrowDate, DueDate) VALUES (@BookId, @UserId, @BorrowDate, @DueDate)";
                                SqlCommand cmd = new SqlCommand(query, conn);
                                cmd.Parameters.AddWithValue("@BookId", bookId);
                                cmd.Parameters.AddWithValue("@UserId", userId);
                                cmd.Parameters.AddWithValue("@BorrowDate", borrowDate);
                                cmd.Parameters.AddWithValue("@DueDate", dueDate);
                                cmd.ExecuteNonQuery();
                                clearData();
                                lblMessage.Text = "Borrowing record added and available copies updated successfully!";
                            }
 
                        }
                        else
                        {
                            lblMessage.Text = "UserID Not Found";
                        }
                        conn.Close();
            }

        }
        protected void clearData()
        {
            txtBookId.Text = "";
            txtUserId.Text = "";
            txtBorrowDate.Text = "";
            txtDueDate.Text = "";

        }
    }
}