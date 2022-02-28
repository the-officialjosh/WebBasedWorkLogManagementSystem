<%@ Page Title="Admin Dashboard | Admin Panel | Web-Based Worklog Management System" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Admin.Master" CodeBehind="dashboard.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.dashboard1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Admin Dashboard</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-tasks fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge"><asp:Label ID="lblAllTasks" runat="server" Text=""></asp:Label></div>
                                            <div>Total Tasks!</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="#">
                                    <div class="panel-footer">
                                        <span class="pull-left">"<asp:Label ID="lblActive" runat="server" Text=""></asp:Label> Active Task"&nbsp;&nbsp;&nbsp;"<asp:Label ID="lblCompleted" runat="server" Text=""></asp:Label> Completed Task"</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-green">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa  fa-check  fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge"><asp:Label ID="lblAllWork" runat="server" Text=""></asp:Label></div>
                                            <div>Worklog Entry!</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="#">
                                    <div class="panel-footer">
                                        <span class="pull-left">"<asp:Label ID="lblOngoingWork" runat="server" Text=""></asp:Label> Ongoing"&nbsp;&nbsp;&nbsp;"<asp:Label ID="lblCompletedWork" runat="server" Text=""></asp:Label> Completed"</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-yellow">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-spinner fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge"><asp:Label ID="lblCancelled" runat="server" Text=""></asp:Label></div>
                                            <div>Cancelled Activity!</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="#">
                                    <div class="panel-footer">
                                        <span class="pull-left">"<asp:Label ID="lblCancelTask" runat="server" Text=""></asp:Label> Task Cancel"&nbsp;&nbsp;&nbsp;"<asp:Label ID="lblCancelWork" runat="server" Text=""></asp:Label> Work Cancel"</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-red">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-trash fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge"><asp:Label ID="lblTrash" runat="server" Text=""></asp:Label></div>
                                            <div>Trash!</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="#">
                                    <div class="panel-footer">
                                        <span class="pull-left">"<asp:Label ID="lblTrashTask" runat="server" Text=""></asp:Label> Task Trashed"&nbsp;&nbsp;&nbsp;"<asp:Label ID="lblTrashWork" runat="server" Text=""></asp:Label> Work Trashed"</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->      
                    
                      <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                   Recent Worklog Activity
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="table-responsive">
                                       <asp:GridView ID="GridView2" runat="server" DataKeyNames="work_id" style="font-family:Verdana; font-size:8pt" EmptyDataText="No Work/Log Entry found" DataSourceID="Grid2SqlSource" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" AllowSorting="True" Width="100%">
                                                        <Columns>
                                                            <asp:BoundField DataField="work_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="work_id" Visible="false" />
                                                            <asp:BoundField DataField="work_date" HeaderText="LogDate" SortExpression="work_date" >
                                                            </asp:BoundField>
                                                             <asp:TemplateField HeaderText="Work/LogTime">
                                                                <ItemTemplate>
                                                                   <%# Eval("work_time") & "/" & Eval("log_time") & "<br/>" & "<strong>" & Eval("time_diff") & "</strong>" %> 
                                                                </ItemTemplate>
                                                             </asp:TemplateField>                                                                                                                                                                                  
                                                            <asp:BoundField DataField="project_name" HeaderText="ProjectName" SortExpression="project_name" />
                                                            <asp:TemplateField HeaderText="SupervisedBy">
                                                                <ItemTemplate>
                                                                    <%# Eval("employee_lname") & " " & Eval("employee_fname") %>
                                                                </ItemTemplate>
                                                             </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="EmployeeName">
                                                                <ItemTemplate>
                                                                    <%# Eval("emp_lname") & " " & Eval("emp_fname") %>
                                                                </ItemTemplate>
                                                             </asp:TemplateField>
                                                            <asp:BoundField DataField="task_name" HeaderText="TaskName" SortExpression="task_name" NullDisplayText="N/A" />                                                             
                                                            <asp:BoundField DataField="task_status" HeaderText="TaskStatus" SortExpression="task_status" NullDisplayText="N/A" Visible="False" />
                                                            <asp:BoundField DataField="work_location" HeaderText="Location" SortExpression="work_location" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_status" HeaderText="WorkStatus" SortExpression="work_status" NullDisplayText="N/A"/>
                                                            <asp:BoundField DataField="work_desc" HeaderText="WorkPerformed" SortExpression="work_desc" NullDisplayText="N/A"/>
                                                            <asp:BoundField DataField="worklog_desc" HeaderText="LogEntry" SortExpression="worklog_desc" />                                                           
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
                                          <asp:SqlDataSource ID="Grid2SqlSource" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT TOP(15) tblProject.project_name, tblTask.task_name, tblTask.task_desc, tblTask.task_startdate, tblTask.task_enddate, tblTask.task_completedate, tblTask.task_status, tblEmployee.employee_fname, tblEmployee.employee_lname, tblEmployee_1.employee_fname AS emp_fname, tblEmployee_1.employee_lname AS emp_lname, tblWork.* FROM tblWork INNER JOIN tblProject ON tblWork.project_id = tblProject.project_id INNER JOIN tblTask ON tblWork.task_id = tblTask.task_id INNER JOIN tblEmployee ON tblWork.supervisor_id = tblEmployee.employee_id INNER JOIN tblEmployee AS tblEmployee_1 ON tblWork.employee_id = tblEmployee_1.employee_id WHERE (tblWork.work_delete = @work_delete) ORDER BY tblWork.work_id DESC">
                                                <SelectParameters>                                                                                                            
                                                <asp:Parameter DefaultValue="0" Name="work_delete" />
                                           </SelectParameters>
                                        </asp:SqlDataSource>  
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-6 -->                        
                    </div>
                    <!-- /.row -->
                      
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                   Recently Registered Employee
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="table-responsive">
                                       <asp:GridView ID="GridView1" runat="server" style="font-family:Verdana; font-size:8pt" OnRowCommand="GridView1_RowCommand" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" PageSize="15" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black">
                                           <Columns>
                                               <asp:BoundField DataField="employee_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="employee_id" />
                                               <asp:BoundField DataField="employee_fname" HeaderText="FirstName" NullDisplayText="N/A" SortExpression="employee_fname" />
                                               <asp:BoundField DataField="employee_lname" HeaderText="LastName" NullDisplayText="N/A" SortExpression="employee_lname" />
                                               <asp:BoundField DataField="employee_gender" HeaderText="Gender" NullDisplayText="N/A" SortExpression="employee_gender" />
                                               <asp:BoundField DataField="employee_role" HeaderText="Role" NullDisplayText="N/A" SortExpression="employee_role" />
                                               <asp:BoundField DataField="employee_email" HeaderText="EmailAddress" NullDisplayText="N/A" SortExpression="employee_email" />
                                               <asp:BoundField DataField="employee_phone" HeaderText="PhoneNumber" NullDisplayText="N/A" SortExpression="employee_phone" />
                                               <asp:TemplateField HeaderText="Status">
                                                   <ItemTemplate>
                                                       <span class='<%# If(Eval("account_status") = 0, "label label-danger", "label label-success")%>'><%# If(Eval("account_status") = 0, "Inactive", "Active")%></span>
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                               <asp:BoundField DataField="employee_registered" HeaderText="Date Registered" NullDisplayText="N/A" SortExpression="employee_registered" />
                                               <asp:TemplateField HeaderText="Action">
                                                   <ItemTemplate>
                                                      <p> <asp:LinkButton ID="ActiveLink" data-toggle='tooltip' data-original-title="Activate Employee's Account" runat="server" CommandName="activeEmployee" Visible='<%# If(Eval("account_status") = 0, "True", "False")%>' CommandArgument='<%# DataBinder.Eval(Container.DataItem, "employee_id") %>' CausesValidation="false"><i class="fa fa-check text-success"></i></asp:LinkButton>&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="InactiveLink" runat="server" data-toggle='tooltip' data-original-title="Suspend this Employee" CommandName="inactiveEmployee" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "employee_id") %>' CausesValidation="false" Visible='<%# If(Eval("account_status") = 1, "True", "False")%>'><i class="fa fa-times text-danger" ></i></asp:LinkButton></p> 
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
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT TOP(15) * FROM [tblEmployee] ORDER BY [employee_id] DESC"></asp:SqlDataSource>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-6 -->                        
                    </div>
                    <!-- /.row -->

                    

                </div>
                <!-- /.container-fluid -->    
</asp:Content>
