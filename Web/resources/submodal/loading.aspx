<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loading.aspx.cs" Inherits="Etech.CMS.Web.submodal.loading" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body style="background-color: #efefef;">
    <form id="form1" runat="server">
    <div>
      <asp:Image ID="imgSpinner" runat="server" SkinID="spinner" />&nbsp;&nbsp;<CMS:Label ID="lblLoading" runat="server" CssClass="label" />
    </div>
    </form>
</body>
</html>
