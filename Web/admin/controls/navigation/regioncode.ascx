<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="regioncode.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.navigation.regioncode" %>
<asp:Menu ID="regionCodeMenu" runat="server" Orientation="Horizontal" DataSourceID="regionCodeDataSource" StaticDisplayLevels="2" StaticSubMenuIndent="0px" CssClass="navigationTable">
  <StaticItemTemplate>
  <div id="left"></div><div id="mid"><span id="text"><%# DataBinder.Eval(Container.DataItem, "Text") %></span></div><div id="right"></div>
 </StaticItemTemplate>
 <StaticMenuItemStyle CssClass="menuItem" />
 <StaticSelectedStyle CssClass="menuItemSelected" />
</asp:Menu>
<hr class="navigationRule" />
<asp:SiteMapDataSource ID="regionCodeDataSource" runat="server" SiteMapProvider="RegionCodeXmlSiteMapProvider" />