<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Blog.ascx.cs" Inherits="Etech.CMS.Web.controls.content.Blog" %>
<div class="contentArea">
    <div class="innerWarp">
        <div id="LeftContent">
            <div class="leftBlock floatLeft">
                <div class="blog_left_block">
                    <div class="recently_posted_block">
                        <h5>
                            RECENTLY POSTED</h5>
                    </div>
                    <ul>
                        <asp:Repeater ID="dgRecentPostHeader" runat="server" OnItemCommand="dgRecentPostHeader_ItemCommand">
                            <ItemTemplate>
                                <li>
                                    <%--<asp:LinkButton ID="lnkCategory" Text='<%# DataBinder.Eval(Container.DataItem, "BlogTitle").ToString().Length > 100 ? DataBinder.Eval(Container.DataItem, "BlogTitle").ToString().Substring(0, 100) + " " : DataBinder.Eval(Container.DataItem, "BlogTitle").ToString()%>'
                                        CommandName="RecentPostedBlog" CommandArgument='<%# Eval("BlogID")%> ' runat="server"></asp:LinkButton>--%>

                                        <asp:HyperLink id="lnkCategory" runat="server" NavigateUrl='<%#Eval("URLTitle") + ".aspx" %> ' Text='<%# DataBinder.Eval(Container.DataItem, "BlogTitle").ToString().Length > 100 ? DataBinder.Eval(Container.DataItem, "BlogTitle").ToString().Substring(0, 100) + " " : DataBinder.Eval(Container.DataItem, "BlogTitle").ToString()%>'  ></asp:HyperLink>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
                <div class="cetegory">
                    <h6>
                        CATEGORY</h6>
                    <ul>
                        <asp:Repeater ID="rptrCategory" runat="server" OnItemCommand="rptrCategory_ItemCommand"
                            OnItemDataBound="rptrCategory_ItemDataBound">
                            <ItemTemplate>
                                <%--<asp:Label ID="lbl" Text='<%# DataBinder.Eval(Container.DataItem, "CategoryID")%>'
                                    runat="server" Visible="false"></asp:Label>--%>
                                <li>
                                    <asp:HyperLink id="lnkCategory" runat="server" NavigateUrl='<%#Eval("URLTitle") + ".aspx" %> ' Text='<%# DataBinder.Eval(Container.DataItem, "CategoryTitle").ToString().Length > 100 ? DataBinder.Eval(Container.DataItem, "CategoryTitle").ToString().Substring(0, 100) + " " : DataBinder.Eval(Container.DataItem, "CategoryTitle").ToString()%>'  ></asp:HyperLink>
                                    <%--<asp:LinkButton ID="lnkCategory" Text='<%# Eval("CategoryTitle")%>' CommandName="Category"
                                        CommandArgument='<%# Eval("CategoryID")%> ' runat="server"></asp:LinkButton>--%>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
        </div>
        <div id="MainContent">
            <div class="floatRight" style="width: 630px;">
                <asp:DataGrid ID="dgBlog" ShowHeader="false" GridLines="None" ShowFooter="false"
                    AutoGenerateColumns="false" runat="server" PagerStyle-CssClass="gridFooter" OnItemCommand="dgBlog_ItemCommand"
                    AllowPaging="false" OnPageIndexChanged="dgBlog_PageIndexChanged" OnItemDataBound="dgBlog_ItemDataBound"
                    PageSize="5" Width="100%">
                    <PagerStyle Font-Size="XX-Small" Font-Names="Arial" Font-Bold="True" HorizontalAlign="Right"
                        Mode="NumericPages" />
                    <Columns>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <div class="blog floatLeft">
                                <h4>
                                    <asp:HyperLink id="lnkTitle" runat="server" NavigateUrl='<%#Eval("URLTitle") + ".aspx" %> ' Text='<%# Eval("BlogTitle") %>'  ></asp:HyperLink>
                                    </h4> 
                                    <%--<asp:LinkButton ID="lnkTitle" Text='<%# DataBinder.Eval(Container.DataItem, "BlogTitle")%>'
                                        CommandArgument='<%#Eval("BlogId") %>' CommandName="Title" runat="server"></asp:LinkButton></h4>--%>
                                
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BlogDescription").ToString().Length > 250 ? DataBinder.Eval(Container.DataItem, "BlogDescription").ToString().Substring(0, 250) + " " : DataBinder.Eval(Container.DataItem, "BlogDescription").ToString()%>'></asp:Label>
                                    <asp:Label ID="lblReadFullPost" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BlogDescription") %>'></asp:Label>
                                    <div class="floatRight green" id="divRead" runat="server">
                                    <strong>
                                        <asp:HyperLink id="lnkReadFullPost" runat="server" NavigateUrl='<%#Eval("URLTitle") + ".aspx" %> ' Text="Read Full Post »"  ></asp:HyperLink>
                                        <%--<asp:LinkButton ID="lnkReadFullPost" Text="Read Full Post »" CommandArgument='<%#Eval("BlogId") %>'
                                            CommandName="Read" runat="server"></asp:LinkButton>--%>
                                            </strong>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
            </div>
        </div>
    </div>
</div>
<div class="clearBoth">
</div>
