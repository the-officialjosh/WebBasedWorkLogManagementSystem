Imports System.Data.SqlClient
Public Class new_work
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
            txtStartDate.Text = "Default"
            txtEndDate.Text = "Default"
            txtStatus.Text = "Default"
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
            txtStartDate.Text = dr("task_startdate").ToString()
            txtEndDate.Text = dr("task_enddate").ToString()
            txtStatus.Text = dr("task_status").ToString()
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
        If txtWorkDate.Text = "" Or txtLocation.Text = "" Or txtSupervisor.Text = "" Or txtStatus.Text = "" Or projectDDL.SelectedValue = "0" Or taskDDL.SelectedValue = "0" Or txtStartDate.Text = "" Or txtEndDate.Text = "" Or txtWorkDesc.Text = "" Then
            'Error Message                       
            ErrorPanel.Visible = True
            lblError.Text = "Please complete the form before proceeding!"
            SuccessPanel.Visible = False
        Else
            getTaskInfo()
            createWork()
        End If
        con.Close()
    End Sub

    Sub createWork()
        Dim a As New SqlDataSource
        With a
            .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            .InsertCommandType = SqlDataSourceCommandType.Text
            .InsertCommand = "INSERT INTO tblWork (task_id,project_id,supervisor_id,employee_id,work_date,work_location,work_desc,work_status,work_delete,work_hrs,work_mins,work_time,log_hrs,log_mins,log_time,date_created) VALUES (@task_id,@project_id,@supervisor_id,@employee_id,@work_date,@work_location,@work_desc,@work_status,@work_delete,@work_hrs,@work_mins,@work_time,@log_hrs,@log_mins,@log_time,@date_created)"
            .InsertParameters.Add("task_id", taskDDL.SelectedValue.ToString)
            .InsertParameters.Add("project_id", projectDDL.SelectedValue.ToString)
            .InsertParameters.Add("supervisor_id", superId)
            .InsertParameters.Add("employee_id", Page.Request("eId"))
            .InsertParameters.Add("work_date", DateTime.Now.ToString("dd-MMM-yyyy"))
            .InsertParameters.Add("work_location", txtLocation.Text)
            .InsertParameters.Add("work_desc", txtWorkDesc.Text)
            .InsertParameters.Add("work_status", "Ongoing")
            .InsertParameters.Add("work_delete", 0)
            .InsertParameters.Add("work_hrs", hrsDDL.SelectedItem.ToString)
            .InsertParameters.Add("work_mins", minDDL.SelectedItem.ToString)
            .InsertParameters.Add("work_time", hrsDDL.SelectedItem.ToString & ":" & minDDL.SelectedItem.ToString)
            .InsertParameters.Add("log_hrs", "00")
            .InsertParameters.Add("log_mins", "00")
            .InsertParameters.Add("log_time", "00:00")
            .InsertParameters.Add("date_created", DateTime.Now.ToString("dd-MMM-yyyy"))
        End With
        Dim b As Integer
        b = a.Insert
        SuccessPanel.Visible = True
        lblSuccess.Text = "A New Work has been created for your Task: " & StrConv(taskDDL.SelectedItem.ToString, vbProperCase) & "!"
        ErrorPanel.Visible = False
        GridView1.DataBind()
        txtWorkDate.Text = ""
        txtLocation.Text = ""
        txtSupervisor.Text = ""
        txtWorkDesc.Text = ""
        txtStartDate.Text = ""
        txtEndDate.Text = ""
        txtStatus.Text = ""
        projectDDL.SelectedValue = "0"
        taskDDL.SelectedValue = "0"
        hrsDDL.SelectedValue = "00"
        minDDL.SelectedValue = "00"
    End Sub
End Class