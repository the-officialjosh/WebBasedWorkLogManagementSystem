Imports System.Data.SqlClient
Public Class new_unplannedTask
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection = New SqlConnection
    Public da As SqlDataAdapter
    Public ds As DataSet
    Dim superId As Integer
    Dim eId As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtWorkDate.Text = DateTime.Now.ToString("dd-MMM-yyyy")
    End Sub

    Protected Sub taskDDL_SelectedIndexChanged(sender As Object, e As EventArgs) Handles taskDDL.SelectedIndexChanged
        If taskDDL.SelectedValue = "0" Then
            txtSupervisor.Text = "Default"
        Else
            getTaskInfo()
        End If
    End Sub

    Sub getTaskInfo()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT tblTask.*, tblEmployee.employee_fname, tblEmployee.employee_lname, tblEmployee.employee_role FROM tblTask INNER JOIN tblEmployee ON tblTask.supervisor_id = tblEmployee.employee_id WHERE (tblTask.task_id = @task_id)", conn)
        cmd.Parameters.Add("@task_id", SqlDbType.Int).Value = taskDDL.SelectedValue.ToString
        Dim dr As SqlDataReader
        conn.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            'TStatusDDL.Text = dr("task_status").ToString()
            txtSupervisor.Text = dr("employee_lname").ToString() & " " & dr("employee_fname").ToString()
            superId = dr("supervisor_id")
            eId = dr("employee_id")
        End While
        conn.Close()
    End Sub

    Protected Sub projectDDL_SelectedIndexChanged(sender As Object, e As EventArgs) Handles projectDDL.SelectedIndexChanged
        taskDDL.Items.Clear()
        taskDDL.Items.Insert(0, New ListItem("Choose Option...", "0"))
        taskDDL.DataBind()
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        getTaskInfo()
        Dim strcon As String = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim con As New SqlConnection(strcon)
        con.Open()
        If txtWorkDate.Text = "" Or txtLocation.Text = "" Or txtSupervisor.Text = "" Or TStatusDDL.SelectedValue = "0" Or projectDDL.SelectedValue = "0" Or taskDDL.SelectedValue = "0" Or WStatusDDL.SelectedValue = "0" Or txtLogDesc.Text = "" Then
            'Error Message                       
            ErrorPanel.Visible = True
            lblError.Text = "Please complete the form before proceeding!"
            SuccessPanel.Visible = False
        Else
            getTaskInfo()
            createUnplannedTask()
        End If
        con.Close()
    End Sub

    Sub createUnplannedTask()
        Dim a As New SqlDataSource
        With a
            .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            .InsertCommandType = SqlDataSourceCommandType.Text
            .InsertCommand = "INSERT INTO tblWork (task_id,project_id,supervisor_id,employee_id,work_date,work_location,work_desc,worklog_desc,work_status,work_delete,work_hrs,work_mins,work_time,log_hrs,log_mins,log_time,date_created) VALUES (@task_id,@project_id,@supervisor_id,@employee_id,@work_date,@work_location,@work_desc,@worklog_desc,@work_status,@work_delete,@work_hrs,@work_mins,@work_time,@log_hrs,@log_mins,@log_time,@date_created)"
            .InsertParameters.Add("task_id", taskDDL.SelectedValue.ToString)
            .InsertParameters.Add("project_id", projectDDL.SelectedValue.ToString)
            .InsertParameters.Add("supervisor_id", superId)
            .InsertParameters.Add("employee_id", Page.Request("eId"))
            .InsertParameters.Add("work_date", DateTime.Now.ToString("dd-MMM-yyyy"))
            .InsertParameters.Add("work_location", txtLocation.Text)
            .InsertParameters.Add("work_desc", "Unplanned Task")
            .InsertParameters.Add("worklog_desc", txtLogDesc.Text)
            .InsertParameters.Add("work_status", WStatusDDL.SelectedItem.ToString)
            .InsertParameters.Add("work_delete", 0)
            .InsertParameters.Add("work_hrs", "00")
            .InsertParameters.Add("work_mins", "00")
            .InsertParameters.Add("work_time", "00:00")
            .InsertParameters.Add("log_hrs", hrsDDL.SelectedItem.ToString)
            .InsertParameters.Add("log_mins", minDDL.SelectedItem.ToString)
            .InsertParameters.Add("log_time", hrsDDL.SelectedItem.ToString & ":" & minDDL.SelectedItem.ToString)
            .InsertParameters.Add("date_created", DateTime.Now.ToString("dd-MMM-yyyy"))
            If TStatusDDL.SelectedValue = "Active" Then
                updateTaskStatus()
            ElseIf TStatusDDL.SelectedValue = "Cancelled" Then
                updateTaskStatus()
            ElseIf TStatusDDL.SelectedValue = "Completed" Then
                updateTaskStatus()
            End If
        End With
        Dim b As Integer
        b = a.Insert
        SuccessPanel.Visible = True
        lblSuccess.Text = "Your Unplanned Task has been saved!"
        ErrorPanel.Visible = False
        GridView1.DataBind()
        txtWorkDate.Text = ""
        txtLocation.Text = ""
        txtSupervisor.Text = ""
        txtLogDesc.Text = ""
        WStatusDDL.SelectedValue = "0"
        TStatusDDL.SelectedValue = "0"
        projectDDL.SelectedValue = "0"
        taskDDL.SelectedValue = "0"
        hrsDDL.SelectedValue = "00"
        minDDL.SelectedValue = "00"
    End Sub

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
            .UpdateParameters.Add("task_id", taskDDL.SelectedValue.ToString)
        End With
        Dim cee As Integer
        cee = bee.Update
    End Sub
End Class