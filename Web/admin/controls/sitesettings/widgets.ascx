<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="widgets.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.sitesettings.widgets" %>


<CMS:Panel ID="pnlWidgets" runat="server" >
  <br />
  <CMS:Label ID="lblDisplayNarrowByManufacturer" runat="server" CssClass="label" /><br />
  <CMS:CheckBox ID="chkDisplayNarrowByManufacturer" runat="server" />&nbsp;<CMS:HelpLink ID="helpDisplayNarrowByManufacturer" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
  <CMS:Label ID="lblDisplayNarrowByPrice" runat="server" CssClass="label" /><br />
  <CMS:CheckBox ID="chkDisplayNarrowByPrice" runat="server" />&nbsp;<CMS:HelpLink ID="helpDisplayNarrowByPrice" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
  <CMS:Label ID="lblDisplaySortBy" runat="server" CssClass="label" /><br />
  <CMS:CheckBox ID="chkDisplaySortBy" runat="server" />&nbsp;<CMS:HelpLink ID="helpDisplaySortBy" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
  <CMS:Label ID="lblDisplayNarrowCategory" runat="server" CssClass="label" /><br />
  <CMS:CheckBox ID="chkDisplayNarrowCategory" runat="server" />&nbsp;<CMS:HelpLink ID="helpDisplayNarrowByCategory" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
  <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" />
 
</CMS:Panel>
