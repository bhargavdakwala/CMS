<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="descriptors.ascx.cs"
    Inherits="Etech.CMS.Web.admin.controls.product.descriptors" %>
<%--<asp:UpdateProgress ID="upDisplay" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="up"
    DisplayAfter="100" />--%>
<CMS:Panel ID="pnlProductDescriptors" runat="server">
    <%--<asp:UpdatePanel ID="up" runat="server" UpdateMode="Always">
        <ContentTemplate>--%>
            <CMS:Panel ID="pnlGrid" runat="server">
                <div class="gridBox">
                    <div class="gridWrap">
                        <CMS:DataGrid ID="dgDescriptors" runat="server" AutoGenerateColumns="false" DataKeyField="DescriptorId"
                            OnEditCommand="Edit_Descriptor" OnDeleteCommand="Delete_Descriptor" SkinID="adminDataGrid">
                            <HeaderStyle CssClass="adminTableHeader" />
                            <Columns>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <CMS:LinkButton ID="lbEdit" runat="server" SkinID="edit" CausesValidation="false"
                                            CommandName="Edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "DescriptorId") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="lbUp" runat="server" CausesValidation="false" CommandName="Up"
                                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "DescriptorId") %>'
                                            OnClick="Items_ItemReorder" SkinID="up" />
                                        <asp:ImageButton ID="lbDown" runat="server" CausesValidation="false" CommandName="Down"
                                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "DescriptorId") %>'
                                            OnClick="Items_ItemReorder" SkinID="down" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="Title" />
                                <asp:BoundColumn DataField="SortOrder" />
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <%# GetStrippedDescriptor(DataBinder.Eval(Container.DataItem, "DescriptorX").ToString()) %>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <CMS:LinkButton ID="lbDelete" runat="server" SkinID="delete" CausesValidation="false"
                                            CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "DescriptorId") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </CMS:DataGrid>
                    </div>
                </div>
                <br />
                <br />
            </CMS:Panel>
               <CMS:Panel ID="pnlAddDescription" runat="server">
        <div class="panelWrap">
            <br />
            <CMS:Label ID="lblDescriptorId" runat="server" Visible="false" />
            <CMS:Label ID="lblTitle" runat="server" CssClass="label" /><br />
            <asp:TextBox ID="txtTitle" runat="server" CssClass="longtextbox" />&nbsp;<CMS:HelpLink
                ID="helpDescriptorTitle" runat="server" NavigateUrl="javascript:void(0);" /><br />
            <asp:RegularExpressionValidator ID="regexTitle" runat="server" ControlToValidate="txtTitle"
                ErrorMessage="Please enter valid title." SetFocusOnError="true" Display="Dynamic"
                ValidationExpression="^[a-zA-Z0-9()/&,|' ?.-]+$"></asp:RegularExpressionValidator>
            <CMS:RequiredFieldValidator ID="rfvTitle" runat="server" Display="None" ControlToValidate="txtTitle" />
            <br />
            <div class="verticalalign">
                <CMS:Label ID="lblDescription" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink
                    ID="helpDescriptorDescription" runat="server" NavigateUrl="javascript:void(0);" /><br />
            </div>
            <FCKeditorV2:FCKeditor ID="txtDescriptor" BasePath="~/FCKeditor/" runat="server"
                Height="400" Width="100%" UseBROnCarriageReturn="true" ToolbarStartExpanded="false" />
            <br />
            <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" />
        </div>
    </CMS:Panel>
    <%--    </ContentTemplate>
    </asp:UpdatePanel>--%>
   
</CMS:Panel>
