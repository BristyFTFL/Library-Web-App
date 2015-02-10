<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReturnBookUI.aspx.cs" Inherits="LibraryManagementSystem.UI.ReturnBookUI" %>

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
      <h1>RETURN BOOK</h1>
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
                    <asp:TextBox ID="memberNoTextBox" runat="server" Width="289px" Height="22px"></asp:TextBox>
                </td>
            </tr>
        <tr>
           <td>
               <asp:Button ID="showButton" runat="server" Text="Show Borrowed Books" OnClick="showButton_Click" BackColor="#FFCC00" />
                </td>
            </tr>
        <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Select a Book" Font-Bold="True" ForeColor="#CC6600"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="bookDropDownList" runat="server" Height="22px" OnSelectedIndexChanged="bookDropDownList_SelectedIndexChanged" Width="289px" ></asp:DropDownList>
                </td>
            </tr>
       <tr>
           <td>
               <asp:Button ID="returnButton" runat="server" Text="Return" Width="83px" OnClick="returnButton_Click" BackColor="#CCFF66" />
                </td>
            </tr>
            </table>
    </div>
        <asp:Label ID="msgLabel" runat="server"></asp:Label>
    </form>
</body>
</html>
