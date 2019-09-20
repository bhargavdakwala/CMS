<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mail.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.overview.mail" %>


<CMS:Panel ID="pnlMailConfiguration" runat="server">
  <br />
  <CMS:HyperLink ID="hlNotifications" runat="server" NavigateUrl="~/admin/notifications.aspx" CssClass="label" /><br />
  <CMS:Label ID="lblNotificationsDescription" runat="server" CssClass="label" /><br /><br />
  <CMS:HyperLink ID="hlMailSettings" runat="server" NavigateUrl="~/admin/mailsettings.aspx" CssClass="label" /><br />
  <CMS:Label ID="lblMailSettingsDescription" runat="server" CssClass="label" /><br /><br />
</CMS:Panel>
