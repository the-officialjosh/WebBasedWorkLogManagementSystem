<%@ Page Title="Task List | Employee Panel | Web-Based Worklog Management System" Language="vb" AutoEventWireup="false" MasterPageFile="~/Employee/Employee.Master" CodeBehind="task_list.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.task_list" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Task List</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">                            
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Use the form below to edit/view/filter all your Project Task(s)
                                    </div>                        
                                <div class="panel-body">                                   
                                    <div class="row">
                                          <div class="col-lg-12">
                                            <h4></h4>
                                           <div class="table-responsive">
                                               <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                   <ContentTemplate>
                                                <fieldset>
                                                    <legend>My Task List</legend>
                                                    <div class="row pull-right"> 
                                                        <div class="col-md-5"></div>
                                                         <div class="col-md-7">
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
                                                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search" CssClass="form-control" Width="100%" autofocus="true"></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-default"><i class="fa fa-search"></i></asp:LinkButton>                                                       
                                                    </span>
                                                </div>                                                            
                                                       </div>  
                                                       </div>
                                                    </div>
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <asp:GridView ID="GridView1" runat="server" style="font-family:Lato; font-size:8pt" DataKeyNames="task_id" EmptyDataText="No Project Task found" DataSourceID="SqlDataSource4" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" AllowSorting="True">
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/images/cancel.jpg" DeleteImageUrl="~/images/delete.png" EditImageUrl="~/images/edit.png" HeaderText="Action" ShowDeleteButton="False" ShowEditButton="True" UpdateImageUrl="~/images/okay.png">
                                                            <ControlStyle Height="20px" Width="20px" />
                                                            </asp:CommandField>
                                                            <asp:BoundField DataField="task_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="task_id" />
                                                            <asp:BoundField DataField="project_id" HeaderText="project_id" SortExpression="project_id" ReadOnly="True" Visible="False" >
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="supervisor_id" HeaderText="supervisor_id" SortExpression="supervisor_id" ReadOnly="True" Visible="False" />
                                                            <asp:BoundField DataField="employee_id" HeaderText="employee_id" SortExpression="employee_id" ReadOnly="True" Visible="False" />                                                             
                                                            <asp:BoundField DataField="project_name" HeaderText="ProjectName" SortExpression="project_name" ControlStyle-Width="100px" >
                                                            <ControlStyle Width="100px" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="Supervisor">
                                                                <ItemTemplate>
                                                                    <%# Eval("employee_lname") & " " & Eval("employee_fname") %>
                                                                </ItemTemplate>
                                                             </asp:TemplateField>
                                                            <asp:BoundField DataField="task_name" HeaderText="TaskName" SortExpression="task_name" >
                                                            <ControlStyle Width="100%" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="task_desc" HeaderText="TaskDescription" SortExpression="task_desc" ControlStyle-Width="100%" ItemStyle-Width="30%" >                                                                

                                                            <ControlStyle Width="100%" />
                                                            <ItemStyle Width="30%" />
                                                            </asp:BoundField>

                                                            <asp:TemplateField HeaderText="Status" SortExpression="task_status" HeaderStyle-Font-Bold="false">
                                                    <EditItemTemplate>
                                                     <asp:DropDownList ID="statusDDL" runat="server" Width="80px" Height="25px" AppendDataBoundItems="True" SelectedValue='<%#Bind("task_status") %>'>
                                                         <asp:ListItem Value="0" Text="Choose Option..."></asp:ListItem>
                                                         <asp:ListItem Value="Active" Text="Active"></asp:ListItem>
                                                         <asp:ListItem Value="Pending" Text="Pending"></asp:ListItem>
                                                         <asp:ListItem Value="Cancelled" Text="Cancelled"></asp:ListItem>
                                                         <asp:ListItem Value="Completed" Text="Completed"></asp:ListItem>                                                         
                                                     </asp:DropDownList>											                                               
                                                    </EditItemTemplate>                                             
                                                         <ItemTemplate>
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("task_status") %>'></asp:Label>
                                                         </ItemTemplate>
                                                                <HeaderStyle Font-Bold="False" />
                                                    </asp:TemplateField>  
                                                            <asp:TemplateField HeaderText="StartDate" SortExpression="task_startdate" HeaderStyle-Font-Bold="False">
                                                                <EditItemTemplate>
                                                                <asp:TextBox ID="txtStart" runat="server" Text='<%# Bind("task_startdate") %>' Width="100px"></asp:TextBox>
                                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtStart" />
                                                                </EditItemTemplate>
                                              
                                                                <ItemTemplate>
                                                                <%# Eval("task_startdate") %>
                                                                </ItemTemplate>
                                                                <HeaderStyle Font-Bold="False" />
                                                             </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="EndDate" SortExpression="task_enddate" HeaderStyle-Font-Bold="False">
                                                                <EditItemTemplate>
                                                                <asp:TextBox ID="txtEnd" runat="server" Text='<%# Bind("task_enddate") %>' Width="100px"></asp:TextBox>
                                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtEnd" />
                                                                </EditItemTemplate>
                                              
                                                                <ItemTemplate>
                                                                <%# Eval("task_enddate") %>
                                                                </ItemTemplate>
                                                                <HeaderStyle Font-Bold="False" />
                                                             </asp:TemplateField>                                                            
                                                            <asp:BoundField DataField="task_completedate" HeaderText="CompleteDate" SortExpression="task_completedate" NullDisplayText="N/A" ReadOnly="true" />
                                                            <asp:BoundField DataField="created_by" HeaderText="CreatedBy" SortExpression="created_by" NullDisplayText="N/A" ReadOnly="true" />
                                                            <asp:BoundField DataField="date_created" HeaderText="CreatedOn" SortExpression="date_created" ReadOnly="true" Visible="false" />
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
                                                    <asp:GridView ID="GridView2" runat="server" Visible="False" style="font-family:Verdana; font-size:8pt" DataKeyNames="task_id" EmptyDataText="No Project Task found" DataSourceID="SqlDataSource1" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Vertical" AllowSorting="True">
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/images/cancel.jpg" DeleteImageUrl="~/images/delete.png" EditImageUrl="~/images/edit.png" HeaderText="Action" ShowDeleteButton="False" ShowEditButton="True" UpdateImageUrl="~/images/okay.png">
                                                            <ControlStyle Height="20px" Width="20px" />
                                                            </asp:CommandField>
                                                            <asp:BoundField DataField="task_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="task_id" />
                                                            <asp:BoundField DataField="project_id" HeaderText="project_id" SortExpression="project_id" ReadOnly="True" Visible="False" >
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="supervisor_id" HeaderText="supervisor_id" SortExpression="supervisor_id" ReadOnly="True" Visible="False" />
                                                            <asp:BoundField DataField="employee_id" HeaderText="employee_id" SortExpression="employee_id" ReadOnly="True" Visible="False" />                                                             
                                                            <asp:BoundField DataField="project_name" HeaderText="ProjectName" SortExpression="project_name" ControlStyle-Width="100px" >
                                                            <ControlStyle Width="100px" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="Supervisor">
                                                                <ItemTemplate>
                                                                    <%# Eval("employee_lname") & " " & Eval("employee_fname") %>
                                                                </ItemTemplate>
                                                             </asp:TemplateField>
                                                            <asp:BoundField DataField="task_name" HeaderText="TaskName" SortExpression="task_name" >
                                                            <ControlStyle Width="100%" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="task_desc" HeaderText="TaskDescription" SortExpression="task_desc" ControlStyle-Width="100%" ItemStyle-Width="30%" >                                                                

                                                            <ControlStyle Width="100%" />
                                                            <ItemStyle Width="30%" />
                                                            </asp:BoundField>

                                                            <asp:TemplateField HeaderText="Status" SortExpression="task_status" HeaderStyle-Font-Bold="false">
                                                    <EditItemTemplate>
                                                     <asp:DropDownList ID="statusDDL" runat="server" Width="80px" Height="25px" AppendDataBoundItems="True" SelectedValue='<%#Bind("task_status") %>'>
                                                         <asp:ListItem Value="0" Text="Choose Option..."></asp:ListItem>
                                                         <asp:ListItem Value="Active" Text="Active"></asp:ListItem>
                                                         <asp:ListItem Value="Pending" Text="Pending"></asp:ListItem>
                                                         <asp:ListItem Value="Cancelled" Text="Cancelled"></asp:ListItem>
                                                         <asp:ListItem Value="Completed" Text="Completed"></asp:ListItem>                                                         
                                                     </asp:DropDownList>											                                               
                                                    </EditItemTemplate>                                             
                                                         <ItemTemplate>
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("task_status") %>'></asp:Label>
                                                         </ItemTemplate>
                                                                <HeaderStyle Font-Bold="False" />
                                                    </asp:TemplateField>  
                                                            <asp:TemplateField HeaderText="StartDate" SortExpression="task_startdate" HeaderStyle-Font-Bold="False">
                                                                <EditItemTemplate>
                                                                <asp:TextBox ID="txtStart" runat="server" Text='<%# Bind("task_startdate") %>' Width="100px"></asp:TextBox>
                                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtStart" />
                                                                </EditItemTemplate>
                                              
                                                                <ItemTemplate>
                                                                <%# Eval("task_startdate") %>
                                                                </ItemTemplate>
                                                                <HeaderStyle Font-Bold="False" />
                                                             </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="EndDate" SortExpression="task_enddate" HeaderStyle-Font-Bold="False">
                                                                <EditItemTemplate>
                                                                <asp:TextBox ID="txtEnd" runat="server" Text='<%# Bind("task_enddate") %>' Width="100px"></asp:TextBox>
                                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtEnd" />
                                                                </EditItemTemplate>
                                              
                                                                <ItemTemplate>
                                                                <%# Eval("task_enddate") %>
                                                                </ItemTemplate>
                                                                <HeaderStyle Font-Bold="False" />
                                                             </asp:TemplateField>                                                            
                                                            <asp:BoundField DataField="task_completedate" HeaderText="CompleteDate" SortExpression="task_completedate" NullDisplayText="N/A" ReadOnly="true" />
                                                            <asp:BoundField DataField="created_by" HeaderText="CreatedBy" SortExpression="created_by" NullDisplayText="N/A" ReadOnly="true" />
                                                            <asp:BoundField DataField="date_created" HeaderText="CreatedOn" SortExpression="date_created" ReadOnly="true" Visible="false" />
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
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT tblTask.*, tblProject.project_name, tblEmployee.employee_fname, tblEmployee.employee_lname FROM tblTask INNER JOIN tblProject ON tblTask.project_id = tblProject.project_id INNER JOIN tblEmployee ON tblTask.supervisor_id = tblEmployee.employee_id WHERE ((tblTask.employee_id = @employee_id) AND (tblTask.task_delete = @task_delete) AND (tblTask.project_id = @project_id)) ORDER BY tblTask.task_id DESC" UpdateCommand="UPDATE tblTask SET task_name = @task_name, task_desc = @task_desc, task_startdate = @task_startdate, task_enddate = @task_enddate, task_status = @task_status WHERE (task_id = @task_id)"
                                                            FilterExpression="project_name LIKE '%{0}%' or task_name LIKE '%{0}%' or task_desc LIKE '%{0}%' or task_startdate LIKE '%{0}%' or task_enddate LIKE '%{0}%' or employee_fname LIKE '%{0}%' or employee_lname LIKE '%{0}%'">
                                                        <FilterParameters>
                                                            <asp:ControlParameter ControlID="txtSearch" Name="project_name" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="task_name" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="task_desc" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="task_startdate" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="task_enddate" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="employee_fname" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="employee_lname" PropertyName="Text" />                                                                                                                                                                                                                      
                                                        </FilterParameters>  
                                                            <SelectParameters>
                                                                <asp:QueryStringParameter Name="employee_id" QueryStringField="eId" />
                                                                <asp:Parameter DefaultValue="0" Name="task_delete" />
                                                                <asp:ControlParameter ControlID="projectDDL1" DefaultValue="" Name="project_id" PropertyName="SelectedValue" />
                                                            </SelectParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="task_name" />
                                                            <asp:Parameter Name="task_desc" />
                                                            <asp:Parameter Name="task_startdate" />
                                                            <asp:Parameter Name="task_enddate" />
                                                            <asp:Parameter Name="task_status" />
                                                            <asp:Parameter Name="task_id" />
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT tblTask.*, tblProject.project_name, tblEmployee.employee_fname, tblEmployee.employee_lname FROM tblTask INNER JOIN tblProject ON tblTask.project_id = tblProject.project_id INNER JOIN tblEmployee ON tblTask.supervisor_id = tblEmployee.employee_id WHERE (tblTask.employee_id = @employee_id) AND (tblTask.task_delete = @task_delete) ORDER BY tblTask.task_id DESC" UpdateCommand="UPDATE tblTask SET task_name = @task_name, task_desc = @task_desc, task_startdate = @task_startdate, task_enddate = @task_enddate, task_status = @task_status WHERE (task_id = @task_id)"
                                                            FilterExpression="project_name LIKE '%{0}%' or task_name LIKE '%{0}%' or task_desc LIKE '%{0}%' or task_startdate LIKE '%{0}%' or task_enddate LIKE '%{0}%' or employee_fname LIKE '%{0}%' or employee_lname LIKE '%{0}%'">
                                                        <FilterParameters>
                                                            <asp:ControlParameter ControlID="txtSearch" Name="project_name" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="task_name" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="task_desc" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="task_startdate" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="task_enddate" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="employee_fname" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="employee_lname" PropertyName="Text" />                                                                                                                                                                                                                      
                                                        </FilterParameters>  
                                                            <SelectParameters>
                                                                <asp:QueryStringParameter Name="employee_id" QueryStringField="eId" />    
                                                                <asp:Parameter DefaultValue="0" Name="task_delete" />
                                                            </SelectParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="task_name" />
                                                            <asp:Parameter Name="task_desc" />
                                                            <asp:Parameter Name="task_startdate" />
                                                            <asp:Parameter Name="task_enddate" />
                                                            <asp:Parameter Name="task_status" />
                                                            <asp:Parameter Name="task_id" />
                                                        </UpdateParameters>
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
