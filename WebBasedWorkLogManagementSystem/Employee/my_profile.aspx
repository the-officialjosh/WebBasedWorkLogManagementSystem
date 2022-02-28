<%@ Page Title="My Profile | Employee Panel | Web-Based Worklog Management System" Language="vb" AutoEventWireup="false" MasterPageFile="~/Employee/Employee.Master" CodeBehind="my_profile.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.my_profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 293px;
            height: 232px;
        }
        .auto-style2 {
            text-align: left;
            height: 183px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Employee Profile</h1>
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
                                    Use the form below to update your Profile
                                    </div>                        
                                 <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <form role="form">

                                                 <table align="center" class="auto-style1">
                                                     <tr>
                                                         <td class="auto-style2">
                                                             <asp:Image ID="Image1" runat="server" Height="155px" Width="154px" ImageUrl="~/images/no-image.png" />
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td class="text-center">
                                                             <asp:FileUpload ID="FileUpload" runat="server" />
                                                         </td>
                                                     </tr>
                                                 </table>

                                                 <br />  
                                                <div class="panel-footer">
                                              <button type="reset" class="btn btn-default">Cancel</button>        
                                            <asp:Button ID="btnSave" runat="server" Text="Upload Picture" CssClass="btn btn-primary" />
                                                    </div>
                                            </form>
                                        </div>
                                        <!-- /.col-lg-6 (nested) -->
                                        <div class="col-lg-8">
                                            <h4></h4>
                                           <div class="table-responsive">
                                               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                   <ContentTemplate>
                                                <fieldset>
                                                    <legend>Profile Details
                                                    </legend>
                                                    <asp:DetailsView ID="DetailsView1" runat="server" DataKeyNames="employee_id" class="table table-striped table-bordered table-hover" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                                                        <EditRowStyle BackColor="#999999" />
                                                        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                                                        <Fields>
                                                            <asp:BoundField DataField="employee_id" HeaderText="employee_id" InsertVisible="False" ReadOnly="True" SortExpression="employee_id" Visible="False" />
                                                            <asp:BoundField DataField="employee_fname" HeaderText="Employee FirstName" SortExpression="employee_fname" ControlStyle-Width="100%" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="employee_lname" HeaderText="Employee LastName" SortExpression="employee_lname" ControlStyle-Width="100%" NullDisplayText="N/A" />                                                           
                                                            <asp:TemplateField HeaderText="Gender" SortExpression="employee_gender">
                                                                <ItemTemplate>
                                                                    <%# Eval("employee_gender") %> 
                                                                </ItemTemplate>

                                                                 <EditItemTemplate>
                                                            <asp:DropDownList ID="genderDDL" runat="server" Width="100%" Height="25px" AppendDataBoundItems="True" SelectedValue='<%#Bind("employee_gender") %>'>                                                         
                                                                <asp:ListItem Value="" Text="Choose Option"></asp:ListItem>
                                                                <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                                                <asp:ListItem Value="Female" Text="Female"></asp:ListItem>                                                                                                                
                                                             </asp:DropDownList>	
                                                                 </EditItemTemplate>
                                                             </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Employee Role" SortExpression="employee_role">
                                                                <ItemTemplate>
                                                                    <%# Eval("employee_role") %> 
                                                                </ItemTemplate>

                                                                 <EditItemTemplate>
                                                            <asp:DropDownList ID="roleDDL" runat="server" Width="100%" Height="25px" AppendDataBoundItems="True" SelectedValue='<%#Bind("employee_role") %>'>                                                         
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
                                                            
                                                            <asp:BoundField DataField="employee_phone" HeaderText="Phone Number" SortExpression="employee_phone" ControlStyle-Width="100%" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="employee_email" HeaderText="Email Address" SortExpression="employee_email" ControlStyle-Width="100%" NullDisplayText="N/A" />
                                                            <asp:BoundField DataField="employee_registered" HeaderText="Registered On" SortExpression="employee_registered" ControlStyle-Width="100%" NullDisplayText="N/A" ReadOnly="true" />
                                                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/images/cancel.jpg" DeleteImageUrl="~/images/delete.png" EditImageUrl="~/images/edit.png" ShowEditButton="True" UpdateImageUrl="~/images/okay.png">
                                                            <ControlStyle Height="25px" Width="25px" />
                                                            </asp:CommandField>
                                                        </Fields>
                                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                    </asp:DetailsView>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT employee_id, employee_lname, employee_role, employee_phone, employee_email, employee_gender, employee_registered, employee_fname FROM tblEmployee WHERE (employee_id = @employee_id)" UpdateCommand="UPDATE tblEmployee SET employee_fname = @employee_fname, employee_lname = @employee_lname, employee_gender = @employee_gender, employee_role = @employee_role, employee_email = @employee_email, employee_phone = @employee_phone WHERE (employee_id = @employee_id)">
                                                        <SelectParameters>
                                                            <asp:QueryStringParameter Name="employee_id" QueryStringField="eId" />
                                                        </SelectParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="employee_fname" />
                                                            <asp:Parameter Name="employee_lname" />
                                                            <asp:Parameter Name="employee_gender" />
                                                            <asp:Parameter Name="employee_role" />
                                                            <asp:Parameter Name="employee_email" />
                                                            <asp:Parameter Name="employee_phone" />
                                                            <asp:Parameter Name="employee_id" />
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                </fieldset>
                                                 </ContentTemplate>
                                               </asp:UpdatePanel>
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
