Imports System.Data.SqlClient
Public Class remove_worklog
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        If e.CommandName = "deleteLog" Then
            Dim workId As String = Convert.ToString(e.CommandArgument)
            Dim con1 As String = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            Dim con2 As New SqlConnection(con1)
            con2.Open()
            Dim sqlds As New SqlDataSource
            With sqlds
                .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ToString
                .UpdateCommandType = SqlDataSourceCommandType.Text
                .UpdateCommand = "UPDATE tblWork SET work_delete=@work_delete WHERE work_id=@work_id"
                .UpdateParameters.Add("work_delete", 1)
                .UpdateParameters.Add("work_id", workId)
            End With
            Dim rmvlog As Integer
            rmvlog = sqlds.Update
            GridView1.DataBind()
        End If
    End Sub
End Class