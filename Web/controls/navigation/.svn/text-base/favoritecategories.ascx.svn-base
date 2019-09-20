<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="favoritecategories.ascx.cs" Inherits="Etech.CMS.Web.controls.navigation.favoritecategories" EnableViewState="false" %>

<CMS:Panel ID="pnlFavoriteCategories" runat="server" CssClass="widget">
  <asp:Repeater ID="rptrFavoriteCategories" runat="server">
    <ItemTemplate>
      <div class="favoriteCategory">
        <CMS:HyperLink ID="hlFavoriteCategory" runat="server" NavigateUrl='<%# GetCatalogUrl(Eval("CategoryId").ToString(), Eval("Name").ToString()) %>' Text='<%# Eval("Name") %>' />
      </div>
    </ItemTemplate>
  </asp:Repeater>
</CMS:Panel>
