<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="sorting.ascx.cs" Inherits="Etech.CMS.Web.controls.catalog.sorting" EnableViewState="false" %>


<CMS:Panel ID="pnlSortBy" runat="server" CssClass="widget">
    <CMS:HyperLink ID="hlSortCheapest" runat="server" /><br />
    <CMS:HyperLink ID="hlSortExpensive" runat="server" /><br />
    <CMS:HyperLink ID="hlSortNewset" runat="server" /><br />
    <CMS:HyperLink ID="hlSortOldest" runat="server" /><br />
    <CMS:HyperLink ID="hlSortTitleAsc" runat="server" /><br />
    <CMS:HyperLink ID="hlSortTitleDesc" runat="server" />
</CMS:Panel>
