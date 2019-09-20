<%@ Page Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="receipt.aspx.cs" Inherits="Etech.CMS.Web.receipt" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/site.master" %>
<%@ Register TagPrefix="CMS" TagName="Navigation" Src="~/controls/navigation/storenavigation.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div id="threeColumnLeftContent">
    <CMS:Navigation ID="leftNavigation" runat="server" />
  </div>
  <div id="threeColumnRightContent">
  </div>
  <div id="threeColumnMainContent">
    <CMS:Label ID="lblReceipt" runat="server" CssClass="label" />
  </div>
</asp:Content>
