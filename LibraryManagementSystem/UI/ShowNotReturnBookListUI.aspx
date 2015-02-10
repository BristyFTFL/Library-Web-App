<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowNotReturnBookListUI.aspx.cs" Inherits="LibraryManagementSystem.UI.ShowNotReturnBookListUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Not Return Books Details</h1>
    <div class ="container">
       <nav>
<a href="StartWebUI.aspx">HOME</a> 
           </nav>
   </div>

    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="showGridView" runat="server" AutoGenerateColumns="False">
        <Columns>
                <asp:BoundField DataField="title" HeaderText="Book Title"  />
                <asp:BoundField DataField="author" HeaderText="Author" />
            <asp:BoundField DataField="publisher" HeaderText="Publisher" />
                 </Columns>
            </asp:GridView>
    </div>
    </form>
</body>
</html>
