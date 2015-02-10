<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookUI.aspx.cs" Inherits="LibraryManagementSystem.UI.BookUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        h1 {
            color: hotpink
        }
    </style>
</head>
<body>
    <h1>WELCOME TO BOOK ENTRY PAGE</h1>
<div class ="container">
       <nav>
<a href="StartWebUI.aspx">HOME</a> 
           </nav>
   </div>


    <form id="form1" runat="server">
            <div>
    <table>
        <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Book Title" Font-Bold="True" ForeColor="#CC6600"></asp:Label>
                </td>
                <td> 
                    <asp:TextBox ID="titleTextBox" runat="server" Width="324px"></asp:TextBox>
                </td>
            </tr>
              <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Author" Font-Bold="True" ForeColor="#CC6600"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="authorTextBox" runat="server" Width="324px"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Publisher" Font-Bold="True" ForeColor="#CC6600"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="publisherTextBox" runat="server" Width="324px"></asp:TextBox>
                </td>
            </tr>
        <tr>
                <td>
                    <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" BackColor="#00CC00" Font-Bold="True" Width="80px" />
                </td>
          </tr>  
                
            </table>
        <asp:Label ID="msgLabel" runat="server" ></asp:Label>
    </div>
    </form>
</body>
</html>
