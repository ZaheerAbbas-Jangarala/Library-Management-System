<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="BorrowList.aspx.cs" Inherits="LMS.BorrowList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    
    /* GridView Styles */
    .gridview {
        width: 100%; /* Full width */
        border-collapse: collapse; /* Collapse borders */
        margin-top: 20px; /* Space above GridView */
    }

    .gridview th, .gridview td {
        border: 1px solid #ddd; /* Light border */
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

    /* Button Styles in GridView */
    .gridview .delete-button {
        background-color: #dc3545; /* Red background for delete buttons */
        color: white; /* White text */
        border: none; /* Remove border */
        border-radius: 5px; /* Rounded corners */
        padding: 5px 10px; /* Padding for delete button */
    }

    .gridview .delete-button:hover {
        background-color: #c82333; /* Darker red on hover */
    }
    .message {
        color: green; /* Red color for error/success messages */
        margin: 10px 0; /* Margin for spacing */
        font-weight: bold; /* Bold text */
    }

    .form-group h3
    {
        margin-top:1%;
        color: black;
        background-color: lightblue;
        border: 1px solid grey;
        padding:10px 10px;
        width:30%;
        text-align:center;
        margin-left:35%;
    }
    h3
    {
        margin-top:1%;
        color: black;
        background-color: lightblue;
        border: 1px solid grey;
        padding:10px 10px;
        width:30%;
        text-align:center;
        margin-left:35%;    
    }
    .form-control
    {
        padding:12px 15px;
        border-radius: 10px;
    }
    .lblname
    {
      font-size:12px  
    }
    h4
    {
        color: darkgreen;
    }
    .btnborrow
    {
        margin-left:3%;
        background-color: darkslategray;
        color: White;
        border 1px solid black;
        border-radius: 10px;
        padding: 12px 26px;
        font-size: 14px
    }
    .btnborrow:hover
    {
        background-color: lightblue;
        transition: 0.5s ease;
        color: black;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
<h3>Borrowing List</h3>
    <asp:Label ID="lblmessage" runat="server" CssClass="message" ></asp:Label>
<asp:GridView ID="gvBorrowing" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="BorrowId" CssClass="gridview"  
        onselectedindexchanged="gvBorrowing_SelectedIndexChanged">
    <Columns>
        <asp:CommandField  ShowSelectButton="true"/>
        <asp:BoundField DataField="BorrowId" HeaderText="Borrow ID" />
        <asp:BoundField DataField="BookId" HeaderText="Book ID" />
        <asp:BoundField DataField="UserId" HeaderText="User ID" />
        <asp:BoundField DataField="BorrowDate" HeaderText="Borrow Date" DataFormatString="{0:yyyy-MM-dd}" />
        <asp:BoundField DataField="DueDate" HeaderText="Due Date" DataFormatString="{0:yyyy-MM-dd}" />
        <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" DataFormatString="{0:yyyy-MM-dd}" />
    </Columns>
</asp:GridView>

<div class="form-group">
<h3>Return Book</h3>
            <h4>Selected Book Details :</h4>
            <asp:TextBox ID="txtBookId" runat="server" placeholder="Book ID" CssClass="form-control" Required="true" ></asp:TextBox>
            <asp:TextBox ID="txtUserId" runat="server" placeholder="User ID" CssClass="form-control"></asp:TextBox>
            <asp:TextBox ID="txtBorrowDate" runat="server" placeholder="Borrow Date (YYYY-MM-DD)" CssClass="form-control"></asp:TextBox>
            <asp:TextBox ID="txtDueDate" runat="server" placeholder="Due Date (YYYY-MM-DD)" CssClass="form-control"></asp:TextBox>
            <asp:TextBox ID="txtReturn" runat="server" TextMode="Date" placeholder="Return Date (YYYY-MM-DD)" CssClass="form-control"></asp:TextBox>
 
           <asp:Button ID="btnBorrow" class="btnborrow" runat="server" Text="Return" 
                onclick="btnBorrow_Click"  />
            <asp:Button ID="btnClear" onclick="btnClear_Click" class="btnborrow" runat="server" Text="Clear"/>
           </div>
</asp:Content>
