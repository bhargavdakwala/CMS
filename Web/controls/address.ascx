<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="address.ascx.cs" Inherits="Etech.CMS.Web.controls.address" %>
<table>
  <tr>
    <td colspan="2">
      <asp:DropDownList ID="ddlAddress" runat="server" CssClass="dropdownlist" /><CMS:RequiredFieldValidator ID="rfvAddress" runat="server" Display="Dynamic" ControlToValidate="ddlAddress" ErrorMessage="*" />&nbsp;&nbsp;<CMS:LinkButton ID="lbAddNew" runat="server" CssClass="button" OnClick="lbAddNew_Click" />
    </td>
  </tr>
</table>
<CMS:Panel ID="pnlNewAddress" runat="server" Visible="false">
  <CMS:Panel ID="pnlAddNew" runat="server">
    <CMS:LinkButton ID="btnCancelAddNew" runat="server" OnClick="btnCancelAddNew_Click" CssClass="button" />
    <br />
    <br />
  </CMS:Panel>
  <table>
    <tr>
      <td>
        <CMS:Label ID="lblAddressId" runat="server" Visible="false" />
        <CMS:Label ID="lblFirstName" runat="server" CssClass="label" /><br />
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvFirstName" runat="server" Display="Dynamic" ControlToValidate="txtFirstName" ErrorMessage="*" />
      </td>
      <td>
        <CMS:Label ID="lblLastName" runat="server" CssClass="label" /><br />
        <asp:TextBox ID="txtLastName" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvLastName" runat="server" Display="Dynamic" ControlToValidate="txtLastName" ErrorMessage="*" />    
      </td>
    </tr>
    <tr>
      <td>
        <CMS:Label ID="lblPhone" runat="server" CssClass="label" /><br />
        <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvPhone" runat="server" Display="Dynamic" ControlToValidate="txtPhone" ErrorMessage="*" />
      </td>
      <td>
        <CMS:Label ID="lblEmail" runat="server" CssClass="label" /><br />
        <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvEmail" runat="server" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="*" />    
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <CMS:Label ID="lblAddress" runat="server" CssClass="label" /><br />
        <asp:TextBox ID="txtAddress1" runat="server" CssClass="longtextbox" /><CMS:RequiredFieldValidator ID="rfvAddress1" runat="server" Display="Dynamic" ControlToValidate="txtAddress1" ErrorMessage="*" />    
      </td>
    </tr>
    <tr>
      <td>
        <asp:TextBox ID="txtAddress2" runat="server" CssClass="longtextbox" />    
      </td>
    </tr>
    <tr>
      <td>
        <CMS:Label ID="lblCity" runat="server" CssClass="label" /><br />
        <asp:TextBox ID="txtCity" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvCity" runat="server" Display="Dynamic" ControlToValidate="txtCity" ErrorMessage="*" />
      </td>
      <td>
        <CMS:Label ID="lblStateOrRegion" runat="server" CssClass="label" /><br />
        <asp:TextBox ID="txtStateOrRegion" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvStateOrRegion" runat="server" Display="Dynamic" ControlToValidate="txtStateOrRegion" ErrorMessage="*" />
        <asp:DropDownList ID="ddlStateOrRegion" runat="server" CssClass="dropdownlist" Visible="false" />
      </td>
    </tr>
    <tr>
      <td>
        <CMS:Label ID="lblPostalCode" runat="server" CssClass="label" /><br />
        <asp:TextBox ID="txtPostalCode" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvPostalCode" runat="server" ControlToValidate="txtPostalCode" Display="Dynamic" ErrorMessage="*" />
      </td>
      <td>
        <CMS:Label ID="lblCountry" runat="server" /><br />
        <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_Changed" /><CMS:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="ddlCountry" Display="Dynamic" ErrorMessage="*" />
      </td>
    </tr>
  </table>
</CMS:Panel>
