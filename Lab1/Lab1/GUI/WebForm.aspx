<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm.aspx.cs" Inherits="Lab1.WebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 50%;
            margin: auto;
            position: relative;
            left: 0px;
            top: 0px;
        }
        .auto-style3 {
            width: 83px;
        }
        .auto-style4 {
            width: 195px;
        }
        .auto-style5 {
            width: 196px;
        }
        .auto-style7 {
            width: 83px;
            height: 30px;
        }
        .auto-style10 {
            text-align: center;
        }
        .auto-style11 {
            width: 202px;
        }
        .auto-style13 {
            width: 172px;
            height: 30px;
        }
        .auto-style14 {
            width: 172px;
        }
        .auto-style15 {
            width: 14px;
        }
        .auto-style16 {
            width: 14px;
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
    <table class="auto-style1">
        <tr>
            <td class="auto-style10" colspan="3">
                <h1>Employee Maintainance</h1>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Employee ID</td>
            <td class="auto-style15">
                <input id="Text1" class="auto-style4" type="text" /></td>
            <td class="auto-style14">
                &nbsp;</tr>
        <tr>
            <td class="auto-style3">First Name</td>
            <td class="auto-style15">
                <input id="Text2" class="auto-style5" type="text" /></td>
            <td class="auto-style14">
                &nbsp;</tr>
        <tr>
            <td class="auto-style7">Last Name</td>
            <td class="auto-style16">
                <input id="Text3" class="auto-style4" type="text" /></td>
            <td class="auto-style13">
                &nbsp;</tr>
        <tr>
            <td class="auto-style3">Job Title</td>
            <td class="auto-style15">
                <input id="Text4" class="auto-style4" type="text" /></td>
            <td class="auto-style14">
                &nbsp;</tr>
        <tr>
            <td class="auto-style3">Search By</td>
            <td class="auto-style15">
                <select id="Select1" class="auto-style11" name="D1">
                    <option></option>
                </select></td>
            <td class="auto-style14">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style15">
                <input id="Text5" class="auto-style4" type="text" /></td>
            <td class="auto-style14">
                &nbsp;</tr>
    </table>
        </div>
    </form>
    </body>
</html>
