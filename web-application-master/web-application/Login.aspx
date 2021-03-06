﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="User_Login_CS.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <%--THIS PAGE NEEDS TO BE IMPLEMENTED WITH THE MASTER PAGE - Didn't do this because time was short and things needed changed quickly.--%>


    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Custom jquery scripts -->
    <script src="js/jquery/custom_jquery.js" type="text/javascript"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="default" />
    <!--  jquery core -->
    <script src="js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>

    <!-- Custom jquery scripts -->
    <script src="js/jquery/custom_jquery.js" type="text/javascript"></script>

    <!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
    <script src="js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>

</head>
<body>


    <!-- Start: page-top-outer -->
    <div id="page-top-outer">

        <!-- Start: page-top -->
        <div id="page-top">

            <!-- start logo -->
            <div id="logo">
                <%--<a href=""><img src="images/shared/logo.png" width="156" height="40" alt="" /></a>--%>
                <h1 style="color: white; margin-top: 20px;">Greenways Portal </h1>
            </div>

            <div class="clear"></div>

        </div>
    </div>

    <div class="clear">&nbsp;</div>

    <!--  start nav-outer-repeat -->
    <div class="nav-outer-repeat">
        <!--  start nav-outer -->
        <div class="nav-outer">

            <!--  start nav -->
            <div class="nav" style="z-index: 1">

                <div class="clear"></div>
            </div>

        </div>
        <div class="clear"></div>
    </div>

    <h1 style="position: absolute; margin-top: 125px; margin-left: 600px;">Login</h1>

    <!--Login Form-->
    <div id="loginbox" style="margin: 0 auto; margin-top: 150px;">
        <div id="login-inner">
            <form id="form1" runat="server">

                <%--The asp:Login allows for user authentication--%>
                <asp:Login ID="Login1" runat="server" OnAuthenticate="ValidateUser">

                    <%--Not sure what LayoutTemplate is for--%>
                    <LayoutTemplate>

                        <%--Table element holds User Login Interface--%>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="table-head" style="padding-bottom: 10px"><b>Username</b>
                                </td>
                                <td>
                                    <%--I think they used the asp:Textbox to allow for "Remember Me" function--%>
                                    <asp:TextBox CssClass="login-inp" ID="UserName" runat="server" autocomplete="disabled"></asp:TextBox>

                                    <%--Check to make sure the user is valid--%>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="table-head" style="padding-bottom: 10px"><b>Password</b>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="login-inp" ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td valign="top">
                                    <%--The Remember Me functionality doesn't work currently--%>
                                    <%--<input type="checkbox" class="checkbox-size" id="login-check" /><label for="login-check">Remember me</label></td>--%>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <%---ASP button used in place of normal submit button--%>
                                    <asp:Button ID="LoginButton" CssClass="submit-login" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />

                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>

                    <%--Don't know what this was for
                        
                        <div>
                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                        </div>--%>
                </asp:Login>
            </form>
        </div>
        <div class="clear"></div>

        <%--Login page should have ability to reset passwords--%>
        <%--<a href="" class="forgot-pwd">Forgot Password?</a>--%>
    </div>

    <div id="spacing" style="margin-top:70px">
        &nbsp;
    </div>

    <!-- This footer should appear on all pages -->
    <div id="footer">

        <!--  start footer-left -->
        <div id="footer-left">
            Greenways Portal &copy; Copyright IPFW Computer Science Department. All rights reserved.
        </div>

        <div class="clear">&nbsp;</div>


    </div>

</body>
</html>
