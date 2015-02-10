<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NotReturnBookUI.aspx.cs" Inherits="LibraryManagementSystem.UI.NotReturnBookUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Not Return BookList</h1>
    <div class ="container">
       <nav>
<a href="StartWebUI.aspx">HOME</a> |
           </nav>
   </div>

    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="showGridView" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Member Name" ReadOnly="True" SortExpression="name" />
                <asp:BoundField DataField="memberNo" HeaderText="Member Number" ReadOnly="True" SortExpression="memberNo" />
                <asp:HyperLinkField DataNavigateUrlFields="memberNo" DataNavigateUrlFormatString="ShowNotReturnBookListUI.aspx?number={0}" DataTextField="noOfNotReturnBook"  HeaderText="No Of Not Return Book" />
           </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
