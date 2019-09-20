<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="GallerySubCategoryEdit.aspx.cs" Inherits="Etech.CMS.Web.admin.GallerySubCategoryEdit" %>
<%@ MasterType VirtualPath="~/admin/admin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="mainContentRegion">
        <div id="admin_centercontent">
            <CMS:Panel ID="pnlEditServiceDetail" runat="server" SkinID="pnlBorder" Width="695px">
                <div class="panelWrap">
                    <table>
                        <tr align="left">
                            <td>
                                <CMS:Label ID="lblBlogTitle" runat="server" Visible="True" />
                                <CMS:Label ID="lblBlogId" runat="server" Visible="False" />
                            </td>
                            <td>
                                
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:TextBox ID="txtBlogTitle" runat="server" MaxLength="100" Width="200px" CssClass="longtextbox" /><br />
                                <asp:RequiredFieldValidator ID="rfvBlogTile" runat="server" ErrorMessage="Title is Required."
                                    Display="Dynamic" ControlToValidate="txtBlogTitle" ValidationGroup="vgblogs"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rfvBlogTitle" runat="server" ControlToValidate="txtBlogTitle"
                                    ErrorMessage="Please enter valid Title." SetFocusOnError="true" Display="Dynamic"
                                    ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&_!.\{}\-/]+$" ValidationGroup="vgblogs"></asp:RegularExpressionValidator><br />
                            </td>
                           
                        </tr>
                        <tr>
                         <td>
                               
                                <CMS:Label ID="lblBlogCategoryName" runat="server" Visible="True" />
                                <CMS:Label ID="lblCategoryId" runat="server" Visible="false" /><br />
                                <asp:DropDownList ID="ddlBlogCategory" runat="server" CssClass="fwdropdownlist">
                                </asp:DropDownList>
                                <br />
                                <asp:RequiredFieldValidator ID="rfvBlogCategoryName" runat="server" ErrorMessage="Select Category"
                                    InitialValue="Select" Display="Dynamic" ValidationGroup="vgblogs" ControlToValidate="ddlBlogCategory"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        
                    </table>
                    <br />
                    <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                        ValidationGroup="vgblogs" />
                    <CMS:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="button"
                        OnClick="btnCancel_Click" />
                </div>
            </CMS:Panel>
            <%--<CMS:Button ID="btnAddBlog" CssClass="button" runat="server" OnClick="btnAddBlog_Click" />--%>
            <CMS:Panel ID="pnlCurrentServiceDetail" runat="server" SkinID="pnlBorder">
                <div class="panelWrap">
                    <div class="gridBox">
                        <div class="gridWrap">
                            <div style="padding: 0 10px 10px 0;" class="floatRight">
                                <CMS:LinkButton Font-Underline="true" Font-Bold="true" ID="lnkAddSubCategory" OnClick="lnkAddSubCategory_Click"
                                    runat="server">        
                                </CMS:LinkButton>
                            </div>
                            <CMS:DataGrid ID="dgBlogCategories" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage"
                                OnItemCommand="dgBlogCategories_OnItemCommand" Width="655px" AllowPaging="true"
                                PageSize="10" OnPageIndexChanged="dgBlogCategories_PageIndexChanged">
                                <PagerStyle Mode="NumericPages" Position="Bottom" />
                                <Columns>
                                    <asp:BoundColumn DataField="ImgSubCategoryTitle" HeaderText="Sub Category Title"
                                        HeaderStyle-Width="150px" ItemStyle-Wrap="true"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="ImgCategoryTitle" HeaderText="Category Title" HeaderStyle-Width="255px"
                                        ItemStyle-Wrap="true" />
                                    <asp:TemplateColumn HeaderText="Edit">
                                        <ItemTemplate>
                                            <CMS:LinkButton runat="server" ID="lblEdit" CausesValidation="false" CommandName="Edit"
                                                CommandArgument='<%# Eval("ImgSubCategoryID") %>' SkinID="Edit"></CMS:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="Delete">
                                        <ItemTemplate>
                                            <CMS:LinkButton runat="server" ID="lbDelete" CausesValidation="false" CommandName="Delete"
                                                CommandArgument='<%# Eval("ImgSubCategoryID") %>' SkinID="delete" OnClientClick="return confirm('Do you want to Delete this record?');"></CMS:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                            </CMS:DataGrid>
                        </div>
                    </div>
                </div>
            </CMS:Panel>
        </div>
    </div>
</asp:Content>
