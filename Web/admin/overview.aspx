<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="overview.aspx.cs" Inherits="Etech.CMS.Web.admin.overview" Title="Untitled Page" %>
<%--<%@ Register TagPrefix="CMS" TagName="SiteSettingsOverview" Src="~/admin/controls/overview/site.ascx" %>--%>
<%@ Register TagPrefix="CMS" TagName="Security" Src="~/admin/controls/overview/security.ascx" %>
<%@ Register TagPrefix="CMS" TagName="ProductManagement" Src="~/admin/controls/overview/productmanagement.ascx" %>
<%@ Register TagPrefix="CMS" TagName="MailConfiguration" Src="~/admin/controls/overview/mail.ascx" %>
<%@ Register TagPrefix="CMS" TagName="Help" Src="~/admin/controls/overview/help.ascx" %>

<%--<%@ Register TagPrefix="CMS" TagName="Sales" Src="~/admin/controls/overview/sales.ascx" %>
<%@ Register TagPrefix="CMS" TagName="ProductCoupons" Src="~/admin/controls/overview/productcoupons.ascx" %>
<%@ Register TagPrefix="CMS" TagName="Configuration" Src="~/admin/controls/overview/configuration.ascx" %>
<%@ Register TagPrefix="CMS" TagName="Providers" Src="~/admin/controls/overview/providers.ascx" %>
<%@ Register TagPrefix="CMS" TagName="CustomerService" Src="~/admin/controls/overview/customerservice.ascx"  %>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <%--<CMS:SiteSettingsOverview ID="siteSettingsOverview" runat="server" Visible="false" />--%>
  <CMS:Security ID="security" runat="server" Visible="false" />
 <%-- <CMS:Sales ID="sales" runat="server" Visible="false" />--%>
  <CMS:ProductManagement ID="productmanagement" runat="server" Visible="false" />
 <%-- <CMS:ProductCoupons ID="productcoupons" runat="server" Visible="false" />
  <CMS:Configuration ID="configuration" runat="server" Visible="false" />--%>
  <CMS:MailConfiguration ID="mailConfiguration" runat="server" Visible="false" />
 <%-- <CMS:Providers ID="providers" runat="server" Visible="false" />
  <CMS:CustomerService ID="customerService" runat="server" Visible="false" />--%>
  <CMS:Help ID="help" runat="server" Visible="false" />
  <CMS:Label ID="lblNotDone" runat="server" Visible="false" Text="not done yet!" />
</asp:Content>
