Imports System.Data.SqlClient

Public Class view_tasktrash
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub projectDDL1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles projectDDL1.SelectedIndexChanged
        If projectDDL1.SelectedValue = 0 Then
            txtSearch.Text = ""
            GridView1.Visible = True
            GridView2.Visible = False
        Else
            txtSearch.Text = ""
            GridView1.Visible = False
            GridView2.Visible = True
        End If
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        projectDDL1.SelectedValue = "0"
        GridView1.Visible = True
        GridView2.Visible = False
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        takeAction(e)
    End Sub

    Protected Sub GridView2_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        takeAction(e)
    End Sub

    Sub takeAction(e)
        If e.CommandName = "reverseTask" Then
            Dim taskId As String = Convert.ToString(e.CommandArgument)
            Dim con1 As String = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            Dim con2 As New SqlConnection(con1)
            con2.Open()
            Dim sqlds As New SqlDataSource
            With sqlds
                .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ToString
                .UpdateCommandType = SqlDataSourceCommandType.Text
                .UpdateCommand = "UPDATE tblTask SET task_delete=@task_delete WHERE task_id=@task_id"
                .UpdateParameters.Add("task_delete", 0)
                .UpdateParameters.Add("task_id", taskId)
            End With
            Dim rmvtsk As Integer
            rmvtsk = sqlds.Update
            GridView1.DataBind()
            GridView2.DataBind()
        End If

        If e.CommandName = "deleteTask" Then
            Dim taskId As String = Convert.ToString(e.CommandArgument)
            Dim con1 As String = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            Dim con2 As New SqlConnection(con1)
            con2.Open()
            Dim sqlds As New SqlDataSource
            With sqlds
                .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ToString
                .DeleteCommandType = SqlDataSourceCommandType.Text
                .DeleteCommand = "DELETE FROM tblTask WHERE task_id=@task_id"
                .DeleteParameters.Add("task_id", taskId)
            End With
            Dim rmvtsk As Integer
            rmvtsk = sqlds.Delete
            GridView1.DataBind()
            GridView2.DataBind()
        End If
    End Sub
End Class