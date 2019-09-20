<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="ImageGallaryEdit.aspx.cs" Inherits="Etech.CMS.Web.admin.ImageGallaryEdit" ValidateRequest="false" %>
<%@ MasterType VirtualPath="~/admin/admin.master" %>
<%@ Register Src="~/admin/controls/Gallary/ImageGallary.ascx" TagName="ImageGallary" TagPrefix="ImageGallary"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<ImageGallary:ImageGallary ID="image" runat="server" />
</asp:Content>
