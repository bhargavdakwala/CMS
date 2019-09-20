<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeBehind="default.aspx.cs" Inherits="Etech.CMS.Web.admin._default" Title="Untitled Page"  %>

<%@ MasterType VirtualPath="~/admin/admin.master" %>
<%@ Register TagPrefix="CMS" TagName="News" Src="~/admin/controls/rsslist.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="mainContentRegion">
        <%--<div id="admin_centercontent">
    <br />
        <table width="100%" width="550px" border="0">
          <tr>
            <td valign="top" width="75%">
              <CMS:Panel ID="pnlPendingOrders" runat="server">
                <br />
                <CMS:DataGrid ID="dgOrders" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPageSmall">
                  <Columns>
                    <asp:TemplateColumn>
                      <ItemTemplate>
                        <CMS:HyperLink ID="hlEditLink" runat="server" NavigateUrl='<%# FormatEditUrl(Eval("OrderId").ToString()) %>' />
                      </ItemTemplate>            
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="OrderNumber" />
                    <asp:TemplateColumn>
                      <ItemTemplate>
                        <%# (Eval("OrderStatusDescriptor.Name")) %>
                      </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-HorizontalAlign="Right">
                      <ItemTemplate>
                        <%# GetFormattedAmount(Eval("Total").ToString()) %>
                      </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="ModifiedOn" ItemStyle-HorizontalAlign="Right" />
                  </Columns>
                </CMS:DataGrid>
              </CMS:Panel>
            </td>
          <!--<td valign="top">
              <CMS:Panel ID="pnlNews" runat="server">
                <CMS:News ID="news" runat="server" />
              </CMS:Panel>    
            </td>-->
          </tr>
          <tr>
            <td valign="top" width="75%">
              <CMS:Panel ID="pnlToDo" runat="server">
                <br />
                <asp:UpdateProgress ID="upDisplay" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="up" DisplayAfter="100" />
                <asp:UpdatePanel ID="up" runat="server" RenderMode="Inline"><ContentTemplate>
                  <div class="verticalalign">
                    <asp:TextBox ID="txtToDo" runat="server" CssClass="longtextbox" />&nbsp;&nbsp;<CMS:Button ID="btnAdd" runat="server" CssClass="button" OnClick="btnAdd_Click" />
                  </div>
                  <br />
                  <CMS:DataGrid ID="dgToDo" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage">
                    <Columns>
                      <asp:BoundColumn DataField="ToDoX" />
                      <asp:TemplateColumn>
                        <ItemTemplate>
                          <CMS:LinkButton ID="lbDelete" runat="server" CommandArgument='<%# Eval("ToDoId") %>' OnCommand="lbDelete_Click" />
                        </ItemTemplate>
                      </asp:TemplateColumn>
                    </Columns>
                  </CMS:DataGrid>
                </ContentTemplate></asp:UpdatePanel>
              </CMS:Panel>    
            </td>
          </tr>
          <tr height="33%">
            <td valign="top">
              <CMS:Panel ID="pnlQuickStats" runat="server">
                <br />
                <CMS:Panel ID="pnlSearchTerms" runat="server" Visible="false">
                  <CMS:Label ID="lblSearchTerms" runat="server" CssClass="label" />
                  <CMS:DataGrid ID="dgSearchTerms" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage">
                    <Columns>
                      <asp:BoundColumn  DataField="SearchTerms"/>
                      <asp:BoundColumn DataField="ViewCount"/>
                    </Columns>
                  </CMS:DataGrid>
                </CMS:Panel>
              </CMS:Panel>    
            </td>
          </tr>
        </table>
    </div>--%>
    </div>
</asp:Content>
