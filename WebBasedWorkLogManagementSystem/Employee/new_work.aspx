<%@ Page Title="New Work | Employee Panel | Web-Based Worklog Management System" Language="vb" AutoEventWireup="false" MasterPageFile="~/Employee/Employee.Master" CodeBehind="new_work.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.new_work" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">New Work</h1>
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
                                  Use the form below to create a new Work for your Task
                                 </div>
                                
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form role="form">
                                                <div class="row">
                                                    <div class="col-md-2">
                                                  <div class="form-group">
                                                    <label>Date:</label>
                                                   <asp:TextBox ID="txtWorkDate" runat="server" CssClass="form-control" placeholder="Today's Date" disabled="true"></asp:TextBox>                                                      
                                                </div>
                                                </div>
                                              <div class="col-md-3">
                                                  <div class="form-group">
                                                    <label>Registered Projects:</label>
                                                       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate> 
                                                      <asp:DropDownList ID="projectDDL" runat="server" CssClass="form-control" AutoPostBack="True" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="project_name" DataValueField="project_id">
                                                         <asp:ListItem Value="0" Text="Choose Option..."></asp:ListItem>
                                                     </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT [project_id], [project_name] FROM [tblProject] ORDER BY [project_name]">
                                                     </asp:SqlDataSource>
                                                         </ContentTemplate>
                                                </asp:UpdatePanel>    
                                                </div>
                                                </div>

                                               <div class="col-md-4">                                                
                                                 <div class="form-group">
                                                    <label>My Task(s):</label>
                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                    <ContentTemplate> 
                                                      <asp:DropDownList ID="taskDDL" runat="server" CssClass="form-control" AutoPostBack="True" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="task_name" DataValueField="task_id">
                                                         <asp:ListItem Value="0" Text="Choose Option..."></asp:ListItem>
                                                     </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT [task_id], [task_name] FROM [tblTask] WHERE ([employee_id] = @employee_id) AND ([project_id] = @project_id)">
                                                        <SelectParameters>
                                                            <asp:QueryStringParameter Name="employee_id" QueryStringField="eId" />
                                                            <asp:ControlParameter ControlID="projectDDL" Name="project_id" PropertyName="SelectedValue" Type="Int32" />                                                            
                                                        </SelectParameters>
                                                     </asp:SqlDataSource>
                                                         </ContentTemplate>
                                                </asp:UpdatePanel>
                                                </div> 
                                                 </div>
                                                                                               
                                                    <div class="col-md-3">
                                                  <div class="form-group">
                                                    <label>Location:</label>
                                                   <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="Location" MaxLength="50" autofocus="true"></asp:TextBox>                                                       
                                                </div>
                                                </div>
                                                 
                                                    </div>

                                                                                              
                                                 <div class="form-group">
                                                    <label>Work Description:</label>
                                                     <asp:TextBox ID="txtWorkDesc" runat="server" CssClass="form-control" placeholder="Enter your Work Description here" TextMode="MultiLine" Height="90px"></asp:TextBox>
                                                </div> 
                                                 <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate> 
                                                 <div class="row">
                                                 <div class="col-md-4">                                                
                                                 <div class="form-group">
                                                    <label>Project Supervisor: </label>                                                     
                                                     <asp:TextBox ID="txtSupervisor" runat="server" CssClass="form-control" disabled="true" placeholder="Project Supervisor"></asp:TextBox>
                                                     
                                                </div> 
                                                 </div>

                                                 <div class="col-md-2">
                                                  <div class="form-group">
                                                    <label>Task Starting:</label>
                                                   <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" placeholder="Start Date of your Task" disabled="true"></asp:TextBox>                                                       
                                                </div>
                                                </div>
                                                  
                                                 <div class="col-md-2">                                                
                                                 <div class="form-group">
                                                    <label>Task Ending:</label>                                                                                                        
                                                     <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" placeholder="End Date of your Task" disabled="true"></asp:TextBox>                                                      
                                                </div> 
                                                 </div>
                                                   
                                                 <div class="col-md-2">                                                
                                                 <div class="form-group">
                                                    <label>Task Status:</label>
                                                     <asp:TextBox ID="txtStatus" runat="server" CssClass="form-control" placeholder="Status of your Task" disabled="true"></asp:TextBox> 
                                                </div> 
                                                 </div>

                                                <div class="col-md-1">                                                
                                                 <div class="form-group">
                                                    <label>Hrs:</label>
                                                     <asp:DropDownList ID="hrsDDL" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                                                         <asp:ListItem Value="00" Text="00"></asp:ListItem>
                                                         <asp:ListItem Value="01" Text="01"></asp:ListItem>
                                                         <asp:ListItem Value="02" Text="02"></asp:ListItem>
                                                         <asp:ListItem Value="03" Text="03"></asp:ListItem>
                                                         <asp:ListItem Value="04" Text="04"></asp:ListItem>                                                         
                                                         <asp:ListItem Value="05" Text="05"></asp:ListItem>                                                         
                                                         <asp:ListItem Value="06" Text="06"></asp:ListItem>                                                                                                                                                                       
                                                         <asp:ListItem Value="07" Text="07"></asp:ListItem>                                                                                                                                                                         
                                                         <asp:ListItem Value="08" Text="08"></asp:ListItem>                                                                                                                                                                           
                                                         <asp:ListItem Value="09" Text="09"></asp:ListItem>                                                                                                                                                                           
                                                         <asp:ListItem Value="10" Text="10"></asp:ListItem>                                                                                                                                                                           
                                                         <asp:ListItem Value="11" Text="11"></asp:ListItem>                                                                                                                                                                          
                                                         <asp:ListItem Value="12" Text="12"></asp:ListItem>                                                                                                                                                                          
                                                         <asp:ListItem Value="13" Text="13"></asp:ListItem>                                                                                                                                                                         
                                                         <asp:ListItem Value="14" Text="14"></asp:ListItem>                                                                                                                                                                         
                                                         <asp:ListItem Value="15" Text="15"></asp:ListItem>                                                                                                                                                                         
                                                         <asp:ListItem Value="16" Text="16"></asp:ListItem>                                                                                                                                                                         
                                                         <asp:ListItem Value="17" Text="17"></asp:ListItem>                                                                                                                                                                         
                                                         <asp:ListItem Value="18" Text="18"></asp:ListItem>                                                                                                                                                                       
                                                         <asp:ListItem Value="19" Text="19"></asp:ListItem>                                                                                                                                                                        
                                                         <asp:ListItem Value="20" Text="20"></asp:ListItem>                                                                                                                  
                                                         <asp:ListItem Value="21" Text="21"></asp:ListItem>                                                                                                                                                             
                                                         <asp:ListItem Value="22" Text="22"></asp:ListItem>                                                                                                                                                                       
                                                         <asp:ListItem Value="23" Text="23"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                     </asp:DropDownList>
                                                </div> 
                                                 </div>

                                                      <div class="col-md-1">                                                
                                                 <div class="form-group">
                                                    <label>Min:</label>
                                                     <asp:DropDownList ID="minDDL" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                                                         <asp:ListItem Value="00" Text="00"></asp:ListItem>
                                                         <asp:ListItem Value="01" Text="01"></asp:ListItem>
                                                         <asp:ListItem Value="02" Text="02"></asp:ListItem>
                                                         <asp:ListItem Value="03" Text="03"></asp:ListItem>
                                                         <asp:ListItem Value="04" Text="04"></asp:ListItem>                                                         
                                                         <asp:ListItem Value="05" Text="05"></asp:ListItem>                                                         
                                                         <asp:ListItem Value="06" Text="06"></asp:ListItem>                                                                                                                                                                       
                                                         <asp:ListItem Value="07" Text="07"></asp:ListItem>                                                                                                                                                                         
                                                         <asp:ListItem Value="08" Text="08"></asp:ListItem>                                                                                                                                                                           
                                                         <asp:ListItem Value="09" Text="09"></asp:ListItem>                                                                                                                                                                           
                                                         <asp:ListItem Value="10" Text="10"></asp:ListItem>                                                                                                                                                                           
                                                         <asp:ListItem Value="11" Text="11"></asp:ListItem>                                                                                                                                                                          
                                                         <asp:ListItem Value="12" Text="12"></asp:ListItem>                                                                                                                                                                          
                                                         <asp:ListItem Value="13" Text="13"></asp:ListItem>                                                                                                                                                                         
                                                         <asp:ListItem Value="14" Text="14"></asp:ListItem>                                                                                                                                                                         
                                                         <asp:ListItem Value="15" Text="15"></asp:ListItem>                                                                                                                                                                         
                                                         <asp:ListItem Value="16" Text="16"></asp:ListItem>                                                                                                                                                                         
                                                         <asp:ListItem Value="17" Text="17"></asp:ListItem>                                                                                                                                                                         
                                                         <asp:ListItem Value="18" Text="18"></asp:ListItem>                                                                                                                                                                       
                                                         <asp:ListItem Value="19" Text="19"></asp:ListItem>                                                                                                                                                                        
                                                         <asp:ListItem Value="20" Text="20"></asp:ListItem>                                                                                                                  
                                                         <asp:ListItem Value="21" Text="21"></asp:ListItem>                                                                                                                                                             
                                                         <asp:ListItem Value="22" Text="22"></asp:ListItem>                                                                                                                                                                       
                                                         <asp:ListItem Value="23" Text="23"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="24" Text="24"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="25" Text="25"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="26" Text="26"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="27" Text="27"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="28" Text="28"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="29" Text="29"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="30" Text="30"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="31" Text="31"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="32" Text="32"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="33" Text="33"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="34" Text="34"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="35" Text="35"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="36" Text="36"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="37" Text="37"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="38" Text="38"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="39" Text="39"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="40" Text="40"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="41" Text="41"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="42" Text="42"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="43" Text="43"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="44" Text="44"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="45" Text="45"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="46" Text="46"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="47" Text="47"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="48" Text="48"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="49" Text="49"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="50" Text="50"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="51" Text="51"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="52" Text="52"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="53" Text="53"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="54" Text="54"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="55" Text="55"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="56" Text="56"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="57" Text="57"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="58" Text="58"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                         <asp:ListItem Value="59" Text="59"></asp:ListItem>                                                                                                                                                                                                                                                                                        
                                                     </asp:DropDownList>                                                     
                                                </div> 
                                                 </div>
                                                    </div>
                                                        </ContentTemplate>
                                                     </asp:UpdatePanel>
                                                 
                                                                                          
                                             <div class="panel-footer">
                                                  <button type="reset" class="btn btn-default">Cancel</button>        
                                            <asp:Button ID="btnSave" runat="server" Text="Save Work" CssClass="btn btn-primary" />
                                             </div>
                                            </form>
                                        </div>
                                        <!-- /.col-lg-6 (nested) -->                                      
                                    </div>
                                    <!-- /.row (nested) -->

                                    <br />
                                    <br />
                                    <div class="row">
                                          <div class="col-lg-12">
                                            <h4></h4>
                                           <div class="table-responsive">
                                               <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                   <ContentTemplate>
                                                <fieldset>
                                                    <legend>My Work & Log List</legend>
                                                    <asp:GridView ID="GridView1" runat="server" DataKeyNames="work_id" style="font-family:Lato; font-size:8pt" EmptyDataText="No Work/Log Entry found" DataSourceID="SqlDataSource1" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowSorting="True">
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/images/cancel.jpg" DeleteImageUrl="~/images/delete.png" EditImageUrl="~/images/edit.png" HeaderText="Action" ShowDeleteButton="False" ShowEditButton="True" UpdateImageUrl="~/images/okay.png">
                                                            <ControlStyle Height="20px" Width="20px" />
                                                            </asp:CommandField>
                                                            <asp:BoundField DataField="work_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="work_id" />
                                                            <asp:BoundField DataField="work_date" HeaderText="LogDate" SortExpression="work_date" ReadOnly="true" >
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="project_name" HeaderText="ProjectName" SortExpression="project_name" ReadOnly="true" />
                                                            <asp:TemplateField HeaderText="Supervisor">
                                                                <ItemTemplate>
                                                                    <%# Eval("employee_lname") & " " & Eval("employee_fname") %>
                                                                </ItemTemplate>
                                                             </asp:TemplateField>
                                                            <asp:BoundField DataField="task_name" HeaderText="TaskName" SortExpression="task_name" NullDisplayText="N/A" ReadOnly="true" />                                                             
                                                            <asp:BoundField DataField="task_status" HeaderText="TaskStatus" SortExpression="task_status" NullDisplayText="N/A" ReadOnly="true" />
                                                            <asp:BoundField DataField="work_location" HeaderText="Location" SortExpression="work_location" NullDisplayText="N/A" ReadOnly="true" />
                                                            <asp:BoundField DataField="work_status" HeaderText="WorkStatus" SortExpression="work_status" NullDisplayText="N/A" ReadOnly="true"/>
                                                            <asp:BoundField DataField="work_desc" HeaderText="WorkDescription" SortExpression="work_desc" NullDisplayText="N/A" ReadOnly="true"/>
                                                             <asp:TemplateField HeaderText="Work/LogTime">
                                                                <ItemTemplate>
                                                                    <%# Eval("work_time") & "/" & Eval("log_time") & "<br/>" & "<strong>" & Eval("time_diff") & "</strong>" %> 
                                                                </ItemTemplate>
                                                             </asp:TemplateField>                                                                   
                                                             <asp:TemplateField HeaderText="LogEntry">
                                                                <ItemTemplate>
                                                                    <asp:Panel ID="Panel1" runat="server" Visible='<%# If(Eval("worklog_desc").ToString() = "", "True", "False")%>'>
                                                                        <a href='<%#Eval("work_id", "log_entry.aspx?workId={0}") & "&taskId=" & Eval("task_id") & "&eId=" & Request.QueryString("eId") & "&user=" & Request.QueryString("user")%>'><i class="fa fa-plus"></i> Add Log</a>
                                                                    </asp:Panel>
                                                                   <asp:Panel ID="Panel2" runat="server" Visible='<%# If(Eval("worklog_desc").ToString().Length > 0, "True", "False")%>'>
                                                                       <%# Eval("worklog_desc")  %>
                                                                   </asp:Panel>                                                                   
                                                                </ItemTemplate>

                                                                 <EditItemTemplate>
                                                                     <asp:TextBox ID="txtDesc" class="form-control" runat="server" Text='<%# Bind("worklog_desc") %>' TextMode="MultiLine" Height="70px"></asp:TextBox>
                                                                 </EditItemTemplate>
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
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT tblWork.*, tblEmployee.employee_fname, tblEmployee.employee_lname, tblTask.task_name, tblTask.task_status, tblProject.project_name FROM tblWork INNER JOIN tblEmployee ON tblWork.supervisor_id = tblEmployee.employee_id INNER JOIN tblTask ON tblWork.task_id = tblTask.task_id INNER JOIN tblProject ON tblWork.project_id = tblProject.project_id WHERE (tblWork.employee_id = @employee_id) AND (tblWork.work_delete = @work_delete) ORDER BY tblWork.work_id DESC" UpdateCommand="UPDATE tblWork SET worklog_desc = @worklog_desc WHERE (work_id = @work_id)">
                                                        <SelectParameters>
                                                            <asp:QueryStringParameter Name="employee_id" QueryStringField="eId" />
                                                            <asp:Parameter DefaultValue="0" Name="work_delete" />
                                                        </SelectParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="worklog_desc" />
                                                            <asp:Parameter Name="work_id" />
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
