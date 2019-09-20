<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="general.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.product.general" %>
<CMS:Panel ID="pnlGeneralProductInformation" runat="server">
    <div class="panelWrap">
        <br />
        <CMS:Label ID="lblBaseSku" runat="server" CssClass="label" /><br />
        <asp:TextBox ID="txtBaseSku" runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink
            ID="helpBaseSku" runat="server" NavigateUrl="javascript:void(0);" />&nbsp;<CMS:RequiredFieldValidator
                ID="rfvBaseSku" runat="server" ControlToValidate="txtBaseSku" /><br />
        <br />
        <CMS:Label ID="lblName" runat="server" CssClass="label" /><br />
        <asp:TextBox ID="txtName" runat="server" CssClass="longtextbox" />&nbsp;<CMS:HelpLink
            ID="helpName" runat="server" NavigateUrl="javascript:void(0);" /><br />
        <br />
        <div class="verticalalign">
            <CMS:Label ID="lblShortDescription" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink
                ID="helpShortDescription" runat="server" NavigateUrl="javascript:void(0);" /><br />
        </div>
        <FCKeditorV2:FCKeditor ID="txtShortDescription" BasePath="~/FCKeditor/" runat="server"
            Height="200" Width="100%" UseBROnCarriageReturn="true" ToolbarStartExpanded="false" />
        <br />
        <CMS:Label ID="lblProductType" runat="server" CssClass="label" /><br />
        <div class="verticalalign">
            <asp:UpdatePanel ID="productTypeUpdate" runat="server" RenderMode="Inline">
                <ContentTemplate>
                    <asp:DropDownList ID="ddlProductType" runat="server" CssClass="dropdownlist" />
                    &nbsp;<CMS:HelpLink ID="helpProductType" runat="server" NavigateUrl="javascript:void(0);" />&nbsp;<asp:TextBox
                        ID="txtProductTypeAdd" runat="server" CssClass="textbox" />&nbsp;<CMS:Button ID="btnProductTypeAdd"
                            runat="server" CssClass="button" OnClick="btnProductTypeAdd_Click" CausesValidation="false" /></ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <br />
        <CMS:Label ID="lblStatus" runat="server" CssClass="label" /><br />
        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="dropdownlist" />
        &nbsp;<CMS:HelpLink ID="helpStatus" runat="server" NavigateUrl="javascript:void(0);" /><br />
        <br />
        <CMS:Panel ID="pnlHide" runat="server" Visible="false">
            <CMS:Label ID="lblOurPrice" runat="server" CssClass="label" /><br />
            <CMS:Label ID="lblOurPriceCurrencySymbol" runat="server" CssClass="label" />&nbsp;</CMS:Label><asp:TextBox
                ID="txtOurPrice" runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink ID="helpOurPrice"
                    runat="server" NavigateUrl="javascript:void(0);" /><br />
            <br />
            <CMS:Label ID="lblRetailPrice" runat="server" CssClass="label" /><br />
            <CMS:Label ID="lblRetailPriceCurrencySymbol" runat="server" CssClass="label" />&nbsp;<asp:TextBox
                ID="txtRetailPrice" runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink ID="helpRetailPrice"
                    runat="server" NavigateUrl="javascript:void(0);" /><br />
            <br />
            <CMS:Label ID="lblManufacturer" runat="server" CssClass="label" /><br />
            <div class="verticalalign">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
                    <ContentTemplate>
                        <asp:DropDownList ID="ddlManufacturer" runat="server" CssClass="dropdownlist" />
                        &nbsp;<CMS:HelpLink ID="helpManufacturer" runat="server" NavigateUrl="javascript:void(0);" />&nbsp;<asp:TextBox
                            ID="txtManufacturerAdd" runat="server" CssClass="textbox" />&nbsp;<CMS:Button ID="btnManufacturerAdd"
                                runat="server" CssClass="button" OnClick="btnManufacturerAdd_Click" CausesValidation="false" /></ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <br />
            <br />
            <CMS:Label ID="lblTaxRate" runat="server" CssClass="label" /><br />
            <asp:DropDownList ID="ddlTaxRate" runat="server" CssClass="dropdownlist" />
            &nbsp;<CMS:HelpLink ID="helpTaxRate" runat="server" NavigateUrl="javascript:void(0);" /><br />
            <CMS:Label ID="lblShippingEstimate" runat="server" CssClass="label" /><br />
            <asp:DropDownList ID="ddlShippingEstimate" runat="server" CssClass="dropdownlist" />
            &nbsp;<CMS:HelpLink ID="helpShippingEstimate" runat="server" NavigateUrl="javascript:void(0);" /><br />
            <br />
            <CMS:Label ID="lblWeight" runat="server" CssClass="label" /><br />
            <asp:TextBox ID="txtWeight" runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink
                ID="helpWeight" runat="server" NavigateUrl="javascript:void(0);" /><br />
            <br />
            <CMS:Label ID="lblDimensions" runat="server" CssClass="label" /><br />
            <CMS:Label ID="lblLength" runat="server" CssClass="label" />&nbsp;<asp:TextBox ID="txtLength"
                runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink ID="helpProductLength" runat="server"
                    NavigateUrl="javascript:void(0);" /><br />
            <CMS:Label ID="lblWidth" runat="server" CssClass="label" />&nbsp;&nbsp;<asp:TextBox
                ID="txtWidth" runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink ID="helpProductWidth"
                    runat="server" NavigateUrl="javascript:void(0);" /><br />
            <CMS:Label ID="lblHeight" runat="server" CssClass="label" />&nbsp;<asp:TextBox ID="txtHeight"
                runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink ID="helpProductHeight" runat="server"
                    NavigateUrl="javascript:void(0);" /><br />
            <br />
            <CMS:Label ID="lblOtherInfo" runat="server" CssClass="label"></CMS:Label><br />
            <br />
        </CMS:Panel>
        <CMS:Label ID="lblAllow" runat="server" CssClass="label" />&nbsp;<asp:TextBox ID="txtAllow"
            runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink ID="HelpAllow" runat="server"
                NavigateUrl="javascript:void(0);" /><br />
        <br />
        <CMS:Label ID="lblCarFrom" runat="server" CssClass="label" />&nbsp;<asp:TextBox ID="txtCarFrom"
            runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink ID="HelpCarFrom" runat="server"
                NavigateUrl="javascript:void(0);" /><br />
        <br />
        <CMS:Label ID="lbl4WDFrom" runat="server" CssClass="label" />&nbsp;<asp:TextBox ID="txt4WDFrom"
            runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink ID="Help4WDfrom" runat="server"
                NavigateUrl="javascript:void(0);" /><br />
        <br />
        <CMS:Label ID="lblURLTitle" runat="server" CssClass="label" /><br />
        <asp:TextBox ID="txtURLTitle" runat="server" CssClass="longtextbox" />&nbsp;<CMS:HelpLink
            ID="helpURLTitle" runat="server" NavigateUrl="javascript:void(0);" /><br />
        <asp:RequiredFieldValidator ID="rfvURLTitle" runat="server" ControlToValidate="txtURLTitle"
            Display="Dynamic" ErrorMessage="Please enter the URL title." SetFocusOnError="true"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regexURLTitle" runat="server" ControlToValidate="txtURLTitle"
            ErrorMessage="Please enter valid URL title." SetFocusOnError="true" Display="Dynamic"
            ValidationExpression="^[a-zA-Z0-9()/'.-]+$"></asp:RegularExpressionValidator><br />
        <br />
        <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <CMS:Button ID="btnCopy" runat="server" CssClass="button" OnClick="btnCopy_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <CMS:Button ID="btnDelete" runat="server" CssClass="button" OnClick="btnDelete_Click"
            OnClientClick="return confirm('Do you want to Delete this record?');" />
    </div>
</CMS:Panel>
