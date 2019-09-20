<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewCustomizedProductsDisplay.ascx.cs"
    Inherits="Etech.CMS.Web.controls.content.products.ViewCustomizedProductsDisplay" %>
<%@ Register TagPrefix="CMS" TagName="Pager" Src="~/controls/paging.ascx" %>
<%@ Register Src="~/controls/content/products/ProductItem.ascx" TagName="ProductItem"
    TagPrefix="CMS" %>
<%--    <asp:Panel ID="pnl1" runat="server"></asp:Panel>--%>
<h2>
    OUR SERVICES</h2>
<div class="floatRight rightPanle">
    <div class="services">
        
            <asp:DataList ID="dlProducts" DataKeyField="ProductId" runat="server" RepeatColumns="2"
                RepeatDirection="Horizontal" OnItemDataBound="dlProducts_ItemDataBound">
                <ItemTemplate>
                   
                        <CMS:ProductItem ID="ProductItem1" runat="server" CurrentProduct='<%# LoadProduct((int)Eval("ProductId"))%>' />
                   
                </ItemTemplate>
            </asp:DataList>
        
    </div>
</div>
<asp:DataList ID="dlPaging" runat="server" CssClass="productPaging" RepeatDirection="Horizontal"
    OnItemCommand="dlPaging_ItemCommand" OnItemDataBound="dlPaging_ItemDataBound">
    <ItemStyle Height="10px" />
   <%-- <ItemTemplate>
        <asp:LinkButton ID="lnkbtnPaging" runat="server" CommandArgument='<%# Eval("PageIndex") %>'
            CommandName="Paging" Text='<%# Eval("PageText") %>'></asp:LinkButton>&nbsp;
    </ItemTemplate>--%>
</asp:DataList>
