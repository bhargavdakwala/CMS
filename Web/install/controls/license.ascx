<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="license.ascx.cs" Inherits="Etech.CMS.Web.install.controls.license" %>

<CMS:Panel ID="pnlLicenseAgreement" runat="server">
 <CMS:Label ID="lblLicenseAgreementInstructions" runat="server" /><br /><br />
  <asp:TextBox ID="txtLicenseAgreement" runat="server" TextMode="MultiLine" Width="98%" Height="250px" ReadOnly="true" />
  <br />
  <br />
  <CMS:CheckBox ID="chkAgreeToLicense" runat="server" OnCheckedChanged="chkAgreeToLicense_Changed" AutoPostBack="true" Font-Bold="true" />
  <br />
  <br />
  <div class="rightAlign">
   <CMS:Button ID="btnPrevious" runat="server" OnClick="btnPrevious_Click" CausesValidation="false"/>&nbsp;&nbsp;&nbsp;&nbsp;
   <CMS:Button ID="btnNext" runat="server" OnClick="btnNext_Click" Enabled="false" />
  </div>
</CMS:Panel>
