<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Services.ascx.cs" Inherits="Etech.CMS.Web.controls.content.Services" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        
        <h1>SERVICES OFFERED</h1>
        <span style="font-size:12px;">With the experience of knowledge the company has gained over many years, a diverse range of Plumbing Design & Hydraulic consulting services are available to our client. Some of these are as follows.
</span><br /><br />
        <asp:TreeView ID="TreeView1" BorderWidth="0px" PopulateNodesFromClient="true" ShowExpandCollapse="true"
            ExpandImageUrl="~/images/service-bullet-blue.jpg" 
            
            CollapseImageUrl="~/images/service-bullet-blue-down.jpg"
            runat="server" OnTreeNodePopulate="TreeView1_TreeNodePopulate" 
            OnTreeNodeExpanded="TreeView1_TreeNodeExpanded" NodeIndent="10" 
            TabIndex="10"  >
            
            <ParentNodeStyle CssClass="parentNode" ForeColor="#929497" />
            <NodeStyle CssClass="node" />
            <LeafNodeStyle CssClass="leafNode" Font-Size="12px"    />
            
            
        </asp:TreeView>
        
    </ContentTemplate>
</asp:UpdatePanel>
