<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="analytics.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.sitesettings.analytics" %>

<CMS:Panel ID="pnlAnalytics" runat="server">
  <br />
  <div class="verticalalign">
    <CMS:Label ID="lblAnalytics" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink ID="helpAnalytics" runat="server" NavigateUrl="javascript:void(0);" /><br />
  </div>
  <asp:TextBox ID="txtAnalytics" runat="server" CssClass="largemultilinetextbox" TextMode="MultiLine"/><br /><br />
  <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" />
  
</CMS:Panel>
