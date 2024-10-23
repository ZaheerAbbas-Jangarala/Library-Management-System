using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace LMS
{
    public partial class AddBook : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
    
        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text;
            string author = txtAuthor.Text;
            string genre = txtGenre.Text;
            string isbn = txtISBN.Text;
            string availableCopies = txtAvailableCopies.Text;

            if (fuBookImage.HasFile)
            {
                try
                {
                    string folderPath = Server.MapPath("~/images/");

                    // Ensure the directory exists
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    // Get the file name and combine with folder path
                    string fileName = Path.GetFileName(fuBookImage.PostedFile.FileName);
                    string filePath = Path.Combine(folderPath, fileName);

                    // Save the uploaded image
                    fuBookImage.SaveAs(filePath);

                    // Save book details and image path to the database
                    string imagePath = "~/images/" + fileName;
                    SaveBookToDatabase(txtTitle.Text, txtAuthor.Text, txtGenre.Text, txtISBN.Text, Convert.ToInt32(txtAvailableCopies.Text), imagePath);

                    lblMessage.Text = "Book added successfully!";
                    lblMessage.CssClass = "success";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.CssClass = "error";
                }
            }
            else
            {
                lblMessage.Text = "Please upload an image for the book.";
                lblMessage.CssClass = "warning";
            }

            clearData();
            lblMessage.Text = "Book added successfully!";
        }



        private void SaveBookToDatabase(string title, string author, string genre, string isbn, int availableCopies, string imagePath)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString))
            {
                string query = "INSERT INTO Books (Title, Author, Genre, ISBN, AvailableCopies, BookImage) VALUES (@Title, @Author, @Genre, @ISBN, @AvailableCopies, @BookImage)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Author", author);
                cmd.Parameters.AddWithValue("@Genre", genre);
                cmd.Parameters.AddWithValue("@ISBN", isbn);
                cmd.Parameters.AddWithValue("@AvailableCopies", availableCopies);
                cmd.Parameters.AddWithValue("@BookImage", imagePath);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }


        protected void clearData()
        {
            txtTitle.Text = "";
            txtAuthor.Text = "";
            txtGenre.Text = "";
            txtISBN.Text = "";
            txtAvailableCopies.Text = "";

        }
    }
}