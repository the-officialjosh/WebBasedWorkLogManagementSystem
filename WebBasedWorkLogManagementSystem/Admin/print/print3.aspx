﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="print3.aspx.vb" Inherits="WebBasedWorkLogManagementSystem.print3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Print Report | Work Activity Log Sheet</title>
    <style type="text/css">
        .style1
        {
            width: 90%;
        }
        .style2
        {
            width: 639px;
            height: 112px;
        }
        .style3
        {
            width: 100%;
        }
        .style5
        {
            font-family: Tahoma;
        }
        .style7
        {
            font-family: Tahoma;
            font-size: 9pt;
        }
        .style8
        {
            font-family: Tahoma;
            text-align: center;
            font-size: 9pt;
        }
        .style9
        {
            font-family: Candara;
        }
    
button.btn,
input[type="submit"].btn {
  *padding-top: 3px;
  *padding-bottom: 3px;
}

.btn:first-child {
  *margin-left: 0;
}

input[type="file"],
input[type="image"],
input[type="submit"],
input[type="reset"],
input[type="button"],
input[type="radio"],
input[type="checkbox"] {
  width: auto;
}

.btn-success {
  color: #ffffff;
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
  background-color: #5bb75b;
  *background-color: #51a351;
  background-repeat: repeat-x;
    background-image: -moz-linear-gradient(top, #62c462, #51a351);
    border-left-color: #51a351;
    border-right-color: #51a351;
    border-top-color: #51a351;
    border-bottom-color: #387038;
}

.btn {
  border-color: #c5c5c5;
  border-color: rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.25);
}

       




.btn {
  display: inline-block;
  *border-left: 0 none #e6e6e6;
    border-right: 0 none #e6e6e6;
    border-top: 0 none #e6e6e6;
    border-bottom: 0 none #a2a2a2;
    display: inline;
    padding: 4px 14px;
    margin-bottom: 0;
  *margin-left: .3em;
    font-size: 14px;
  line-height: 20px;
  *line-height: 20px;
    color: #333333;
    text-align: center;
    text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
    vertical-align: middle;
    cursor: pointer;
  background-color: #f5f5f5;
  *background-color: #e6e6e6;
    background-repeat: repeat-x;
  *-webkit-border-radius: 4px;
     -moz-border-radius: 4px;
          border-radius: 4px;
    zoom: 1;
    -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
    -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
    box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
    background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);*
}

input,
textarea,
.uneditable-input {
  margin-left: 0;
}

        .style10
        {
            font-family: Candara;
            font-size: 9pt;
        }
        .style11
        {
            font-family: Tahoma;
            font-size: 10pt;
        }

         .auto-style1 {
         }

         .auto-style4 {
             font-family: Tahoma;
             font-size: 10pt;
             height: 25px;
         }

         .auto-style6 {
            font-family: Tahoma;
            font-size: 10pt;
            text-align: left;
        }
        .auto-style7 {
            font-size: xx-large;
        }
         
         .auto-style8 {
            text-decoration: underline;
        }
         
         </style>
</head>
<body>
    <form id="form1" runat="server">
      <div>
       <br />
         <br />
        <table align="center" class="style1" 
            style="border-style: solid; border-width: thin; background-repeat: no-repeat; background-attachment: fixed; background-position: center center">
            <tr>
                <td style="text-align: left">
                    <table align="center" class="style3">
                        <tr>
                            <td style="text-align: center" class="auto-style7">
                                <strong>Work Activity Log Sheet</strong></td>                               
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table align="center" class="style3">
                        <tr>
                            <td style="text-align: center">
                                
                                <hr />
                                </td>
                        </tr>
                        <tr>
                            <td>
                                <fieldset>
                                    <legend class="style9"><strong>Report Summary From: <asp:Label ID="lblFrom" runat="server" Text=""></asp:Label> To: <asp:Label ID="lblTo" runat="server" Text=""></asp:Label></strong></legend>
                                    <table align="center" class="style3">
                                        <tr>
                                            <td class="auto-style1">
                                <asp:GridView ID="GridView2" runat="server" DataKeyNames="work_id" EmptyDataText="No Work/Log Entry found" style="font-family:Verdana; font-size:8pt" DataSourceID="Grid3SqlSource" class="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowSorting="True">
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
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
                                                    <asp:SqlDataSource ID="Grid3SqlSource" runat="server" ConnectionString="<%$ ConnectionStrings:WLOG %>" SelectCommand="SELECT tblProject.project_name, tblTask.task_name, tblTask.task_desc, tblTask.task_startdate, tblTask.task_enddate, tblTask.task_completedate, tblTask.task_status, tblEmployee.employee_fname, tblEmployee.employee_lname, tblEmployee_1.employee_fname AS emp_fname, tblEmployee_1.employee_lname AS emp_lname, tblWork.* FROM tblWork INNER JOIN tblProject ON tblWork.project_id = tblProject.project_id INNER JOIN tblTask ON tblWork.task_id = tblTask.task_id INNER JOIN tblEmployee ON tblWork.supervisor_id = tblEmployee.employee_id INNER JOIN tblEmployee AS tblEmployee_1 ON tblWork.employee_id = tblEmployee_1.employee_id WHERE (tblWork.work_delete = @work_delete) AND (((tblWork.work_date) BETWEEN @work_date1 AND @work_date2))">
                                                        <SelectParameters>                                                             
                                                             <asp:Parameter DefaultValue="0" Name="work_delete" />
                                                            <asp:QueryStringParameter Name="work_date1" QueryStringField="from" Type="DateTime" />
                                                            <asp:QueryStringParameter Name="work_date2" QueryStringField="to" Type="DateTime" />
                                                          
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                        </table>
                                </fieldset>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <hr />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style10" style="text-align: center">
                    <strong>FOR OFFICIAL USE ONLY (RECOMMENDATION)</strong></td>
            </tr>
            <tr>
                <td class="style10" style="text-align: center">
                    <hr />
                </td>
            </tr>
            <tr>
                <td class="style11">
                    <strong>&nbsp;&nbsp;&nbsp; <span class="auto-style8">Employee's Signature:</span></strong></td>
            </tr>
             <tr>
                <td class="auto-style4">
                    </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    Sign_______________________________________________________________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:_________________________________________________________________________ </td>
            </tr>

            <tr>
                <td class="style11">
                    &nbsp;</td>
            </tr>

            <tr>
                <td class="style11">
                    <strong>&nbsp;&nbsp;&nbsp; <span class="auto-style8">Supervisor's Signature:</span></strong></td>
            </tr>
             <tr>
                <td class="auto-style4">
                    </td>
            </tr>
            <tr>
                <td class="style11">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    Sign_______________________________________________________________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:_________________________________________________________________________</td>
            </tr>
            <tr>
                <td class="style11">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
