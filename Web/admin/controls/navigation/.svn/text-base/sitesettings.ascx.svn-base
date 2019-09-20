<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="sitesettings.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.navigation.sitesettings" %>
<asp:Menu ID="siteSettingsMenu" runat="server" Orientation="Horizontal" 
DataSourceID="siteSettingsMenuDataSource" StaticDisplayLevels="2" 
StaticSubMenuIndent="0px" CssClass="navigationTable">
  <StaticItemTemplate>
        <span class="floatLeft left"></span>
        <span class="floatLeft right"><%# DataBinder.Eval(Container.DataItem, "Text") %></span>
                  
 </StaticItemTemplate>
<%-- <StaticMenuItemStyle CssClass="menuItem" />--%>
 <StaticSelectedStyle CssClass="current" />
</asp:Menu>
<%--<hr class="navigationRule" />--%>
<asp:SiteMapDataSource ID="siteSettingsMenuDataSource" runat="server" SiteMapProvider="SiteSettingsXmlSiteMapProvider" />
