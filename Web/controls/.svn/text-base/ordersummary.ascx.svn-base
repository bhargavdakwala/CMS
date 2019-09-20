<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ordersummary.ascx.cs" Inherits="Etech.CMS.Web.controls.ordersummary" %>


<div class="controlHeader"><CMS:Label ID="lblOrderSummary" runat="server" /></div>
<br />
<table class="orderSummaryTable">
  <tr><th class="itemSku"><CMS:Label ID="lblItemSku" runat="server" /></th><th class="itemName"><CMS:Label ID="lblItem" runat="server" /></th><th class="itemQuantity"><CMS:Label ID="lblQuantity" runat="server" /></th><th class="itemAmount"><CMS:Label ID="lblPrice" runat="server" /></th><th class="extendedAmount"><CMS:Label ID="lblExtendedAmount" runat="server" /></th></tr>
    <asp:Repeater ID="rptrCart" runat="server">
      <ItemTemplate>
        <tr class="itemRow">
            <td class="itemSku"><CMS:Label ID="lblSku" runat="server" Text='<%# Eval("Sku") %>' /></td>
            <td class="itemName"><CMS:Label ID="lblOrderItemId" runat="server" Visible="false" Text='<%# Eval("OrderItemId") %>' />
                                 <CMS:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>' /><br />
                                 <CMS:Label ID="lblAttributes" runat="server" Text='<%# Eval("Attributes") %>' /><br /><br /></td>
            <td class="itemQuantity">
              <asp:TextBox ID="txtQuantity" runat="server" CssClass="quantitytextbox" />
              <asp:FilteredTextBoxExtender ID="ftbeQuantity" runat="server" TargetControlId="txtQuantity" FilterType="Numbers" />
              <asp:DropDownList ID="ddlQuantity" runat="server" />
            </td>
            <td class="itemAmount"><%# GetFormattedAmount(Eval("PricePaid").ToString()) %></td>
            <td class="extendedAmount"><%# GetFormattedAmount(Eval("ExtendedPrice").ToString()) %></td>
            <% if(IsEditable) { //TODO: Get this logic out of here%>
            <td class="editArea"><asp:ImageButton ID="lbDelete" runat="server" CommandArgument='<%# Eval("OrderItemId") %>' AlternateText='<%# GetDeleteText() %>' OnCommand="lbDelete_Click" SkinId="delete"/></td>
            <%} %>
        </tr>
      </ItemTemplate>
    </asp:Repeater>
  <tr>
    <td colspan="4" class="subTotal"><CMS:Label ID="lblSubTotal" runat="server" /></td>
    <td class="subTotalAmount"><CMS:Label ID="lblSubTotalAmount" runat="server" /></td>
  </tr>
  <tr id="trCoupon" runat="server">
    <td colspan="4" class="subTotal"><CMS:Label ID="lblCoupon" runat="server" /></td>
    <td class="subTotalAmount"><CMS:Label ID="lblCouponAmount" runat="server" /></td>
  </tr>
  <tr id="trTax" runat="server">
    <td colspan="4" class="subTotal"><CMS:Label ID="lblTax" runat="server" /></td>
    <td class="subTotalAmount"><CMS:Label ID="lblTaxAmount" runat="server" /></td>
  </tr>
  <tr>
    <td colspan="4" class="subTotal">
      <CMS:Label ID="lblShipping" runat="server" />

      <asp:DropDownList ID="ddlShipping" runat="server" Visible="false" OnSelectedIndexChanged="ddlShipping_SelectedIndexChanged" AutoPostBack="true" />   
    </td>
    <td class="subTotalAmount"><CMS:Label ID="lblShippingAmount" runat="server" /></td>
  </tr>
  <tr><td colspan="4" class="total"><CMS:Label ID="lblTotal" runat="server" /></td><td class="totalAmount"><CMS:Label ID="lblTotalAmount" runat="server" /></td></tr>
</table>
