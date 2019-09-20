<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="downloads.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.product.downloads" %>


<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>
    <CMS:Panel ID="pnlProductDownloads" runat="server">
        <table id="categoryTable">
          <tr>
            <td width="50%">
              <CMS:Panel ID="pnlCurrentDownloads" runat="server">
                <CMS:DataGrid ID="dgDownloads" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage">
                  <Columns>
                    <asp:BoundColumn DataField="Title" />
                    <asp:BoundColumn DataField="DownloadFile" />
                    <asp:TemplateColumn>
                      <ItemTemplate>
                        <asp:LinkButton ID="lbAdd" runat="server" CausesValidation="false" CommandName="Add" CommandArgument='<%# Eval("DownloadId") %>' OnCommand="lbAdd_Click" />
                      </ItemTemplate>
                    </asp:TemplateColumn>
                  </Columns>
                </CMS:DataGrid>
              </CMS:Panel>        
            </td>
            <td width="50%">
              <CMS:Panel ID="pnlAssociatedDownloads" runat="server">
                <CMS:DataGrid ID="dgProductDownloads" runat="server" AutoGenerateColumns="false" SkinID="adminDataGrid">
                  <Columns>
                    <asp:BoundColumn DataField="Title" />
	                  <asp:TemplateColumn>
                      <ItemTemplate>
                        <asp:LinkButton ID="lbDelete" runat="server" CausesValidation="false" CommandName="myDelete" CommandArgument='<%# Eval("DownloadId") %>' OnCommand="lbDelete_Click" />
                      </ItemTemplate>
                    </asp:TemplateColumn>
                  </Columns>
                </CMS:DataGrid>
              </CMS:Panel>
            </td>
          </tr>
        </table>
    </CMS:Panel>
  </ContentTemplate>  
</asp:UpdatePanel>