<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="BookList.aspx.cs" Inherits="LMS.BookList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<head>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
</head>
<style>
/* GridView Styles */
.gridview {
    width: 100%; /* Full width */
    border-collapse: collapse; /* Collapse borders */
    margin-top: 20px; /* Space above GridView */
}

.gridview th, .gridview td {
    border: 1px solid #ddd;
    padding: 8px; 
    text-align: left; 
}

.gridview th {
    background-color: #007bff; 
    color: white; 
}

.gridview tr:hover {
    background-color: rgba(0, 123, 255, 0.1); 
}

/* Button Styles in GridView */
.gridview .delete-button {
    background-color: #dc3545; 
    color: white; 
    border: none; 
    border-radius: 5px; 
    padding: 5px 10px; 
}

.gridview .delete-button:hover {
    background-color: #c82333; 
}
.heading
{
    margin-left:40%;
    font-size:38px;
    font-family: poppins,Sans Serif;
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h1 class="heading">Book List</h1>
   <asp:GridView ID="gvBooks" runat="server" AutoGenerateColumns="False" DataKeyNames="BookId" CssClass="gridview" >
    <Columns>
        <asp:BoundField DataField="BookId" HeaderText="Book ID" />
        <asp:BoundField DataField="Title" HeaderText="Book Title" />
        <asp:BoundField DataField="Author" HeaderText="Author" />
        <asp:BoundField DataField="Genre" HeaderText="Genre" />
        <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
        <asp:BoundField DataField="AvailableCopies" HeaderText="Available Copies" />
    </Columns>
</asp:GridView>

</asp:Content>
