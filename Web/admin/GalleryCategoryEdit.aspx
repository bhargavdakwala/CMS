<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="GalleryCategoryEdit.aspx.cs" Inherits="Etech.CMS.Web.admin.GalleryCategoryEdit" %>
<%@ MasterType VirtualPath="~/admin/admin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div id="mainContentRegion">
        <div id="admin_centercontent">
            <CMS:Panel ID="pnlEditAffiliatesCategories" runat="server" SkinID="pnlBorder" Width="695px">
                <br />
                <div class="panelWrap">
                    <table>
                        <tr align="left">
                            <td>
                                <CMS:Label ID="lblCategory" runat="server" Visible="True" />
                                <CMS:Label ID="lblBlogCategoryId" runat="server" Visible="False" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:TextBox ID="txtBlogCategory" runat="server" MaxLength="50" Width="250px" CssClass="longtextbox" />
                                <asp:RequiredFieldValidator ID="rfvBlogTile" runat="server" ErrorMessage="Title is Required."
                                    Display="Dynamic" ControlToValidate="txtBlogCategory" ValidationGroup="vgCategory"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rfvBlogTitle" runat="server" ControlToValidate="txtBlogCategory"
                                    ErrorMessage="Please enter valid Title." SetFocusOnError="true" Display="Dynamic"
                                    ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&_!.\{}\-/]+$" ValidationGroup="vgCategory"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        
                       
                    </table>
                    <br />
                    <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                        ValidationGroup="vgCategory" />
                    <CMS:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="button"
                    OnClick="btnCancel_Click" />
                    <br />
                </div>
            </CMS:Panel>
            <CMS:Panel ID="pnlCurrentAffiliatesCategories" runat="server" SkinID="pnlBorder">
                <div class="panelWrap">
                    <div class="gridBox">
                        <div class="gridWrap">
                           <div style="padding: 0 10px 10px 0;" class="floatRight">
                            <CMS:LinkButton Font-Underline="true" Font-Bold="true" ID="lnkAffiliatesCategories" OnClick="lnkAffiliatesCategories_Click"
                                runat="server">        
                            </CMS:LinkButton>
                        </div> 
                            <CMS:DataGrid ID="dgBlogCategories" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage"
                                Width="655px" OnItemCommand="dgBlogCategories_ItemCommand" AllowPaging="true"
                                PageSize="10" OnPageIndexChanged="dgBlogCategories_PageIndexChanged">
                                <Columns>
                                    <asp:BoundColumn DataField="ImgCategoryTitle" HeaderText="Title" ItemStyle-Width="430px"
                                        ItemStyle-Wrap="true" />
                                    <asp:TemplateColumn HeaderText="Edit">
                                        <ItemTemplate>
                                            <CMS:LinkButton ID="lblEdit" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ImgCategoryID") %>'
                                                SkinID="Edit" CommandName="Edit"></CMS:LinkButton>
                                                
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="Delete">
                                        <ItemTemplate>
                                            <CMS:LinkButton runat="server" ID="lbDelete" CausesValidation="false" CommandName="Delete"
                                                CommandArgument='<%# Eval("ImgCategoryID") %>' SkinID="delete" OnClientClick="return confirm('Do you want to Delete all related records?');"></CMS:LinkButton>
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
