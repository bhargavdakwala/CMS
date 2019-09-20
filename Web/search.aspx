<%@ Page Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="Etech.CMS.Web.search" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/site.master" %>
<%@ Register TagPrefix="CMS" TagName="Navigation" Src="~/controls/navigation/storenavigation.ascx" %>
<%@ Register TagPrefix="CMS" TagName="CatalogList" Src="~/controls/catalogList.ascx" %>
<%@ Register TagPrefix="CMS" TagName="Pager" Src="~/controls/paging.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div id="threeColumnLeftContent">
    <CMS:Navigation ID="leftNavigation" runat="server" />
  </div>
  <div id="threeColumnRightContent">
  </div>
  <div id="threeColumnMainContent">
    <CMS:Pager ID="topPager" runat="server" />
    <CMS:CatalogList ID="catalogList" runat="server" />
    <CMS:Pager ID="bottomPager" runat="server" />
  </div>
</asp:Content>