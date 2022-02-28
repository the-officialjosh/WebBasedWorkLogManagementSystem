<%@ Page Title="Change Password | Employee Panel | Web-Based Worklog Management System" Language="vb" AutoEventWireup="false" MasterPageFile="~/Employee/Employee.Master" CodeBehind="change_password.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.change_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 293px;
            height: 232px;
        }
        .auto-style2 {
            text-align: left;
            height: 183px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Change Password</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>     
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                             <asp:Panel ID="SuccessPanel" runat="server" Visible="false">
                            <div class="alert alert-success alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <asp:Label ID="lblSuccess" runat="server" Text="" ></asp:Label>
                               </div>
                                </asp:Panel>
                            <asp:Panel ID="ErrorPanel" runat="server" Visible="false">
                            <div class="alert alert-danger alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                   <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                               </div>
                              </asp:Panel>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Use the form below to update your Password
                                    </div>                        
                                 <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <form role="form">

                                                 <table align="center" class="auto-style1">
                                                     <tr>
                                                         <td class="auto-style2">
                                                             <asp:Image ID="Image1" runat="server" Height="155px" Width="154px" ImageUrl="~/images/no-image.png" BorderStyle="None" />
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td class="text-center">
                                                             <asp:FileUpload ID="FileUpload" runat="server" />
                                                         </td>
                                                     </tr>
                                                 </table>

                                                 <br />  
                                                <div class="panel-footer">
                                              <button type="reset" class="btn btn-default">Cancel</button>        
                                            <asp:Button ID="btnSave" runat="server" Text="Upload Picture" CssClass="btn btn-primary" />
                                                    </div>
                                            </form>
                                        </div>
                                        <!-- /.col-lg-6 (nested) -->
                                        <div class="col-lg-8">
                                            <form role="form">
                                                <div class="form-group">
                                                    <label>Old Password:</label>
                                                    <asp:TextBox ID="txtOldPassword" runat="server" CssClass="form-control" placeholder="Enter your Old Password here" TextMode="Password" autofocus="true"></asp:TextBox>                                                   
                                                </div>                                                                                                
                                                 <div class="form-group">
                                                    <label>New Password:</label>
                                                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" placeholder="Enter your New Password here" TextMode="Password"></asp:TextBox>  
                                                </div> 
                                                  <div class="form-group">
                                                    <label>Confirm Password:</label>
                                                    <asp:TextBox ID="txtRPassword" runat="server" CssClass="form-control" placeholder="Enter your New Password Again" TextMode="Password"></asp:TextBox>  
                                                </div>
                                                <div class="panel-footer">
                                              <button type="reset" class="btn btn-default">Cancel</button>        
                                            <asp:Button ID="btnChange" runat="server" Text="Save Password" CssClass="btn btn-primary" />
                                                    </div>
                                            </form>
                                        </div>
                                        <!-- /.col-lg-6 (nested) -->
                                    </div>
                                    <!-- /.row (nested) -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
</asp:Content>
