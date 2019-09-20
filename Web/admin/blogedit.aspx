<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeBehind="blogedit.aspx.cs" Inherits="Etech.CMS.Web.admin.blogedit1" %>

<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript">
        function ValidateFCKAText(source, args) {
            var fckText = FCKeditorAPI.GetInstance('<%=txtDescriptor.ClientID %>');
            args.IsValid = fckText.GetXHTML(true) != "";
        }
        
      
    </script>
    <div id="mainContentRegion">
        <CMS:Panel ID="pnlEditBlog" runat="server" SkinID="pnlBorder" Width="695px">
            <div class="panelWrap">
                <table>
                    <tr align="left">
                        <td>
                            <CMS:Label ID="lblBlogTitle" runat="server" Visible="True" />
                            <CMS:Label ID="lblBlogId" runat="server" Visible="False" />
                        </td>
                        <td>
                            <CMS:Label ID="lblBlogCategoryName" runat="server" Visible="True" />
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:TextBox ID="txtBlogTitle" runat="server" MaxLength="100" Width="200px" CssClass="longtextbox" /><br />
                            <asp:RequiredFieldValidator ID="rfvBlogTile" runat="server" ErrorMessage="Title is Required."
                                Display="Dynamic" ControlToValidate="txtBlogTitle" ValidationGroup="vgblogs"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rfvBlogTitle" runat="server" ControlToValidate="txtBlogTitle"
                                ErrorMessage="Please enter valid Title." SetFocusOnError="true" Display="Dynamic"
                                ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\-/]+$" ValidationGroup="vgblogs"></asp:RegularExpressionValidator><br />
                        </td>
                        <td>
                            <CMS:Label ID="lblCategoryId" runat="server" Visible="false" />
                            <asp:DropDownList ID="ddlBlogCategory" runat="server" CssClass="fwdropdownlist">
                            </asp:DropDownList>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvBlogCategoryName" runat="server" ErrorMessage="Select Category"
                                InitialValue="Select" Display="Dynamic" ValidationGroup="vgblogs" ControlToValidate="ddlBlogCategory"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr align="left">
                        <td colspan="2">
                            <CMS:Label ID="lblBlogDescriptions" runat="server" Visible="True" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <FCKeditorV2:FCKeditor ID="txtDescriptor" BasePath="~/FCKeditor/" runat="server"
                                Height="300px" Width="660px" UseBROnCarriageReturn="true" ToolbarStartExpanded="false" />
                            <br />
                            <asp:CustomValidator ID="cvcfckAText" runat="server" ErrorMessage="Description is required"
                                Display="None" ControlToValidate="txtDescriptor" ClientValidationFunction="ValidateFCKAText"
                                ValidateEmptyText="True" />
                            <%--<asp:RequiredFieldValidator ID="rfvBlogDescriptions" runat="server" ErrorMessage="Descriptions is blank"
                                            Display="None" ControlToValidate="txtDescriptor"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <CMS:Label ID="lblURLTitle" runat="server" CssClass="label" /><br />
                            <asp:TextBox ID="txtURLTitle" runat="server" CssClass="longtextbox" /><br />
                            <asp:RequiredFieldValidator ID="rfvURLTitle" runat="server" ControlToValidate="txtURLTitle"
                                Display="Dynamic" ValidationGroup="vgblogs" ErrorMessage="Please enter the URL title."
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regexURLTitle" runat="server" ControlToValidate="txtURLTitle"
                                ErrorMessage="Please enter valid URL title." SetFocusOnError="true" ValidationGroup="vgblogs"
                                Display="Dynamic" ValidationExpression="^[a-zA-Z0-9()/'|:&,\s?.-]+$"></asp:RegularExpressionValidator><br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <CMS:Label ID="lblTitle" runat="server" CssClass="label" /><br />
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="multilinetextbox" MaxLength="250"
                                TextMode="MultiLine" /><br />
                            <asp:RegularExpressionValidator ID="regexTitle" runat="server" ControlToValidate="txtTitle"
                                ErrorMessage="Please enter valid title." SetFocusOnError="true" ValidationGroup="vgblogs"
                                Display="Dynamic" ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\{}\-/]+$"></asp:RegularExpressionValidator>
                            <br />
                        </td>
                        <td>
                            <CMS:Label ID="lblKeywords" runat="server" CssClass="label" /><br />
                            <asp:TextBox ID="txtKeywords" runat="server" CssClass="multilinetextbox" MaxLength="250"
                                TextMode="MultiLine" /><br />
                            <asp:RegularExpressionValidator ID="regKeywords" runat="server" ControlToValidate="txtKeywords"
                                ErrorMessage="Please enter valid keywords." ValidationGroup="vgblogs" SetFocusOnError="true"
                                Display="Dynamic" ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&_!.\{}\-/]+$"></asp:RegularExpressionValidator><br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <CMS:Label ID="lblDescription" runat="server" CssClass="label" /><br />
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="multilinetextbox" MaxLength="250"
                                TextMode="MultiLine" /><br />
                            <asp:RegularExpressionValidator ID="regDescription" runat="server" ControlToValidate="txtDescription"
                                ErrorMessage="Please enter valid description." ValidationGroup="vgblogs" SetFocusOnError="true"
                                Display="Dynamic" ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\{}\-/]+$"></asp:RegularExpressionValidator><br />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                    ValidationGroup="vgblogs" />
                <CMS:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="button"
                    OnClick="btnCancel_Click" />
                        </td>
                    </tr>
                </table>
                
            </div>
        </CMS:Panel>
        <%--<CMS:Button ID="btnAddBlog" CssClass="button" runat="server" OnClick="btnAddBlog_Click" />--%>
        <CMS:Panel ID="pnlCurrentBlog" runat="server" SkinID="pnlBorder">
            <div class="panelWrap">
                <div class="gridBox">
                    <div class="gridWrap">
                        <div style="padding: 0 10px 10px 0;" class="floatRight">
                            <CMS:LinkButton Font-Underline="true" Font-Bold="true" ID="lnkBlogAdd" OnClick="lnkAddBlog_Click"
                                runat="server">        
                            </CMS:LinkButton>
                        </div>
                        <CMS:DataGrid ID="dgBlogCategories" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage"
                            OnItemCommand="dgBlogCategories_OnItemCommand" Width="655px" AllowPaging="true"
                            PageSize="10" OnPageIndexChanged="dgBlogCategories_PageIndexChanged">
                            <PagerStyle Mode="NumericPages" Position="Bottom" />
                            <Columns>
                                <asp:BoundColumn DataField="blogtitle" HeaderText="Title" HeaderStyle-Width="150px"
                                    ItemStyle-Wrap="true"></asp:BoundColumn>
                                <asp:BoundColumn DataField="categorytitle" HeaderText="Category" HeaderStyle-Width="255px"
                                    ItemStyle-Wrap="true" />
                                <asp:TemplateColumn HeaderText="Edit">
                                    <ItemTemplate>
                                        <CMS:LinkButton runat="server" ID="lblEdit" CausesValidation="false" CommandName="Edit"
                                            CommandArgument='<%# Eval("BlogId") %>' SkinID="Edit"></CMS:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Delete">
                                    <ItemTemplate>
                                        <CMS:LinkButton runat="server" ID="lbDelete" CausesValidation="false" CommandName="Delete"
                                            CommandArgument='<%# Eval("BlogId") %>' SkinID="delete" OnClientClick="return confirm('Do you want to Delete this record?');"></CMS:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </CMS:DataGrid>
                    </div>
                </div>
            </div>
        </CMS:Panel>
    </div>
</asp:Content>
