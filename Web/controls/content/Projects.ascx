<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Projects.ascx.cs" Inherits="Etech.CMS.Web.controls.content.Projects" %>

<style>
    <!-- 
    .BreadcrumbNav { display:none }
    -->
</style>

<br />
<div class="floatLeft BreadcrumbNav1"   >
        <span>
             <a href="http://www.pjwrightandassociates.com.au/Home.aspx">Home</a> | Projects
        </span>   
    </div>
  
    
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
     
     <h1 style="margin-top:50px;">PROJECTS</h1>
        <span style="font-size:12px;">With the experience of knowledge the company has gained over many years, a diverse range of Plumbing Design & Hydraulic consulting services are available to our client. Some of these are as follows.
</span><br /><br />
        <asp:TreeView ID="TreeView1"  PopulateNodesFromClient="true" ShowExpandCollapse="true"
            ExpandImageUrl="~/images/service-bullet-blue.jpg" 
            
            CollapseImageUrl="~/images/service-bullet-blue-down.jpg"
            runat="server" OnTreeNodePopulate="TreeView1_TreeNodePopulate" OnTreeNodeExpanded="TreeView1_TreeNodeExpanded"
             TabIndex="10" NodeIndent="10">
             <ParentNodeStyle CssClass="parentNode" />
            <NodeStyle CssClass="node"  />
            <LeafNodeStyle CssClass="leafNode" />
        </asp:TreeView>
    </ContentTemplate>
</asp:UpdatePanel>