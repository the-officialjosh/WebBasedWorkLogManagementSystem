<%@ Page Title="New Log Entry | Employee Panel | Web-Based Worklog Management System" Language="vb" AutoEventWireup="false" MasterPageFile="~/Employee/Employee.Master" CodeBehind="log_entry.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.log_entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">New Log Entry</h1>
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
                                  Use the form below to update your log description and the time it took you to complete your Task
                                 </div>
                                
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form role="form">
                                                <div class="row">                                                    
                                                     <div class="col-md-2">
                                                  <div class="form-group">
                                                    <label>Project:</label>
                                                        <asp:TextBox ID="txtProject" runat="server" CssClass="form-control" placeholder="Name of Project" disabled="true"></asp:TextBox>    
                                                </div>
                                                </div>

                                                    <div class="col-md-4">                                                
                                                 <div class="form-group">
                                                    <label>Task:</label>
                                                    <asp:TextBox ID="txtTask" runat="server" CssClass="form-control" placeholder="Name of Task" disabled="true"></asp:TextBox> 
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
                                                                                               
                                                  <div class="col-md-2">
                                                  <div class="form-group">
                                                    <label>Work Status:</label>
                                                    <asp:DropDownList ID="WStatusDDL" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                                                         <asp:ListItem Value="0" Text="Choose Option..."></asp:ListItem>
                                                         <asp:ListItem Value="1" Text="Completed"></asp:ListItem>
                                                         <asp:ListItem Value="2" Text="Cancelled"></asp:ListItem> 
                                                         <asp:ListItem Value="3" Text="Suspended"></asp:ListItem>                                                                                                                  
                                                     </asp:DropDownList>
                                                </div>
                                                </div>
                                                 
                                                    <div class="col-md-2">
                                                  <div class="form-group">
                                                    <label>Task Status:</label>
                                                    <asp:DropDownList ID="TStatusDDL" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                                                         <asp:ListItem Value="0" Text="Choose Option..."></asp:ListItem>
                                                         <asp:ListItem Value="Active" Text="Active"></asp:ListItem>                                                         
                                                         <asp:ListItem Value="Cancelled" Text="Cancelled"></asp:ListItem>
                                                         <asp:ListItem Value="Completed" Text="Completed"></asp:ListItem>                                                         
                                                     </asp:DropDownList>
                                                </div>
                                                </div>
                                                    </div>

                                                                                              
                                                 <div class="form-group">
                                                    <label>Log Description:</label>
                                                     <asp:TextBox ID="txtLogDesc" runat="server" CssClass="form-control" placeholder="Enter your Log Description here" TextMode="MultiLine" Height="90px"></asp:TextBox>
                                                </div> 
                                                 
                                                 
                                                                                          
                                             <div class="panel-footer">
                                                  <button type="reset" class="btn btn-default">Cancel</button>        
                                            <asp:Button ID="btnSave" runat="server" Text="Save Log" CssClass="btn btn-primary" />
                                             </div>
                                            </form>
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
