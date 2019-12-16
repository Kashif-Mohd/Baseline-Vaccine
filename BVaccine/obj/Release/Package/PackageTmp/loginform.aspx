<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginform.aspx.cs" Inherits="BVaccine.loginform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Baseline Vaccination</title>
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
    <div class="login-page">
    <form id="form1" class="login-form" runat="server">
    <div class="form">
        <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" FailureText="Invalid user name & password">
            <LayoutTemplate>
                    <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table cellpadding="0" style="width:265px;">
                                    <tr>
                                        <td align="center" class="auto-style1" style="color:ghostwhite"><h2><b>LOGIN</b></h2></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server" Width="250px" placeholder="user name"></asp:TextBox>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="250px" placeholder="password"></asp:TextBox>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="font-size:small; color:Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" class="btn" style="background-color: #39CCCC; width:250px; height:50px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
        </asp:Login>
    </div>
    </form>
    </div>
</body>
</html>
