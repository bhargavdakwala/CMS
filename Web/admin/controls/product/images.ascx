<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="images.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.product.images" %>
<%--CMS:Panel ID="pnlProductImages" runat="server">--%>
<CMS:Panel ID="pnlImageManagement" runat="server">
    <br />
    <CMS:Label ID="lblImageId" runat="server" Visible="false" />
    <CMS:Label ID="lblImageFile" runat="server" CssClass="label" /><br />
    <asp:TextBox ID="txtImageFile" runat="server" CssClass="longtextbox" /><CMS:RequiredFieldValidator
        ID="rfvImageFile" runat="server" ControlToValidate="txtImageFile" Display="None" />&nbsp;<CMS:HyperLink
            ID="hlImageSelector" runat="server" SkinID="submodal-800-430" Text=". . ." />&nbsp;<CMS:HelpLink
                ID="helpImageFile" runat="server" NavigateUrl="javascript:void(0);" />
    <CMS:Button ID="btnDelete" runat="server" CssClass="button" OnClick="btnDelete_Click" /><br />
    <asp:RegularExpressionValidator ID="regexBanner" runat="server" ControlToValidate="txtImageFile"
        ErrorMessage="Please enter valid image file." SetFocusOnError="true" Display="Dynamic"
        ValidationExpression="^[a-zA-Z0-9()~_/ ?.-]+$"></asp:RegularExpressionValidator>
    <br />
    <div class="verticalalign">
        <CMS:Label ID="lblImageCaption" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink
            ID="helpImageCaption" runat="server" NavigateUrl="javascript:void(0);" /><br />
    </div>
    <asp:TextBox ID="txtImageCaption" runat="server" TextMode="MultiLine" CssClass="multilinetextbox" /><br />
    <asp:RegularExpressionValidator ID="regexTitle" runat="server" ControlToValidate="txtImageCaption"
        ErrorMessage="Please enter valid image caption." SetFocusOnError="true" Display="Dynamic"
        ValidationExpression="^[a-zA-Z0-9()/&,|' ?.-]+$"></asp:RegularExpressionValidator>
    <br />
    <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" />
</CMS:Panel>
<br />
<br />
<div class="gridBox">
    <div class="gridWrap">
        <CMS:Panel ID="pnlImages" runat="server">
            <CMS:DataGrid ID="dgProductImages" runat="server" AutoGenerateColumns="false" SkinID="adminDataGrid">
                <Columns>
                    <asp:TemplateColumn>
                        <ItemTemplate>
                            <CMS:LinkButton ID="lbEdit" runat="server" CausesValidation="false" SkinID="edit"
                                CommandName="Edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ImageId") %>'
                                OnCommand="lbEdit_Click" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn>
                        <ItemTemplate>
                            <asp:ImageButton ID="lbUp" runat="server" CausesValidation="false" CommandName="Up"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ImageId") %>' OnClick="Items_ItemReorder"
                                SkinID="up" />
                            <asp:ImageButton ID="lbDown" runat="server" CausesValidation="false" CommandName="Down"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ImageId") %>' OnClick="Items_ItemReorder"
                                SkinID="down" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="SortOrder" ItemStyle-HorizontalAlign="center" />
                    <asp:TemplateColumn>
                        <ItemTemplate>
                            <CMS:HyperLink ID="hlImage" runat="server" NavigateUrl="javascript:void(0);"><asp:Image ID="productImage" runat="server" ImageUrl='<%# Etech.CMS.Core.ImageProcess.GetProductThumbnailUrl((string)Eval("ImageFile")) %>'  /></CMS:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="Caption" />
                    <asp:TemplateColumn>
                        <ItemTemplate>
                            <CMS:LinkButton ID="lbDelete" runat="server" SkinID="delete" CausesValidation="false"
                                CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ImageId") %>'
                                OnCommand="lbDelete_Click" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
            </CMS:DataGrid>
    </div>
</div>
</CMS:Panel>
<%--</CMS:Panel>--%>
