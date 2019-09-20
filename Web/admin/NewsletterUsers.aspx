<%@ Page Title="NewsLetter User" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeBehind="NewsletterUsers.aspx.cs" Inherits="Etech.CMS.Web.admin.NewsletterUsers" %>

<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <CMS:Panel ID="pnlNewsUserSearch" runat="server" SkinID="pnlBorder">
        <div class="panelWrap">
            <CMS:Label ID="lblSearchBy" runat="server" CssClass="label" /><br />
            <br />
            <asp:DropDownList ID="ddlSearchBy" runat="server" CssClass="dropdownlist" />
            &nbsp;
            <asp:TextBox ID="txtSearchBy" runat="server" CssClass="textbox" MaxLength="50" />&nbsp;
            <CMS:Button ID="btnSearch" runat="server" CssClass="button" OnClick="btnSearch_Click" />
        </div>
        <div style="padding-left: 150px">
            <asp:RegularExpressionValidator ID="regexUserNameName" runat="server" ControlToValidate="txtSearchBy"
                ErrorMessage="Please enter valid name/email address." SetFocusOnError="true"
                Display="Dynamic" ValidationExpression="^[a-zA-Z0-9()/@&,|' ?.-]+$"></asp:RegularExpressionValidator>
        </div>
    </CMS:Panel>
    <CMS:Panel ID="pnlNewsUserList" runat="server" SkinID="pnlBorder">
        <div class="gridBox">
            <div class="gridWrap">
                <div style="padding: 0 10px 10px 0;">
                    <CMS:Label ID="lblTotalUsers" runat="server" CssClass="floatLeft" />&nbsp;<CMS:Label
                        ID="lblNumberOfTotalUsers" runat="server" />
                </div>
                <asp:GridView ID="dgUserList" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    GridLines="None" DataKeyNames="UserID,GroupID"
                    OnRowCancelingEdit="dgUserList_RowCancelingEdit" 
                    OnRowDataBound="dgUserList_RowDataBound" AllowPaging="true" PageSize="10"
                    OnRowEditing="dgUserList_RowEditing" 
                    OnRowUpdating="dgUserList_RowUpdating" AllowSorting="true" 
                    OnSorting="dgUserList_Sorting" onpageindexchanging="dgUserList_PageIndexChanging">
                    
                    <Columns>
                    
                        <asp:BoundField DataField="UserID" Visible="false" HeaderText="UserID" />
                        <asp:TemplateField HeaderText="User Name" SortExpression="UserName" HeaderStyle-Wrap="false">
                            <HeaderStyle HorizontalAlign="center" Font-Bold="true" ForeColor="Black" Font-Underline="true"/>
                          
                            <ItemTemplate>
                                <asp:Label ID="hlUserEdit" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                <%--<CMS:HyperLink ID="hlUserEdit" runat="server" Text='<%# Eval("UserName") %>' SkinID="submodal-640-500" />--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email Address">
                            <HeaderStyle HorizontalAlign="center" Font-Bold="true" />
                            <ItemTemplate>
                                <CMS:HyperLink ID="EmailLink" runat="server" NavigateUrl='<%# Eval("Email", "mailto:{0}") %>'
                                    Text='<%# Eval("Email") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="SubscriptionDate" ReadOnly="True" SortExpression="SubscriptionDate"
                            HeaderText="Subscription Date" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Underline="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" />
                        <asp:TemplateField HeaderText="Group Name" HeaderStyle-Wrap="false">
                            <HeaderStyle HorizontalAlign="center" Font-Bold="true"/>
                            <ItemTemplate>
                                <asp:Label ID="lblGroupName" Visible='<%# !(bool) IsInEditMode %>' runat="server"
                                    Text='<%#Eval("GroupName")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList AutoPostBack="false" ID="ddlGroup" DataTextField="GroupName" DataValueField="GroupID"
                                    runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <HeaderStyle HorizontalAlign="center" Font-Bold="true" />
                            <ItemTemplate>
                                <asp:Label ID="lblACtive" Text='<%# Eval("IsActive") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <CMS:CheckBox runat="server" ID="chkActiveEdit" AutoPostBack="true" Checked='<%#DataBinder.Eval(Container.DataItem, "IsActive")%>'
                                    Value='<%#DataBinder.Eval(Container.DataItem, "UserName")%>' />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit" ShowHeader="False" HeaderStyle-HorizontalAlign="Left">
                         <HeaderStyle HorizontalAlign="center" Font-Bold="true" />
                            <EditItemTemplate>
                                <asp:LinkButton ID="lbkUpdate" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update"></asp:LinkButton>
                                <asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>                           
                            <ItemTemplate>
                                <CMS:LinkButton ID="lnkEdit" SkinID="Edit" runat="server" CausesValidation="False" CommandName="Edit">
                                </CMS:LinkButton>
                                    
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                         <HeaderStyle HorizontalAlign="center" Font-Bold="true" />
                            <ItemTemplate>
                                <CMS:LinkButton runat="server" ID="lbDelete" CommandName="mydelete" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "UserID")%>'
                                    OnCommand="lbDelete_Click" SkinID="delete" OnClientClick="return confirm('Do you want to Delete this record?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="header" />
                    <PagerStyle HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                </asp:GridView>
            </div>
        </div>
        <br />
        <CMS:HyperLink ID="hlShowAll" runat="server" NavigateUrl="~/admin/userlist.aspx"
            SkinID="showAll" Visible="false" />
    </CMS:Panel>
</asp:Content>
