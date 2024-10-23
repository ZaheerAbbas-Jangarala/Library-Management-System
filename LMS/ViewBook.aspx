<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewBook.aspx.cs" Inherits="LMS.ViewBook" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
          body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .book-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .book-container {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 15px;
            width: 150px;
            text-align: center;
            transition: transform 0.2s;
        }

        .book-container:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .book-container img {
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .book-title {
            font-size: 16px;
            font-weight: bold;
            color: #007bff;
            margin: 5px 0;
        }

        .book-author,
        .book-genre {
            font-size: 14px;
            color: #555;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .book-list {
                flex-direction: column;
                align-items: center;
            }

            .book-container {
                width: 80%;
            }
        }
        .booktitle
        {
            font-size:20px;
            color: Orange;
        }
        .bookgenre
        {
            font-size:16px;
            color: green;
        }
        .bookauthor
        {
            font-size:16px;
            color: green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <div>
     <h2>Available Books</h2>
    
    <asp:DataList ID="dlBook" runat="server" RepeatColumns="4" CellPadding="5" CssClass="book-list">
    <ItemTemplate>
        <div class="book-container">
            <!-- Display Book Image -->
            <asp:Image ID="Image1" ImageUrl='<%# Eval("BookImage") %>' runat="server" Width="100px" Height="150px" />

            <!-- Display Book Title -->
            <p class="booktitle"><strong><%# Eval("Title") %></strong></p>

            <!-- Display Author -->
            <p class="bookauthor">Author: <%# Eval("Author") %></p>

            <!-- Display Genre -->
            <p class="bookgenre">Genre: <%# Eval("Genre") %></p>
        </div>
    </ItemTemplate>
</asp:DataList>


    </div>
    </form>
</body>
</html>
