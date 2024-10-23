<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="LMS.AddBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    /* General Styles */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 0;
}

.form-container {
    width: 540px;
    background-color: white;
    padding: 30px;
    margin: 50px auto;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.form-header h2 {
    text-align: center;
    font-size: 24px;
    font-weight: 600;
    color: #333;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid #007bff;
}

.form-group {
    margin-bottom: 20px;
}

.form-control {
    width: 100%;
    padding: 12px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
    transition: all 0.3s ease;
    box-sizing: border-box;
}

.form-control:focus {
    border-color: #007bff;
    background-color: #fff;
    outline: none;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
}

.form-control::placeholder {
    color: #bbb;
    font-size: 14px;
}

.btn {
    background-color: #588157; /* Blue background for buttons */
    color: white; /* White text */
    padding: 10px 20px; /* Padding for buttons */
    border: none; /* Remove border */
    border-radius: 5px; /* Rounded corners */
    cursor: pointer; /* Pointer cursor on hover */
    font-size: 1.2em; /* Font size */
    transition: background-color 0.3s ease; /* Smooth background transition */
    border-radius:20px;
    width: 30%;
}

/* Button Hover Effect */
.btn:hover {
    background-color: #0056b3; /* Darker blue on hover */
}
    
.message {
    text-align: center;
    margin-bottom: 15px;
    font-size: 14px;
    color: green; /* Can change this color based on the message */
}

/* Make the form more responsive */
@media (max-width: 500px) {
    .form-container {
        width: 100%;
        padding: 20px;
        margin: 20px;
    }
}

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="form-container">
    <div class="form-header">
        <h2>Add New Book</h2>
    </div>

   <asp:Label ID="lblMessage" runat="server" Text="" CssClass="message"></asp:Label>

    <div class="form-group">
        <asp:TextBox ID="txtTitle" runat="server" placeholder="Book Title" CssClass="form-control" required="true"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:TextBox ID="txtAuthor" runat="server" placeholder="Author" CssClass="form-control" required="true"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:TextBox ID="txtGenre" runat="server" placeholder="Genre" CssClass="form-control" required="true"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:TextBox ID="txtISBN" runat="server" placeholder="ISBN" CssClass="form-control" required="true"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:TextBox ID="txtAvailableCopies" runat="server" placeholder="Available Copies" CssClass="form-control" required="true"></asp:TextBox>
    </div>

    <!-- FileUpload control for the book image -->
    <div class="form-group">
        <asp:FileUpload ID="fuBookImage" runat="server" CssClass="form-control" required="true"/>
    </div>

    <div class="form-group">
        <asp:Button ID="btnAddBook" runat="server" Text="Add Book" 
             CssClass="btn" onclick="btnAddBook_Click" />
    </div>

</div>


</asp:Content>
