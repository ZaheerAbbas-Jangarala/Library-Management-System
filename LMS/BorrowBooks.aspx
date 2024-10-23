<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="BorrowBooks.aspx.cs" Inherits="LMS.BorrowBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       /* General Styles */
body
{
    background-color:#f4f4f9;
}
h2, h3 {
    color: #333; /* Dark grey color for headings */
}

/* Form Group Styles */
.form-group {
    margin: 15px 0; /* Space between form elements */
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

.form-control::placeholder {
    color: #bbb;
    font-size: 14px;
}

/* TextBox Styles */
input[type="text"] {
    width: 100%; /* Full width */
    padding: 10px; /* Padding for input fields */
    border: 1px solid #ccc; /* Light border */
    border-radius: 5px; /* Rounded corners */
    font-size: 1em; /* Font size */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow */
    transition: border-color 0.3s ease; /* Smooth border transition */
}

/* Input Focus Effect */
input[type="text"]:focus {
    border-color: #007bff; /* Change border color on focus */
    outline: none; /* Remove default outline */
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

.form-header h2 {
    text-align: center;
    font-size: 24px;
    font-weight: 600;
    color: #333;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid #007bff;
}
</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="form-container">
    <div class="form-header">
        <h2>Issue Book</h2>
    </div>
        <!-- Form for adding borrowing records -->
        <asp:Label ID="lblMessage" runat="server" CssClass="message" 
        ForeColor="Green"></asp:Label>

        <br />

        <asp:Label ID="lblbookid" Text="Book ID" runat="server"></asp:Label> 
        <div class="form-group">
            <asp:TextBox ID="txtBookId" runat="server" placeholder="Book ID" CssClass="form-control" required="true"></asp:TextBox>
        </div>

        <asp:Label ID="lbluserid" Text="User ID" runat="server"></asp:Label> 
        <div class="form-group">
            <asp:TextBox ID="txtUserId" runat="server" placeholder="User ID" CssClass="form-control" required="true"></asp:TextBox>
        </div>

        <asp:Label ID="lblborrowdate" Text="Borrow Date" runat="server"></asp:Label> 
        <div class="form-group">
            <asp:TextBox ID="txtBorrowDate" runat="server" TextMode="Date" placeholder="Borrow Date (YYYY-MM-DD)" CssClass="form-control" required="true"></asp:TextBox>
        </div>

        <asp:Label ID="lblduedate" Text="Due Date" runat="server"></asp:Label> 
        <div class="form-group">
            <asp:TextBox ID="txtDueDate" runat="server" TextMode="Date" placeholder="Due Date (YYYY-MM-DD)" CssClass="form-control" required="true"></asp:TextBox>
        </div>
           <asp:Button ID="btnBorrow" runat="server" Text="Add Borrow Record" CssClass="btn" 
            onclick="btnBorrow_Click" />
</div>

</asp:Content>
