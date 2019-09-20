<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="favoriteproducts.ascx.cs" Inherits="Etech.CMS.Web.controls.navigation.favoriteproducts" EnableViewState="false" %>

<CMS:Panel ID="pnlFavoriteProducts" runat="server" CssClass="widget">
  <asp:Repeater ID="rptrFavoriteProducts" runat="server">
    <ItemTemplate>
      <div class="favoriteProduct">
        <CMS:HyperLink ID="hlFavoriteProduct" runat="server" NavigateUrl='<%# GetProductUrl(Eval("ProductId").ToString(), Eval("Name").ToString()) %>' Text='<%# Eval("Name") %>' />
      </div>
    </ItemTemplate>
  </asp:Repeater>
</CMS:Panel>
