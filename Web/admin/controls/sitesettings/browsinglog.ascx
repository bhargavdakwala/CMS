<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="browsinglog.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.sitesettings.browsinglog" %>


<CMS:Panel ID="pnlBrowsingLog" runat="server" >
  <br />
  <CMS:Label ID="lblBrowsingCategory" runat="server" CssClass="label" /><br />
  <CMS:CheckBox ID="chkBrowsingCategory" runat="server" />&nbsp;<CMS:HelpLink ID="helpBrowsingCategory" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
  <CMS:Label ID="lblBrowsingProduct" runat="server" CssClass="label" /><br />
  <CMS:CheckBox ID="chkBrowsingProduct" runat="server" />&nbsp;<CMS:HelpLink ID="helpBrowsingProduct" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
  <CMS:Label ID="lblCollectSearchTerms" runat="server" CssClass="label" /><br />
  <CMS:CheckBox ID="chkCollectSearchTerms" runat="server" />&nbsp;<CMS:HelpLink ID="helpCollectSearchTerms" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
  
  <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" />
  <br /><br />
  
</CMS:Panel>
