<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="catalogList.ascx.cs" Inherits="Etech.CMS.Web.controls.catalogList" EnableViewState="false" %>


<asp:DataList ID="dlCatalog" runat="server" SkinId="catalogList">
  <ItemTemplate>
    <div class="productBox">
      <div class="productImageContainer">
        <CMS:HyperLink ID="hlImageLink" runat="server" NavigateUrl='<%# GetNavigateUrl(Eval("ProductId").ToString(), Eval("Name").ToString()) %>' SkinID="noDefaultImage" />
      </div>
      <CMS:HyperLink ID="hlProduct" runat="server" NavigateUrl='<%# GetNavigateUrl(Eval("ProductId").ToString(), Eval("Name").ToString()) %>' Text='<%#Eval("Name") %>' CssClass="catalogProductName" /><br />
      <CMS:Label ID="lblRetailPrice" runat="server" CssClass="retailPrice" /><CMS:Label ID="lblOurPrice" runat="server" CssClass="ourPrice" />&nbsp;&nbsp;<CMS:Label ID="lblTaxApplied" Visible="false" runat="server" /><br />
      <asp:Rating ID="ajaxRating" runat="server" SkinID="rating" ReadOnly="true" />
    </div>
  </ItemTemplate>
</asp:DataList>
