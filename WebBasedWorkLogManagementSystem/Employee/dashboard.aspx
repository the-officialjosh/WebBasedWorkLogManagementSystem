<%@ Page Title="Employee Dashboard | Web-Based Worklog Management System" Language="vb" AutoEventWireup="false" MasterPageFile="~/Employee/Employee.Master" CodeBehind="dashboard.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.dashboard" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">             
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Employee Dashboard</h1>
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
                                <div class="panel-body">                                   
                                    <div class="row">
                                          <div class="col-lg-12">
                                            <h4></h4>
                                           <div class="table-responsive">
                                               <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                   <ContentTemplate>
                                                <fieldset>
                                                    <legend>Project Details</legend>
                                                    <div class="row pull-right"> 
                                                        <div class="col-md-3">
                                                            <div class="col-lg-12">
                                                           <label>Filter by Work Status:</label>
                                                           <asp:DropDownList ID="statusDDL" runat="server" CssClass="form-control" Width="100%" AppendDataBoundItems="true" AutoPostBack="True">
                                                               <asp:ListItem Value="0" Text="Choose Status..."></asp:ListItem> 
                                                                 <asp:ListItem Value="Completed" Text="Completed"></asp:ListItem>
                                                                <asp:ListItem Value="Cancelled" Text="Cancelled"></asp:ListItem> 
                                                                 <asp:ListItem Value="Suspended" Text="Suspended"></asp:ListItem>    
                                                                </asp:DropDownList>                                                          
                                                       </div>
                                                        </div>
                                                        <div class="col-md-5">
                                                       <div class="col-lg-6 pull-left">
                                                           <label>Filter by Projects:</label>
                                                           <asp:DropDownList ID="projectDDL1" runat="server" CssClass="form-control" Width="100%" AppendDataBoundItems="true" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="project_name" DataValueField="project_id">
                                                               <asp:ListItem Value="0" Text="Choose Project..."></asp:ListItem>                                                              
                                                           </asp:DropDownList>
                                                           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT [project_id], [project_name] FROM [tblProject] ORDER BY [project_name]"></asp:SqlDataSource>
                                                       </div>

                                                        <div class="col-lg-6 pull-right">
                                                            <label>Search:</label>
                                                            <div class="form-group input-group">
                                                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search" CssClass="form-control" Width="100%"></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-default"><i class="fa fa-search"></i></asp:LinkButton>                                                       
                                                    </span>
                                                </div>                                                            
                                                       </div>  
                                                       </div>
                                                        <div class="col-md-4">
                                                            <div class="col-lg-6 pull-left">
                                                            <label>From: <asp:Label ID="lblError1" runat="server" Text="*" ForeColor="Red" Visible="false"></asp:Label></label>
                                                            <div class="form-group">
                                                    <asp:TextBox ID="txtFrom" runat="server" placeholder="From Date" CssClass="form-control" Width="100%"></asp:TextBox> 
                                               <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtFrom" Format="dd-MMM-yyyy" />                                                             
                                                </div>                                                            
                                                       </div>
                                                        
                                                            <div class="col-lg-6 pull-right">
                                                            <label>To: <asp:Label ID="lblError2" runat="server" Text="*" ForeColor="Red" Visible="false"></asp:Label></label>
                                                            <div class="form-group input-group">
                                                    <asp:TextBox ID="txtTo" runat="server" placeholder="To Date" CssClass="form-control" Width="100%"></asp:TextBox>
                                                  <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtTo" Format="dd-MMM-yyyy" />
                                                    <span class="input-group-btn">
                                                        <asp:LinkButton ID="LinkButton3" runat="server" class="btn btn-default"><i class="fa fa-search"></i></asp:LinkButton>                                                       
                                                    </span>
                                                </div>                                                            
                                                       </div>
                                                        </div>
                                                         
                                                    </div>
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <asp:GridView ID="GridView1" runat="server" style="font-family:Verdana; font-size:8pt" DataKeyNames="work_id" EmptyDataText="No Work/Log Entry found" DataSourceID="Grid1SqlSource" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" AllowSorting="True">
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                            <asp:BoundField DataField="work_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="work_id" Visible="false" />
                                                            <asp:BoundField DataField="work_date" HeaderText="LogDate" SortExpression="work_date" >
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="project_name" HeaderText="ProjectName" SortExpression="project_name" />
                                                            <asp:TemplateField HeaderText="Supervisor">
                                                                <ItemTemplate>
                                                                    <%# Eval("employee_lname") & " " & Eval("employee_fname") %>
                                                                </ItemTemplate>
                                                             </asp:TemplateField>
                                                            <asp:BoundField DataField="task_name" HeaderText="TaskName" SortExpression="task_name" NullDisplayText="N/A" />                                                             
                                                            <asp:BoundField DataField="task_status" HeaderText="TaskStatus" SortExpression="task_status" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_location" HeaderText="Location" SortExpression="work_location" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_status" HeaderText="WorkStatus" SortExpression="work_status" NullDisplayText="N/A"/>
                                                            <asp:BoundField DataField="work_desc" HeaderText="WorkDescription" SortExpression="work_desc" NullDisplayText="N/A"/>
                                                             <asp:TemplateField HeaderText="Work/LogTime">
                                                                <ItemTemplate>
                                                                    <%# Eval("work_time") & "/" & Eval("log_time") & "<br/>" & "<strong>" & Eval("time_diff") & "</strong>" %> 
                                                                </ItemTemplate>
                                                             </asp:TemplateField>                                                                                                                                                                                  
                                                            <asp:BoundField DataField="date_created" HeaderText="DateCreated" SortExpression="date_created" Visible="false" />
                                                             <asp:TemplateField HeaderText="LogDescription">
                                                                <ItemTemplate>
                                                                    <asp:Panel ID="Panel1" runat="server" Visible='<%# If(Eval("worklog_desc").ToString() = "", "True", "False")%>'>
                                                                        <a href='<%#Eval("work_id", "log_entry.aspx?workId={0}") & "&taskId=" & Eval("task_id") & "&eId=" & Request.QueryString("eId") & "&user=" & Request.QueryString("user")%>'><i class="fa fa-plus"></i> Add Log</a>
                                                                    </asp:Panel>
                                                                   <asp:Panel ID="Panel2" runat="server" Visible='<%# If(Eval("worklog_desc").ToString().Length > 0, "True", "False")%>'>
                                                                       <%# Eval("worklog_desc")  %>
                                                                   </asp:Panel>                                                                   
                                                                </ItemTemplate>
                                                             </asp:TemplateField>      
                                                        </Columns>
                                                        <EditRowStyle BackColor="#2461BF" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#EFF3FB" />
                                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                    </asp:GridView>

                                                    <asp:GridView ID="GridView2" runat="server" style="font-family:Verdana; font-size:8pt" Visible="False" DataKeyNames="work_id" EmptyDataText="No Work/Log Entry found" DataSourceID="Grid2SqlSource" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" AllowSorting="True">
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                            <asp:BoundField DataField="work_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="work_id" Visible="false" />
                                                            <asp:BoundField DataField="work_date" HeaderText="LogDate" SortExpression="work_date" >
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="project_name" HeaderText="ProjectName" SortExpression="project_name" />
                                                            <asp:TemplateField HeaderText="Supervisor">
                                                                <ItemTemplate>
                                                                    <%# Eval("employee_lname") & " " & Eval("employee_fname") %>
                                                                </ItemTemplate>
                                                             </asp:TemplateField>
                                                            <asp:BoundField DataField="task_name" HeaderText="TaskName" SortExpression="task_name" NullDisplayText="N/A" />                                                             
                                                            <asp:BoundField DataField="task_status" HeaderText="TaskStatus" SortExpression="task_status" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_location" HeaderText="Location" SortExpression="work_location" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_status" HeaderText="WorkStatus" SortExpression="work_status" NullDisplayText="N/A"/>
                                                            <asp:BoundField DataField="work_desc" HeaderText="WorkDescription" SortExpression="work_desc" NullDisplayText="N/A"/>
                                                             <asp:TemplateField HeaderText="Work/LogTime">
                                                                <ItemTemplate>
                                                                    <%# Eval("work_time") & "/" & Eval("log_time") & "<br/>" & "<strong>" & Eval("time_diff") & "</strong>" %> 
                                                                </ItemTemplate>
                                                             </asp:TemplateField>                                                                                                                                                                                  
                                                            <asp:BoundField DataField="date_created" HeaderText="DateCreated" SortExpression="date_created" Visible="false" />
                                                             <asp:TemplateField HeaderText="LogDescription">
                                                                <ItemTemplate>
                                                                    <asp:Panel ID="Panel1" runat="server" Visible='<%# If(Eval("worklog_desc").ToString() = "", "True", "False")%>'>
                                                                        <a href='<%#Eval("work_id", "log_entry.aspx?workId={0}") & "&taskId=" & Eval("task_id") & "&eId=" & Request.QueryString("eId") & "&user=" & Request.QueryString("user")%>'><i class="fa fa-plus"></i> Add Log</a>
                                                                    </asp:Panel>
                                                                   <asp:Panel ID="Panel2" runat="server" Visible='<%# If(Eval("worklog_desc").ToString().Length > 0, "True", "False")%>'>
                                                                       <%# Eval("worklog_desc")  %>
                                                                   </asp:Panel>                                                                   
                                                                </ItemTemplate>
                                                             </asp:TemplateField>      
                                                        </Columns>
                                                        <EditRowStyle BackColor="#2461BF" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#EFF3FB" />
                                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                    </asp:GridView>
                                                    <asp:GridView ID="GridView3" runat="server" style="font-family:Verdana; font-size:8pt" Visible="False" DataKeyNames="work_id" EmptyDataText="No Work/Log Entry found" DataSourceID="Grid3SqlSource" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" AllowSorting="True">
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                            <asp:BoundField DataField="work_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="work_id" Visible="false" />
                                                            <asp:BoundField DataField="work_date" HeaderText="LogDate" SortExpression="work_date" >
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="project_name" HeaderText="ProjectName" SortExpression="project_name" />
                                                            <asp:TemplateField HeaderText="Supervisor">
                                                                <ItemTemplate>
                                                                    <%# Eval("employee_lname") & " " & Eval("employee_fname") %>
                                                                </ItemTemplate>
                                                             </asp:TemplateField>
                                                            <asp:BoundField DataField="task_name" HeaderText="TaskName" SortExpression="task_name" NullDisplayText="N/A" />                                                             
                                                            <asp:BoundField DataField="task_status" HeaderText="TaskStatus" SortExpression="task_status" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_location" HeaderText="Location" SortExpression="work_location" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_status" HeaderText="WorkStatus" SortExpression="work_status" NullDisplayText="N/A"/>
                                                            <asp:BoundField DataField="work_desc" HeaderText="WorkDescription" SortExpression="work_desc" NullDisplayText="N/A"/>
                                                             <asp:TemplateField HeaderText="Work/LogTime">
                                                                <ItemTemplate>
                                                                    <%# Eval("work_time") & "/" & Eval("log_time") & "<br/>" & "<strong>" & Eval("time_diff") & "</strong>" %> 
                                                                </ItemTemplate>
                                                             </asp:TemplateField>                                                                                                                                                                                  
                                                            <asp:BoundField DataField="date_created" HeaderText="DateCreated" SortExpression="date_created" Visible="false" />
                                                             <asp:TemplateField HeaderText="LogDescription">
                                                                <ItemTemplate>
                                                                    <asp:Panel ID="Panel1" runat="server" Visible='<%# If(Eval("worklog_desc").ToString() = "", "True", "False")%>'>
                                                                        <a href='<%#Eval("work_id", "log_entry.aspx?workId={0}") & "&taskId=" & Eval("task_id") & "&eId=" & Request.QueryString("eId") & "&user=" & Request.QueryString("user")%>'><i class="fa fa-plus"></i> Add Log</a>
                                                                    </asp:Panel>
                                                                   <asp:Panel ID="Panel2" runat="server" Visible='<%# If(Eval("worklog_desc").ToString().Length > 0, "True", "False")%>'>
                                                                       <%# Eval("worklog_desc")  %>
                                                                   </asp:Panel>                                                                   
                                                                </ItemTemplate>
                                                             </asp:TemplateField>      
                                                        </Columns>
                                                        <EditRowStyle BackColor="#2461BF" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#EFF3FB" />
                                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                    </asp:GridView>
                                                    <asp:GridView ID="GridView4" Visible="False" style="font-family:Verdana; font-size:8pt" DataKeyNames="work_id" runat="server" EmptyDataText="No Work/Log Entry found" DataSourceID="Grid4SqlSource" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" AllowSorting="True">
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                            <asp:BoundField DataField="work_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="work_id" Visible="false" />
                                                            <asp:BoundField DataField="work_date" HeaderText="LogDate" SortExpression="work_date" >
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="project_name" HeaderText="ProjectName" SortExpression="project_name" />
                                                            <asp:TemplateField HeaderText="Supervisor">
                                                                <ItemTemplate>
                                                                    <%# Eval("employee_lname") & " " & Eval("employee_fname") %>
                                                                </ItemTemplate>
                                                             </asp:TemplateField>
                                                            <asp:BoundField DataField="task_name" HeaderText="TaskName" SortExpression="task_name" NullDisplayText="N/A" />                                                             
                                                            <asp:BoundField DataField="task_status" HeaderText="TaskStatus" SortExpression="task_status" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_location" HeaderText="Location" SortExpression="work_location" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_status" HeaderText="WorkStatus" SortExpression="work_status" NullDisplayText="N/A"/>
                                                            <asp:BoundField DataField="work_desc" HeaderText="WorkDescription" SortExpression="work_desc" NullDisplayText="N/A"/>
                                                             <asp:TemplateField HeaderText="Work/LogTime">
                                                                <ItemTemplate>
                                                                    <%# Eval("work_time") & "/" & Eval("log_time") & "<br/>" & "<strong>" & Eval("time_diff") & "</strong>" %> 
                                                                </ItemTemplate>
                                                             </asp:TemplateField>                                                                                                                                                                                  
                                                            <asp:BoundField DataField="date_created" HeaderText="DateCreated" SortExpression="date_created" Visible="false" />
                                                             <asp:TemplateField HeaderText="LogDescription">
                                                                <ItemTemplate>
                                                                    <asp:Panel ID="Panel1" runat="server" Visible='<%# If(Eval("worklog_desc").ToString() = "", "True", "False")%>'>
                                                                        <a href='<%#Eval("work_id", "log_entry.aspx?workId={0}") & "&taskId=" & Eval("task_id") & "&eId=" & Request.QueryString("eId") & "&user=" & Request.QueryString("user")%>'><i class="fa fa-plus"></i> Add Log</a>
                                                                    </asp:Panel>
                                                                   <asp:Panel ID="Panel2" runat="server" Visible='<%# If(Eval("worklog_desc").ToString().Length > 0, "True", "False")%>'>
                                                                       <%# Eval("worklog_desc")  %>
                                                                   </asp:Panel>                                                                   
                                                                </ItemTemplate>
                                                             </asp:TemplateField>      
                                                        </Columns>
                                                        <EditRowStyle BackColor="#2461BF" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#EFF3FB" />
                                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                    </asp:GridView>


                                                    <asp:SqlDataSource ID="Grid1SqlSource" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT tblProject.project_name, tblTask.task_name, tblTask.task_desc, tblTask.task_startdate, tblTask.task_enddate, tblTask.task_completedate, tblTask.task_status, tblEmployee.employee_fname, tblEmployee.employee_lname, tblWork.*, tblWork.employee_id AS Expr1 FROM tblWork INNER JOIN tblProject ON tblWork.project_id = tblProject.project_id INNER JOIN tblTask ON tblWork.task_id = tblTask.task_id INNER JOIN tblEmployee ON tblWork.supervisor_id = tblEmployee.employee_id WHERE (tblWork.employee_id = @employee_id) AND (tblWork.work_delete = @work_delete)"
                                                         FilterExpression="work_location LIKE '%{0}%' or work_desc LIKE '%{0}%' or work_status LIKE '%{0}%' or work_time LIKE '%{0}%' or worklog_desc LIKE '%{0}%' or log_time LIKE '%{0}%' or time_diff LIKE '%{0}%' or project_name LIKE '%{0}%' or task_name LIKE '%{0}%' or task_desc LIKE '%{0}%' or task_startdate LIKE '%{0}%' or task_enddate LIKE '%{0}%' or employee_fname LIKE '%{0}%' or employee_lname LIKE '%{0}%' or task_completedate LIKE '%{0}%' or task_status LIKE '%{0}%' or work_date LIKE '%{0}%'">
                                                        <FilterParameters>
                                                            <asp:ControlParameter ControlID="txtSearch" Name="work_location" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="work_desc" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="work_status" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="work_time" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="worklog_desc" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="log_time" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="time_diff" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="project_name" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="task_name" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="task_desc" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="task_startdate" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="task_enddate" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="employee_fname" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="employee_lname" PropertyName="Text" />                                                                                                                                                                                                                      
                                                            <asp:ControlParameter ControlID="txtSearch" Name="task_completedate" PropertyName="Text" />                                                                                                                                                                                                                      
                                                            <asp:ControlParameter ControlID="txtSearch" Name="task_status" PropertyName="Text" />                                                                                                                                                                                                                      
                                                            <asp:ControlParameter ControlID="txtSearch" Name="work_date" PropertyName="Text" />                                                                                                                                                                                                                      
                                                        </FilterParameters>  
                                                        <SelectParameters>
                                                             <asp:QueryStringParameter Name="employee_id" QueryStringField="eId" /> 
                                                             <asp:Parameter DefaultValue="0" Name="work_delete" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="Grid2SqlSource" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT tblProject.project_name, tblTask.task_name, tblTask.task_desc, tblTask.task_startdate, tblTask.task_enddate, tblTask.task_completedate, tblTask.task_status, tblEmployee.employee_fname, tblEmployee.employee_lname, tblWork.*, tblWork.employee_id AS Expr1 FROM tblWork INNER JOIN tblProject ON tblWork.project_id = tblProject.project_id INNER JOIN tblTask ON tblWork.task_id = tblTask.task_id INNER JOIN tblEmployee ON tblWork.supervisor_id = tblEmployee.employee_id WHERE (tblWork.employee_id = @employee_id) AND (tblWork.project_id = @project_id) AND (tblWork.work_delete = @work_delete)">
                                                        <SelectParameters>
                                                             <asp:QueryStringParameter Name="employee_id" QueryStringField="eId" />
                                                           <asp:ControlParameter ControlID="projectDDL1" DefaultValue="" Name="project_id" PropertyName="SelectedValue" />
                                                             <asp:Parameter DefaultValue="0" Name="work_delete" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>                                                    
                                                    <asp:SqlDataSource ID="Grid3SqlSource" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT tblProject.project_name, tblTask.task_name, tblTask.task_desc, tblTask.task_startdate, tblTask.task_enddate, tblTask.task_completedate, tblTask.task_status, tblEmployee.employee_fname, tblEmployee.employee_lname, tblWork.*, tblWork.employee_id AS Expr1 FROM tblWork INNER JOIN tblProject ON tblWork.project_id = tblProject.project_id INNER JOIN tblTask ON tblWork.task_id = tblTask.task_id INNER JOIN tblEmployee ON tblWork.supervisor_id = tblEmployee.employee_id WHERE (tblWork.employee_id = @employee_id)  AND (tblWork.work_delete = @work_delete) AND (((tblWork.work_date) BETWEEN @work_date1 AND @work_date2))">
                                                        <SelectParameters>
                                                             <asp:QueryStringParameter Name="employee_id" QueryStringField="eId" />
                                                             <asp:Parameter DefaultValue="0" Name="work_delete" />
                                                            <asp:ControlParameter ControlID="txtFrom" Name="work_date1" PropertyName="Text" Type="DateTime" />
                                                            <asp:ControlParameter ControlID="txtTo" Name="work_date2" PropertyName="Text" Type="DateTime" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="Grid4SqlSource" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT tblProject.project_name, tblTask.task_name, tblTask.task_desc, tblTask.task_startdate, tblTask.task_enddate, tblTask.task_completedate, tblTask.task_status, tblEmployee.employee_fname, tblEmployee.employee_lname, tblWork.*, tblWork.employee_id AS Expr1 FROM tblWork INNER JOIN tblProject ON tblWork.project_id = tblProject.project_id INNER JOIN tblTask ON tblWork.task_id = tblTask.task_id INNER JOIN tblEmployee ON tblWork.supervisor_id = tblEmployee.employee_id WHERE (tblWork.employee_id = @employee_id) AND (tblWork.work_status = @work_status) AND (tblWork.work_delete = @work_delete)">
                                                        <SelectParameters>
                                                             <asp:QueryStringParameter Name="employee_id" QueryStringField="eId" />
                                                             <asp:Parameter DefaultValue="0" Name="work_delete" />
                                                           <asp:ControlParameter ControlID="statusDDL" DefaultValue="" Name="work_status" PropertyName="SelectedValue" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </fieldset>                                                       
                                                   </ContentTemplate>
                                               </asp:UpdatePanel>
                                            </div>
                                            
                                        </div>
                                        <!-- /.col-lg-6 (nested) -->
                                    </div>
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
