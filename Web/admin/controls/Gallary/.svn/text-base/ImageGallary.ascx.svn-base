<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageGallary.ascx.cs"
    Inherits="Etech.CMS.Web.admin.controls.Gallary.ImageGallary" %>
<CMS:Panel ID="pnlEditPage" runat="server" SkinID="pnlBorder">
    <div class="panelWrap">
        <table width="100%">
            <tr>
                <td valign="top">
                    <table width="100%">
                        <tr>
                            <td width="50%" valign="top" colspan="2">
                                <CMS:Label ID="lblImageId" runat="server" Visible="false" />
                                <CMS:Label ID="lblImageFile" runat="server" CssClass="label" /><br />
                                <asp:TextBox ID="txtImageFile" runat="server" CssClass="longtextbox" />
                                &nbsp;<CMS:HyperLink ID="hlImageSelector" runat="server" SkinID="submodal-800-430"
                                    Text="Browse" />&nbsp;<CMS:HelpLink ID="helpImageFile" runat="server" NavigateUrl="javascript:void(0);"></CMS:HelpLink>
                                <CMS:Button ID="btnBigDelete" runat="server" CssClass="button" OnClick="btnBigDelete_Click"
                                    Text="Delete" CausesValidation="false" /><br />
                                <%--<CMS:RequiredFieldValidator ID="rfvImageFile" runat="server" ControlToValidate="txtImageFile"
                                    ErrorMessage="Image File is required." Display="Dynamic" SetFocusOnError="true"></CMS:RequiredFieldValidator>--%>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <CMS:Label ID="lblTumbFile" runat="server" CssClass="label"></CMS:Label>
                                <br />
                                <asp:TextBox ID="txtTumbImageFile" runat="server" CssClass="longtextbox" />
                                <CMS:HyperLink ID="hlThumbImageSelector" runat="server" SkinID="submodal-800-430"
                                    Text="Browse" />&nbsp;
                                <CMS:HelpLink ID="helpThumbImageFile" runat="server" NavigateUrl="javascript:void(0);" />
                                <%-- <CMS:Button ID="btnThumbDelete" runat="server" CssClass="button" OnClick="btnThumbDelete_Click" />--%>
                                <CMS:Button ID="btnDelete" runat="server" CssClass="button" OnClick="btnDelete_Click"
                                    CausesValidation="false" /><br />
                                <%--<CMS:RequiredFieldValidator ID="rfvThumbImageFile" runat="server" ControlToValidate="txtTumbImageFile"
                                    ErrorMessage="Thumb File is required." Display="Dynamic" SetFocusOnError="true" />--%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="verticalalign">
                                    <CMS:Label ID="lblImageCaption" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink
                                        ID="helpImageCaption" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                    <asp:TextBox ID="txtImageCaption" runat="server" TextMode="MultiLine" CssClass="multilinetextbox" />
                                    <br />
                                    <asp:RegularExpressionValidator ID="revImageCaption" runat="server" ControlToValidate="txtImageCaption"
                                        ErrorMessage="Please enter valid Image Caption." SetFocusOnError="true" Display="Dynamic"
                                        ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\{}\-/]+$"></asp:RegularExpressionValidator>
                                </div>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" colspan="2">
                                <CMS:Label ID="lblImgCategoryID" runat="server" CssClass="label"></CMS:Label>
                                <br />
                                <CMS:DropDownList ID="ddlImgCategoryID" runat="server" CssClass="fwdropdownlist">
                                </CMS:DropDownList>
                                <br />
                                <CMS:RequiredFieldValidator ID="rfvImgCategoryID" runat="server" InitialValue="Select"
                                    ControlToValidate="ddlImgCategoryID" ErrorMessage="Category is required." Display="Dynamic"
                                    SetFocusOnError="true" />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <CMS:Label ID="lblFooterSponsorURLTitle" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink
                                        ID="hlImageURLTitle" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                <asp:TextBox ID="txtURLTitle" runat="server" CssClass="longtextbox" /><br />
                                <%--<asp:RequiredFieldValidator ID="rfvURLTitle" runat="server" ControlToValidate="txtURLTitle"
                                    Display="Dynamic" ErrorMessage="Please enter the URL title." SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                <asp:RegularExpressionValidator ID="regexURLTitle" runat="server" ControlToValidate="txtURLTitle"
                                    ErrorMessage="Please enter valid Right Sponsor URL Title." SetFocusOnError="true" Display="Dynamic"
                                    ValidationExpression="^[a-zA-Z0-9()/'|:&,\s?.-]+$"></asp:RegularExpressionValidator><br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                
                                <asp:CheckBox ID="chkLeftSponsorImage" runat="server"  />&nbsp;
                                <CMS:Label ID="lblIsDownload" runat="server" Text="Left Sponsor Image" CssClass="label" />
                                &nbsp;<CMS:HelpLink
                                        ID="hlLeftSponsorImage" runat="server" NavigateUrl="javascript:void(0);" />
                                <br/ ><br/ >
                            </td>
                        </tr>
                         <tr>
                            <td colspan="2">
                                <CMS:Label ID="lblLeftSponsorURLTitle" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink
                                        ID="hlLeftSponsorURLTitle" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                <asp:TextBox ID="txtLeftSponsorURLTitle" runat="server" CssClass="longtextbox" /><br />
                                <%--<asp:RequiredFieldValidator ID="rfvURLTitle" runat="server" ControlToValidate="txtURLTitle"
                                    Display="Dynamic" ErrorMessage="Please enter the URL title." SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                <asp:RegularExpressionValidator ID="revLeftSponsorURLTitle" runat="server" ControlToValidate="txtLeftSponsorURLTitle"
                                    ErrorMessage="Please enter valid Left Sponsor URL Title." SetFocusOnError="true" Display="Dynamic"
                                    ValidationExpression="^[a-zA-Z/\s:.-]+$"></asp:RegularExpressionValidator><br />
                            </td>
                        </tr>

                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" />
                    <CMS:Button ID="btnCancel" runat="server" CssClass="button" OnClick="btnCancel_Click"
                        CausesValidation="false" />
                </td>
            </tr>
        </table>
    </div>
