<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="LMS.Signup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #1abc9c;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color:1abc9c;
            height: 300px; 
            
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            margin-top:26%;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-family: 'Poppins', sans-serif;            
        }
        label {
            font-weight: bold;
            margin-top: 10px;
            font-family: 'Poppins', sans-serif;                        
        }
        input[type="text"], input[type="email"], input[type="tel"], select {
            width: 90%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 0px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            width: 100%;
            background-color: darkslategray;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.4s ease, color 0.4s ease;            
        }
        input[type="submit"]:hover {
            background-color: lightblue;
            color:Black;
            transition: background-color 0.4s ease, color 0.4s ease;        
        }
        .form-group {
            margin-bottom: 0px;
        }
        #RegularExpressionValidatorEmail
        {
            font-size:12px;
            font-family: 'Poppins', sans-serif; 
            color:Red;
        }
        #RequiredFieldName
        {
            font-size:12px;
            font-family: 'Poppins', sans-serif; 
            color:Red;
        }  
        #RequiredFieldUsertype
        {
            font-size:12px;
            font-family: 'Poppins', sans-serif; 
            color:Red;
        } 
        #RequiredFieldValidatorEmail
        {
            font-size:12px;
            font-family: 'Poppins', sans-serif; 
            color:Red;
        } 
        #RangeValidatorPhone
        {
            font-size:12px;
            font-family: 'Poppins', sans-serif; 
            color:Red;
        }
        #RequiredFieldValidatorPhone
        {
            font-size:12px;
            font-family: 'Poppins', sans-serif; 
            color:Red;
        }
        #RegularExpressionValidatorPhone
        {
            font-size:12px;
            font-family: 'Poppins', sans-serif; 
            color:Red;
        }
        #RequiredFieldValidatorPassword
        {
            font-size:12px;
            font-family: 'Poppins', sans-serif; 
            color:Red;
        }
        .container h1 
        {
           color:darkslategray;   
        }
    </style>
<body>
   <div class="container">
        <h1>USER REGISTRATION</h1>
        <form id="registerForm" runat="server">
            <div class="form-group">
                <label for="name">Name:</label>
                <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name"></asp:TextBox>
                <br />
            <asp:RequiredFieldValidator ID="RequiredFieldName" runat="server" ControlToValidate="txtName" ErrorMessage="* Name must be Required"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="name">Password:</label>
                <asp:TextBox ID="txtPass" runat="server" placeholder="Enter your name"></asp:TextBox>
                <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="txtPass" ErrorMessage="* Password must be Required"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="usertype">User Type:</label>
                <asp:DropDownList ID="ddlType" runat="server">
                   <asp:ListItem Value="" Selected="True">Select User Type</asp:ListItem>
                    <asp:ListItem Value="student">Student</asp:ListItem>
                    <asp:ListItem Value="faculty">Faculty</asp:ListItem>
                </asp:DropDownList>
                <br />
            <asp:RequiredFieldValidator ID="RequiredFieldUsertype" runat="server" ControlToValidate="ddlType" ErrorMessage="* Please Select User Type"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <asp:TextBox ID="txtMail" runat="server" placeholder="Enter your E Mail"></asp:TextBox>
                <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtMail" ErrorMessage="* E Mail must be Required"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" 
                    ControlToValidate="txtMail"  
                    ErrorMessage="* Enter Valid Mail (eg. 'ABC@gmail.com')" ForeColor="Red" 
                    ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <asp:TextBox ID="txtPhone" runat="server" placeholder="Enter your phone number"></asp:TextBox>
                <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="* Phone Number must be Required"></asp:RequiredFieldValidator>
                <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server" 
                    ControlToValidate="txtPhone"  
                    ErrorMessage="* Phone Number must be 10 Digits" ForeColor="Red" 
                    ValidationExpression="^\d{10}$">
            </asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <asp:Button ID="btnRegister" runat="server" CssClass="register-btn" 
                    Text="Register" onclick="btnRegister_Click"/>
            </div>
        </form>
    </div>
</body>
</html>
