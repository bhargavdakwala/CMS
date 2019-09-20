<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LatestNews.ascx.cs" Inherits="Etech.CMS.Web.controls.content.LatestNews" %>

<body>
<div class="mainContentinner">
<h3>Latest News</h3>
    <asp:DataGrid ID="dgBlog" ShowHeader="false" GridLines="None" ShowFooter="false"
        BorderWidth="0" AutoGenerateColumns="false" runat="server" AllowPaging="True"
        OnPageIndexChanged="dgBlog_PageIndexChanged" PageSize="15" Width="100%">
        <PagerStyle CssClass="paging" Font-Names="Arial" Font-Underline="false" Font-Bold="True"
            HorizontalAlign="Left" Mode="NumericPages" ForeColor="#9AACB9" />
        <Columns>
            <asp:TemplateColumn>
                <ItemTemplate>
                      <div class="news">
                        <p>
                            
                            <asp:Label ID="lblTitle" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "ServiceTitle") %> '>
                            </asp:Label>
                            <%--<%#  DataBinder.Eval(Container.DataItem, "Createdon", "{0:dd / MM / yyyy}") %>--%>
                        </p>
                             <%--<asp:Label ID="lblCreatedOn" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "Createdon", "{0:dd / MM / yyyy}") %> '></asp:Label>--%>
                            
                           <p>
                           <%# DataBinder.Eval(Container.DataItem, "ServiceDescription")%>
                           </p> 
                            <%--<asp:Label ID="lblDescription" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDescription")%>'></asp:Label>--%>
                            <hr style="border-bottom:1px solid #bbcedb;"  />
                        
                    </div>
                </ItemTemplate>
            </asp:TemplateColumn>
        </Columns>
    </asp:DataGrid>
    </div>
</body>