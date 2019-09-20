<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Etech.CMS.Web.Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<asp:Calendar ID="MyCalendar" runat="server" OnSelectionChanged="MyCalendar_SelectionChanged"
            OnDayRender="MyCalendar_DayRender" SelectionMode="DayWeek" SelectWeekText="***">
        </asp:Calendar>
    </div>
    </form>
</body>
</html>
