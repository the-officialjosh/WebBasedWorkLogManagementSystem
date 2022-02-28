Imports System.Data.SqlClient
Public Class employee_list
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        If e.CommandName = "activeEmployee" Then
            Dim eId As String = Convert.ToString(e.CommandArgument)
            Dim strmgr As String = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            Dim con2 As New SqlConnection(strmgr)
            con2.Open()
            Dim bb As New SqlDataSource
            With bb
                .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ToString
                .UpdateCommandType = SqlDataSourceCommandType.Text
                .UpdateCommand = "UPDATE tblEmployee SET account_status=@account_status WHERE employee_id=@employee_id"
                .UpdateParameters.Add("account_status", 1)
                .UpdateParameters.Add("employee_id", eId)
            End With
            Dim aa As Integer
            aa = bb.Update
            GridView1.DataBind()
        End If

        If e.CommandName = "inactiveEmployee" Then
            Dim eId As Integer = Convert.ToInt32(e.CommandArgument)
            Dim strcon As String = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            Dim con2 As New SqlConnection(strcon)
            con2.Open()
            Dim bbb As New SqlDataSource
            With bbb
                .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ToString
                .UpdateCommandType = SqlDataSourceCommandType.Text
                .UpdateCommand = "UPDATE tblEmployee SET account_status=@account_status WHERE employee_id=@employee_id"
                .UpdateParameters.Add("account_status", 0)
                .UpdateParameters.Add("employee_id", eId)
            End With
            Dim aaa As Integer
            aaa = bbb.Update
            GridView1.DataBind()
        End If
    End Sub
End Class