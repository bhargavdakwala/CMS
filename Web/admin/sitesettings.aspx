<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="sitesettings.aspx.cs" Inherits="Etech.CMS.Web.admin.sitesettings" Title="Untitled Page" ValidateRequest="false" %>
<%@ MasterType VirtualPath="~/admin/admin.master" %>

<%@ Register TagPrefix="CMS" TagName="SiteSettingsNavigation" Src="~/admin/controls/navigation/sitesettings.ascx" %>
<%@ Register TagPrefix="CMS" TagName="GlobalizationSettings" Src="~/admin/controls/sitesettings/globalization.ascx" %>
<%@ Register TagPrefix="CMS" TagName="Site" Src="~/admin/controls/sitesettings/site.ascx" %>
<%@ Register TagPrefix="CMS" TagName="Widgets" Src="~/admin/controls/sitesettings/widgets.ascx" %>
<%@ Register TagPrefix="CMS" TagName="BrowsingLog" Src="~/admin/controls/sitesettings/browsinglog.ascx" %>
<%@ Register TagPrefix="CMS" TagName="CacheSettings" Src="~/admin/controls/sitesettings/caching.ascx" %>
<%@ Register TagPrefix="CMS" TagName="Analytics" Src="~/admin/controls/sitesettings/analytics.ascx" %>
<%@ Register TagPrefix="CMS" TagName="Images" Src="~/admin/controls/sitesettings/images.ascx" %>
<%@ Register TagPrefix="CMS" TagName="SeoSettings" Src="~/admin/controls/sitesettings/seosettings.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <%--<div id="mainContentRegion">
    <div id="admin_centercontent">--%>
      
      <%--<div class="sectionHeader"><CMS:Label ID="lblSiteSettings" runat="server" /></div><br />--%>
      
            <div class="tabPanel">
            	<div class="tabs">
                    <CMS:SiteSettingsNavigation ID="dcSiteSettingsNavigation" runat="server" />
                </div> 
                <div class="tabData">
      <CMS:Site ID="dcSite" runat="server" Visible="false" />
      <CMS:Site id="site" runat="server" Visible="false" />
   <%--   <CMS:GlobalizationSettings ID="dcGlobalizationSettings" runat="server" Visible="false" />
      <CMS:Widgets ID="dcWidgets" runat="server" Visible="false" />
      <CMS:BrowsingLog ID="dcBrowsingLog" runat="server" Visible="false" />--%>
      <CMS:CacheSettings ID="dcCachingSettings" runat="server" Visible="false" />
      <%--<CMS:Analytics ID="dcAnalytics" runat="server" Visible="false" />--%>
      <CMS:Images ID="dcImagesSettings" runat="server" Visible="false" />
      <CMS:SeoSettings ID="dcSeoSettings" runat="server" Visible="false" />
    </div> 
    </div> 
      
   <%-- </div>
  </div>--%>
</asp:Content>
