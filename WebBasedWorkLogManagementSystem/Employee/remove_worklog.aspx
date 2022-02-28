<%@ Page Title="Remove Worklog | Employee Panel | Web-Based Worklog Management System" Language="vb" AutoEventWireup="false" MasterPageFile="~/Employee/Employee.Master" CodeBehind="remove_worklog.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.remove_worklog" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Remove Worklog(s)</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>     
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">                            
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Use the form below to remove your Project Worklog(s)
                                    </div>                        
                                <div class="panel-body">                                   
                                    <div class="row">
                                          <div class="col-lg-12">
                                            <h4></h4>
                                           <div class="table-responsive">
                                               <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                   <ContentTemplate>
                                                <fieldset>
                                                    <legend>My Worklog Entries</legend>
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
                                                     <asp:GridView ID="GridView1" runat="server" DataKeyNames="work_id" EmptyDataText="No Work/Log Entry found" style="font-family:Verdana; font-size:8pt" OnRowCommand="GridView1_RowCommand" DataSourceID="SqlDataSource1" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" AllowSorting="True">
                                                         <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Action" HeaderStyle-Font-Bold="false">
                                            <ItemTemplate>
                                                <p style="text-align:center; font-size:large;"> <asp:LinkButton ID="DeleteLink" data-toggle='tooltip' data-original-title="Delete this Log" runat="server" CommandName="deleteLog" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "work_id") %>' CausesValidation="false">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/delete.png" Height="20px" Width="20px" /></asp:LinkButton></p>                                                   
                                                <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="DeleteLink" ConfirmText="This log will be deleted?" />
                                            </ItemTemplate>
                                                        <HeaderStyle Font-Bold="False" />
                                        </asp:TemplateField>
                                                            <asp:BoundField DataField="work_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="work_id" />
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
                                                             <asp:TemplateField HeaderText="LogEntry">
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
                                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT tblProject.project_name, tblTask.task_name, tblTask.task_desc, tblTask.task_startdate, tblTask.task_enddate, tblTask.task_completedate, tblTask.task_status, tblEmployee.employee_fname, tblEmployee.employee_lname, tblWork.*, tblWork.employee_id AS Expr1 FROM tblWork INNER JOIN tblProject ON tblWork.project_id = tblProject.project_id INNER JOIN tblTask ON tblWork.task_id = tblTask.task_id INNER JOIN tblEmployee ON tblWork.supervisor_id = tblEmployee.employee_id WHERE (tblWork.employee_id = @employee_id) AND (tblWork.work_delete = @work_delete)"
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
                                                             <asp:QueryStringParameter Name="employee_id" QueryStringField="eId" />   
                                                             <asp:Parameter DefaultValue="0" Name="work_delete" />
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
