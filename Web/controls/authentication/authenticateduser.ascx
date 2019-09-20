<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="authenticateduser.ascx.cs"
    Inherits="Etech.CMS.Web.controls.authentication.authenticateduser" EnableViewState="false" %>
<%@ Register TagPrefix="CMS" TagName="Search" Src="~/controls/search.ascx" %>
<div class="userName">
    <CMS:Label ID="lblWelcome" runat="server" />
    <br />
    <strong>
        <CMS:Label ID="lblUserName" runat="server" /></strong></div>
<div class="links">
    <CMS:LinkButton ID="lnkLogout" CausesValidation="false" runat="server" OnClick="lnkLogout_Click" />
    | <a href="../Home.aspx">Home</a></div>
