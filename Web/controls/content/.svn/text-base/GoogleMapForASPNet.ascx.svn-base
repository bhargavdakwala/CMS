<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GoogleMapForASPNet.ascx.cs"
    Inherits="Etech.CMS.Web.controls.content.GoogleMapForASPNet" %>
<%--<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:ScriptManagerProxy ID="ScriptManager1" runat="server">
    <Services>
        <asp:ServiceReference Path="~/controls/content/GService.asmx" />
    </Services>
</asp:ScriptManagerProxy>
<div id="GoogleMap_Div_Container">
    <div id="GoogleMap_Div" style="width: <%=GoogleMapObject.Width %>; height: <%=GoogleMapObject.Height %>;"
        valign="top">
    </div>
    <%
        if (ShowControls)
        {
    %>
    <input type="button" id="btnFullScreen" value="Full Screen" onclick="ShowFullScreenMap();" />
    &nbsp&nbsp
    <input type="checkbox" id="chkIgnoreZero" onclick="IgnoreZeroLatLongs(this.checked);" />Ignore
    Zero Lat Longs
    <% } %>
</div>
<div id="directions_canvas">
</div>
<asp:UpdatePanel ID="UpdatePanelXXXYYY" runat="server">
    <ContentTemplate>
        <asp:HiddenField ID="hidEventName" runat="server" />
        <asp:HiddenField ID="hidEventValue" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>
<%--
<script src='http://maps.google.com/maps?file=api&amp;v="+GoogleMapObject.APIVersion+">&amp;key="+GoogleMapObject.APIKey+"'
    type='text/javascript'></script>--%>

<%--<script src='http://maps.google.com/maps?file=api&amp;v="+GoogleMapObject.APIVersion+">&amp;key="+GoogleMapObject.APIKey+"' type="text/javascript"></script>--%>
<%--<script src='http://maps.google.com/maps?file=api&v=2&sensor=false&key=ABQIAAAA05Pcu-jGM29FtBWfap1CsxQ42GY4B8gKCuE6MMAc7qJy_XP8WxT8qFlC2A9Gq7jbP-r6Zr6NdOz5xA' type="text/javascript"></script>--%>
<%--<script src="http://maps.google.com/maps?file=api&v=2&sensor=false&key=ABQIAAAA05Pcu-jGM29FtBWfap1CsxTFdtb6P3LQLOPzR7PQExx9fNfmfxSPhKCgslyJPU3A9NflKcDqUyiyqQ" type="text/javascript"></script>--%>
<script src="http://maps.google.com/maps?file=api&v=2&sensor=false&key=ABQIAAAA05Pcu-jGM29FtBWfap1CsxRZmYI4aanJYzOxu1uvt70jmOKX9hSjEiwIMDN5J-FeIZ6jRf3Jbqvb2Q" type="text/javascript"></script>

    

<%--<script src="http://maps.google.com/maps?file=api&amp;v=1&amp;sensor=false&amp;key=ABQIAAAAGM9-mpvzHRDXoXxamFqJIhTtKEmhEEAbAVxz5rtcgs0W9SefVRQ2BpFgxg1jsp7wn3WpXp2MQ0CULw" type="text/javascript"></script>--%>

<script type="text/javascript" src="../../JavaScript/GoogleMapAPIWrapper.js">
</script>

<script language="javascript" type="text/javascript">
    //RaiseEvent('MovePushpin','pushpin2');
    function RaiseEvent(pEventName, pEventValue) {
        document.getElementById('<%=hidEventName.ClientID %>').value = pEventName;
        document.getElementById('<%=hidEventValue.ClientID %>').value = pEventValue;
        if (document.getElementById('<%=UpdatePanelXXXYYY.ClientID %>') != null) {
            __doPostBack('<%=UpdatePanelXXXYYY.ClientID %>', '');
        }
    }

</script>

