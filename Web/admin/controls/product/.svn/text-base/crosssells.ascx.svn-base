<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="crosssells.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.product.crosssells" %>


<CMS:Panel ID="pnlCrossSells" runat="server">
  <CMS:DataGrid ID="dgCrossSells" runat="server" AutoGenerateColumns="false" SkinId="adminDataGrid" DataKeyField="ProductId" OnPageIndexChanged="dgCrossSells_PageIndexChanging">
    <HeaderStyle CssClass="adminTableHeader" />
    <Columns>
      <asp:TemplateColumn>
        <ItemTemplate>
          <CMS:CheckBox ID="chkCrossSell" runat="server" OnCheckedChanged="crossSell_Clicked" AutoPostBack="true" />
        </ItemTemplate>
      </asp:TemplateColumn>
      <asp:BoundColumn DataField="Name" />
    </Columns>
    <PagerStyle Mode="NumericPages" />
  </CMS:DataGrid>
</CMS:Panel>
