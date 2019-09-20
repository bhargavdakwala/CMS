<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeBehind="contentAddEdit.aspx.cs" Inherits="Etech.CMS.Web.admin.contentAddEdit"
    EnableEventValidation="false" %>

<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" language="javascript">
        function checkTextAreaMaxLength(textBox, e, length) {

            var mLen = textBox["MaxLength"];
            if (null == mLen)
                mLen = length;

            var maxLength = parseInt(mLen);
            if (!checkSpecialKeys(e)) {
                if (textBox.value.length > maxLength - 1) {
                    if (window.event)//IE
                        e.returnValue = false;
                    else//Firefox
                        e.preventDefault();
                }
            }
        }
        function checkSpecialKeys(e) {
            if (e.keyCode != 8 && e.keyCode != 46 && e.keyCode != 37 && e.keyCode != 38 && e.keyCode != 39 && e.keyCode != 40)
                return false;
            else
                return true;
        }      
    </script>
    <CMS:Panel ID="pnlCurrentPages" runat="server" Height="50%" SkinID="pnlBorder">
        <div class="panelWrap">
            <div class="gridBox">
                <div class="gridWrap">
                    <div align="right">
                        <CMS:LinkButton ID="lnkbtnAddPage" runat="server" CausesValidation="false" Font-Bold="true"
                            OnClick="lnkbtnAddPage_Click" Font-Underline="true"></CMS:LinkButton>
                    </div>
                </div>
            </div>
            <table class="adminTable" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="gridBox pageGrid">
                            <div class="gridWrap">
                                <asp:UpdatePanel ID="upPanel" runat="server">
                                    <ContentTemplate>
                                        <table width="100%" align="center" cellspacing="0" cellpadding="0">
                                            <CMS:Repeater ID="rptParentPages" runat="server" OnItemDataBound="rptParentPages_ItemDataBound"
                                                OnItemCommand="rptParentPages_ItemCommand" SkinID="adminDataGridNoPage">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td id="tdParentName" runat="server" width="70%" class="header">
                                                            <asp:Label ID="lblParentPageName" runat="server" Text='<%# DataBinder.Eval(Container, "dataitem.PageName")%>'></asp:Label>
                                                            <asp:Label ID="lblParentPageID" runat="server" Text='<%# DataBinder.Eval(Container, "dataitem.PageId")%>'
                                                                Visible="false"></asp:Label>
                                                        </td>
                                                        <td align="right" id="tdParent" runat="server" class="header">
                                                            <table class="buttons" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td nowrap="nowrap" id="tdParentUpImage" runat="server" align="center" class="parentGridIcon">
                                                                        <asp:ImageButton ID="lbUpParent" runat="server" CausesValidation="false" CommandName="UpParent"
                                                                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>' SkinID="upParent" />
                                                                    </td>
                                                                    <td id="tdParentDownImage" runat="server" class="parentGridIcon" align="center">
                                                                        <asp:ImageButton ID="lbDownParent" runat="server" CausesValidation="false" CommandName="DownParent"
                                                                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>' SkinID="downParent" />
                                                                    </td>
                                                                    <td id="tdParentEditImage" runat="server" class="parentGridIcon" align="center">
                                                                        <CMS:LinkButton ID="lblEditlnk" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>'
                                                                            CommandName="EditParent" SkinID="edit"></CMS:LinkButton>
                                                                    </td>
                                                                    <td id="tdParentDeleteImage" runat="server" class="parentGridIcon" align="center">
                                                                        <CMS:LinkButton ID="lblDeleteParent" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>'
                                                                            CommandName="DeleteParent" BorderStyle="None" OnClientClick="return confirm('Do you want to Delete this record?');"
                                                                            SkinID="delete"></CMS:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="5" style="padding: 0; padding: 10px 0 10px 20px;">
                                                            <table width="100%" align="right" cellspacing="0" cellpadding="0">
                                                                <CMS:Repeater ID="rptChildPages" runat="server" OnItemDataBound="rptChildPages_ItemDataBound"
                                                                    OnItemCommand="rptChildPages_ItemCommand">
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td id="tdChildName" runat="server">
                                                                                <asp:Label ID="lblChildPageName" runat="server" Text='<%# DataBinder.Eval(Container, "dataitem.PageName")%>'></asp:Label>
                                                                                <asp:Label ID="lblChildPageID" runat="server" Text='<%# DataBinder.Eval(Container, "dataitem.PageId")%>'
                                                                                    Visible="false"></asp:Label>
                                                                            </td>
                                                                            <td align="right" id="tdChild" runat="server">
                                                                                <table class="buttons" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td nowrap="nowrap" id="tdChildUpImage" runat="server" align="center" class="childGridIcon">
                                                                                            <asp:ImageButton ID="lbUpChild" runat="server" CausesValidation="false" CommandName="UpChild"
                                                                                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>' SkinID="up" />
                                                                                        </td>
                                                                                        <td id="tdChildDownImage" runat="server" align="center" class="childGridIcon">
                                                                                            <asp:ImageButton ID="lbDownChild" runat="server" CausesValidation="false" CommandName="DownChild"
                                                                                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>' SkinID="down" />
                                                                                        </td>
                                                                                        <td id="tdChildEditImage" runat="server" align="center" class="childGridIcon">
                                                                                            <CMS:LinkButton ID="ImageButton1" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>'
                                                                                                SkinID="edit" CommandName="EditChild" />
                                                                                        </td>
                                                                                        <td id="tdChildDeleteImage" runat="server" align="center" class="childGridIcon">
                                                                                            <CMS:LinkButton ID="lbDelete" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>'
                                                                                                SkinID="Delete" CommandName="Delete" OnClientClick="return confirm('Do you want to Delete this record?');" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="5" style="padding: 0; padding: 10px 0 5px 20px;">
                                                                                <table width="100%" align="right" cellspacing="0" cellpadding="0">
                                                                                    <CMS:Repeater ID="rptGrandChildPages" runat="server" OnItemDataBound="rptGrandChildPages_ItemDataBound"
                                                                                        OnItemCommand="rptGrandChildPages_ItemCommand">
                                                                                        <ItemTemplate>
                                                                                            <tr>
                                                                                                <td id="tdGrandChildName" runat="server">
                                                                                                    <asp:Label ID="lblGrandChildPageName" runat="server" Text='<%# DataBinder.Eval(Container, "dataitem.PageName")%>'></asp:Label>
                                                                                                    <asp:Label ID="lblGrandChildPageID" runat="server" Text='<%# DataBinder.Eval(Container, "dataitem.PageId")%>'
                                                                                                        Visible="false"></asp:Label>
                                                                                                </td>
                                                                                                <td align="right" id="tdGrandChild" runat="server">
                                                                                                    <table class="buttons" cellspacing="0" cellpadding="0">
                                                                                                        <tr>
                                                                                                            <td nowrap="nowrap" id="tdGrandChildUpImage" runat="server" align="center" class="childGridIcon">
                                                                                                                <asp:ImageButton ID="lbUpGrandChild" runat="server" CausesValidation="false" CommandName="UpGrandChild"
                                                                                                                    CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>' SkinID="up" />
                                                                                                            </td>
                                                                                                            <td id="tdGrandChildDownImage" runat="server" align="center" class="childGridIcon">
                                                                                                                <asp:ImageButton ID="lbDownGrandChild" runat="server" CausesValidation="false" CommandName="DownGrandChild"
                                                                                                                    CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>' SkinID="down" />
                                                                                                            </td>
                                                                                                            <td id="tdGrandChildEditImage" runat="server" align="center" class="childGridIcon">
                                                                                                                <CMS:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>'
                                                                                                                    SkinID="edit" CommandName="EditGrandChild" />
                                                                                                            </td>
                                                                                                            <td id="tdGrandChildDeleteImage" runat="server" align="center" class="childGridIcon">
                                                                                                                <CMS:LinkButton ID="lbDeleteGrandChild" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>'
                                                                                                                    SkinID="Delete" CommandName="DeleteGrandChild" OnClientClick="return confirm('Do you want to Delete this record?');" />
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="5" style="padding: 0; padding: 10px 0 5px 20px;">
                                                                                                    <table width="100%" align="right" cellspacing="0" cellpadding="0">
                                                                                                        <CMS:Repeater ID="rptSubGrandChild" runat="server" OnItemDataBound="rptSubGrandChild_ItemDataBound"
                                                                                                            OnItemCommand="rptSubGrandChild_ItemCommand">
                                                                                                            <ItemTemplate>
                                                                                                                <tr>
                                                                                                                    <td id="tdGrandChildName" runat="server">
                                                                                                                        <asp:Label ID="lblGrandChildPageName" runat="server" Text='<%# DataBinder.Eval(Container, "dataitem.PageName")%>'></asp:Label>
                                                                                                                        <asp:Label ID="lblGrandChildPageID" runat="server" Text='<%# DataBinder.Eval(Container, "dataitem.PageId")%>'
                                                                                                                            Visible="false"></asp:Label>
                                                                                                                    </td>
                                                                                                                    <td align="right" id="tdGrandChild" runat="server">
                                                                                                                        <table class="buttons" cellspacing="0" cellpadding="0">
                                                                                                                            <tr>
                                                                                                                                <td nowrap="nowrap" id="tdGrandChildUpImage" runat="server" align="center" class="childGridIcon">
                                                                                                                                    <asp:ImageButton ID="lbUpGrandChild" runat="server" CausesValidation="false" CommandName="UpGrandChild"
                                                                                                                                        CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>' SkinID="up" />
                                                                                                                                </td>
                                                                                                                                <td id="tdGrandChildDownImage" runat="server" align="center" class="childGridIcon">
                                                                                                                                    <asp:ImageButton ID="lbDownGrandChild" runat="server" CausesValidation="false" CommandName="DownGrandChild"
                                                                                                                                        CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>' SkinID="down" />
                                                                                                                                </td>
                                                                                                                                <td id="tdGrandChildEditImage" runat="server" align="center" class="childGridIcon">
                                                                                                                                    <CMS:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>'
                                                                                                                                        SkinID="edit" CommandName="EditGrandChild" />
                                                                                                                                </td>
                                                                                                                                <td id="tdGrandChildDeleteImage" runat="server" align="center" class="childGridIcon">
                                                                                                                                    <CMS:LinkButton ID="lbDeleteGrandChild" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>'
                                                                                                                                        SkinID="Delete" CommandName="DeleteGrandChild" OnClientClick="return confirm('Do you want to Delete this record?');" />
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                        </table>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </ItemTemplate>
                                                                                                        </CMS:Repeater>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </ItemTemplate>
                                                                                    </CMS:Repeater>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </CMS:Repeater>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </CMS:Repeater>
                                        </table>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="rptParentPages" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <CMS:LinkButton ID="lnkPrevious" runat="server" Font-Bold="true" Font-Size="Medium"
                            OnClick="lnkPrevious_Click"></CMS:LinkButton>
                        &nbsp;&nbsp;
                        <CMS:LinkButton ID="lnkNext" runat="server" Font-Bold="true" Font-Size="Medium" OnClick="lnkNext_Click"></CMS:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </CMS:Panel>
    <CMS:Panel ID="pnlEditPage" runat="server" SkinID="pnlBorder" Visible="false">
        <div class="panelWrap">
            <table width="100%">
                <tr>
                    <td valign="top" colspan="2">
                        <table width="100%">
                            <tr>
                                <td width="50%" valign="top">
                                    <CMS:Label ID="lblPageId" runat="server" Visible="false" />
                                    <CMS:Label ID="lblParentPage" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink
                                        ID="helpParentPage" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                    <asp:DropDownList ID="ddlParentPage" runat="server" CssClass="fwdropdownlist" />
                                    <br />
                                    <br />
                                    <CMS:Label ID="lblURLTitle" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink
                                        ID="helpURLTitlePage" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                    <asp:TextBox ID="txtURLTitle" runat="server" CssClass="longtextbox" /><br />
                                    <asp:RequiredFieldValidator ID="rfvURLTitle" runat="server" ControlToValidate="txtURLTitle"
                                        Display="Dynamic" ErrorMessage="Please enter the URL title." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regexURLTitle" runat="server" ControlToValidate="txtURLTitle"
                                        ErrorMessage="Please enter valid URL title." SetFocusOnError="true" Display="Dynamic"
                                        ValidationExpression="^[a-zA-Z/\s:.-]+$"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                                <td width="50%">
                                    <CMS:Label ID="lblTitle" runat="server" CssClass="label" />&nbsp;
                                    <CMS:HelpLink ID="helpTitle" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                    <asp:TextBox ID="txtTitle" runat="server" CssClass="multilinetextbox" MaxLength="250"
                                        TextMode="MultiLine" />
                                    <br />
                                    <asp:RegularExpressionValidator ID="regexTitle" runat="server" ControlToValidate="txtTitle"
                                        ErrorMessage="Please enter valid title." SetFocusOnError="true" Display="Dynamic"
                                        ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\{}\-/]+$"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <CMS:Label ID="lblPageName" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink
                                        ID="helpPageName" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                    <asp:TextBox ID="txtPageName" runat="server" CssClass="longtextbox" MaxLength="100" /><br />
                                    <asp:RequiredFieldValidator ID="rfvPageName" runat="server" ControlToValidate="txtPageName"
                                        Display="Dynamic" ErrorMessage="Please enter Page Name." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regexPageName" runat="server" ControlToValidate="txtPageName"
                                        ErrorMessage="Please enter valid Page Name." SetFocusOnError="true" Display="Dynamic"
                                        ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\{}\-/]+$"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                                <td valign="top">
                                    <CMS:Label ID="lblMenuTitle" runat="server" CssClass="label" />&nbsp;
                                    <CMS:HelpLink ID="helpMenuTitle" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                    <asp:TextBox ID="txtMenuTitle" runat="server" CssClass="textbox" Width="200px" /><br />
                                    <asp:RegularExpressionValidator ID="regexMenuTitle" runat="server" ControlToValidate="txtMenuTitle"
                                        ErrorMessage="Please enter valid menu title." SetFocusOnError="true" Display="Dynamic"
                                        ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\{}\-/]+$"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <CMS:Label ID="lblPageRedirect" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink
                                        ID="helpPageRedirect" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                    <asp:DropDownList ID="ddlPageRedirect" runat="server" CssClass="fwdropdownlist" AutoPostBack="True" />
                                    <br />
                                    <br />
                                </td>
                                <td>
                                    <CMS:Label ID="lblPageTemplate" runat="server" CssClass="label" />&nbsp;
                                    <CMS:HelpLink ID="helpPageTemplate" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                    <asp:DropDownList ID="ddlPageTemplate" runat="server" CssClass="fwdropdownlist" />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="verticalalign">
                                        <CMS:Label ID="lblKeywords" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink
                                            ID="helpKeywords" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                    </div>
                                    <asp:TextBox ID="txtKeywords" runat="server" CssClass="multilinetextbox" MaxLength="250"
                                        TextMode="MultiLine" /><br />
                                    <asp:RegularExpressionValidator ID="regKeywords" runat="server" ControlToValidate="txtKeywords"
                                        ErrorMessage="Please enter valid keywords." SetFocusOnError="true" Display="Dynamic"
                                        ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&_!.\{}\-/]+$"
                                        ValidationGroup="btnContent"></asp:RegularExpressionValidator><br />
                                    <br />
                                </td>
                                <td>
                                    <div class="verticalalign">
                                        <CMS:Label ID="lblDescription" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink
                                            ID="helpDescription" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                    </div>
                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="multilinetextbox" MaxLength="250"
                                        TextMode="MultiLine" /><br />
                                    <asp:RegularExpressionValidator ID="regDescription" runat="server" ControlToValidate="txtDescription"
                                        ErrorMessage="Please enter valid description." SetFocusOnError="true" Display="Dynamic"
                                        ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\{}\-/]+$"></asp:RegularExpressionValidator><br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="chkIsDownLoad" runat="server" />&nbsp;  
                                    <CMS:Label ID="lblIsDownload" runat="server" CssClass="label" />
                                      <br />  <br />
                                </td>
                            </tr>
                            <%--<tr>
                                <td colspan="2">
                                    <CMS:Label ID="lblBanner" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink ID="helpBanner"
                                        runat="server" NavigateUrl="javascript:void(0);" /><br />
                                    <asp:TextBox ID="txtBanner" runat="server" CssClass="longtextbox" />
                                    &nbsp;<CMS:HyperLink ID="hlBannerImage" runat="server" SkinID="submodal-800-430"
                                        Text="Browse" />&nbsp;<CMS:HelpLink ID="helpBannerFile" runat="server" NavigateUrl="javascript:void(0);"></CMS:HelpLink>
                                    <CMS:Button ID="btnBanner" runat="server" CssClass="button" Text="Delete" CausesValidation="false"
                                        OnClick="btnBanner_Click" /><br />
                                    <asp:RegularExpressionValidator ID="rfvBannerSelecter" runat="server" ControlToValidate="txtBanner"
                                        ErrorMessage="Please enter valid Banner." SetFocusOnError="true" Display="Dynamic"
                                        ValidationExpression="^[a-zA-Z0-9()~:/ ?.-]+$"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                               
                            </tr>--%>
                            <tr>
                              
                                <td colspan="2">
                                    <CMS:Label ID="lblPageTitleImage" runat="server" CssClass="label" />
                                    <br />
                                    <asp:TextBox ID="txtPageTitleImage" runat="server" CssClass="longtextbox" />
                                    &nbsp;<CMS:HyperLink ID="hlImageSelector" runat="server" SkinID="submodal-800-430"
                                        Text="Browse" />&nbsp;<CMS:HelpLink ID="helpImageFile" runat="server" NavigateUrl="javascript:void(0);"></CMS:HelpLink>
                                    <CMS:Button ID="btnBigDelete" runat="server" CssClass="button" OnClick="btnBigDelete_Click"
                                        Text="Delete" CausesValidation="false" /><br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPageTitleImage"
                                        ErrorMessage="Please enter valid Page Title Image." SetFocusOnError="true" Display="Dynamic"
                                        ValidationExpression="^[a-zA-Z0-9()~:_=&/ ?.-]+$"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                            </tr>
                            <%--<tr>
                                <td colspan="2">
                                    <CMS:Label ID="lblMenuTitelImage" runat="server" CssClass="label" />
                                    <br />
                                    <asp:TextBox ID="txtMenuTitelImage" runat="server" CssClass="longtextbox" />
                                    &nbsp;<CMS:HyperLink ID="hlMenuTitleImage" runat="server" SkinID="submodal-800-430"
                                        Text="Browse" />&nbsp;<CMS:HelpLink ID="helpMenuTitleImage" runat="server" NavigateUrl="javascript:void(0);"></CMS:HelpLink>
                                    <CMS:Button ID="btnMenuTitleImage" runat="server" CssClass="button" Text="Delete"
                                        CausesValidation="false" OnClick="btnMenuTitleImage_Click" /><br />
                                    <asp:RegularExpressionValidator ID="rfvMenuTitleImage" runat="server" ControlToValidate="txtMenuTitelImage"
                                        ErrorMessage="Please enter valid Menu Title Image." SetFocusOnError="true" Display="Dynamic"
                                        ValidationExpression="^[a-zA-Z0-9()~:/ ?.-]+$"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                            </tr>--%>
                            <%--<tr>
                                <td colspan="2">
                                    <CMS:Label ID="lblMenuTitleHoverImage" runat="server" CssClass="label" />
                                    <br />
                                    <asp:TextBox ID="txtMenuTitleHoverImage" runat="server" CssClass="longtextbox" />
                                    &nbsp;<CMS:HyperLink ID="hlMenuTitleHoverImage" runat="server" SkinID="submodal-800-430"
                                        Text="Browse" />&nbsp;<CMS:HelpLink ID="helpMenuTitleHoverImage" runat="server" NavigateUrl="javascript:void(0);"></CMS:HelpLink>
                                    <CMS:Button ID="btnMenuTitleHoverImage" runat="server" CssClass="button" Text="Delete"
                                        CausesValidation="false" OnClick="btnMenuTitleHoverImage_Click" /><br />
                                    <asp:RegularExpressionValidator ID="rfvMenuTitleHoverImage" runat="server" ControlToValidate="txtMenuTitleHoverImage"
                                        ErrorMessage="Please enter valid Menu Title Hover Image." SetFocusOnError="true"
                                        Display="Dynamic" ValidationExpression="^[a-zA-Z0-9()~:/ ?.-]+$"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                            </tr>--%>
                        </table>
                        <CMS:Panel ID="pnlRegions" runat="server" Visible="false">
                            <div class="gridBox">
                                <div class="gridWrap">
                                    <div style="padding: 0 10px 10px 0;" class="floatRight">
                                        <CMS:HyperLink ID="hlAddRegion" runat="server" SkinID="submodal-900-500" ForeColor="#157797"
                                            Font-Bold="true" Font-Underline="true" />
                                    </div>
                                    <CMS:DataGrid ID="dgRegions" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage"
                                        OnItemDataBound="dgRegions_ItemDataBound">
                                        <Columns>
                                            <asp:TemplateColumn>
                                                <ItemTemplate>
                                                    <CMS:HyperLink ID="hlEditRegion" runat="server" SkinID="submodal-900-500" ForeColor="Black" />
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn>
                                                <ItemTemplate>
                                                    <%# Eval("TemplateRegion.Name") %>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="Title" />
                                            <asp:BoundColumn DataField="SortOrder" />
                                            <asp:TemplateColumn>
                                                <ItemTemplate>
                                                    <CMS:HyperLink ID="hlEdit" runat="server" SkinID="submodaledit" />
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn>
                                                <ItemTemplate>
                                                    <CMS:LinkButton ID="lbDelete" runat="server" CommandArgument='<%# Eval("RegionId") %>'
                                                        OnCommand="lbDelete_Click" SkinID="delete" OnClientClick="return confirm('Do you want to Delete this record?');" />
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                    </CMS:DataGrid>
                                </div>
                            </div>
                            <br />
                        </CMS:Panel>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                            ValidationGroup="btnContent" />&nbsp;&nbsp;
                        <CMS:Button ID="btnCancel" runat="server" CssClass="button" OnClick="btnCancel_Click"
                            CausesValidation="false" />
                    </td>
                </tr>
            </table>
        </div>
    </CMS:Panel>
</asp:Content>
