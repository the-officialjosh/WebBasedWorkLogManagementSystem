Imports System.Data.SqlClient
Public Class remove_employee
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        If e.CommandName = "deleteAccount" Then
            Dim eId As String = Convert.ToString(e.CommandArgument)
            Dim strmgr As String = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            Dim con2 As New SqlConnection(strmgr)
            con2.Open()
            Dim bb As New SqlDataSource
            With bb
                .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ToString
                .DeleteCommandType = SqlDataSourceCommandType.Text
                .DeleteCommand = "DELETE FROM tblEmployee WHERE employee_id=@employee_id"
                .DeleteParameters.Add("employee_id", eId)
            End With
            Dim aa As Integer
            aa = bb.Delete
            GridView1.DataBind()
        End If
    End Sub

End Class