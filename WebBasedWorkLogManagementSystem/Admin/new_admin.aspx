<%@ Page Title="New Administrator | Admin Panel | Web-Based Worklog Management System" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Admin.Master" CodeBehind="new_admin.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.new_admin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">New Administrator</h1>
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
                                  Use the form below to create a new Administrator
                                    </div>
                                
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form role="form">
                                                   <div class="row">
                                              <div class="col-md-9">
                                                <div class="form-group">
                                                    <label>FullName:</label>
                                                    <asp:TextBox ID="txtFName" runat="server" CssClass="form-control" placeholder="Enter the Fullname of the Admin here" autofocus="true"></asp:TextBox>                                                   
                                                </div> 
                                                     </div>
                                                <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Role:</label>
                                                    <asp:DropDownList ID="roleDDL" runat="server" Width="100%" AppendDataBoundItems="True" CssClass="form-control">                                                         
                                                                <asp:ListItem Value="Principal ITO" Text="Principal ITO"></asp:ListItem>
                                                                <asp:ListItem Value="Senior ITO" Text="Senior ITO"></asp:ListItem>                                                                
                                                                <asp:ListItem Value="Junior ITO" Text="Junior ITO"></asp:ListItem>                                                                                                                
                                                                <asp:ListItem Value="ITO I " Text="ITO I"></asp:ListItem>                                                                                                                
                                                                <asp:ListItem Value="ITO II" Text="ITO II"></asp:ListItem>                                                                                                                
                                                                <asp:ListItem Value="Engineer" Text="Engineer"></asp:ListItem>                                                                                                                
                                                                <asp:ListItem Value="System Analyst" Text="System Analyst"></asp:ListItem>                                                                                                                
                                                                <asp:ListItem Value="Net Admin" Text="Net Admin"></asp:ListItem>                                                                                                                
                                                                <asp:ListItem Value="Researcher" Text="Researcher"></asp:ListItem>                                                                                                                
                                                                <asp:ListItem Value="Staff" Text="Staff"></asp:ListItem>                                                                                                              
                                                    </asp:DropDownList>	                                                 
                                                </div> 
                                                     </div>
                                                  </div>
                                                   
                                            <div class="row">
                                              <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Username:</label>
                                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter the Username for the Admin here"></asp:TextBox>                                                   
                                                </div> 
                                                     </div>
                                              <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Email:</label>
                                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter the Email of the Admin here" TextMode="Email"></asp:TextBox>	                                                 
                                                </div> 
                                                     </div>
                                              <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Password:</label>
                                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter the Password for the Admin here" TextMode="Password"></asp:TextBox>	                                                 
                                                </div> 
                                                     </div>
                                                  </div>
                                                <div class="panel-footer">
                                              <button type="reset" class="btn btn-default">Cancel</button>        
                                            <asp:Button ID="btnSave" runat="server" Text="Create Account" CssClass="btn btn-primary" />
                                                    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="A new account will be created for this Admin?" TargetControlID="btnSave" />
                                                    </div>
                                            </form>
                                        </div>
                                        <!-- /.col-lg-12 (nested) -->
                                      </div>                                  
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->


                    <div class="row">
                          <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                 Registered Administrators
                                </div>
                                     <div class="panel-body">
                                           <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" style="font-family:Verdana; font-size:8pt" DataKeyNames="admin_id" class="table table-striped table-bordered table-hover" AllowPaging="True" EmptyDataText="No record found" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" PageSize="15" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black">
                                           <Columns>
                                               <asp:CommandField ButtonType="Image" CancelImageUrl="~/images/cancel.jpg" DeleteImageUrl="~/images/delete.png" EditImageUrl="~/images/edit.png" HeaderText="Action" ShowDeleteButton="False" ShowEditButton="True" UpdateImageUrl="~/images/okay.png">
                                                <ControlStyle Height="20px" Width="20px" />
                                              </asp:CommandField>
                                               <asp:BoundField DataField="admin_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="admin_id" />
                                               <asp:BoundField DataField="fullname" HeaderText="FullName" NullDisplayText="N/A" SortExpression="fullname" />                                              
                                               <asp:TemplateField HeaderText="Admin Role" SortExpression="role">
                                               <ItemTemplate>
                                               <%# Eval("role") %> 
                                               </ItemTemplate>

                                               <EditItemTemplate>
                                                            <asp:DropDownList ID="roleDDL" runat="server" Width="100%" Height="25px" AppendDataBoundItems="True" SelectedValue='<%#Bind("role") %>'>                                                         
                                                                <asp:ListItem Value="" Text="Choose Option"></asp:ListItem>
                                                                <asp:ListItem Value="Principal ITO" Text="Principal ITO"></asp:ListItem>
                                                                <asp:ListItem Value="Senior ITO" Text="Senior ITO"></asp:ListItem>                                                                
                                                                <asp:ListItem Value="Junior ITO" Text="Junior ITO"></asp:ListItem>                                                                                                                
                                                                <asp:ListItem Value="ITO I " Text="ITO I"></asp:ListItem>                                                                                                                
                                                                <asp:ListItem Value="ITO II" Text="ITO II"></asp:ListItem>                                                                                                                
                                                                <asp:ListItem Value="Engineer" Text="Engineer"></asp:ListItem>                                                                                                                
                                                                <asp:ListItem Value="System Analyst" Text="System Analyst"></asp:ListItem>                                                                                                                
                                                                <asp:ListItem Value="Net Admin" Text="Net Admin"></asp:ListItem>                                                                                                                
                                                                <asp:ListItem Value="Researcher" Text="Researcher"></asp:ListItem>                                                                                                                
                                                                <asp:ListItem Value="Staff" Text="Staff"></asp:ListItem>                                                                                                                 
                                                             </asp:DropDownList>	
                                                                 </EditItemTemplate>
                                               </asp:TemplateField>
                                               <asp:BoundField DataField="username" HeaderText="Username" NullDisplayText="N/A" SortExpression="username" />                                                                                            
                                               <asp:BoundField DataField="email" HeaderText="Email" NullDisplayText="N/A" SortExpression="email" />
                                               <asp:BoundField DataField="password" HeaderText="Password" NullDisplayText="N/A" SortExpression="password" ReadOnly="true" />
                                               <asp:TemplateField HeaderText="Status">
                                                   <ItemTemplate>
                                                       <span class='<%# If(Eval("status") = 0, "label label-danger", "label label-success")%>'><%# If(Eval("status") = 0, "Inactive", "Active")%></span>
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                         <asp:BoundField DataField="created_by" HeaderText="Created By" NullDisplayText="N/A" SortExpression="created_by" ReadOnly="true" />
                                               <asp:BoundField DataField="date_created" HeaderText="Created On" NullDisplayText="N/A" SortExpression="date_created" ReadOnly="true" />
                                               <asp:TemplateField HeaderText="">
                                                   <ItemTemplate>
                                                      <p> <asp:LinkButton ID="ActiveLink" data-toggle='tooltip' data-original-title="Activate this Account" runat="server" CommandName="activeAdmin" Visible='<%# If(Eval("status") = 0, "True", "False")%>' CommandArgument='<%# DataBinder.Eval(Container.DataItem, "admin_id") %>' CausesValidation="false"><i class="fa fa-check text-success"></i></asp:LinkButton>&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="InactiveLink" runat="server" data-toggle='tooltip' data-original-title="Suspend this Account" CommandName="inactiveAdmin" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "admin_id") %>' CausesValidation="false" Visible='<%# If(Eval("status") = 1, "True", "False")%>'><i class="fa fa-times text-danger" ></i></asp:LinkButton></p> 
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                           </Columns>
                                           <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                           <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                           <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                           <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                           <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                           <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                           <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                           <SortedDescendingHeaderStyle BackColor="#242121" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT * FROM [tblAdmin] ORDER BY [admin_id] DESC" UpdateCommand="UPDATE tblAdmin SET fullname = @fullname, role = @role, username = @username, email = @email WHERE (admin_id = @admin_id)">
                                            <UpdateParameters>
                                                <asp:Parameter Name="fullname" />
                                                <asp:Parameter Name="role" />
                                                <asp:Parameter Name="username" />
                                                <asp:Parameter Name="email" />
                                                <asp:Parameter Name="admin_id" />
                                            </UpdateParameters>
                                               </asp:SqlDataSource>
                                            </div>
                                            </div>
                                  </div>
                                        </div> 
                                       <!-- /.col-lg-12 (nested) -->
                                    </div>
                                    <!-- /.row (nested) -->
                </div>
                <!-- /.container-fluid -->
</asp:Content>
