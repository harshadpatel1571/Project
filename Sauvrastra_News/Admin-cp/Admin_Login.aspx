<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Login.aspx.cs" Inherits="Admin_cp_Admin_Login" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Sauvrastra Mirror</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-theme.css" rel="stylesheet" />
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="css/owl.carousel.css" rel="stylesheet" />
    <link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/fullcalendar.css" />
    <link href="css/widgets.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link href="css/xcharts.min.css" rel=" stylesheet" />
    <link href="css/jquery-ui-1.10.4.min.css" rel="stylesheet" />

</head>
<body class="login-img3-body">
    <div class="container">
        <form class="login-form" runat="server" id="form1">
            <div class="login-wrap">
                <p class="login-img"><i class="icon_lock_alt"></i></p>
                <div class="input-group">
                    <span class="input-group-addon"><i class="icon_profile"></i></span>
                    <asp:TextBox runat="server" class="form-control" ID="txt_username" placeholder="Username" autofocus="true"></asp:TextBox>
                </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                    <asp:TextBox runat="server" class="form-control" placeholder="Password" TextMode="Password" ID="txt_pass"></asp:TextBox>
                </div>
               <%-- <label class="checkbox">
                <span class="pull-right"><a href="#">Forgot Password?</a></span>
                </label>--%>
                <asp:button runat="server" class="btn btn-primary btn-lg btn-block" ID="btn_save" Text="Login" OnClick="btn_save_Click"/>
               <%-- <asp:button runat="server" class="btn btn-info btn-lg btn-block" ID="btn_cancel" Text="Login"/>
                <button class="btn btn-info btn-lg btn-block" type="submit">Signup</button>--%>
            </div>
        </form>
    </div>
</body>
</html>

