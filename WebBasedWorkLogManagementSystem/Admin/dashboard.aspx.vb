Imports System.Data.SqlClient
Public Class dashboard1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        countAllTasks()
        countCompletedTasks()
        countActiveTasks()
        countAllWork()
        countCompletedWork()
        countOngoingWork()
        countCancelledTasks()
        countCancelledWork()
        countTrashedTasks()
        countTrashedWork()
        lblCancelled.Text = Val(lblCancelTask.Text) + Val(lblCancelWork.Text)
        lblTrash.Text = Val(lblTrashTask.Text) + Val(lblTrashWork.Text)
    End Sub

    Sub countTrashedWork()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'trashedLog' FROM tblWork WHERE (tblWork.work_delete = @work_delete)", connection)
        cmd.Parameters.Add("@work_delete", SqlDbType.Int).Value = 1
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblTrashWork.Text = dr("trashedLog").ToString()
        End While
        connection.Close()
    End Sub

    Sub countTrashedTasks()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'trashedTasks' FROM tblTask WHERE (tblTask.task_delete = @task_delete)", connection)
        cmd.Parameters.Add("@task_delete", SqlDbType.Int).Value = 1
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblTrashTask.Text = dr("trashedTasks").ToString()
        End While
        connection.Close()
    End Sub

    Sub countCancelledWork()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'cancelledLog' FROM tblWork WHERE (tblWork.work_status = @work_status)", connection)
        cmd.Parameters.Add("@work_status", SqlDbType.NVarChar).Value = "Cancelled"
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblCancelWork.Text = dr("cancelledLog").ToString()
        End While
        connection.Close()
    End Sub

    Sub countCancelledTasks()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'cancelledTasks' FROM tblTask WHERE (tblTask.task_status = @task_status)", connection)
        cmd.Parameters.Add("@task_status", SqlDbType.NVarChar).Value = "Cancelled"
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblCancelTask.Text = dr("cancelledTasks").ToString()
        End While
        connection.Close()
    End Sub

    Sub countOngoingWork()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'ongoingWork' FROM tblWork WHERE (tblWork.work_status = @work_status)", connection)
        cmd.Parameters.Add("@work_status", SqlDbType.NVarChar).Value = "Ongoing"
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblOngoingWork.Text = dr("ongoingWork").ToString()
        End While
        connection.Close()
    End Sub

    Sub countCompletedWork()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'compWork' FROM tblWork WHERE (tblWork.work_status = @work_status)", connection)
        cmd.Parameters.Add("@work_status", SqlDbType.NVarChar).Value = "Completed"
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblCompletedWork.Text = dr("compWork").ToString()
        End While
        connection.Close()
    End Sub

    Sub countAllWork()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'allWorkEntry' FROM tblWork", connection)
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblAllWork.Text = dr("allWorkEntry").ToString()
        End While
        connection.Close()
    End Sub

    Sub countAllTasks()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'allTasks' FROM tblTask", connection)
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblAllTasks.Text = dr("allTasks").ToString()
        End While
        connection.Close()
    End Sub

    Sub countCompletedTasks()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'compTasks' FROM tblTask WHERE (tblTask.task_status = @task_status)", connection)
        cmd.Parameters.Add("@task_status", SqlDbType.NVarChar).Value = "Completed"
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblCompleted.Text = dr("compTasks").ToString()
        End While
        connection.Close()
    End Sub

    Sub countActiveTasks()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'activeTasks' FROM tblTask WHERE (tblTask.task_status = @task_status)", connection)
        cmd.Parameters.Add("@task_status", SqlDbType.NVarChar).Value = "Active"
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblActive.Text = dr("activeTasks").ToString()
        End While
        connection.Close()
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