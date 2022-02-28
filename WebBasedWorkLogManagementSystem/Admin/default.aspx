<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="WebBasedWorkLogManagementSystem._default1" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Admin Sign In | Web-Based Worklog Management System</title>

        <!-- Bootstrap Core CSS -->
        <link href="../Employee/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../Employee/css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../Employee/css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../Employee/css/font-awesome.min.css" rel="stylesheet" type="text/css"> 
        <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,300italic' rel='stylesheet' type='text/css'>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
       <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Please Sign In</h3>
                        </div>
                        <div class="panel-body">
                            <form role="form">
                                <fieldset>
                                    <div class="form-group">
                                        <%--<input class="form-control" placeholder="E-mail" name="email" type="email" autofocus>--%>
                                        <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="E-mail/Username" name="email" autofocus="true"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <%--<input class="form-control" placeholder="Password" name="password" type="password" value="">--%>
                                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Password" name="password" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                        </label>
                                    </div>
                                    <!-- Change this to a button or input when using this as a form -->
                                    <asp:Button ID="btnLogin" runat="server" class="btn btn-lg btn-success btn-block" Text="Login" />
                                    <%--<a href="#" class="btn btn-lg btn-success btn-block">Login</a>--%>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="../Employee/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../Employee/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../Employee/js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../Employee/js/startmin.js"></script>

    </form>
</body>
</html>
