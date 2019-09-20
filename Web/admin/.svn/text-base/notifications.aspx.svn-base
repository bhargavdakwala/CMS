<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="notifications.aspx.cs" Inherits="Etech.CMS.Web.admin.notifications" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div id="mainContentRegion">
    <div id="admin_centercontent">
      <div class="sectionHeader"><CMS:Label ID="lblNotificationList" runat="server" /></div><br />
      <CMS:Panel ID="pnlGrid" runat="server">
        <CMS:DataGrid ID="dgNotifications" runat="server" AutoGenerateColumns="false" SkinID="adminDataGrid">
          <Columns>
            <asp:TemplateColumn>
              <ItemTemplate>
                <CMS:HyperLink ID="hlEditLink" runat="server" NavigateUrl='<%# FormatEditUrl(Eval("NotificationId").ToString()) %>' />
              </ItemTemplate>
            </asp:TemplateColumn>
            <asp:BoundColumn DataField="Name" />
            <asp:BoundColumn DataField="IsSystemNotification" />
          </Columns>
        </CMS:DataGrid>
      </CMS:Panel>
    </div>
  </div>
</asp:Content>
