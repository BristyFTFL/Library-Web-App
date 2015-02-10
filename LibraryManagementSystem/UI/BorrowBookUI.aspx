<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BorrowBookUI.aspx.cs" Inherits="LibraryManagementSystem.UI.BorrowBookUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
      h1 {
          color:yellowgreen
      }
  </style>

</head>
<body>
    <h1>Borrow BOOK</h1>
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
                    <asp:Label ID="Label1" runat="server" Text="Enter Member No" Font-Bold="True" ForeColor="#CC6600"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="memberNoTextBox" runat="server" Width="324px"></asp:TextBox>
                </td>
            </tr>
        <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Select a Book" Font-Bold="True" ForeColor="#CC6600"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="bookDropDownList" runat="server" AutoPostBack="True" Height="18px" OnSelectedIndexChanged="bookDropDownList_SelectedIndexChanged" Width="151px"></asp:DropDownList>
                </td>
            </tr>
        <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Author" Font-Bold="True" ForeColor="#CC6600"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="authorTextBox" runat="server" Width="324px"></asp:TextBox>
                </td>
            </tr>
        <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Publisher" Font-Bold="True" ForeColor="#CC6600"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="publisherTextBox" runat="server" Width="324px"></asp:TextBox>
                </td>
            </tr>
        <tr>
                
                <td>
                    <asp:Button ID="borrowButton" runat="server" Text="Borrow" OnClick="borrowButton_Click" />
                </td>
            </tr>
    </table>
    </div>
        <asp:Label ID="msgLabel" runat="server" ></asp:Label>
    </form>
</body>
</html>
