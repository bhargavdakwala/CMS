<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="membership.ascx.cs" Inherits="Etech.CMS.Web.install.controls.membership" %>


<CMS:Panel ID="pnlMembershipSetup" runat="server">
 <CMS:Label ID="lblMembershipInstructions" runat="server" CssClass="label" />
  <table border="0">
    <tr>
      <td>
        <CMS:Label ID="lblUsername" runat="server" Text="Username:" /><br />
        <asp:TextBox ID="txtUsername" runat="server" CssClass="textbox" Width="150px" TabIndex="1" /><br />
        <br />
      </td>
      <td>
        <CMS:Label ID="lblEmail" runat="server" Text="Email:" /><br />
        <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" Width="150px"  TabIndex="4"/><br />
        <br />
      </td>
    </tr>
    <tr>
      <td>
        <CMS:Label ID="lblPassword" runat="server" Text="Password:" /><br />
        <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" Width="150px" TabIndex="2" /><br />
        <br />
      </td>
      <td>
        <CMS:Label ID="lblConfirmEmail" runat="server" Text="Confirm Email:"></CMS:Label><br />
        <asp:TextBox ID="txtConfirmEmail" runat="server" CssClass="textbox" Width="150px" TabIndex="5"/><br />
        <br />
      </td>
    </tr>
    <tr>
      <td>
        <CMS:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:" /><br />
        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="textbox" Width="150px" TabIndex="3" /><br />
        <br />
      </td>
      <td>
        <CMS:Label ID="lblSecurityQuestion" runat="server" Text="Security Question:"></CMS:Label><br />
        <asp:TextBox ID="txtSecurityQuestion" runat="server" CssClass="textbox" Width="150px"  TabIndex="6"/><br />
        <br />
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td>
        <CMS:Label ID="lblSecurityAnswer" runat="server" Text="Security Answer:"></CMS:Label><br />
        <asp:TextBox ID="txtSecurityAnswer" runat="server" CssClass="textbox" Width="150px"  TabIndex="7"/><br />
        <br />
      </td>
    </tr>
  </table>
  <CMS:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
  ErrorMessage="Please supply a Username." Display="None" />
  <CMS:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
  ErrorMessage="Please supply a Password." Display="None" />
  <CMS:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword"
  ErrorMessage="Please supply a Confirm Password." Display="None" />
  <CMS:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
  ErrorMessage="Please supply an Email." Display="None" />
  <CMS:RequiredFieldValidator ID="rfvConfirmEmail" runat="server" ControlToValidate="txtConfirmEmail"
  ErrorMessage="Please supply a Confirm Email." Display="None" />
  <CMS:RequiredFieldValidator ID="rfvSecurityQuestion" runat="server" ControlToValidate="txtSecurityQuestion"
  ErrorMessage="Please supply a Security Question." Display="None" />
  <CMS:RequiredFieldValidator ID="rfvSecurityAnswer" runat="server" ControlToValidate="txtSecurityAnswer"
  ErrorMessage="Please supply a Security Answer." Display="None" />
  <asp:CompareValidator ID="cmpPassword" runat="server" ControlToValidate="txtPassword"
  ControlToCompare="txtConfirmPassword" ErrorMessage="Passwords do not match." Display="None" />
  <asp:CompareValidator ID="cmpEmail" runat="server" ControlToValidate="txtEmail"
  ControlToCompare="txtConfirmEmail" ErrorMessage="Emails do not match." Display="None" />            
 <div class="rightAlign">
   <CMS:Button ID="btnPrevious" runat="server" CssClass="button" OnClick="btnPrevious_Click" CausesValidation="false"/>&nbsp;&nbsp;&nbsp;&nbsp;<CMS:Button ID="btnNext" runat="server" CssClass="button" OnClick="btnNext_Click"/>
 </div>
</CMS:Panel>
