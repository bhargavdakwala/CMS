<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="attributeedit.aspx.cs" Inherits="Etech.CMS.Web.admin.attributeedit" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/admin/admin.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div id="mainContentRegion">
    <div id="admin_centercontent">
      <div class="sectionHeader"><CMS:Label ID="lblAttributeAdministration" runat="server" /></div><br />
        <table id="categoryTable">
          <tr>
            <td>
              <CMS:Panel ID="pnlCurrentAttributes" runat="server" Visible="false">
                <CMS:DataGrid ID="dgAttributes" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage">
                  <Columns>
                    <asp:TemplateColumn>
                      <ItemTemplate>
                        <CMS:LinkButton ID="lbEdit" runat="server" CommandArgument='<%# Eval("AttributeId") %>' OnCommand="lbEdit_Click" />
                      </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="Name" />
                    <asp:BoundColumn DataField="AttributeType" />
                  </Columns>
                </CMS:DataGrid>
              </CMS:Panel>        
            </td>
            <td>
              <CMS:Panel ID="pnlEditAttribute" runat="server">
                <CMS:Label ID="lblAttributeId" runat="server" Visible="false" />
                <CMS:Label ID="lblName" runat="server" CssClass="label" /><br />
                <asp:TextBox ID="txtName" runat="server" CssClass="textbox"/><br /><br />
                <CMS:Label ID="lblAttributeType" runat="server" CssClass="label" /><br />
                <asp:DropDownList ID="ddlAttributeType" runat="server" CssClass="dropdownlist" /><br /><br />
                <CMS:Label ID="lblLabel" runat="server" CssClass="label"></CMS:Label><br />
                <asp:TextBox ID="txtLabel" runat="server" CssClass="longtextbox" /><br /><br />
                <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;<CMS:Button ID="btnReset" runat="server" OnClick="btnReset_Click" CssClass="button" /><br /><br />               
                <CMS:Panel ID="pnlAttributeItems" runat="server" Visible="false">
                  <CMS:Label ID="lblAttributeItemId" runat="server" Visible="false" />
                  <CMS:Label ID="lblAttributeItemName" runat="server" CssClass="label"/><br />
                  <asp:TextBox ID="txtAttributeItemName" runat="server" CssClass="textbox"/><br /><br />
                  <CMS:Label ID="lblAdjustment" runat="server" CssClass="label"/><br />
                  <CMS:Label ID="lblAdjustmentCurrencySymbol" runat="server" CssClass="label"/>&nbsp;<asp:TextBox ID="txtAdjustment" runat="server" CssClass="textbox"/><br /><br />
                  <CMS:Label ID="lblSkuSuffix" runat="server" CssClass="label" /><br />
                  <asp:TextBox ID="txtSkuSuffix" runat="server" CssClass="textbox"/><br /><br />
                  <CMS:Button ID="btnAdd" runat="server" CssClass="button" OnClick="btnAdd_Click"/><br /><br />
                  <CMS:DataGrid ID="dgAttributeItems" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage">
                    <Columns>
                      <asp:TemplateColumn>
                        <ItemTemplate>
                          <CMS:LinkButton ID="lbAttrbuteItemEdit" runat="server" CommandArgument='<%# Eval("AttributeItemId") %>' OnCommand="lbAttributeItemEdit" />
                        </ItemTemplate>
                      </asp:TemplateColumn>
	                    <asp:TemplateColumn>
                        <ItemTemplate>
                          <asp:ImageButton ID="lbUp" runat="server" CausesValidation="false" CommandName="Up" CommandArgument='<%# Eval("AttributeItemId") %>' OnClick="Items_ItemReorder" SkinID="up" /> 
                          <asp:ImageButton ID="lbDown" runat="server" CausesValidation="false" CommandName="Down" CommandArgument='<%# Eval("AttributeItemId") %>' OnClick="Items_ItemReorder" SkinID="down" />
                        </ItemTemplate>
                      </asp:TemplateColumn>
                      <asp:BoundColumn DataField="Name" />
                      <asp:BoundColumn DataField="Adjustment" />
                      <asp:BoundColumn DataField="SkuSuffix" />
                      <asp:TemplateColumn>
                        <ItemTemplate>
                          <CMS:LinkButton ID="lbAttrbuteItemDelete" runat="server" CommandArgument='<%# Eval("AttributeItemId") %>' OnCommand="lbAttributeItemDelete" />
                        </ItemTemplate>
                      </asp:TemplateColumn>
                    </Columns>
                  </CMS:DataGrid>
                </CMS:Panel>
              </CMS:Panel>
            </td>
          </tr>
        </table>
    </div>
  </div>
</asp:Content>
