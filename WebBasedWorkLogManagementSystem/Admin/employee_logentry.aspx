<%@ Page Title="Employee LogEntry | Admin Panel | Web-Based Worklog Management System" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Admin.Master" CodeBehind="employee_logentry.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.employee_logentry" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Employee Log Entries</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>     
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">                            
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Use the form below to view Employee's log entries
                                    </div>                        
                                <div class="panel-body">                                   
                                    <div class="row">
                                          <div class="col-lg-12">
                                            <h4></h4>
                                           <div class="table-responsive">
                                               <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                   <ContentTemplate>
                                                <fieldset>
                                                    <legend>Employee's List</legend>
                                                    <div class="row pull-right"> 
                                                        <div class="col-md-5"></div>
                                                         <div class="col-md-7">                                                      
                                                        <div class="col-lg-12">
                                                            <label>Search:</label>
                                                            <div class="form-group input-group">
                                                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search Employee" CssClass="form-control" Width="100%" autofocus="true"></asp:TextBox>
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
                                       <asp:GridView ID="GridView1" runat="server" style="font-family:Verdana; font-size:8pt" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" PageSize="15" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black">
                                           <Columns>                                              
                                                <asp:TemplateField HeaderText="Status">
                                                   <ItemTemplate>
                                                       <span class='<%# If(Eval("account_status") = 0, "label label-danger", "label label-success")%>'><%# If(Eval("account_status") = 0, "Inactive", "Active")%></span>
                                                       <asp:Label ID="lblEmployeeId" runat="server" Text='<%#Eval("employee_id") %>' Visible="false"></asp:Label>
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                                <asp:BoundField DataField="employee_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="employee_id" />
                                               <asp:BoundField DataField="employee_fname" HeaderText="FirstName" NullDisplayText="N/A" SortExpression="employee_fname" />
                                               <asp:BoundField DataField="employee_lname" HeaderText="LastName" NullDisplayText="N/A" SortExpression="employee_lname" />
                                               <asp:BoundField DataField="employee_gender" HeaderText="Gender" NullDisplayText="N/A" SortExpression="employee_gender" />
                                               <asp:BoundField DataField="employee_role" HeaderText="Role" NullDisplayText="N/A" SortExpression="employee_role" />
                                               <asp:BoundField DataField="employee_email" HeaderText="Email" NullDisplayText="N/A" SortExpression="employee_email" />
                                               <asp:BoundField DataField="employee_phone" HeaderText="Phone" NullDisplayText="N/A" SortExpression="employee_phone" />      
                                               <asp:TemplateField HeaderText="Log Entries">
                                                   <ItemTemplate>                                                       
                                                       <asp:Label ID="lblEntries" runat="server" Text="0"></asp:Label>
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                               <asp:BoundField DataField="employee_registered" HeaderText="DateRegistered" NullDisplayText="N/A" SortExpression="employee_registered" />
                                                <asp:TemplateField HeaderText="Action">
                                                   <ItemTemplate>
                                                       <a target="_blank" href='<%#Eval("employee_id", "view_log.aspx?eId={0}") & "&admin=" & Request.QueryString("admin") & "&user=" & Request.QueryString("user")%>'>View log</a>
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
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT * FROM [tblEmployee] ORDER BY [employee_id] DESC"
                                            FilterExpression="employee_fname LIKE '%{0}%' or employee_lname LIKE '%{0}%' or employee_gender LIKE '%{0}%' or employee_role LIKE '%{0}%' or employee_email LIKE '%{0}%' or employee_phone LIKE '%{0}%' or employee_registered LIKE '%{0}%'">

                                             <FilterParameters>
                                                            <asp:ControlParameter ControlID="txtSearch" Name="employee_fname" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="employee_lname" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="employee_gender" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="employee_role" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="employee_email" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="employee_phone" PropertyName="Text" />                                                                             
                                                            <asp:ControlParameter ControlID="txtSearch" Name="employee_registered" PropertyName="Text" />      
                                            </FilterParameters>
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
