<%@ Page Title="Testimonials" Language="C#" MasterPageFile="~/admin/admin.master"
    AutoEventWireup="true" CodeBehind="testimonials.aspx.cs" ValidateRequest="false"
    Inherits="Etech.CMS.Web.admin.blogedit" %>

<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript">
        function ValidateFCKAText(source, args) {
            var fckText = FCKeditorAPI.GetInstance('<%=txtDescriptor.ClientID %>');
            args.IsValid = fckText.GetXHTML(true) != "";
        }
    </script>
    <div id="mainContentRegion">
        <div id="admin_centercontent">
            <%--   <div class="sectionHeader">
                <CMS:Label ID="lblBlogEdit" runat="server" /></div>--%>
            <table id="categoryTable">
                <tr>
                    <td>
                        <CMS:Panel ID="pnlEditBlog" runat="server" SkinID="pnlBorder" Width="695px">
                            <br />
                            <div class="panelWrap">
                                <table>
                                    <tr align="left">
                                        <td>
                                            <CMS:Label ID="lblBlogTitle" runat="server" Visible="True" />
                                            <CMS:Label ID="lblBlogId" runat="server" Visible="False" />
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            <asp:TextBox ID="txtBlogTitle" Width="545px" runat="server" MaxLength="100" CssClass="longtextbox" />
                                            <asp:RequiredFieldValidator ID="rfvBlogTile" runat="server" ErrorMessage="Title is blank"
                                                Display="None" ControlToValidate="txtBlogTitle" ValidationGroup="Validation"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="revFirstName" runat="server" ValidationGroup="Validation"
                                                ControlToValidate="txtBlogTitle" ErrorMessage="Invalid Title" ToolTip="Invalid Title"
                                                ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&_!.\{}\-/]+$"
                                                Display="Dynamic" SetFocusOnError="True">*</asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            <CMS:Label ID="lblBlogDescriptions" runat="server" Visible="True" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <FCKeditorV2:FCKeditor ID="txtDescriptor" BasePath="~/FCKeditor/" runat="server"
                                                Height="300px" Width="660px" UseBROnCarriageReturn="true" ToolbarStartExpanded="false" />
                                            <br />
                                            <asp:CustomValidator ID="cvcfckAText" runat="server" ErrorMessage="Description is required"
                                                ToolTip="Description is required" ControlToValidate="txtDescriptor" ValidationGroup="Validation"
                                                ClientValidationFunction="ValidateFCKAText" ValidateEmptyText="True">*</asp:CustomValidator>
                                            <%--<asp:RequiredFieldValidator ID="rfvBlogDescriptions" runat="server" ErrorMessage="Descriptions is blank"
                                            Display="None" ControlToValidate="txtDescriptor"></asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                </table>
                                <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                                    ValidationGroup="Validation" />
                                <CMS:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="button"
                                    OnClick="btnCancel_Click" />
                                <asp:ValidationSummary ID="vsSaving" runat="server" ValidationGroup="Validation"
                                    ShowMessageBox="True" ShowSummary="False" HeaderText="Please follow below Suggestion(s):" />
                                <br />
                            </div>
                        </CMS:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%--<CMS:Button ID="btnAddBlog" CssClass="button" runat="server" OnClick="btnAddBlog_Click" />--%>
                        <CMS:Panel ID="pnlCurrentNewsEvent" runat="server" SkinID="pnlBorder">
                            <div class="panelWrap">
                                <div class="gridBox">
                                    <div class="gridWrap">
                                        <div style="padding: 0 10px 10px 0;" class="floatRight">
                                            <CMS:LinkButton Font-Underline="true" Font-Bold="true" ID="lnkBlogAdd" OnClick="lnkAddBlog_Click"
                                                runat="server">
                                            </CMS:LinkButton>
                                        </div>
                                        <CMS:DataGrid ID="dgBlogCategories" PageSize="5" runat="server" AutoGenerateColumns="false"
                                            AllowPaging="true" SkinID="adminDataGridNoPage" OnItemCommand="dgBlogCategories_OnItemCommand"
                                            Width="670px" OnPageIndexChanged="dgBlogCategories_PageIndexChanged">
                                            <Columns>
                                                <asp:BoundColumn DataField="BlogTitle" ItemStyle-HorizontalAlign="Left" ItemStyle-Wrap="true"
                                                    HeaderText="Title" ItemStyle-Width="180px" />
                                                <asp:TemplateColumn HeaderText="Description">
                                                    <ItemTemplate>
                                
                                                        <asp:Label ID="Label1" Width="200px" runat="server" Text='<%#DataBinder.Eval(Container,"DataItem.BlogDescription").ToString().Length>45?DataBinder.Eval(Container,"DataItem.BlogDescription").ToString().Substring(0,45)+"...":DataBinder.Eval(Container,"DataItem.BlogDescription").ToString()%>'>
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                  <%--<asp:BoundColumn DataField="BlogDescription"  ItemStyle-Width="40%" HeaderText="Description"
                                                HeaderStyle-HorizontalAlign="Center" />--%>
                                                <asp:TemplateColumn HeaderText="Edit">
                                                    <ItemTemplate>
                                                        <CMS:LinkButton runat="server" ID="lblEdit" CausesValidation="false" CommandName="Edit"
                                                            CommandArgument='<%# Eval("BlogId") %>' SkinID="Edit"></CMS:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <CMS:LinkButton runat="server" ID="lbDelete" CausesValidation="false" CommandName="Delete"
                                                            CommandArgument='<%# Eval("BlogId") %>' OnClientClick="return confirm('Do you want to Delete this record?');"
                                                            SkinID="delete"></CMS:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </CMS:DataGrid>
                                    </div>
                                </div>
                            </div>
                        </CMS:Panel>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
