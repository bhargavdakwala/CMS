<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FullMember.ascx.cs"
	Inherits="Etech.CMS.Web.controls.content.FullMember" %>
<div class="mainContentinner">
	<h3>
		Full Member</h3>
	<%--        <tr>
			<td align="left" valign="top">
			<table width="250" cellpadding="3" border="0">
				<tbody>
					<tr>
						<td align="left" valign="top"><strong>Name:</strong></td>
						<td>Adam Byrnes</td>
					</tr>-
					<tr>
						<td align="left" width="8" valign="top"><strong>Email:</strong></td>
						<td align="left" width="120" valign="top"><a href="mailto:adam@volume.com.au">adam@volume.com.au</a></td>
					</tr>
				</tbody>
			</table>
			</table>
	--%>
	<asp:DataList ID="dlFullMember" RepeatDirection="Horizontal" RepeatColumns="2" runat="server" OnItemDataBound="dlFullMember_ItemDataBound" CssClass="membersList">
		<ItemTemplate>
			<table width="300" cellpadding="3" border="0">
				<tr runat="server" id="Name">
					<td align="left" valign="top">
						<strong>
							<asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label></strong>
					</td>
					<td>
						<asp:HyperLink ID="hplName" runat="server" Text='<%# Eval("Name") %>'>
						</asp:HyperLink>
					</td>
				</tr>
				<tr runat="server" id="Company">
					<td align="left" width="8" valign="top">
						<strong>
							<asp:Label ID="labelCompany" runat="server" Text="Company:"></asp:Label></strong>
					</td>
					<td align="left" width="200" valign="top">
						<asp:Label ID="lblCompany" runat="server" Text='<%#Eval("Company") %>'></asp:Label>
					</td>
				</tr>
				<tr runat="server" id="Phone">
					<td align="left" width="8" valign="top">
						<strong><asp:Label ID="labelPhone" runat="server" Text="Phone:"></asp:Label></strong>
					</td>
					<td align="left" valign="top">
						<asp:Label ID="lblPhone" runat="server" Text='<%#Eval("Phone") %>'></asp:Label>
					</td>
				</tr>
				<tr runat="server" id="Mobile">
					<td align="left" width="8" valign="top">
						<strong>
						<asp:Label ID="labelMobile" runat="server" Text="Mobile:"></asp:Label>
					   </strong>
					</td>
					<td align="left" valign="top">
						<asp:Label ID="lblMobile" runat="server" Text='<%#Eval("Mobile") %>'></asp:Label>
					</td>
				</tr>
				<tr runat="server" id="Email">
					<td align="left" width="8" valign="top">
						<strong>
						 <asp:Label ID="labelEmail" runat="server" Text="Email:"></asp:Label>
						</strong>
					</td>
					<td align="left" width="120" valign="top">
						<a href='mailto:<%#Eval("Email") %>'>
							<asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label></a>
					</td>
				</tr>
				<tr runat="server" id="WebAddress">
					<td align="left" width="8" valign="top">
						<strong>
						  <asp:Label ID="labelWeb" runat="server" Text="Web:"></asp:Label>
						</strong>
					</td>
					<td align="left" width="120" valign="top">
						<a href='<%#Eval("WebAddress") %>' target="_blank">
							<asp:Label ID="lblWebAddress" runat="server" Text='<%#Eval("WebAddress") %>'></asp:Label></a>
					</td>
				</tr>
				<br />
			</table>
			<br />
				<!-- hr class="clearBoth" / -->
		</ItemTemplate>
		
		
		
	</asp:DataList>
</div>
