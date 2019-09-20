<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="seosettings.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.sitesettings.seosettings" %>
<%@ Reference Control="~/admin/admin.master" %>

<CMS:Panel ID="pnlSeo" runat="server" >
  <br />
  <div class="verticalalign">
    <CMS:Label ID="lblSiteKeywords" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink ID="helpSiteKeywords" runat="server" NavigateUrl="javascript:void(0);" /><br />
  </div>
  <asp:TextBox ID="txtSiteKeywords" runat="server" CssClass="multilinetextbox" /><br />
  <asp:RegularExpressionValidator ID="refSiteKeywords" runat="server" ControlToValidate="txtSiteKeywords"
  ErrorMessage="Please enter valid Site Keyword." SetFocusOnError="true" Display="Dynamic" 
  ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&_!.\{}\-/]+$"  ValidationGroup="vgSeo"></asp:RegularExpressionValidator>
  <br />
  <div class="verticalalign">
    <CMS:Label ID="lblSiteDescription" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink ID="helpSiteDescription" runat="server" NavigateUrl="javascript:void(0);" /><br />
  </div>
  <asp:TextBox ID="txtSiteDescription" runat="server" CssClass="multilinetextbox" /><br />
  <asp:RegularExpressionValidator ID="rfvSiteDescription" runat="server" ControlToValidate="txtSiteDescription"
       ErrorMessage="Please enter valid Site Description." SetFocusOnError="true" Display="Dynamic" 
       ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&_!.\{}\-/]+$"  ValidationGroup="vgSeo"></asp:RegularExpressionValidator>
  <br />
  <CMS:Label ID="lblCopyrightText" runat="server" CssClass="label" />
  &nbsp;<CMS:HelpLink ID="helpCopyrightText" runat="server" NavigateUrl="javascript:void(0);" />
  <br />
  <asp:TextBox ID="txtCopyrightText" runat="server" CssClass="longtextbox" /><br />
  <asp:RegularExpressionValidator ID="rfvCopyrightText" runat="server" ControlToValidate="txtCopyrightText"
       ErrorMessage="Please enter valid Site CopyrightText." SetFocusOnError="true" Display="Dynamic" 
       ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&_!.\{}\-/]+$"  ValidationGroup="vgSeo"></asp:RegularExpressionValidator>
  
    <br /><br />
  <CMS:Button ID="btnSave" runat="server" CssClass="button" ValidationGroup="vgSeo" OnClick="btnSave_Click" />
 
</CMS:Panel>
