<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeBehind="CommonBanner.aspx.cs" Inherits="Etech.CMS.Web.admin.CommonBanner" %>

<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <CMS:Panel ID="pnlEditPage" runat="server" SkinID="pnlBorder">
        <div class="panelWrap">
            <table width="100%" cellspacing="15px" cellspacing="6px">
                <tr>
                    <td valign="top">
                        <CMS:Label ID="lblImageId" runat="server" Visible="false" />
                        <asp:Label ID="lblFileUpload" runat="server" Text="Browse Image:"></asp:Label>
                    </td>
                    <td>
                     
                        <asp:FileUpload ID="fuFile" runat="server" />
                        <CMS:HelpLink ID="helpImageCommonBanner" runat="server" NavigateUrl="javascript:void(0);"></CMS:HelpLink>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="vgCategory"
                            runat="server" ControlToValidate="fuFile" ErrorMessage="Please Browse Image"
                            Display="None">  
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revImage" ValidationGroup="vgCategory" ControlToValidate="fuFile"
                            ValidationExpression="^.*\.((j|J)(p|P)(e|E)?(g|G)|(g|G)(i|I)(f|F)|(p|P)(n|N)(g|G))$"
                            Text="Invalid image type" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:Label ID="lblURL" runat="server" Text="URL:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtURLTitle" runat="server" ValidationGroup="vgCategory"></asp:TextBox>
                        <CMS:HelpLink ID="hplValidURL" runat="server" NavigateUrl="javascript:void(0);"></CMS:HelpLink>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vgCategory"
                            runat="server" ControlToValidate="txtURLTitle" ErrorMessage="Please Enter URL"
                            Display="None">  
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="None" ID="RegularExpressionValidator1" ValidationGroup="vgCategory"
                            runat="server" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"
                            ControlToValidate="txtURLTitle" ErrorMessage="Please Enter valid URL!"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <CMS:Button ID="btnSave" runat="server" CssClass="button" ValidationGroup="vgCategory"
                            OnClick="btnSave_Click" />
                        <CMS:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="button"
                            OnClick="btnCancel_Click" />
                        <asp:ValidationSummary ID="vgCategory" ValidationGroup="vgCategory" runat="server"
                            DisplayMode="List" ShowSummary="false" ShowMessageBox="true" />
                    </td>
                </tr>
            </table>
        </div>
    </CMS:Panel>

    <br /><br />
        <CMS:Panel ID="panelUpdate" runat="server" SkinID="pnlBorder">
        <div class="panelWrap">
            <table width="100%" cellspacing="15px" cellspacing="6px">
                <tr>
                    <td valign="top">
                        <CMS:Label ID="lblUpdateImageID" runat="server" Visible="false" />
                        <asp:Label ID="lblFuUpload" runat="server" Text="Image:"></asp:Label>
                    </td>
                    <td>
                           <asp:Image ID="imgFileUploaded" runat="server" />
                      
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:Label ID="lblUpdateURLTitle" runat="server" Text="URL Title:" ></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="textUpdateURL" runat="server" ValidationGroup="vgBanner"></asp:TextBox>
                        <CMS:HelpLink ID="hplUpdateURL" runat="server" NavigateUrl="javascript:void(0);"></CMS:HelpLink>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="vgBanner"
                            runat="server" ControlToValidate="textUpdateURL" ErrorMessage="Please Enter URL"
                            Display="None">  
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="None" ID="RegularExpressionValidator3" ValidationGroup="vgBanner"
                            runat="server" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"
                            ControlToValidate="textUpdateURL" ErrorMessage="Please Enter valid URL!"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <CMS:Button ID="btnUpdate" runat="server" CssClass="button" ValidationGroup="vgBanner"
                            OnClick="btnUpdate_Click" />
                        <CMS:Button ID="btnUpdateCancel" runat="server" CausesValidation="False" CssClass="button"
                            OnClick="btnUpdateCancel_Click" />
                        <asp:ValidationSummary ID="vsUpdate" ValidationGroup="vgBanner" runat="server"
                            DisplayMode="List" ShowSummary="false" ShowMessageBox="true" />
                    </td>
                </tr>
            </table>
        </div>
    </CMS:Panel>

    <br />
    <br />
    <CMS:Panel ID="pnlBannerImages" runat="server" SkinID="pnlBorder">
        <div class="panelWrap">
            <div class="gridBox">
                <div class="gridWrap">
                    <div style="padding: 0 10px 10px 0;" class="floatRight">
                        <CMS:LinkButton Font-Underline="true" Font-Bold="true" ID="lnkAddCommonBanner" runat="server"
                            OnClick="lnkAddTherapists_Click">        
                        </CMS:LinkButton>
                    </div>
                    <CMS:DataGrid ID="dgProductImages" runat="server" AutoGenerateColumns="false" SkinID="adminDataGrid">
                        <PagerStyle Mode="NumericPages" Position="Bottom" />
                        <Columns>
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <CMS:HyperLink ID="hlImage" runat="server" NavigateUrl="javascript:void(0);">
                                    <asp:Image ID="productImage" Width="50px" Height="50px" runat="server" ImageUrl='<%# Etech.CMS.Core.ImageProcess.GetGalleryThumbnailUrl((string)Eval("ImagePath")) %>'  />
                                   </CMS:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="ImageTitle" ItemStyle-HorizontalAlign="center" />
                            <asp:BoundColumn DataField="SortOrder" ItemStyle-HorizontalAlign="center" />
                  
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
                                    <CMS:LinkButton ID="lbEdit" runat="server" CausesValidation="false" SkinID="edit"
                                        CommandName="Edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ImageId") %>'
                                        OnCommand="lbEdit_Click" />
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
</asp:Content>
