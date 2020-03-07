<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginWebForm.aspx.cs" Inherits="MidExam.GUI.LoginWebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style5 {
            width: 548px;
        }
    </style>
</head>
<body style="width: 556px">
    <form id="form1" runat="server">
        <div>
            <table class="auto-style5">
            <tr>
                <td>&nbsp;</td>
                <td>LOGIN</td>
                <td class="auto-style7">&nbsp;</td>
                <td>REGISTER</td>
            </tr>
            <tr>
                <td>ID:</td>
                <td>
                        <asp:TextBox ID="TextBoxId" runat="server" Width="136px"></asp:TextBox>
                    </td>
                <td class="auto-style7">ID</td>
                <td>
                    <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">PASSWORD</td>
                <td class="auto-style6">
                        <asp:TextBox type="password" ID="TextBoxPsw" runat="server" Width="134px"></asp:TextBox>
                    </td>
                <td class="auto-style8">FirstName</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtFname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                        <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click" Text="Login" />
                    </td>
                <td class="auto-style7">LastName</td>
                <td>
                    <asp:TextBox ID="txtLname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style7">Email</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style7">Phone</td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style7">Password</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>
                        <asp:Button ID="ButtonRegister" runat="server" Text="Register" OnClick="ButtonRegister_Click" />
                    </td>
            </tr>
        </table>
        </div>
        
    </form>
</body>
</html>
