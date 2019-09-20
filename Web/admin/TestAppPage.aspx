<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="TestAppPage.aspx.cs" Inherits="Etech.CMS.Web.admin.TestAppPage" %>
<%@ Register Src="~/admin/controls/Gallary/ImageGallary.ascx" TagName="Gallary" TagPrefix="Gallary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<Gallary:Gallary ID="images" runat="server" />
</asp:Content>
