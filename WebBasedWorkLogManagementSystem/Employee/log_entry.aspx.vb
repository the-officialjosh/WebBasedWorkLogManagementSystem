Imports System.Data.SqlClient
Public Class log_entry
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection = New SqlConnection
    Public da As SqlDataAdapter
    Public ds As DataSet
    Dim superId As Integer
    Dim eId As Integer
    Dim startTime As String
    Dim endTime As String
    Dim workTime As String
    Dim logTime As String
    Dim timeDiff As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        getWorkInfo()
    End Sub

    Sub getWorkInfo()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT tblWork.*, tblTask.task_name, tblTask.task_desc, tblTask.task_startdate, tblTask.task_enddate, tblTask.task_completedate, tblTask.task_status, tblProject.project_name, tblEmployee.employee_fname, tblEmployee.employee_lname FROM tblWork INNER JOIN tblTask ON tblWork.task_id = tblTask.task_id INNER JOIN tblProject ON tblWork.project_id = tblProject.project_id INNER JOIN tblEmployee ON tblWork.supervisor_id = tblEmployee.employee_id WHERE (tblWork.work_id = @work_id)", conn)
        cmd.Parameters.Add("@work_id", SqlDbType.Int).Value = Page.Request("workId")
        Dim dr As SqlDataReader
        conn.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            txtProject.Text = dr("project_name").ToString()
            txtTask.Text = dr("task_name").ToString() & " / " & dr("work_date").ToString()
            'TStatusDDL.SelectedValue = dr("task_status").ToString()
            superId = dr("supervisor_id")
            eId = dr("employee_id")
            workTime = dr("work_time").ToString
        End While
        conn.Close()
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim strcon As String = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim con As New SqlConnection(strcon)
        con.Open()
        If txtLogDesc.Text = "" Or txtProject.Text = "" Or txtTask.Text = "" Or TStatusDDL.SelectedValue = "0" Or WStatusDDL.SelectedValue = "0" Then
            'Error Message                       
            ErrorPanel.Visible = True
            lblError.Text = "Please complete the form before proceeding!"
            SuccessPanel.Visible = False
        Else
            updateWorklog()
        End If
        con.Close()
    End Sub

    Sub updateWorklog()
        getResult()
        Dim a As New SqlDataSource
        With a
            .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            .UpdateCommandType = SqlDataSourceCommandType.Text
            .UpdateCommand = "UPDATE tblWork SET worklog_desc=@worklog_desc, work_status=@work_status, log_hrs=@log_hrs, log_mins=@log_mins, log_time=@log_time, time_diff=@time_diff WHERE work_id=@work_id"
            .UpdateParameters.Add("work_id", Page.Request("workId"))
            .UpdateParameters.Add("worklog_desc", txtLogDesc.Text)
            .UpdateParameters.Add("work_status", WStatusDDL.SelectedItem.ToString)
            .UpdateParameters.Add("log_hrs", hrsDDL.SelectedItem.ToString)
            .UpdateParameters.Add("log_mins", minDDL.SelectedItem.ToString)
            .UpdateParameters.Add("log_time", hrsDDL.SelectedItem.ToString & ":" & minDDL.SelectedItem.ToString)
            .UpdateParameters.Add("time_diff", timeDiff)
            If TStatusDDL.SelectedValue = "Active" Then
                updateTaskStatus()
            ElseIf TStatusDDL.SelectedValue = "Cancelled" Then
                updateTaskStatus()
            ElseIf TStatusDDL.SelectedValue = "Completed" Then
                updateTaskStatus()
            End If
        End With
        Dim b As Integer
        b = a.Update
        Response.Redirect("new_work.aspx?eId=" & Request.QueryString("eId") & "&user=" & Request.QueryString("user"))
    End Sub

    Sub getResult()
        logTime = hrsDDL.SelectedItem.ToString & ":" & minDDL.SelectedItem.ToString
        startTime = workTime
        endTime = logTime
        timeDiff = String.Empty
        Dim fromData As DateTime = Convert.ToDateTime(startTime.Trim())
        Dim toData As DateTime = Convert.ToDateTime(endTime.Trim())
        timeDiff = Me.CalculateDifference(fromData, toData)
    End Sub

    Private Function CalculateDifference(ByVal fromData As DateTime, ByVal toData As DateTime) As String
        Dim ts As TimeSpan = fromData - toData
        Dim diff As String = String.Format("{0} hours, {1} minutes", ts.Hours, ts.Minutes.ToString.Replace("-", ""))
        'Dim diff As String = String.Format("{0}:{1}", ts.Hours, ts.Minutes.ToString.Replace("-", ""))
        Return diff
    End Function

    Sub updateTaskStatus()
        Dim bee As New SqlDataSource
        With bee
            .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            .UpdateCommandType = SqlDataSourceCommandType.Text
            .UpdateCommand = "UPDATE tblTask SET task_status=@task_status, task_completedate=@task_completedate WHERE task_id=@task_id"
            If TStatusDDL.SelectedValue = "Completed" Then
                .UpdateParameters.Add("task_status", TStatusDDL.SelectedValue.ToString)
                .UpdateParameters.Add("task_completedate", DateTime.Now.ToString("dd-MMM-yyyy"))
            Else
                .UpdateParameters.Add("task_status", TStatusDDL.SelectedValue.ToString)
                .UpdateParameters.Add("task_completedate", "")
            End If
            .UpdateParameters.Add("task_id", Page.Request("taskId"))
        End With
        Dim cee As Integer
        cee = bee.Update
    End Sub
End Class