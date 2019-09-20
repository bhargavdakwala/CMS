<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="images.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.sitesettings.images" %>
<%@ Reference Control="~/admin/admin.master" %>



<CMS:Panel ID="pnlImages" runat="server" >
    <br />
    <CMS:CheckBox ID="chkGenerateThumbs" runat="server" CssClass="label" />
    <CMS:HelpLink ID="helpGenerateThumbs" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
    <CMS:Label ID="lblSmallSize" runat="server" CssClass="label" />
    <asp:TextBox ID="txtSmallWidth" runat="server" CssClass="textbox" Width="30px" /> x <asp:TextBox ID="txtSmallHeight" runat="server" CssClass="textbox" Width="30px" /><br /><br />
    <asp:FilteredTextBoxExtender ID="ftbeSmallWidth" runat="server" TargetControlId="txtSmallWidth" FilterType="Numbers" />
    <asp:FilteredTextBoxExtender ID="ftbeSmallHeight" runat="server" TargetControlId="txtSmallHeight" FilterType="Numbers" />
    <CMS:RequiredFieldValidator ID="rfvSmallWidth" runat="server" Display="None" ControlToValidate="txtSmallWidth"/>
    <CMS:RequiredFieldValidator ID="rfvSmallHeight" runat="server" Display="None" ControlToValidate="txtSmallHeight"/>
    <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" />
   
</CMS:Panel>
