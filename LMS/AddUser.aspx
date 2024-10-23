<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="LMS.AddUser" %>
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

.btn-primary {
    width: 100%;
    padding: 12px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn-primary:hover {
    background-color: #0056b3;
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
        <h2>Add New User</h2>
    </div>

 <!-- Form for adding new users -->
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblMessage" runat="server" Text="" CssClass="message"></asp:Label>
    <br />
    <div class="form-group">
        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Name" required="true"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" placeholder="Password" required="true"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:DropDownList ID="ddlUserType" CssClass="form-control" runat="server" requried="true">
          <asp:ListItem  Text="Select User Type" Value="" Selected="true"></asp:ListItem>            
            <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
            <asp:ListItem Text="Faculty" Value="Faculty"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="form-group">
        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Email" required="true"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatormail" 
            runat="server" ErrorMessage="* Invalid Format (eg. Abc@gmail.com)" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ControlToValidate="txtEmail" ForeColor="Red"></asp:RegularExpressionValidator>
    </div>
    <div class="form-group">
        <asp:TextBox ID="txtPhoneNumber" CssClass="form-control" runat="server" placeholder="Phone Number" required="true"></asp:TextBox>
    </div>
    
    <div class="form-group">
       <asp:Button ID="btnAddUser" runat="server" Text="Add User"  
            CssClass="btn btn-primary" onclick="btnAddUser_Click" />

    </div>
</div>

</asp:Content>
