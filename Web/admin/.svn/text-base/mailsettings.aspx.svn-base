<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="mailsettings.aspx.cs" Inherits="Etech.CMS.Web.admin.mailconfiguration" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/admin/admin.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="mainContentRegion">
  <div id="admin_centercontent">
    <div class="sectionHeader"><CMS:Label ID="lblMailConfiguration" runat="server" /></div><br />
    <CMS:Panel ID="pnlMailSettings" runat="server">
      <CMS:Label ID="lblFrom" runat="server" CssClass="label"/><br />
      <asp:TextBox ID="txtFrom" runat="server" CssClass="longtextbox" />&nbsp;<CMS:HelpLink ID="helpMailSettingsFrom" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
      <CMS:Label ID="lblHost" runat="server" CssClass="label"/><br />
      <asp:TextBox ID="txtHost" runat="server" CssClass="longtextbox"/>&nbsp;<CMS:HelpLink ID="helpMailSettingsHost" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
      <CMS:Label ID="lblRequireAuthentication" runat="server" CssClass="label" /><br />
      <CMS:CheckBox ID="chkRequireAuthentication" runat="server" CssClass="checkbox" />&nbsp;<CMS:HelpLink ID="helpRequireAuthentication" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
      <CMS:Label ID="lblUserName" runat="server" CssClass="label"/><br />
      <asp:TextBox ID="txtUserName" runat="server" CssClass="longtextbox"/>&nbsp;<CMS:HelpLink ID="helpMailSettingsUserName" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
      <CMS:Label ID="lblPassword" runat="server" CssClass="label"/><br />
      <asp:TextBox ID="txtPassword" runat="server" CssClass="longtextbox"/>&nbsp;<CMS:HelpLink ID="helpMailSettingsPassword" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
      <CMS:Label ID="lblRequireSsl" runat="server" CssClass="label" /><br />
      <CMS:CheckBox ID="chkRequireSsl" runat="server" CssClass="checkbox" />&nbsp;<CMS:HelpLink ID="helpMailRequireSsl" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
      <CMS:Label ID="lblPort" runat="server" CssClass="label"/><br />
      <asp:TextBox ID="txtPort" runat="server" />&nbsp;<CMS:HelpLink ID="helpMailSettingsPort" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
      <CMS:Button ID="btnTest" runat="server" CssClass="button" OnClick="btnTestSmtp_Click" />
      <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" /><br />
    </CMS:Panel>
  </div>
</div>
</asp:Content>
