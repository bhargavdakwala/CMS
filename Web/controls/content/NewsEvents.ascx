<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsEvents.ascx.cs"
    Inherits="Etech.CMS.Web.controls.content.NewsEvents" %>
<asp:Repeater ID="dgRecentPostHeader" runat="server" onitemcommand="dgRecentPostHeader_ItemCommand">
                        <ItemTemplate>
                            <div class="newsItem">
                                <p>
                                    <strong>
                                        <asp:LinkButton ID="lnkTitle"  Text='<%# DataBinder.Eval(Container.DataItem, "BlogTitle")%>' 
                                        CommandArgument='<%#Eval("BlogId") %>' CommandName="Title" runat="server"></asp:LinkButton>
                                        
                                    </strong>
                                </p>
                                <p>
                                    <strong>
                                        "<%#DataBinder.Eval(Container.DataItem, "Createdon", "{0:dd/MM/yyyy}")%>"
                                    
                                    </strong>
                                </p>
                                <p>
                                    <asp:Label ID="lblBlogID" Text='<%# DataBinder.Eval(Container.DataItem, "BlogID")%>'
                                        runat="server" Visible="false"></asp:Label>
                                   
                                        
                                        <%# DataBinder.Eval(Container.DataItem, "BlogDescription").ToString().Length > 250 ? DataBinder.Eval(Container.DataItem, "BlogDescription").ToString().Substring(0,DataBinder.Eval(Container.DataItem, "BlogDescription").ToString().Substring(0,250).LastIndexOf(" ")) + " " : DataBinder.Eval(Container.DataItem, "BlogDescription").ToString()%>
                                </p>
                                
                            </div>
                            
                        </ItemTemplate>
                    </asp:Repeater>
                    <a href="http://www.pjwrightandassociates.com.au/hydraulic-design-australia-news-and-events.aspx" style="text-align:right;padding-left:220px;float:left;color:#929497;font-weight:bold;font-size:12.5px;padding-bottom:10px;">Read    More...</a>