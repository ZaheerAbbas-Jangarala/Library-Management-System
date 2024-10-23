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
    public partial class BorrowList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            show();
            btnBorrow.Visible = false;
        }

        void show()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString))
            {
                string query = "SELECT BorrowId, BookId, UserId, BorrowDate, DueDate, ReturnDate FROM Borrowing";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                gvBorrowing.DataSource = cmd.ExecuteReader();
                gvBorrowing.DataBind();
            }
        }

        protected void btnBorrow_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString))
            {
                string bookId = txtBookId.Text.Trim();
                string borrowId = gvBorrowing.SelectedRow.Cells[1].Text; // Assuming column 1 is Borrow ID
                string returnDate = txtReturn.Text;

                conn.Open();

                try
                {
                    // Step 1: Check if the book is already returned by checking ReturnDate
                    string checkReturnQuery = "SELECT ReturnDate FROM Borrowing WHERE BorrowId = @BorrowId";
                    SqlCommand checkReturnCmd = new SqlCommand(checkReturnQuery, conn);
                    checkReturnCmd.Parameters.AddWithValue("@BorrowId", borrowId);

                    object result = checkReturnCmd.ExecuteScalar();

                    if (result != DBNull.Value && !string.IsNullOrEmpty(result.ToString()))
                    {
                        // If ReturnDate is not null or empty, it means the book has already been returned
                        lblmessage.Text = "This book has already been returned.";
                    }
                    else
                    {
                        // If not returned, proceed with returning the book

                        // Step 2: Update return_date in the borrow table
                        string updateReturnQuery = "UPDATE Borrowing SET ReturnDate = @ReturnDate WHERE BorrowId = @BorrowId";
                        SqlCommand updateReturnCmd = new SqlCommand(updateReturnQuery, conn);
                        updateReturnCmd.Parameters.AddWithValue("@ReturnDate", DateTime.Now); // Current date for the return
                        updateReturnCmd.Parameters.AddWithValue("@BorrowId", borrowId);
                        updateReturnCmd.ExecuteNonQuery();

                        // Step 3: Increment availableCopies in the books table
                        string updateCopiesQuery = "UPDATE Books SET AvailableCopies = AvailableCopies + 1 WHERE BookId = @BookId";
                        SqlCommand updateCopiesCmd = new SqlCommand(updateCopiesQuery, conn);
                        updateCopiesCmd.Parameters.AddWithValue("@BookId", bookId);
                        updateCopiesCmd.ExecuteNonQuery();

                        // Hide Return Button and clear the fields
                        lblmessage.Text = "Book returned successfully!";
                        btnBorrow.Visible = false;
                        txtBookId.Text = "";
                        txtUserId.Text = "";
                        txtBorrowDate.Text = "";
                        txtDueDate.Text = "";
                        txtReturn.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    lblmessage.Text = "An error occurred: " + ex.Message;
                }
                finally
                {
                    conn.Close();
                }
                show();
            }
    }
        
        protected void gvBorrowing_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvBorrowing.SelectedRow;

            // Populate the text fields with data from the selected row
            txtBookId.Text = row.Cells[2].Text;
            txtUserId.Text = row.Cells[3].Text;
            txtBorrowDate.Text = row.Cells[4].Text;
            txtDueDate.Text = row.Cells[5].Text;
            txtReturn.Text = row.Cells[6].Text;

            // Check if the book is already returned based on ReturnDate
            if (!string.IsNullOrEmpty(txtReturn.Text) && txtReturn.Text != "&nbsp;")
            {
                // If ReturnDate is already filled, disable the Return button
                btnBorrow.Visible = false;
                lblmessage.Text = "This book has already been returned.";
            }
            else
            {
                // If not returned, enable the Return button
                btnBorrow.Visible = true;
                lblmessage.Text = "";
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtBookId.Text = "";
            txtUserId.Text = "";
            txtBorrowDate.Text = "";
            txtDueDate.Text = "";
            txtReturn.Text = "";
        }

    }
}