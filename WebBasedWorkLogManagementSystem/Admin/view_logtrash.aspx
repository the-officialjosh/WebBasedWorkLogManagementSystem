<%@ Page Title="Deleted Logs | Admin Panel | Web-Based Worklog Management System" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Admin.Master" CodeBehind="view_logtrash.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.view_logtrash" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Remove/Reverse Log Entries</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">                            
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Use the form below to remove/reverse deleted logs
                                    </div>                        
                                <div class="panel-body">                                   
                                    <div class="row">
                                          <div class="col-lg-12">
                                            <h4></h4>
                                           <div class="table-responsive">
                                               <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                   <ContentTemplate>
                                                <fieldset>
                                                    <legend>Showing All Deleted Logs</legend>
                                                    <div class="row pull-right"> 
                                                        <div class="col-md-5"></div>
                                                         <div class="col-md-7">                                                      
                                                        <div class="col-lg-12">
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
                                                    <asp:GridView ID="GridView1" runat="server" DataKeyNames="work_id" style="font-family:Verdana; font-size:8pt" OnRowCommand="GridView1_RowCommand" EmptyDataText="No Deleted Log Entry found" DataSourceID="SqlDataSource1" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" AllowSorting="True">
                                                         <Columns>
                                             <asp:TemplateField HeaderText="Action" HeaderStyle-Font-Bold="false" ItemStyle-Width="9%">
                                            <ItemTemplate>
                                                <p style="text-align:center; font-size:medium;">
                                                    <asp:LinkButton ID="DeleteLink" data-toggle='tooltip' data-original-title="Delete this Log Permanently" runat="server" CommandName="deleteLog" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "work_id") %>' CausesValidation="false"><asp:Image ID="Image1" runat="server" ImageUrl="~/images/delete.png" Height="20px" Width="20px" /></asp:LinkButton>
                                                    <asp:LinkButton ID="ReverseLink" data-toggle='tooltip' data-original-title="Reverse this Log" runat="server" CommandName="reverseLog" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "work_id") %>' CausesValidation="false"><asp:Image ID="Image2" runat="server" ImageUrl="~/images/cancel.jpg" Height="20px" Width="20px" /></asp:LinkButton>
                                                </p>                                                  
                                                <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender3" runat="server" TargetControlID="DeleteLink" ConfirmText="This log entry will be deleted permanently?" />
                                                <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" TargetControlID="ReverseLink" ConfirmText="This log entry will be reversed?" />
                                            </ItemTemplate>
                                                        <HeaderStyle Font-Bold="False" />
                                        </asp:TemplateField>
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
                                                    
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT tblProject.project_name, tblTask.task_name, tblTask.task_desc, tblTask.task_startdate, tblTask.task_enddate, tblTask.task_completedate, tblTask.task_status, tblEmployee.employee_fname, tblEmployee.employee_lname, tblWork.*, tblEmployee_1.employee_fname AS emp_fname, tblEmployee_1.employee_lname AS emp_lname FROM tblWork INNER JOIN tblProject ON tblWork.project_id = tblProject.project_id INNER JOIN tblTask ON tblWork.task_id = tblTask.task_id INNER JOIN tblEmployee ON tblWork.supervisor_id = tblEmployee.employee_id INNER JOIN tblEmployee AS tblEmployee_1 ON tblTask.employee_id = tblEmployee_1.employee_id WHERE (tblWork.work_delete = @work_delete)"
                                                         FilterExpression="work_location LIKE '%{0}%' or work_desc LIKE '%{0}%' or work_status LIKE '%{0}%' or work_time LIKE '%{0}%' or worklog_desc LIKE '%{0}%' or log_time LIKE '%{0}%' or time_diff LIKE '%{0}%' or project_name LIKE '%{0}%' or task_name LIKE '%{0}%' or task_desc LIKE '%{0}%' or task_startdate LIKE '%{0}%' or task_enddate LIKE '%{0}%' or employee_fname LIKE '%{0}%' or employee_lname LIKE '%{0}%' or task_completedate LIKE '%{0}%' or task_status LIKE '%{0}%' or work_date LIKE '%{0}%'" DeleteCommand="DELETE FROM tblWork WHERE (work_id = @work_id)">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="work_id" />
                                                        </DeleteParameters>
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
                                                             <asp:Parameter DefaultValue="1" Name="work_delete" />
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
