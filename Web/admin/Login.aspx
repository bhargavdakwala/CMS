<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Etech.CMS.Web.admin.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../App_Themes/CMS/admin.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon"  href="../images/ahsca.ico" />
    <style type="text/css">
        body
        {
            margin: 0px;
            padding: 0px;
            width: auto;
            height: auto;
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
            font-size: 11px;
            background: url(../App_Themes/CMS/images/bodybackground.png) no-repeat center center;
            background-color: #2b2b2b !important;
        }
        form
        {
            margin: 0 !important;
            padding: 0 !important;
            display: inherit !important;
            min-height: auto !important;
            position: relative !important;
            padding-bottom: 0px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="loginPost">
        <asp:Login ID="llogin" runat="server" OnLoggedIn="SetCookie">
            <LayoutTemplate>
                <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification"
                    ValidationGroup="LoginUserValidationGroup" />
                <div class="lpHeader">
                    <h1 class="floatLeft">
                        AHSCA</h1>
                    <a href="../Home.aspx">
                        <img src="../App_Themes/CMS/images/lp-homeicon.png" class="floatRight" alt="Home"
                            title="Home" border="none;" /></a>
                </div>
                <div class="clearBoth lpcontainer">
                    <img src="../App_Themes/CMS/images/member-login-left.png" class="floatLeft" />
                    <img src="../App_Themes/CMS/images/member-login-right.png" class="floatRight" />
                    <div class="floatLeft lpMemberlogin">
                        <h2>
                            Member Login</h2>
                    </div>
                    <div class="clearBoth lpErrorMsg" id="ErrMsg" runat="server">
                        <p class="floatLeft">
                            Either Username or Password is wrong. Please try again.</p>
                        <img src="../App_Themes/CMS/images/password-flag.png" alt="" class="floatRight" />
                    </div>
                    <div class="clearBoth lpUsername">
                        <p>
                            Username</p>
                        <asp:TextBox ID="UserName" runat="server" CssClass="usernameTextbox"></asp:TextBox>
                       <asp:CustomValidator ID="custUserName" runat="server" EnableClientScript="true" OnServerValidate="UserName_Validate"
                            ControlToValidate="UserName">             
                        </asp:CustomValidator>
                        <p>
                            Password</p>
                        <asp:TextBox ID="Password" runat="server" CssClass="usernameTextbox" TextMode="Password"></asp:TextBox>
                     <asp:CustomValidator ID="custPassword" runat="server" EnableClientScript="true" OnServerValidate="UserName_Validate"
                            ControlToValidate="Password">             
                        </asp:CustomValidator>
                        <div class="floatLeft lprememberMe">
                            <div class="floatLeft">
                                <asp:CheckBox ID="RememberMe" runat="server" />
                                <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                            </div>
                            <div class="floatRight">
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup"
                                    OnClick="LoginButton_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="floatLeft">
                        <img src="../App_Themes/CMS/images/forgotpassword-left-background.png" class="floatLeft" />
                        <img src="../App_Themes/CMS/images/forgotpassword-right-background.png" class="floatRight" />
                        <div class="floatLeft lpforgotPassword">
                            <ul>
                                <li><a href="ForgetPassword.aspx">Forgot password?</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </LayoutTemplate>
        </asp:Login>
    </div>
    </form>
</body>
</html>
