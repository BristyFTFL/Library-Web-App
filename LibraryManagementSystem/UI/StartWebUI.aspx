<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartWebUI.aspx.cs" Inherits="LibraryManagementSystem.UI.StartWebUI" %>

 <!DOCTYPE html>
<html>
<head>
  <title>Page Title</title>
    <style>
        h1 {
            color : darkcyan
        }
        a {
            color: tomato;
        }
        </style>
</head>

<body>
    <h1>LIBRARY MANAGEMENT SYSTEM</h1>

   <div class ="container">
       <nav>
<a href="BookUI.aspx">Book</a> |
<a href="MemberUI.aspx">Member</a> |
<a href="BorrowBookUI.aspx">Borrow Book</a> |
<a href="ReturnBookUI.aspx">Return Book</a>|
<a href="NotReturnBookUI.aspx">Number of Not Return Book</a>
           </nav>
   </div>

</body>

</html> 