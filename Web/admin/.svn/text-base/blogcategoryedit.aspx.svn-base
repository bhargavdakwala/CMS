<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeBehind="blogcategoryedit.aspx.cs" Inherits="Etech.CMS.Web.admin.blogcategoryedit"
    EnableEventValidation="false" ValidateRequest="false" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <CMS:Panel ID="pnlEditBlogCategories" runat="server" SkinID="pnlBorder"  Visible="false">
        <div class="panelWrap">
            <table width="100%">
                <tr>
                    <td valign="top">
                        <table width="100%">
                            <tr>
                                <td width="50%" valign="top">
                                    <CMS:Label ID="lblBlogCategoryId" runat="server" Visible="False" />
                                    <CMS:Label ID="lblBlogCategory" runat="server" Visible="True" /><br />
                                    <asp:TextBox ID="txtBlogCategory" runat="server" MaxLength="50" Width="250px" CssClass="longtextbox" />
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvBlogCategory" runat="server" ErrorMessage="Category is Required."
                                        Display="Dynamic" ValidationGroup="vgCategory" SetFocusOnError="true" ControlToValidate="txtBlogCategory">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="rfvCategory" runat="server" ControlToValidate="txtBlogCategory"
                                        ErrorMessage="Please enter valid Blog Category." SetFocusOnError="true" Display="Dynamic"
                                        ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\-/]+$" ValidationGroup="vgCategory"></asp:RegularExpressionValidator>
                                </td>
                                <td>
                                    <CMS:Label ID="lblURLTitle" runat="server" CssClass="label" /><br />
                                    <asp:TextBox ID="txtURLTitle" runat="server" CssClass="longtextbox" /><br />
                                    <asp:RequiredFieldValidator ID="rfvURLTitle" runat="server" ControlToValidate="txtURLTitle"
                                        Display="Dynamic" ValidationGroup="vgCategory" ErrorMessage="Please enter the URL title."
                                        SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regexURLTitle" runat="server" ControlToValidate="txtURLTitle"
                                        ErrorMessage="Please enter valid URL title." SetFocusOnError="true" ValidationGroup="vgCategory"
                                        Display="Dynamic" ValidationExpression="^[a-zA-Z0-9()/'|:&,\s?.-]+$"></asp:RegularExpressionValidator><br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <CMS:Label ID="lblTitle" runat="server" CssClass="label" /><br />
                                    <asp:TextBox ID="txtTitle" runat="server" CssClass="multilinetextbox" MaxLength="250"
                                        TextMode="MultiLine" /><br />
                                    <asp:RegularExpressionValidator ID="regexTitle" runat="server" ControlToValidate="txtTitle"
                                        ErrorMessage="Please enter valid title." SetFocusOnError="true" ValidationGroup="vgCategory"
                                        Display="Dynamic" ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\{}\-/]+$"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                                <td>
                                    <CMS:Label ID="lblKeywords" runat="server" CssClass="label" /><br />
                                    <asp:TextBox ID="txtKeywords" runat="server" CssClass="multilinetextbox" MaxLength="250"
                                        TextMode="MultiLine" /><br />
                                    <asp:RegularExpressionValidator ID="regKeywords" runat="server" ControlToValidate="txtKeywords"
                                        ErrorMessage="Please enter valid keywords." ValidationGroup="vgCategory" SetFocusOnError="true"
                                        Display="Dynamic" ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&_!.\{}\-/]+$"></asp:RegularExpressionValidator><br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <CMS:Label ID="lblDescription" runat="server" CssClass="label" /><br />
                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="multilinetextbox" MaxLength="250"
                                        TextMode="MultiLine" /><br />
                                    <asp:RegularExpressionValidator ID="regDescription" runat="server" ControlToValidate="txtDescription"
                                        ErrorMessage="Please enter valid description." ValidationGroup="vgCategory" SetFocusOnError="true"
                                        Display="Dynamic" ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\{}\-/]+$"></asp:RegularExpressionValidator><br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr align="center">
                    <td>
                    <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                        ValidationGroup="vgCategory" />
                    <CMS:Button ID="btnCancel" runat="server" CssClass="button" OnClick="btnCancel_Click"
                        CausesValidation="false" /><br />
                        </td>
                </tr>
            </table>
        </div>
    </CMS:Panel>
    <CMS:Panel ID="pnlCurrentCategories" runat="server" SkinID="pnlBorder">
        <div class="panelWrap">
            <div class="gridBox">
                <div class="gridWrap">
                <div style="padding: 0 10px 10px 0;" class="floatRight">
                            <CMS:LinkButton Font-Underline="true" Font-Bold="true" ID="lnkAddTherapists" 
                                runat="server" onclick="lnkAddTherapists_Click">        
                            </CMS:LinkButton>
                        </div>
                    <CMS:DataGrid ID="dgBlogCategories" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage"
                        Width="655px" OnItemCommand="dgBlogCategories_ItemCommand" AllowPaging="true"
                        PageSize="10" OnPageIndexChanged="dgBlogCategories_PageIndexChanged">
                        <Columns>
                            <asp:BoundColumn DataField="CategoryTitle" HeaderText="Title" ItemStyle-Width="430px"
                                ItemStyle-Wrap="true" />
                            <asp:TemplateColumn HeaderText="Edit">
                                <ItemTemplate>
                                    <CMS:LinkButton ID="lblEdit" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "CategoryId") %>'
                                        SkinID="Edit" CommandName="Edit"></CMS:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Delete">
                                <ItemTemplate>
                                    <CMS:LinkButton ID="lbDelete" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "CategoryId") %>'
                                        SkinID="delete" CommandName="Delete" OnClientClick="return confirm('Do you want to Delete this record?');"></CMS:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </CMS:DataGrid>
                </div>
            </div>
        </div>
    </CMS:Panel>
</asp:Content>
