<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginFormTest.aspx.cs" Inherits="ReviewExersice.GUI.LoginFormTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 83px;
        }

        table{
            width: max-content;
            margin: auto
        }

        .heading {
            text-align:center
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">  
            <tr>
                <td class="heading" colspan="2">
                    Login Form</td>
            </tr>
            
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="UserID"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" />
                </td>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="Cancel" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
