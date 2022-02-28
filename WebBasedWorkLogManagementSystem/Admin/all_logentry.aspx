<%@ Page Title="All Log Entry | Admin Panel | Web-Based Worklog Management System" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Admin.Master" CodeBehind="all_logentry.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.all_logentry" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">All Log Entries</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>

           <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">                            
                            <div class="panel panel-default">                                                    
                                <div class="panel-body">                                   
                                    <div class="row">
                                         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                   <ContentTemplate>
                                        <div class="col-lg-12">
                                              <asp:Button ID="Button1" runat="server" Text="Generate Report" CssClass="btn btn-primary pull-right" OnClick="Button1_Click" Visible="true" />
                                              <asp:Button ID="Button2" runat="server" Text="Generate Report" CssClass="btn btn-primary pull-right" OnClick="Button2_Click" Visible="false" />
                                              <asp:Button ID="Button3" runat="server" Text="Generate Report" CssClass="btn btn-primary pull-right" OnClick="Button3_Click" Visible="false" />
                                              <asp:Button ID="Button4" runat="server" Text="Generate Report" CssClass="btn btn-primary pull-right" OnClick="Button4_Click" Visible="false" />
                                        </div>
                                           </ContentTemplate>
                                               </asp:UpdatePanel>
                                          <div class="col-lg-12">                                                                                     
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
                                                    <asp:GridView ID="GridView1" runat="server" DataKeyNames="work_id" style="font-family:Verdana; font-size:8pt" EmptyDataText="No Work/Log Entry found" DataSourceID="Grid1SqlSource" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowSorting="True">
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
                                                            <asp:TemplateField HeaderText="EmployeeName">
                                                                <ItemTemplate>
                                                                    <%# Eval("emp_lname") & " " & Eval("emp_fname") %>
                                                                </ItemTemplate>
                                                             </asp:TemplateField>
                                                            <asp:BoundField DataField="task_name" HeaderText="TaskName" SortExpression="task_name" NullDisplayText="N/A" />                                                             
                                                            <asp:BoundField DataField="task_status" HeaderText="TaskStatus" SortExpression="task_status" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_location" HeaderText="Location" SortExpression="work_location" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_status" HeaderText="WorkStatus" SortExpression="work_status" NullDisplayText="N/A"/>
                                                            <asp:BoundField DataField="work_desc" HeaderText="WorkPerformed" SortExpression="work_desc" NullDisplayText="N/A"/>
                                                             <asp:TemplateField HeaderText="Work/LogTime">
                                                                <ItemTemplate>
                                                                   <%# Eval("work_time") & "/" & Eval("log_time") & "<br/>" & "<strong>" & Eval("time_diff") & "</strong>" %> 
                                                                </ItemTemplate>
                                                             </asp:TemplateField>                                                                                                                                                                                                                                              
                                                            <asp:BoundField DataField="worklog_desc" HeaderText="LogEntry" SortExpression="worklog_desc" />         
                                                        </Columns>
                                                        <FooterStyle BackColor="#CCCC99" />
                                                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                        <RowStyle BackColor="#F7F7DE" />
                                                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                                        <SortedAscendingHeaderStyle BackColor="#848384" />
                                                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                                        <SortedDescendingHeaderStyle BackColor="#575357" />
                                                    </asp:GridView>
                                                    <asp:GridView ID="GridView2" runat="server" Visible="false" DataKeyNames="work_id" EmptyDataText="No Work/Log Entry found" style="font-family:Verdana; font-size:8pt" DataSourceID="Grid2SqlSource" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowSorting="True">
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
                                                            <asp:TemplateField HeaderText="EmployeeName">
                                                                <ItemTemplate>
                                                                    <%# Eval("emp_lname") & " " & Eval("emp_fname") %>
                                                                </ItemTemplate>
                                                             </asp:TemplateField>
                                                            <asp:BoundField DataField="task_name" HeaderText="TaskName" SortExpression="task_name" NullDisplayText="N/A" />                                                             
                                                            <asp:BoundField DataField="task_status" HeaderText="TaskStatus" SortExpression="task_status" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_location" HeaderText="Location" SortExpression="work_location" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_status" HeaderText="WorkStatus" SortExpression="work_status" NullDisplayText="N/A"/>
                                                            <asp:BoundField DataField="work_desc" HeaderText="WorkPerformed" SortExpression="work_desc" NullDisplayText="N/A"/>
                                                             <asp:TemplateField HeaderText="Work/LogTime">
                                                                <ItemTemplate>
                                                                   <%# Eval("work_time") & "/" & Eval("log_time") & "<br/>" & "<strong>" & Eval("time_diff") & "</strong>" %> 
                                                                </ItemTemplate>
                                                             </asp:TemplateField>                                                                                                                                                                                                                                              
                                                            <asp:BoundField DataField="worklog_desc" HeaderText="LogEntry" SortExpression="worklog_desc" />         
                                                        </Columns>
                                                        <FooterStyle BackColor="#CCCC99" />
                                                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                        <RowStyle BackColor="#F7F7DE" />
                                                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                                        <SortedAscendingHeaderStyle BackColor="#848384" />
                                                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                                        <SortedDescendingHeaderStyle BackColor="#575357" />
                                                    </asp:GridView>
                                                    <asp:GridView ID="GridView3" runat="server" style="font-family:Verdana; font-size:8pt" Visible="false" DataKeyNames="work_id" EmptyDataText="No Work/Log Entry found" DataSourceID="Grid3SqlSource" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowSorting="True">
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
                                                            <asp:TemplateField HeaderText="EmployeeName">
                                                                <ItemTemplate>
                                                                    <%# Eval("emp_lname") & " " & Eval("emp_fname") %>
                                                                </ItemTemplate>
                                                             </asp:TemplateField>
                                                            <asp:BoundField DataField="task_name" HeaderText="TaskName" SortExpression="task_name" NullDisplayText="N/A" />                                                             
                                                            <asp:BoundField DataField="task_status" HeaderText="TaskStatus" SortExpression="task_status" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_location" HeaderText="Location" SortExpression="work_location" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_status" HeaderText="WorkStatus" SortExpression="work_status" NullDisplayText="N/A"/>
                                                            <asp:BoundField DataField="work_desc" HeaderText="WorkPerformed" SortExpression="work_desc" NullDisplayText="N/A"/>
                                                             <asp:TemplateField HeaderText="Work/LogTime">
                                                                <ItemTemplate>
                                                                   <%# Eval("work_time") & "/" & Eval("log_time") & "<br/>" & "<strong>" & Eval("time_diff") & "</strong>" %> 
                                                                </ItemTemplate>
                                                             </asp:TemplateField>                                                                                                                                                                                                                                              
                                                            <asp:BoundField DataField="worklog_desc" HeaderText="LogEntry" SortExpression="worklog_desc" />         
                                                        </Columns>
                                                        <FooterStyle BackColor="#CCCC99" />
                                                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                        <RowStyle BackColor="#F7F7DE" />
                                                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                                        <SortedAscendingHeaderStyle BackColor="#848384" />
                                                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                                        <SortedDescendingHeaderStyle BackColor="#575357" />
                                                    </asp:GridView>
                                                    <asp:GridView ID="GridView4" Visible="false" style="font-family:Verdana; font-size:8pt" DataKeyNames="work_id" runat="server" EmptyDataText="No Work/Log Entry found" DataSourceID="Grid4SqlSource" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowSorting="True">
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
                                                            <asp:TemplateField HeaderText="EmployeeName">
                                                                <ItemTemplate>
                                                                    <%# Eval("emp_lname") & " " & Eval("emp_fname") %>
                                                                </ItemTemplate>
                                                             </asp:TemplateField>
                                                            <asp:BoundField DataField="task_name" HeaderText="TaskName" SortExpression="task_name" NullDisplayText="N/A" />                                                             
                                                            <asp:BoundField DataField="task_status" HeaderText="TaskStatus" SortExpression="task_status" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_location" HeaderText="Location" SortExpression="work_location" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="work_status" HeaderText="WorkStatus" SortExpression="work_status" NullDisplayText="N/A"/>
                                                            <asp:BoundField DataField="work_desc" HeaderText="WorkPerformed" SortExpression="work_desc" NullDisplayText="N/A"/>
                                                             <asp:TemplateField HeaderText="Work/LogTime">
                                                                <ItemTemplate>
                                                                   <%# Eval("work_time") & "/" & Eval("log_time") & "<br/>" & "<strong>" & Eval("time_diff") & "</strong>" %> 
                                                                </ItemTemplate>
                                                             </asp:TemplateField>                                                                                                                                                                                                                                              
                                                            <asp:BoundField DataField="worklog_desc" HeaderText="LogEntry" SortExpression="worklog_desc" />         
                                                        </Columns>
                                                        <FooterStyle BackColor="#CCCC99" />
                                                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                        <RowStyle BackColor="#F7F7DE" />
                                                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                                        <SortedAscendingHeaderStyle BackColor="#848384" />
                                                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                                        <SortedDescendingHeaderStyle BackColor="#575357" />
                                                    </asp:GridView>


                                                    <asp:SqlDataSource ID="Grid1SqlSource" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT tblProject.project_name, tblTask.task_name, tblTask.task_desc, tblTask.task_startdate, tblTask.task_enddate, tblTask.task_completedate, tblTask.task_status, tblEmployee.employee_fname, tblEmployee.employee_lname, tblEmployee_1.employee_fname AS emp_fname, tblEmployee_1.employee_lname AS emp_lname, tblWork.* FROM tblWork INNER JOIN tblProject ON tblWork.project_id = tblProject.project_id INNER JOIN tblTask ON tblWork.task_id = tblTask.task_id INNER JOIN tblEmployee ON tblWork.supervisor_id = tblEmployee.employee_id INNER JOIN tblEmployee AS tblEmployee_1 ON tblWork.employee_id = tblEmployee_1.employee_id WHERE (tblWork.work_delete = @work_delete)"
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
                                                             <asp:Parameter DefaultValue="0" Name="work_delete" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="Grid2SqlSource" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT tblProject.project_name, tblTask.task_name, tblTask.task_desc, tblTask.task_startdate, tblTask.task_enddate, tblTask.task_completedate, tblTask.task_status, tblEmployee.employee_fname, tblEmployee.employee_lname, tblEmployee_1.employee_fname AS emp_fname, tblEmployee_1.employee_lname AS emp_lname, tblWork.* FROM tblWork INNER JOIN tblProject ON tblWork.project_id = tblProject.project_id INNER JOIN tblTask ON tblWork.task_id = tblTask.task_id INNER JOIN tblEmployee ON tblWork.supervisor_id = tblEmployee.employee_id INNER JOIN tblEmployee AS tblEmployee_1 ON tblWork.employee_id = tblEmployee_1.employee_id WHERE (tblWork.project_id = @project_id) AND (tblWork.work_delete = @work_delete)">
                                                        <SelectParameters>                                                             
                                                           <asp:ControlParameter ControlID="projectDDL1" DefaultValue="" Name="project_id" PropertyName="SelectedValue" />
                                                             <asp:Parameter DefaultValue="0" Name="work_delete" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>                                                    
                                                    <asp:SqlDataSource ID="Grid3SqlSource" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT tblProject.project_name, tblTask.task_name, tblTask.task_desc, tblTask.task_startdate, tblTask.task_enddate, tblTask.task_completedate, tblTask.task_status, tblEmployee.employee_fname, tblEmployee.employee_lname, tblEmployee_1.employee_fname AS emp_fname, tblEmployee_1.employee_lname AS emp_lname, tblWork.* FROM tblWork INNER JOIN tblProject ON tblWork.project_id = tblProject.project_id INNER JOIN tblTask ON tblWork.task_id = tblTask.task_id INNER JOIN tblEmployee ON tblWork.supervisor_id = tblEmployee.employee_id INNER JOIN tblEmployee AS tblEmployee_1 ON tblWork.employee_id = tblEmployee_1.employee_id WHERE (tblWork.work_delete = @work_delete) AND (((tblWork.work_date) BETWEEN @work_date1 AND @work_date2))">
                                                        <SelectParameters>                                                             
                                                             <asp:Parameter DefaultValue="0" Name="work_delete" />
                                                            <asp:ControlParameter ControlID="txtFrom" Name="work_date1" PropertyName="Text" Type="DateTime" />
                                                            <asp:ControlParameter ControlID="txtTo" Name="work_date2" PropertyName="Text" Type="DateTime" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="Grid4SqlSource" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT tblProject.project_name, tblTask.task_name, tblTask.task_desc, tblTask.task_startdate, tblTask.task_enddate, tblTask.task_completedate, tblTask.task_status, tblEmployee.employee_fname, tblEmployee.employee_lname, tblEmployee_1.employee_fname AS emp_fname, tblEmployee_1.employee_lname AS emp_lname, tblWork.* FROM tblWork INNER JOIN tblProject ON tblWork.project_id = tblProject.project_id INNER JOIN tblTask ON tblWork.task_id = tblTask.task_id INNER JOIN tblEmployee ON tblWork.supervisor_id = tblEmployee.employee_id INNER JOIN tblEmployee AS tblEmployee_1 ON tblWork.employee_id = tblEmployee_1.employee_id WHERE (tblWork.work_status = @work_status) AND (tblWork.work_delete = @work_delete)">
                                                        <SelectParameters>                                                            
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
