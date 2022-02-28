<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="test.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblTime" runat="server" CssClass="auto-style1" Text=""></asp:Label>
            <asp:Label ID="lblTest" runat="server" CssClass="auto-style1" Text="" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
