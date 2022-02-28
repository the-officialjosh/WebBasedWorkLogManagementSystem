<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="create_account.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.create_account" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
   <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="css/style.css">

    <title>Create Account | Web-Based Worklog Management System</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="d-lg-flex half">
    <div class="bg order-1 order-md-2" style="background-image: url('images/Remote-working.png');"></div>
    <div class="contents order-2 order-md-1">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7">
            <h3>Worklog <strong>Management System</strong></h3>
            <p class="mb-4">Track & manage the daily routines of your organization by logging their daily tasks in the application. </p>
            <div>
                <div class="row">
                    <div class="col-md-6">
              <div class="form-group first">
                <label for="txtFname">First Name</label>
                <%--<input type="text" class="form-control" placeholder="your-email@gmail.com" id="username">--%>
                  <asp:TextBox ID="txtFname" runat="server" class="form-control" placeholder="Employee First Name" autofocus="true"></asp:TextBox>
              </div>
                </div>

               <div class="col-md-6">
              <div class="form-group first">
                <label for="txtLName">Last Name</label>
                <%--<input type="text" class="form-control" placeholder="your-email@gmail.com" id="username">--%>
                  <asp:TextBox ID="txtLName" runat="server" class="form-control" placeholder="Employee Last Name"></asp:TextBox>
              </div>
                </div>
                </div>
              
              <div class="form-group first">
                <label for="txtEmail">Email Address</label>
                <%--<input type="text" class="form-control" placeholder="your-email@gmail.com" id="username">--%>
                  <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="your-email@example.com" TextMode="Email"></asp:TextBox>
              </div>

               <div class="form-group first">
                <label for="txtPhone">Phone Number</label>
                <%--<input type="text" class="form-control" placeholder="your-email@gmail.com" id="username">--%>
                  <asp:TextBox ID="txtPhone" runat="server" class="form-control" placeholder="Employee Valid Phone Number" ></asp:TextBox>
              </div>

            
                <div class="row">
                    <div class="col-md-6">
              <div class="form-group last mb-3">
                 <label for="txtPassword">Password</label>                
                  <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="New Password" TextMode="Password"></asp:TextBox>
              </div>
                </div>

               <div class="col-md-6">
              <div class="form-group last mb-3">
                <label for="txtRPassword">Confirm Password</label>                
                  <asp:TextBox ID="txtRPassword" runat="server" class="form-control" placeholder="New Password Again" TextMode="Password"></asp:TextBox>
              </div>
                   <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match" ControlToCompare="txtPassword" ForeColor="Red" ControlToValidate="txtRPassword" Operator="Equal"></asp:CompareValidator>
                </div>
                    <p>
                        
                    </p>
                </div>
              
              <div class="d-flex mb-5 align-items-center">
                <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                  <input type="checkbox" checked="checked"/>
                  <div class="control__indicator"></div>
                </label>
                <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span> 
              </div>
                <asp:Button ID="btnCreate" runat="server" Text="Create Account" CssClass="btn btn-block btn-primary" />
                <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="btnCreate" ConfirmText="You are about to create an Employee account?" />
            <%--  <input type="submit" value="Log In" class="btn btn-block btn-primary">--%>
                <br />
                <p class="mb-4" style="text-align:center">Already have an account? <a href="default.aspx" class="text-info">Log In</a></p>
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
