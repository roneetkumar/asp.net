<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeForm.aspx.cs" Inherits="Lab1V2.Gui.EmployeeFrom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-style: solid;
            border-width: 2px;
            background-color: #C0C0C0;
            height: 277px;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            width: 191px;
        }
        .auto-style4 {
            width: 374px;
        }
        .auto-style5 {
            width: 191px;
            height: 26px;
        }
        .auto-style6 {
            width: 374px;
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
        }
        .auto-style8 {
            width: 191px;
            height: 68px;
        }
        .auto-style9 {
            width: 374px;
            height: 68px;
        }
        .auto-style10 {
            height: 68px;
        }
        .auto-style11 {
            height: 496px;
        }
        .auto-style12 {
            position: absolute;
            top: 319px;
            left: 630px;
            z-index: 1;
        }
        .auto-style14 {
            position: absolute;
            top: 356px;
            left: 635px;
            z-index: 1;
            width: 263px;
        }
        .auto-style15 {
            position: absolute;
            top: 420px;
            left: 629px;
            z-index: 1;
        }
        .auto-style16 {
            position: absolute;
            top: 397px;
            left: 847px;
            z-index: 1;
            margin-top: 26px;
        }
    </style>
</head>
<body style="margin-bottom: 240px">
    <form id="form1" runat="server" class="auto-style11">
        <div>

            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" colspan="3">Employee Form</td>
                </tr>
                <tr>
                    <td class="auto-style5">Employee ID: </td>
                    <td class="auto-style6">
                        
                        <asp:TextBox ID="TextBoxID" runat="server"></asp:TextBox>                     
                                             
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorId" runat="server" ErrorMessage="Please input 4 number"
                            
                            ValidationExpression='\d{4}$' ControlToValidate="TextBoxID"></asp:RegularExpressionValidator>                                     
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="ButtonSave" runat="server" OnClick="ButtonSave_Click" Text="Save" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">First Name: </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxFname" runat="server"></asp:TextBox>
                                             
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorfn" runat="server" ErrorMessage="First Name"
                            
                            ValidationExpression='[a-zA-Z]+(([&#039;,. -][a-zA-Z ])?[a-zA-Z]*)*$' ControlToValidate="TextBoxFname"></asp:RegularExpressionValidator>                                     
                    </td>
                    <td>
                        <asp:Button ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Last Name:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxLname" runat="server"></asp:TextBox>
                                             
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorln" runat="server" ErrorMessage="Last Name"
                            
                            ValidationExpression='[a-zA-Z]+(([&#039;,. -][a-zA-Z ])?[a-zA-Z]*)*$' ControlToValidate="TextBoxLname"></asp:RegularExpressionValidator>                                     
                    </td>
                    <td>
                        <asp:Button ID="ButtonDelete" runat="server" Text="Delete" OnClick="ButtonDelete_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">Job Title:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="TextBoxJobtitle" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style10">
                        <asp:Button ID="ButtonListView" runat="server" Text="List View" OnClick="ButtonListView_Click" />
                    </td>
                </tr>
            </table>

        </div>
        <asp:GridView ID="GridView1" runat="server" Width="548px">
        </asp:GridView>
        <asp:Button ID="ButtonSearch" runat="server" CssClass="auto-style16" OnClick="ButtonSearch_Click" Text="Search" />
        <asp:TextBox ID="TextBoxinput" runat="server" CssClass="auto-style15"></asp:TextBox>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style14">
            <asp:ListItem>Select: </asp:ListItem>
            <asp:ListItem>Employee</asp:ListItem>
            <asp:ListItem>First Name</asp:ListItem>
            <asp:ListItem>Last Name</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label1" runat="server" CssClass="auto-style12" Text="Search By"></asp:Label>
    </form>
</body>
</html>
