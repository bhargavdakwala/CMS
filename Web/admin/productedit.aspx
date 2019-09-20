<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="productedit.aspx.cs" Inherits="Etech.CMS.Web.admin.productedit" Title="Untitled Page" ValidateRequest="false" %>

<%@ MasterType VirtualPath="~/admin/admin.master" %>
<%@ Register TagPrefix="CMS" TagName="ProductNavigation" Src="~/admin/controls/navigation/product.ascx" %>
<%@ Register TagPrefix="CMS" TagName="GeneralProductInformation" Src="~/admin/controls/product/general.ascx" %>
<%@ Register TagPrefix="CMS" TagName="ProductDescriptors" Src="~/admin/controls/product/descriptors.ascx" %>
<%@ Register TagPrefix="CMS" TagName="ProductCategories" Src="~/admin/controls/product/categories.ascx" %>
<%--<%@ Register TagPrefix="CMS" TagName="ProductAttributes" Src="~/admin/controls/product/attributes.ascx" %>
<%@ Register TagPrefix="CMS" TagName="ProductDownloads" Src="~/admin/controls/product/downloads.ascx" %>--%>
<%@ Register TagPrefix="CMS" TagName="ProductImages" Src="~/admin/controls/product/images.ascx" %>
<%@ Register TagPrefix="CMS" TagName="Skus" Src="~/admin/controls/product/sku.ascx" %>
<%--<%@ Register TagPrefix="CMS" TagName="CrossSells" Src="~/admin/controls/product/crosssells.ascx" %>
<%@ Register TagPrefix="CMS" TagName="Reviews" Src="~/admin/controls/product/reviews.ascx" %>
<%@ Register TagPrefix="CMS" TagName="Notes" Src="~/admin/controls/product/notes.ascx" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <%--<CMS:Label ID="lblProductEdit" runat="server" />&nbsp;<br /><br />--%>
  
 <div class="tabPanel">
            	<div class="tabs">
            	    <CMS:ProductNavigation ID="productNavigation" runat="server" Visible="false"/>
            	</div>
                <div class="tabData">
                    
  
      <%--<CMS:HelpLink ID="helpProductEnabled" runat="server" NavigateUrl="javascript:void(0);" /></div>--%>
      
      <CMS:GeneralProductInformation ID="generalInformation" runat="server" Visible="false" />
      <CMS:ProductDescriptors ID="descriptors" runat="server" Visible="false" />
      <CMS:ProductCategories ID="categories" runat="server" Visible="false" />
    <%--  <CMS:ProductAttributes ID="attributes" runat="server" Visible="false" />
      <CMS:ProductDownloads ID="downloads" runat="server" Visible="false" />--%>
      <CMS:ProductImages ID="images" runat="server" Visible="false" />
     <CMS:Skus ID="skus" runat="server" Visible="false" />
      <%-- <CMS:CrossSells ID="crossSells" runat="server" Visible="false" />
      <CMS:Reviews ID="reviews" runat="server" Visible="false" />
      <CMS:Notes ID="notes" runat="server" Visible="false" />--%>
      </div>
    
                
    </div>
   
</asp:Content>