</CMS:Panel>
<br />
<br />
<CMS:Panel ID="pnlImages" runat="server" SkinID="pnlBorder">
    <div class="panelWrap">
        <div class="gridBox">
            <div class="gridWrap">
                <div style="padding: 0 10px 10px 0;" class="floatRight">
                    <CMS:LinkButton Font-Underline="true" Font-Bold="true" ID="lnkAddTherapists" runat="server"
                        OnClick="lnkAddTherapists_Click">        
                    </CMS:LinkButton>
                </div>
                <CMS:DataGrid ID="dgProductImages" runat="server" AutoGenerateColumns="false" SkinID="adminDataGrid">
                    <PagerStyle Mode="NumericPages" Position="Bottom" />
                    <Columns>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <CMS:HyperLink ID="hlImage" runat="server" NavigateUrl="javascript:void(0);"><asp:Image ID="productImage" runat="server" ImageUrl='<%# Etech.CMS.Core.ImageProcess.GetGalleryThumbnailUrl((string)Eval("ImageFile")) %>'  /></CMS:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <asp:Image ID="FooterImage" runat="server" ImageUrl='<%# Eval("ThumbImageFile") %>'  />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="Caption" />
                        <asp:BoundColumn DataField="SortOrder" ItemStyle-HorizontalAlign="center" />
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
                                    CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ImageID") %>' OnClick="Items_ItemReorder"
                                    SkinID="up" />
                                <asp:ImageButton ID="lbDown" runat="server" CausesValidation="false" CommandName="Down"
                                    CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ImageID") %>' OnClick="Items_ItemReorder"
                                    SkinID="down" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
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
    </div>
</CMS:Panel>
