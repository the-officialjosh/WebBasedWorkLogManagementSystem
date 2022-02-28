Imports System.Data.SqlClient
Public Class new_project
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection = New SqlConnection
    Public da As SqlDataAdapter
    Public ds As DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub prjsuprDDL_SelectedIndexChanged(sender As Object, e As EventArgs) Handles prjsuprDDL.SelectedIndexChanged
        If prjsuprDDL.SelectedValue = "0" Then
            lblEmployeeName.Text = ""
        Else
            getEmployeeInfo()
        End If
    End Sub

    Sub getEmployeeInfo()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT tblEmployee.* FROM tblEmployee WHERE (tblEmployee.employee_id = @employee_id)", conn)
        cmd.Parameters.Add("@employee_id", SqlDbType.Int).Value = prjsuprDDL.SelectedValue.ToString
        Dim dr As SqlDataReader
        conn.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblEmployeeName.Text = dr("employee_lname").ToString() & " " & dr("employee_fname").ToString()
        End While
        conn.Close()
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim strcon As String = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim con As New SqlConnection(strcon)
        con.Open()
        If txtProject.Text = "" Or prjsuprDDL.SelectedValue = "0" Then
            'Error Message                       
            ErrorPanel.Visible = True
            lblError.Text = "Please complete the form before proceeding!"
            SuccessPanel.Visible = False
        Else
            Dim theQuery As String = "SELECT * FROM tblProject WHERE project_name = @project_name"
            Dim cmd1 As SqlCommand = New SqlCommand(theQuery, con)
            cmd1.Parameters.AddWithValue("@project_name", txtProject.Text.ToUpper)

            Using reader As SqlDataReader = cmd1.ExecuteReader()
                If reader.HasRows Then
                    ErrorPanel.Visible = True
                    lblError.Text = "Operation Failed! The Project Name already exist. Please enter a different name."
                    SuccessPanel.Visible = False
                Else
                    createProject()
                End If
            End Using
            con.Close()
        End If
    End Sub

    Sub createProject()
        Dim a As New SqlDataSource
        With a
            .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            .InsertCommandType = SqlDataSourceCommandType.Text
            .InsertCommand = "INSERT INTO tblProject (project_name,project_supervisor,project_created) VALUES (@project_name,@project_supervisor,@project_created)"
            .InsertParameters.Add("project_name", txtProject.Text.ToUpper)
            .InsertParameters.Add("project_supervisor", prjsuprDDL.SelectedValue.ToString)
            .InsertParameters.Add("project_created", DateTime.Now.ToString("dd-MMM-yyyy"))
        End With
        Dim b As Integer
        b = a.Insert
        SuccessPanel.Visible = True
        lblSuccess.Text = "A New Project has been created successfully!"
        ErrorPanel.Visible = False
        GridView1.DataBind()
        txtProject.Text = ""
        lblEmployeeName.Text = ""
        prjsuprDDL.SelectedValue = "0"
    End Sub
End Class