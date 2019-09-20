<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="narrowprice.ascx.cs" Inherits="Etech.CMS.Web.controls.catalog.narrowprice" EnableViewState="false" %>


<CMS:Panel ID="pnlNarrowByPrice" runat="server" CssClass="widget">
  <asp:Repeater ID="rptrNarrowByPrice" runat="server">
    <ItemTemplate>
      <CMS:HyperLink ID="hlNarrowByPrice" runat="server" NavigateUrl='<%# GetPriceRangeUrl(Eval("lowRange").ToString(), Eval("hiRange").ToString()) %>' Text='<%# GetFormattedPriceRange(Eval("lowRange").ToString(), Eval("hiRange").ToString()) %>' /><br />
    </ItemTemplate>
  </asp:Repeater>
</CMS:Panel>
