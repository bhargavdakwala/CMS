<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="newsletterTemplates.aspx.cs" Inherits="Etech.CMS.Web.admin.newsletterTemplates" %>
<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript">
        function ValidateFCKAText(source, args) {
            var fckText = FCKeditorAPI.GetInstance('<%=txtDescriptor.ClientID %>');
            args.IsValid = fckText.GetXHTML(true) != "";
        }

        function InsertTag(source, args) {
            var fckText = FCKeditorAPI.GetInstance('<%=txtDescriptor.ClientID %>');
            if (fckText.EditMode == FCK_EDITMODE_WYSIWYG) {
                // Insert the desired HTML.
                var comboValue = document.getElementById('ctl00_ContentPlaceHolder1_ddlTemplateTag');
                var index = document.getElementById('ctl00_ContentPlaceHolder1_ddlTemplateTag').selectedIndex;
                if (comboValue.value != "0") {
                    var selectedText = document.getElementById('ctl00_ContentPlaceHolder1_ddlTemplateTag').options[index].text;
                    fckText.InsertHtml('<span>[' + selectedText + ']</span>');
                }
                else {
                    alert('Please select a tag');
                }
            }
            else
                alert('You must be on WYSIWYG mode!');
           
            //fckText.InsertHtml("<p>hello world</p>");

            //args.IsValid = fckText.GetXHTML(true) != "";
            
        }
    </script>

    <div id="mainContentRegion">
        <CMS:Panel ID="pnlEditTemplate" runat="server" SkinID="pnlBorder" Width="695px">
            <div class="panelWrap">
                <table>
                    <tr>
                        <td colspan="2">
                            <CMS:Label ID="lblDuplicateMessage" runat="server" Visible="false" ForeColor="Red"
                                Font-Size="Small" />
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <CMS:Label ID="lblTemplateTitle" runat="server" Visible="True" />
                            <CMS:Label ID="lblTemplateId" runat="server" Visible="False" />
                        </td>
                        <td>
                            <CMS:TextBox ID="txtTemplateTitle" runat="server" MaxLength="50" Width="200px" CssClass="longtextbox" />
                            <CMS:RequiredFieldValidator ID="rfvTempalteTitle" runat="server" ErrorMessage="Title is required"
                                Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtTemplateTitle"
                                ValidationGroup="vgNewsLetterTemplate"></CMS:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="refTemplateTitle" runat="server" ControlToValidate="txtTemplateTitle"
                                ErrorMessage="Please enter valid Title." SetFocusOnError="true" Display="Dynamic"
                                ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\-/]+$" ValidationGroup="vgNewsLetterTemplate"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <CMS:Label ID="lblTemplateTags" runat="server" Visible="True" />
                        </td>
                        <td>
                            <CMS:DropDownList ID="ddlTemplateTag" runat="server" AppendDataBoundItems="true">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">Customer Name</asp:ListItem>
                                <asp:ListItem Value="2">Todays Date</asp:ListItem>
                                <asp:ListItem Value="3">Email</asp:ListItem>
                            </CMS:DropDownList>
                            &nbsp;<CMS:LinkButton ID="lnkInsertTag" runat="server" OnClientClick="InsertTag();"
                                CausesValidation="false"></CMS:LinkButton>
                        </td>
                    </tr>
                    <tr align="left">
                        <td colspan="2">
                            <CMS:Label ID="lblTemplateDescriptions" runat="server" Visible="True" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <FCKeditorV2:FCKeditor ID="txtDescriptor" BasePath="~/FCKeditor/" runat="server"
                                Height="300px" Width="555px" UseBROnCarriageReturn="true" ToolbarStartExpanded="false" />
                            <br />
                            <asp:CustomValidator ID="cvcfckAText" runat="server" ErrorMessage="Description is required"
                                Display="None" ControlToValidate="txtDescriptor" ClientValidationFunction="ValidateFCKAText"
                                ValidateEmptyText="True" />
                        </td>
                    </tr>
                </table>
                <CMS:Button ID="btnSave" runat="server" CssClass="button" ValidationGroup="vgNewsLetterTemplate"
                    OnClick="btnSave_Click" />
                <CMS:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="button"
                    OnClick="btnCancel_Click" />
            </div>
        </CMS:Panel>
        <CMS:Panel ID="pnlCurrentTemplate" runat="server" SkinID="pnlBorder">
            <div class="panelWrap">
                <div class="gridBox">
                    <div class="gridWrap">
                        <div style="padding: 0 10px 10px 0;" class="floatRight">
                            <CMS:LinkButton ID="lnkAddTemplate" OnClick="lnkAddTemplate_Click" runat="server"
                                Font-Bold="true" Font-Underline="true"></CMS:LinkButton>
                        </div>
                        <CMS:DataGrid ID="dgTemplates" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage"
                            Width="655px" OnItemCommand="dgTemplates_OnItemCommand" AllowPaging="true" PageSize="10"
                            OnPageIndexChanged="dgTemplates_PageIndexChanged">
                            <Columns>
                                <asp:BoundColumn DataField="TemplateName" ItemStyle-HorizontalAlign="Left" HeaderText="Title"
                                    ItemStyle-Wrap="true" HeaderStyle-Width="200px" />
                                <asp:BoundColumn DataField="CreatedOn" ItemStyle-HorizontalAlign="Left" HeaderText="Date" />
                                <asp:TemplateColumn HeaderText="Edit">
                                    <ItemTemplate>
                                        <CMS:LinkButton runat="server" ID="lblEdit" CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "TemplateID")%>'
                                            SkinID="Edit" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Delete">
                                    <ItemTemplate>
                                        <CMS:LinkButton runat="server" ID="lbDelete" CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "TemplateID")%>'
                                            SkinID="delete" OnClientClick="return confirm('Do you want to Delete this record?');" />
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