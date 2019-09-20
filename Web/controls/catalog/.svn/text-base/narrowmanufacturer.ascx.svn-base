<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="narrowmanufacturer.ascx.cs" Inherits="Etech.CMS.Web.controls.catalog.narrowmanufacturer" EnableViewState="false" %>


<CMS:Panel ID="pnlNarrowByManufacturer" runat="server" CssClass="widget">
  <asp:Repeater ID="rptrNarrowByManufacturer" runat="server">
    <ItemTemplate>
      <CMS:HyperLink ID="hlNarrowByManufacturer" runat="server" NavigateUrl='<%# GetManufacturerUrl(Eval("ManufacturerId").ToString()) %>' Text='<%# Eval("Name") %>' /><br />
    </ItemTemplate>
  </asp:Repeater>
</CMS:Panel>
