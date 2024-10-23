<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SearchBook.aspx.cs" Inherits="LMS.SearchBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
   /* General Styles */
  
body {
    font-family: Arial, sans-serif; /* Use a clean, sans-serif font */
    background-color: #f4f4f9; /* Light background color */
    color: #333; /* Dark grey text for readability */
}

.search-container {
    max-width: 800px; /* Maximum width for the search container */
    margin: 20px auto; /* Center the container */
    padding: 20px; /* Padding inside the container */
    background-color: #ffffff; /* White background for the container */
    border-radius: 8px; /* Rounded corners */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
}

.form-container {
    width: 540px;
    background-color: white;
    padding: 30px;
    margin: 50px auto;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
/* Button Styles */
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
    width:30%;
}

/* Button Hover Effect */
.btn:hover {
    background-color: #0056b3; /* Darker blue on hover */
}

/* Message Label Styles */
.message {
    color: #d9534f; /* Red color for error/success messages */
    margin: 10px 0; /* Margin for spacing */
    font-weight: bold; /* Bold text */
}
/* Heading Styles */
#sr_h1 {
    text-align: center; /* Center the heading */
    color: #007bff; /* Blue color for the heading */
    margin-bottom: 20px; /* Space below the heading */
}

/* Table Styles */
.search-table {
    width: 100%; /* Full width for the table */
    margin-bottom: 20px; /* Space below the table */
    border-collapse: collapse; /* Collapse borders */
}

.search-table td {
    padding: 10px; /* Padding in table cells */
    border: 1px solid #ddd; /* Light grey border */
}

/* Input TextBox Styles */
input[type="text"] {
    width: 100%; /* Full width for input fields */
    padding: 10px; /* Padding for input fields */
    border: 1px solid #ccc; /* Light grey border */
    border-radius: 5px; /* Rounded corners */
    font-size: 1em; /* Font size */
    transition: border-color 0.3s ease; /* Smooth border transition */
}

/* Input Focus Effect */
input[type="text"]:focus {
    border-color: #007bff; /* Change border color on focus */
    outline: none; /* Remove default outline */
}

/* Button Styles */
.btn-search {
    background-color: #007bff; /* Blue background for buttons */
    color: white; /* White text */
    padding: 10px 20px; /* Padding for buttons */
    border: none; /* Remove border */
    border-radius: 5px; /* Rounded corners */
    cursor: pointer; /* Pointer cursor on hover */
    font-size: 1.2em; /* Font size */
    transition: background-color 0.3s ease; /* Smooth background transition */
}

/* Button Hover Effect */
.btn-search:hover {
    background-color: #0056b3; /* Darker blue on hover */
}
.gridview {
    width: 100%; /* Full width for GridView */
    border-collapse: collapse; /* Collapse borders */
}

.gridview th, .gridview td {
    border: 1px solid #ddd; /* Light grey border */
    padding: 8px; /* Padding in cells */
    text-align: left; /* Left align text */
}

.gridview th {
    background-color: #007bff; /* Header background color */
    color: white; /* Header text color */
}

.gridview tr:hover {
    background-color: rgba(0, 123, 255, 0.1); /* Light blue background on row hover */
}


</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
<div class="form-container">
    <div class="form-header">
        <h2>Search Books</h2>
    </div>
        <table class="search-table">
            <tr>
                <td>Title:</td>
                <td><asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Author:</td>
                <td><asp:TextBox ID="txtAuthor" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Genre:</td>
                <td><asp:TextBox ID="txtGenre" runat="server" CssClass="form-control"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" 
                        onclick="btnSearch_Click" />
                </td>
            </tr>
        </table>
</div>
 <asp:GridView ID="GridViewBooks" runat="server" AutoGenerateColumns="False" CssClass="gridview">
            <Columns>
                <asp:BoundField DataField="BookID" HeaderText="Book ID" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Author" HeaderText="Author" />
                <asp:BoundField DataField="Genre" HeaderText="Genre" />
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                <asp:BoundField DataField="AvailableCopies" HeaderText="Available Copies" />
            </Columns>
        </asp:GridView>
</asp:Content>
