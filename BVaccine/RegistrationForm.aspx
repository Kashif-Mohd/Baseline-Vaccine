<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="BVaccine.RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/style.css" />
</head>

<body>
    <div class="login-page">
    <form id="form1" runat="server">
        <%--<h4 style="text-align:center; color:ghostwhite;"><b>User Registration</b></h4>--%>       
        <div class="form">         
               
            <asp:TextBox id="Textuname" runat="server" placeholder="username" required="required" Width="100%"></asp:TextBox>
            <%--<asp:TextBox id="Textemail" runat="server" placeholder="email" Width="100%"></asp:TextBox>--%>
            <asp:TextBox id="Textpass" runat="server"  TextMode="Password" placeholder="password" required="required" Width="100%"></asp:TextBox>
            <asp:TextBox id="Textconfirm" runat="server"  TextMode="Password" placeholder="confirm password" required="required" Width="100%" ValidateRequestMode="Enabled" ></asp:TextBox>
            <asp:CompareValidator ID="CV" runat="server" ErrorMessage="Passwords don't match" ControlToValidate="Textconfirm" ControlToCompare="Textpass" Operator="Equal" Font-Size="Smaller" ForeColor="Red" CssClass="auto-style2"></asp:CompareValidator>
            <asp:Button CssClass="btn" id="button" runat="server" Text="create" Style="background-color:#1abc9c;" OnClick="button_Click" />            
        </div>
    </form>
    </div>
</body>
</html>
