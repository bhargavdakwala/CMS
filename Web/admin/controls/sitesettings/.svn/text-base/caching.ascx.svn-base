<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="caching.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.sitesettings.caching" %>
<%@ Reference Control="~/admin/admin.master" %>

<CMS:Panel ID="pnlCaching" runat="server" >
  <br />
  <CMS:CheckBox ID="chkUseCache" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink ID="helpUseCache" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
  <CMS:Label ID="lblShortCache" runat="server" CssClass="label" /><br />
  <asp:TextBox ID="txtShortCache" runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink ID="helpShortCache" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
  <CMS:Label ID="lblNormalCache" runat="server" CssClass="label" /><br />
  <asp:TextBox ID="txtNormalCache" runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink ID="helpNormalCache" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
  <CMS:Label ID="lblLongCache" runat="server" CssClass="label" /><br />
  <asp:TextBox ID="txtLongCache" runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink ID="helpLongCache" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
  <asp:FilteredTextBoxExtender ID="ftbeShortCache" runat="server" TargetControlId="txtShortCache" FilterType="Numbers" />
  <asp:FilteredTextBoxExtender ID="ftbeNormalCache" runat="server" TargetControlId="txtNormalCache" FilterType="Numbers" />
  <asp:FilteredTextBoxExtender ID="ftbetLongCache" runat="server" TargetControlId="txtLongCache" FilterType="Numbers" />
  <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" />
  <CMS:Button ID="btnRefreshCache" runat="server" CssClass="button" OnClick="btnRefreshCache_Click" />
  <CMS:Button ID="btnClearCache" runat="server" CssClass="button" OnClick="btnClearCache_Click" />
  
</CMS:Panel>
