<%@ Page Title="New Project | Admin Panel | Web-Based Worklog Management System" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/Admin.Master" CodeBehind="new_project.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.new_project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">New Project</h1>
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
                                  Use the form below to create a new Task Project
                                    </div>
                                
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <form role="form">
                                                <div class="form-group">
                                                    <label>Project Name:</label>
                                                    <asp:TextBox ID="txtProject" runat="server" CssClass="form-control" placeholder="Enter the Title of the Project here" autofocus="true"></asp:TextBox>                                                   
                                                </div>  
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>                                                    
                                                 <div class="form-group">
                                                    <label>Project Supervisor: <asp:Label ID="lblEmployeeName" runat="server" Text="" CssClass="text-danger"></asp:Label></label>
                                                     <asp:DropDownList ID="prjsuprDDL" runat="server" CssClass="form-control" AutoPostBack="True" AppendDataBoundItems="true" DataSourceID="SqlDataSource2" DataTextField="employee_lname" DataValueField="employee_id">
                                                         <asp:ListItem Value="0" Text="Choose Option..."></asp:ListItem>
                                                     </asp:DropDownList>                                                     
                                                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT [employee_id], [employee_lname], [employee_fname] FROM [tblEmployee] WHERE ([account_status] = @account_status) ORDER BY [employee_lname]">
                                                         <SelectParameters>
                                                             <asp:Parameter DefaultValue="1" Name="account_status" Type="Int32" />
                                                         </SelectParameters>
                                                     </asp:SqlDataSource>
                                                </div>  
                                                </ContentTemplate>
                                                </asp:UpdatePanel>  
                                                <div class="panel-footer">
                                              <button type="reset" class="btn btn-default">Cancel</button>        
                                            <asp:Button ID="btnSave" runat="server" Text="Save Project" CssClass="btn btn-primary" />
                                                    </div>
                                            </form>
                                        </div>
                                        <!-- /.col-lg-6 (nested) -->
                                        <div class="col-lg-8">
                                            <h4></h4>
                                           <div class="table-responsive">                                               
                                                    <asp:GridView ID="GridView1" runat="server" DataKeyNames="project_id" style="font-family:Verdana; font-size:8pt" EmptyDataText="No Project found" CssClass="table table-striped table-bordered table-hover" DataSourceID="SqlDataSource1" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black">
                                                        <Columns>
                                                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/images/cancel.jpg" DeleteImageUrl="~/images/delete.png" EditImageUrl="~/images/edit.png" HeaderText="Action" ShowDeleteButton="True" ShowEditButton="True" UpdateImageUrl="~/images/okay.png">
                                                            <ControlStyle Height="20px" Width="20px" />
                                                            </asp:CommandField>
                                                            <asp:BoundField DataField="project_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="project_id" />
                                                            <asp:BoundField DataField="project_name" HeaderText="ProjectName" SortExpression="project_name" >
                                                            <ControlStyle Width="100%" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="Supervisor">
                                                                <ItemTemplate>
                                                                    <%# Eval("employee_lname") & " " & Eval("employee_fname") %>
                                                                </ItemTemplate>
                                                             </asp:TemplateField>
                                                            <asp:BoundField DataField="employee_role" HeaderText="Role" NullDisplayText="N/A" SortExpression="employee_role" ReadOnly="True" />
                                                            <asp:BoundField DataField="employee_phone" HeaderText="PhoneNumber" SortExpression="employee_phone" ReadOnly="True" />                                                             
                                                            <asp:BoundField DataField="project_created" HeaderText="DateCreated" SortExpression="project_created" ReadOnly="True" />
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
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT tblEmployee.employee_fname, tblEmployee.employee_lname, tblEmployee.employee_role, tblEmployee.employee_phone, tblProject.* FROM tblProject INNER JOIN tblEmployee ON tblProject.project_supervisor = tblEmployee.employee_id ORDER BY tblProject.project_id DESC" DeleteCommand="DELETE FROM tblProject WHERE (project_id = @project_id)" UpdateCommand="UPDATE tblProject SET project_name = @project_name WHERE (project_id = @project_id)">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="project_id" />
                                                        </DeleteParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="project_name" />
                                                            <asp:Parameter Name="project_id" />
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                 
                                            </div>
                                            
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
