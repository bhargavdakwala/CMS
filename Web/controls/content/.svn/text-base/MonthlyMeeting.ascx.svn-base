<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MonthlyMeeting.ascx.cs"
    Inherits="Etech.CMS.Web.controls.content.MonthlyMeeting" %>
<asp:Repeater ID="rptMonthlyMeeting" runat="server">
    <HeaderTemplate>
        <h2 class="textStyle">
            AHSCA WA Meeting Dates</h2>
    </HeaderTemplate>
    <ItemTemplate>
        <p>
            <%#  DataBinder.Eval(Container.DataItem, "ProjectTitle")%><br />
            <%# DataBinder.Eval(Container.DataItem, "ProjectDescription").ToString().Length > 50 ? DataBinder.Eval(Container.DataItem, "ProjectDescription").ToString().Substring(0, DataBinder.Eval(Container.DataItem, "ProjectDescription").ToString().Substring(0, 50).LastIndexOf(" ")) + " " : DataBinder.Eval(Container.DataItem, "ProjectDescription").ToString()%>
            <%--<%#  DataBinder.Eval(Container.DataItem, "MeetingDate", "{0:dddd,dd'th of' MMMM yyyy}")%>--%>
            
        </p>
        <p>
            <a href="http://www.ahscawa.com.au/ahsca-wa-meeting-dates.aspx">View Future Meeting Dates ></a></p>
    </ItemTemplate>
</asp:Repeater>
