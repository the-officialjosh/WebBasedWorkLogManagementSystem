<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="WebBasedWorkLogManagementSystem._default" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="css/style.css">

    <title>Sign In | Worklog Management System</title>
</head>
<body style=" color:white">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
       <div class="d-lg-flex half">
    <div class="bg order-1 order-md-2" style="background-image: url(images/Remote-working.png)"></div>
    <div class="contents order-2 order-md-1">

      <div class="container" style="background-color:#212020; font-family:Lato; color:white;  font-weight:700; opacity:unset">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7">
            <h3 style="font-family:'BernhardFashion BT'; -webkit-text-stroke: 2px; font-size:250%"><strong>Worklog</strong> Management System</h3>
            <p class="mb-4">Work, Log, Record, Success</p>
            <div>
              <div class="form-group first">
                <label for="username">Email</label>
                <%--<input type="text" class="form-control" placeholder="your-email@gmail.com" id="username">--%>
                  <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="your-email@example.com" autofocus="true"></asp:TextBox>
              </div>
              <div class="form-group last mb-3">
                <label for="password">Password</label>
                <%--<input type="password" class="form-control" placeholder="Your Password" id="password">--%>
                  <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Your Password" TextMode="Password"></asp:TextBox>
              </div>
              
              <div class="d-flex mb-5 align-items-center">
                <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                  <input type="checkbox" checked="checked"/>
                  <span class="control__indicator"></span>
                </label>
                "<span Class="ml-auto"><a href="create_account.aspx" class="forgot-pass">Forgot Password</a></span>"
              </div>

                <asp:Button ID="btnLogIn" runat="server" Text="Log In" CssClass="btn btn-block btn-primary" />
             <%-- <input type="submit" value="Log In" class="btn btn-block btn-primary">--%>
                <br />
                <p class="mb-4" style="text-align:center">Not Registered? <a href="create_account.aspx" class="text-info">Create Account!</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>  
  </div>        
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    </form>
</body>
</html>
