<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="paging.ascx.cs" Inherits="Etech.CMS.Web.controls.paging" EnableViewState="false" %>

<div class="paging">
  <div class="pagingLeft"></div>
  <div class="pagingMid">
    <span class="totals">
      <CMS:Label ID="lblShowingTotals" runat="server" CssClass="label" />
    </span>
    <span class="links">
      <CMS:HyperLink ID="hlPrevious" runat="server" SkinID="previous" />   
      <span id="pageLinks" class="pageLinks" runat="server" />
      <CMS:HyperLink ID="hlNext" runat="server" SkinID="next" />
    </span>
  </div>
  <div class="pagingRight"></div>
</div>
<br />