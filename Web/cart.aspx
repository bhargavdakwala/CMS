<%@ Page Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Etech.CMS.Web.cart" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/site.master" %>

<%@ Register TagPrefix="CMS" TagName="Navigation" Src="~/controls/navigation/storenavigation.ascx" %>
<%@ Register TagPrefix="CMS" TagName="CatalogList" Src="~/controls/catalogList.ascx" %>
<%@ Register TagPrefix="CMS" TagName="OrderSummary" Src="~/controls/ordersummary.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div id="twoColumnLeftContent">
    <CMS:Navigation ID="navigation" runat="server" />
  </div>
  <div id="twoColumnMainContent">
  <CMS:MessageCenter ID="messageCenter" runat="server" Visible="false" />
  <CMS:Panel ID="pnlCart" runat="server">
    <table class="cartSubTotal">
      <tr>
        <td class="itemName"><CMS:HyperLink ID="hlCheckout1" runat="server" SkinId="proceedToCheckout" /></td>
        <td class="subTotal"><CMS:Label ID="lblSubTotalTop" runat="server" /></td>
        <td class="subTotalAmount"><CMS:Label ID="lblSubTotalAmountTop" runat="server" /></td>
      </tr>
    </table>
    <br />
    <CMS:LinkButton ID="lbUpdate" runat="server" OnClick="lbUpdate_Click" />
    <br />
    <br />
    <CMS:OrderSummary ID="orderSummary" runat="server" IsEditable="true" />
    <hr />
    <div>
      <CMS:HyperLink ID="hlCheckout2" runat="server" SkinId="proceedToCheckout" />
    </div>
    <br />
    <br />
    <CMS:Panel ID="pnlExpressCheckout" runat="server" Visible="false">
      <asp:ImageButton ID="imgPayPal" runat="server" ImageUrl="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" OnClick="imgPayPal_Click" CausesValidation="False" />
    </CMS:Panel>
  </CMS:Panel>
  <CMS:Panel ID="pnlNoCart" runat="server">
    <CMS:Label ID="lblNoCart" runat="server" CssClass="label" /><br /><br />
    <hr />
    <CMS:CatalogList ID="catalogList" runat="server" />
  </CMS:Panel>
  </div>
</asp:Content>
