<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="versioncheck.ascx.cs" Inherits="Etech.CMS.Web.install.controls.versioncheck" %>

<CMS:Panel ID="pnlVersionCheckSetup" runat="server">
  <CMS:Label ID="lblVersionCheckInstructions" runat="server" />
  <br />
  <br />
  <div class="verticalalign">
  <CMS:Label ID="lblVersionCheck" runat="server" />&nbsp;&nbsp;<asp:TextBox ID="txtVersionNumber" runat="server" ReadOnly="true" />
  <CMS:Button ID="btnTestVersion" runat="server" OnClick="btnTestVersion_Click" /><br /><br />
  <CMS:CheckBox ID="chkReInstall" runat="server" OnCheckedChanged="chkReInstall_Click" AutoPostBack="true" Visible="false" />
  </div>
  <br /><br />
  <div class="rightAlign">
   <CMS:Button ID="btnPrevious" runat="server" OnClick="btnPrevious_Click" CausesValidation="false"/>&nbsp;&nbsp;&nbsp;&nbsp;
   <CMS:Button ID="btnNext" runat="server" OnClick="btnNext_Click" Enabled="false" />
  </div>
</CMS:Panel>
