<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="database.ascx.cs" Inherits="Etech.CMS.Web.install.controls.database" %>


<CMS:Panel ID="pnlDatabaseSetup" runat="server">
 <CMS:Label ID="lblDatabaseInstructions" runat="server" CssClass="label" />
 <CMS:CheckBox ID="chkUseConnectionStringConfig" runat="server" OnCheckedChanged="chkUseConnectionStringConfig_Changed" AutoPostBack="true" Font-Bold="true" /><br /><br />
 <CMS:Panel ID="pnlDatabaseSettings" runat="server">
   <CMS:Label ID="lblDatabaseServer" runat="server" CssClass="label" /><br />
   <asp:TextBox ID="txtDatabaseServer" runat="server" CssClass="longtextbox" TabIndex="1" />&nbsp;<CMS:HelpLink ID="helpDatabaseServer" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
   <CMS:Label ID="lblDatabaseName" runat="server" CssClass="label" /><br />
   <asp:TextBox ID="txtDatabaseName" runat="server" CssClass="textbox" TabIndex="2" />&nbsp;<CMS:HelpLink ID="helpDatabaseName" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
   <CMS:RequiredFieldValidator ID="rfvDatabaseServer" runat="server" ControlToValidate="txtDatabaseServer" Display="None" />
   <CMS:RequiredFieldValidator ID="rfvDatabaseName" runat="server" ControlToValidate="txtDatabaseName" Display="None" /> 
   <CMS:CheckBox ID="chkWindowsAuth" runat="server" CssClass="label" OnCheckedChanged="chkWindowsAuth_CheckedChanged" AutoPostBack="true" /><br /><br />
   <CMS:Label ID="lblDatabaseUserName" runat="server" CssClass="label" /><br />
   <asp:TextBox ID="txtDatabaseUserName" runat="server" CssClass="textbox" TabIndex="3" />&nbsp;<CMS:HelpLink ID="helpDatabaseUserName" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
   <CMS:Label ID="lblDatabasePassword" runat="server" CssClass="label" /><br />
   <asp:TextBox ID="txtDatabasePassword" runat="server" CssClass="textbox" TabIndex="4"/>&nbsp;<CMS:HelpLink ID="helpDatabasePassword" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
   <CMS:RequiredFieldValidator ID="rfvDatabaseUserName" runat="server" ControlToValidate="txtDatabaseUserName" Display="None" />
   <CMS:RequiredFieldValidator ID="rfvDatabasePassword" runat="server" ControlToValidate="txtDatabasePassword" Display="None" />
 </CMS:Panel>
 <CMS:Label ID="lblLanguagePack" runat="server" CssClass="label" /><br /><br />
 <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="dropdownlist" TabIndex="5" /><br /><br />
 <div class="rightAlign">
   <CMS:Button ID="btnTestConnection" runat="server" CssClass="button" OnClick="btnTestConnection_Click" CausesValidation="true" />&nbsp;&nbsp;&nbsp;&nbsp;
   <CMS:Button ID="btnPrevious" runat="server" CssClass="button" OnClick="btnPrevious_Click" CausesValidation="false"/>&nbsp;&nbsp;&nbsp;&nbsp;
   <CMS:Button ID="btnNext" runat="server" CssClass="button" OnClick="btnNext_Click" />
 </div>
</CMS:Panel>
