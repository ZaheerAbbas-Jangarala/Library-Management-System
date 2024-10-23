<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="LMS.UserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
/* GridView Styles */
.gvUsers {
    width: 100%; /* Full width for GridView */
    border-collapse: collapse; /* Collapse borders */
    margin-top: 20px; /* Space above the GridView */
}

.gvUsers th, .gvUsers td {
    border: 1px solid #ddd; /* Light grey border */
    padding: 8px; /* Padding in cells */
    text-align: left; /* Left align text */
}

.gvUsers th {
    background-color: #007bff; /* Header background color */
    color: white; /* Header text color */
}

.gvUsers tr:hover {
    background-color: rgba(0, 123, 255, 0.1); /* Light blue background on row hover */
}    
</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h3>User List</h3>
<asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="gvUsers" DataKeyNames="UserId">
    <Columns>
        <asp:BoundField DataField="UserId" HeaderText="User ID" />
        <asp:BoundField DataField="Name" HeaderText="Name" />
        <asp:BoundField DataField="UserType" HeaderText="User Type" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
        <asp:BoundField DataField="RegistrationDate" HeaderText="Registration Date" DataFormatString="{0:yyyy-MM-dd}" />
    </Columns>
</asp:GridView>

</asp:Content>
