<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="Etech.CMS.Web.admin.about" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="mainContentRegion">
  <div id="admin_centercontent">
    <div class="sectionHeader"><CMS:Label ID="lblAbout" runat="server" /></div>
    <CMS:HyperLink ID="hlLogo" runat="server" SkinID="logo" /><br />
    <CMS:Label ID="lblVersion" runat="server" /><br /><br />
    <CMS:Label ID="lblStoreNotice" runat="server" /><br />
    <CMS:Label ID="lblCopyright" runat="server" /><br /><br />
    <CMS:Label ID="lblTrademark" runat="server" /><br /><br />
    <CMS:Label ID="lblLicenseAgreement" runat="server" /><br /><br />
    <asp:TextBox ID="txtLicenseAgreement" runat="server" TextMode="MultiLine" Width="98%" Height="250px" ReadOnly="true" /><br /><br />
    <CMS:Label ID="lblAssembliesTitle" runat="server" /><br /><br />
    <CMS:DataGrid ID="dgAssemblies" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage">
      <Columns>
        <asp:BoundColumn DataField="FullName" />
      </Columns>
    </CMS:DataGrid>
  </div>
</div>
</asp:Content>
