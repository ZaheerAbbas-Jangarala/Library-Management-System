<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="LMS.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
</head>
<style>
/* Importing Google Fonts - Poppins */
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}

body {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
  padding: 15px;
  background: #1abc9c;
  overflow: hidden;
}

.wrapper {
  max-width: 500px;
  width: 100%;
  background: #fff;
  border-radius: 5px;
  box-shadow: 0px 4px 10px 1px rgba(0, 0, 0, 0.1);
}

.wrapper .title {
  height: 120px;
  background: #16a085;
  border-radius: 5px 5px 0 0;
  color: #fff;
  font-size: 30px;
  font-weight: 600;
  display: flex;
  align-items: center;
  justify-content: center;
}

.wrapper form {
  padding: 25px 35px;
}

.wrapper form .row {
  height: 60px;
  margin-top: 15px;
  position: relative;
}

.wrapper form .row input {
  height: 100%;
  width: 100%;
  outline: none;
  padding-left: 70px;
  border-radius: 5px;
  border: 1px solid lightgrey;
  font-size: 18px;
  transition: all 0.3s ease;
}

form .row input:focus {
  border-color: #16a085;
}

form .row input::placeholder {
  color: #999;
}

.wrapper form .row i {
  position: absolute;
  width: 55px;
  height: 100%;
  color: #fff;
  font-size: 22px;
  background: #16a085;
  border: 1px solid #16a085;
  border-radius: 5px 0 0 5px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.wrapper form .pass {
  margin-top: 12px;
}

.wrapper form .pass a {
  color: #16a085;
  font-size: 17px;
  text-decoration: none;
}

.wrapper form .pass a:hover {
  text-decoration: underline;
}

.wrapper form .button input {
  margin-top: 20px;
  color: #fff;
  font-size: 20px;
  font-weight: 500;
  padding-left: 0px;
  background: #16a085;
  border: 1px solid #16a085;
  cursor: pointer;
}

form .button input:hover {
  background: #12876f;
}

.wrapper form .signup-link {
  text-align: center;
  margin-top: 45px;
  font-size: 17px;
}

.wrapper form .signup-link a {
  color: #16a085;
  text-decoration: none;
}

form .signup-link a:hover {
  text-decoration: underline;
}
.errorMessage
{
    color:Red;
    margin-left:33%;
    font-size:20px;
}
</style>
<body>
   <div class="wrapper">
    <div class="title"><span>Login Form</span></div>
     <asp:Label ID="lblMessage" class="errorMessage" runat="server" Text=""></asp:Label>
    <form id="form2" runat="server">
      <div class="row">
        <i class="fas fa-user"></i>
        <asp:TextBox ID="txtEmailPhone" runat="server" placeholder="Username" CssClass="form-control" required="true"></asp:TextBox>
      </div>
      <div class="row">
        <i class="fas fa-lock"></i>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control" required="true"></asp:TextBox>
      </div>
      <div class="row button">
        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" 
              onclick="btnLogin_Click" />
      </div>
      <div class="signup-link">Not a member? <a href="Signup.aspx">Signup now</a></div>
    </form>
   </div>
</body>
</html>
