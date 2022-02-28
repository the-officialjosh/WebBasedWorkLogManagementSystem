Imports System.Data.SqlClient
Public Class assign_task
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection = New SqlConnection
    Public da As SqlDataAdapter
    Public ds As DataSet
    Dim supervisorId As Integer
    Dim adminName As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        getAdminInfo()
        getEmployeeInfo()
    End Sub

    Sub getAdminInfo()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT tblAdmin.* FROM tblAdmin WHERE (tblAdmin.admin_id = @admin_id)", conn)
        cmd.Parameters.Add("@admin_id", SqlDbType.Int).Value = Page.Request("admin")
        Dim dr As SqlDataReader
        conn.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            adminName = dr("fullname").ToString()
        End While
        conn.Close()
    End Sub

    Sub getEmployeeInfo()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT tblEmployee.* FROM tblEmployee WHERE (tblEmployee.employee_id = @employee_id)", conn)
        cmd.Parameters.Add("@employee_id", SqlDbType.Int).Value = Page.Request("eId")
        Dim dr As SqlDataReader
        conn.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblEmployeeName.Text = dr("employee_lname").ToString() & " " & dr("employee_fname").ToString()
            lblEmpName.Text = dr("employee_lname").ToString() & " " & dr("employee_fname").ToString()
        End While
        conn.Close()
    End Sub

    Protected Sub projectDDL_SelectedIndexChanged(sender As Object, e As EventArgs) Handles projectDDL.SelectedIndexChanged
        If projectDDL.SelectedValue = "0" Then
            txtSupervisor.Text = "Default"
        Else
            getSupervisorInfo()
        End If
    End Sub

    Sub getSupervisorInfo()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT tblEmployee.employee_fname, tblEmployee.employee_lname, tblEmployee.employee_role, tblEmployee.employee_phone, tblProject.* FROM tblProject INNER JOIN tblEmployee ON tblProject.project_supervisor = tblEmployee.employee_id WHERE (tblProject.project_id = @project_id)", conn)
        cmd.Parameters.Add("@project_id", SqlDbType.Int).Value = projectDDL.SelectedValue.ToString
        Dim dr As SqlDataReader
        conn.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            txtSupervisor.Text = dr("employee_lname").ToString() & " " & dr("employee_fname").ToString()
            supervisorId = dr("project_supervisor")
        End While
        conn.Close()
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim strcon As String = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim con As New SqlConnection(strcon)
        con.Open()
        If txtTask.Text = "" Or projectDDL.SelectedValue = "0" Or txtStartDate.Text = "" Or txtEndDate.Text = "" Or txtDesc.Text = "" Then
            'Error Message                       
            ErrorPanel.Visible = True
            lblError.Text = "Please complete the form before proceeding!"
            SuccessPanel.Visible = False
        Else

            createTask()
        End If
        con.Close()
    End Sub

    Sub createTask()
        getSupervisorInfo()
        Dim a As New SqlDataSource
        With a
            .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            .InsertCommandType = SqlDataSourceCommandType.Text
            .InsertCommand = "INSERT INTO tblTask (project_id,supervisor_id,employee_id,task_name,task_desc,task_startdate,task_enddate,task_status,task_delete,created_by,date_created) VALUES (@project_id,@supervisor_id,@employee_id,@task_name,@task_desc,@task_startdate,@task_enddate,@task_status,@task_delete,@created_by,@date_created)"
            .InsertParameters.Add("project_id", projectDDL.SelectedValue.ToString)
            .InsertParameters.Add("supervisor_id", supervisorId)
            .InsertParameters.Add("employee_id", Page.Request("eId"))
            .InsertParameters.Add("task_name", txtTask.Text)
            .InsertParameters.Add("task_desc", txtDesc.Text)
            .InsertParameters.Add("task_startdate", txtStartDate.Text)
            .InsertParameters.Add("task_enddate", txtEndDate.Text)
            .InsertParameters.Add("task_status", statusDDL.SelectedItem.ToString)
            .InsertParameters.Add("task_delete", 0)
            .InsertParameters.Add("created_by", adminName.ToUpper & " (ADMIN)")
            .InsertParameters.Add("date_created", DateTime.Now.ToString("dd-MMM-yyyy"))
        End With
        Dim b As Integer
        b = a.Insert
        SuccessPanel.Visible = True
        lblSuccess.Text = "A New Project Task has been created for " & StrConv(projectDDL.SelectedItem.ToString, vbProperCase) & "!"
        ErrorPanel.Visible = False
        GridView1.DataBind()
        GridView2.DataBind()
        txtTask.Text = ""
        txtSupervisor.Text = ""
        txtDesc.Text = ""
        txtStartDate.Text = ""
        txtEndDate.Text = ""
        projectDDL.SelectedValue = "0"
        statusDDL.SelectedValue = "0"
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
End Class