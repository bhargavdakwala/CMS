<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="sku.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.product.sku" %>

<CMS:Panel ID="pnlSkuListing" runat="server">
<br />
<CMS:Panel ID="pnlSkuList" runat="server">
    <CMS:Label ID="lblSkuDescription" runat="server" CssClass="label" /><br />
   
    <CMS:Label ID="lblTotalSkuCountText" runat="server" CssClass="label" />&nbsp;<CMS:Label
        ID="lblTotalSkuCount" runat="server" CssClass="label" /><br />
    <br />
    <asp:DataList ID="dlSkus" runat="server" RepeatColumns="3" RepeatDirection="Vertical"
        CssClass="adminTable">
        <ItemTemplate>
            <%# Container.DataItem.ToString() %>
        </ItemTemplate>
    </asp:DataList>
    <br />
    <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" />
</CMS:Panel>
<CMS:Panel ID="pnlSkuInventory" runat="server">

    <CMS:CheckBox ID="chkAllowNegativeInventories" runat="server" />&nbsp;<CMS:HelpLink
        ID="helpAllowNegativeInventories" runat="server" NavigateUrl="javascript:void(0);" /><br />
    <br />
    <div class="gridBox">
        <div class="gridWrap">
            <CMS:DataGrid ID="dgSkuInventory" runat="server" AutoGenerateColumns="false" DataKeyField="SkuId"
                SkinID="adminDataGridNoPage">
                <Columns>
                    <asp:BoundColumn DataField="SkuX" />
                    <asp:TemplateColumn>
                        <ItemTemplate>
                            <asp:TextBox ID="txtInventory" runat="server" CssClass="smalltextbox" Text='<%#Eval("Inventory") %>' />
                            <asp:FilteredTextBoxExtender ID="ftbeInventory" runat="server" TargetControlID="txtInventory"
                                FilterType="Numbers" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
            </CMS:DataGrid>
        </div>
    </div>
    <br />
    <CMS:Button ID="btnSaveInventory" runat="server" CssClass="button" OnClick="btnSaveInventory_Click" />
</CMS:Panel>
</CMS:Panel>
