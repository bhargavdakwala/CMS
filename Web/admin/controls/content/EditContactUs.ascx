<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditContactUs.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.content.EditContactUs" %>

<CMS:Label ID="lblEmail" runat="server" CssClass="label"/><br />
<asp:TextBox ID="txtEmail" runat="server" CssClass="longtextbox" />&nbsp;<CMS:HelpLink ID="helpMailSettingTo" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
<CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" /><br />
