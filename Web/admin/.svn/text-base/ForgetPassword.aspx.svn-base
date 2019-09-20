<%@ Page Title="" Language="C#" MasterPageFile="~/admin/SubAdmin.Master" AutoEventWireup="true"
    CodeBehind="ForgetPassword.aspx.cs" Inherits="Etech.CMS.Web.admin.ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            background: url(../App_Themes/ISTWeb/images/bodybackground.png) no-repeat center center;
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
    <div class="loginPost">
        <div class="clearBoth lpcontainer">
            <div class="clearBoth lpUsername">
                <asp:PasswordRecovery ID="prPasswordRecover" SuccessPageUrl="~/admin/default.aspx"
                    runat="server"  SubmitButtonStyle-CssClass="fButton"
                    OnSendingMail="prPasswordRecover_SendingMail" Width="320px" TextBoxStyle-Width="220px">
                    <TitleTextStyle CssClass="sectionHeader" Font-Size="Large"></TitleTextStyle>
                    <SubmitButtonStyle CssClass="fButton"></SubmitButtonStyle>
                    <FailureTextStyle CssClass="errorbox" />
                    <InstructionTextStyle CssClass="plainbox" Font-Size="Small"/>
                    <LabelStyle CssClass="checkoutlabel" Font-Size="Small"/>
                </asp:PasswordRecovery>
            </div>
        </div>
        <div class="margin_bottom">
        </div>
    </div>
</asp:Content>
