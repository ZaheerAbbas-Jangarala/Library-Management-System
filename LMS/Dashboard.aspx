<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="LMS.Overview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
.main-content {
    flex: 1;
    padding: 20px;
    background-color: #ecf0f1;
    overflow-y: auto;
    height:90vh;
}

header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
}

header h1 {
    font-size: 28px;
}

.user-profile {
    font-size: 18px;
    color: #34495e;
}

/* Cards Section */
.cards {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
}

.card {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.card h3 {
    font-size: 18px;
    margin-bottom: 10px;
}

.card p {
    font-size: 24px;
    font-weight: bold;
    color: #27ae60;
}

/* Recent Activity Section */
.recent-activity {
    margin-top: 40px;
}

.recent-activity ul {
    list-style: none;
    padding: 0;
}

.recent-activity ul li {
    background-color: white;
    padding: 15px;
    margin-bottom: 10px;
    border-radius: 10px;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
}
.flex-container
{
    display:flex;
    flex-direction:row;
}
</style>
  <div class="flex-container">

    <div class="main-content" id="main-container">
        <header>
            <h1>Panel Overview</h1>
            <div class="user-profile">
                <span><asp:Label ID="lbladmin" runat="server" Text="Admin"></asp:Label></span>
            </div>
        </header>

        <section class="cards">
            <div class="card">
                <h3>Total Books</h3>
                <p id="totalBooks"><asp:Label ID="lblTotalBooks" runat="server" Text="100"></asp:Label></p>
            </div>
            <div class="card">
                <h3>Available Books</h3>
                <p id="availableBooks"><asp:Label ID="lblAvailable" runat="server" Text="50"></asp:Label></p>
            </div>
            <div class="card">
                <h3>Borrowed Books</h3>
                <p id="borrowedBooks"><asp:Label ID="lblBorrow" runat="server" Text="10"></asp:Label></p>
            </div>
            <div class="card">
                <h3>Total Users</h3>
                <p id="activeUsers"><asp:Label ID="lblUser" runat="server" Text="140"></asp:Label></p>
            </div>
        </section>
    </div>
  </div>
</asp:Content>
