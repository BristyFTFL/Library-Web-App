<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberUI.aspx.cs" Inherits="LibraryManagementSystem.UI.MemberUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        h1 {
            color : darkorchid
        }
    </style>
</head>
<body>
    <h1>WELCOME TO MEMBER ENTRY PAGE</h1>
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
                    <asp:Label ID="Label1" runat="server" Text="Member Number" Font-Bold="True" ForeColor="#CC6600"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="numberTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
         <tr>
              <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Member Name" Font-Bold="True" ForeColor="#CC6600"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="nameTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
         <tr>   
                <td>
                    <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" BackColor="#FF66CC" Font-Bold="True" Width="73px" />
                </td>
            </tr>
            </table>
        <asp:Label ID="msgLabel" runat="server" ></asp:Label>
    </div>
    </form>
</body>
</html>
