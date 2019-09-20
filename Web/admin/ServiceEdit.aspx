<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeBehind="ServiceEdit.aspx.cs" Inherits="Etech.CMS.Web.admin.ServiceEdit" %>

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
            <CMS:Panel ID="pnlEditServiceCategories" runat="server" SkinID="pnlBorder" Width="695px">
                <br />
                <div class="panelWrap">
                    <table>
                        <tr align="left">
                            <td>
                                <CMS:Label ID="lblServiceCategory" runat="server" Visible="True" />
                                <CMS:Label ID="lblBlogCategoryId" runat="server" Visible="False" />
                            </td>
                            <td>
                                <CMS:Label ID="lblAffiliateNews" runat="server">
                                </CMS:Label>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:TextBox ID="txtBlogCategory" runat="server" MaxLength="50" Width="250px" CssClass="longtextbox" />
                                <asp:RequiredFieldValidator ID="rfvBlogTile" runat="server" ErrorMessage="Title is Required."
                                    Display="Dynamic" ControlToValidate="txtBlogCategory" ValidationGroup="vgCategory"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rfvBlogTitle" runat="server" ControlToValidate="txtBlogCategory"
                                    ErrorMessage="Please enter valid Title." SetFocusOnError="true" Display="Dynamic"
                                    ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\-/]+$" ValidationGroup="vgCategory"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <CMS:DropDownList ID="ddlAffiliateNews" runat="server">
                                    <asp:ListItem Value="--Select--">--Select--</asp:ListItem>
                                    <asp:ListItem Value="Latest news">Latest news</asp:ListItem>
                                    <asp:ListItem Value="Upcoming Affiliate Functions">Upcoming Affiliate Functions</asp:ListItem>
                                </CMS:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please select Type"
                                    ControlToValidate="ddlAffiliateNews" ValidationGroup="vgCategory" InitialValue="--Select--"></asp:RequiredFieldValidator>
                            </td>
                            <td>
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
                    </table>
                    <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                        ValidationGroup="vgCategory" />
                    <CMS:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="button"
                        OnClick="btnCancel_Click" />
                    <br />
                </div>
            </CMS:Panel>
            <CMS:Panel ID="pnlCurrentServicesCategories" runat="server" SkinID="pnlBorder">
                <div class="panelWrap">
                    <div class="gridBox">
                        <div class="gridWrap">
                            <div style="padding: 0 10px 10px 0;" class="floatRight">
                                <CMS:LinkButton Font-Underline="true" Font-Bold="true" ID="lnkServices" OnClick="lnkServices_Click"
                                    runat="server">        
                                </CMS:LinkButton>
                            </div>
                            <CMS:DataGrid ID="dgBlogCategories" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage"
                                Width="655px" OnItemCommand="dgBlogCategories_ItemCommand" AllowPaging="true"
                                PageSize="10" OnPageIndexChanged="dgBlogCategories_PageIndexChanged">
                                <Columns>
                                    <asp:BoundColumn DataField="ServiceTitle" HeaderText="Title" ItemStyle-Width="230px"
                                        ItemStyle-Wrap="true" />
                                     <asp:BoundColumn DataField="AffiliateNews" HeaderText="News Type" ItemStyle-Width="230px"
                                        ItemStyle-Wrap="true" />
                                    <asp:TemplateColumn HeaderText="Edit">
                                        <ItemTemplate>
                                            <CMS:LinkButton ID="lblEdit" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ServiceID") %>'
                                                SkinID="Edit" CommandName="Edit"></CMS:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="lbUp" runat="server" CausesValidation="false" CommandName="Up"
                                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ServiceID") %>' OnClick="Items_ItemReorder"
                                                SkinID="up" />
                                            <asp:ImageButton ID="lbDown" runat="server" CausesValidation="false" CommandName="Down"
                                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ServiceID") %>' OnClick="Items_ItemReorder"
                                                SkinID="down" />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="Delete">
                                        <ItemTemplate>
                                            <CMS:LinkButton runat="server" ID="lbDelete" CausesValidation="false" CommandName="Delete"
                                                CommandArgument='<%# Eval("ServiceID") %>' SkinID="delete" OnClientClick="return confirm('Do you want to Delete this record?');"></CMS:LinkButton>
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
