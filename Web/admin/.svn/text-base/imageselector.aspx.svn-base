<%@ Page Language="C#" MasterPageFile="~/admin/modal.master" AutoEventWireup="true" CodeBehind="imageselector.aspx.cs" Inherits="Etech.CMS.Web.admin.imageselector" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/admin/modal.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <CMS:Panel ID="pnlImages" runat="server">
    <div style="overflow:auto;width:100%;height:105px;">
    <asp:DataList ID="dlImages" runat="server" RepeatColumns="6" RepeatLayout="Table">
      <ItemTemplate>
        <span class="imageContainer" style="display:inline-block;"><div style="display:table-cell;"><asp:Image ID="img" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Height='<%# Eval("Height") %>' Width='<%# Eval("Width") %>' ondblclick='<%# Eval("Attributes[\"ondblclick\"]") %>'/></div></span>
      </ItemTemplate>
    </asp:DataList>
    </div>
  </CMS:Panel><br />
  <CMS:Panel ID="pnlImageManagement" runat="server">
    <asp:FileUpload ID="fuFile" runat="server" CssClass="button" />&nbsp;<CMS:Button ID="btnUpload" runat="server" CssClass="button" OnClick="btnUpload_Click" />
  </CMS:Panel>
</asp:Content>
