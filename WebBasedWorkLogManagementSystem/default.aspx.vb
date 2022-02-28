Imports System.Data.SqlClient
Public Class _default
    Inherits System.Web.UI.Page
    Dim con As SqlConnection = New SqlConnection
    Dim conn As SqlConnection = New SqlConnection
    Dim dt As DataTable
    Dim adp As SqlDataAdapter
    Dim employeeId As Integer
    Dim status As Integer
    Dim phone As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'Connection string definition
            con.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btnLogIn_Click(sender As Object, e As EventArgs) Handles btnLogIn.Click
        If con.State = ConnectionState.Closed Then
            'TODO: Open connection to the database 
            con.Open()

            adp = New SqlDataAdapter("SELECT * FROM tblEmployee WHERE employee_email=@employee_email AND employee_password=@employee_password", con)
            adp.SelectCommand.Parameters.Add("@employee_email", SqlDbType.NVarChar).Value = txtEmail.Text.ToLower
            adp.SelectCommand.Parameters.Add("@employee_password", SqlDbType.NVarChar).Value = txtPassword.Text
            dt = New DataTable()
            adp.Fill(dt) ' fill the records in datatable
            adp.Dispose()

            If dt.Rows.Count = 0 Then
                txtEmail.Text = ""
                txtPassword.Text = ""
                'if no user name and password found throw error message invalid credencial                
                MyMessageBox("Access Denied - Please verify that the information(s) are inputed correctly!")

            Else
                'if credencials are found redirect to aaplication form page 
                getloginInfo()
                If status = 0 Then
                    MyMessageBox("Access Denied - Your account is NOT active!")
                Else
                    Response.Redirect("~/Employee/dashboard.aspx?eId=" & employeeId & "&user=" & phone)
                End If
            End If
            con.Close()
        End If
    End Sub


#Region "Functions and procedure"
    Sub getloginInfo()
        'Try
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT tblEmployee.* FROM tblEmployee WHERE (tblEmployee.employee_email = @employee_email) AND (tblEmployee.employee_password = @employee_password)", conn)
        cmd.Parameters.Add("@employee_email", SqlDbType.NVarChar).Value = txtEmail.Text.ToLower
        cmd.Parameters.Add("@employee_password", SqlDbType.NVarChar).Value = txtPassword.Text.Trim()
        Dim dr As SqlDataReader
        conn.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            employeeId = dr("employee_id").ToString()
            phone = dr("employee_phone").ToString()
            status = dr("account_status").ToString()
            Session("LandingTime") = DateTime.Now
        End While
    End Sub

    Public Sub MyMessageBox(text As String)
        Dim script As String = (Convert.ToString("alert('") & text) + "');"
        ScriptManager.RegisterStartupScript(Me, [GetType](), "ServerControlScripts", script, True)
    End Sub
#End Region
End Class