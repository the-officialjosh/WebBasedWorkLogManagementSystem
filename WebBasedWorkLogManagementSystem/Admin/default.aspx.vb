Imports System.Data.SqlClient
Public Class _default1
    Inherits System.Web.UI.Page
    Dim con As SqlConnection = New SqlConnection
    Dim conn As SqlConnection = New SqlConnection
    Dim dt As DataTable
    Dim adp As SqlDataAdapter
    Dim adminId As Integer
    Dim name As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'Connection string definition
            con.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        If con.State = ConnectionState.Closed Then
            'TODO: Open connection to the database 
            con.Open()

            adp = New SqlDataAdapter("SELECT * FROM tblAdmin WHERE ((tblAdmin.email = @email) OR (tblAdmin.username = @username)) AND (tblAdmin.password = @password)", con)
            adp.SelectCommand.Parameters.Add("@email", SqlDbType.NVarChar).Value = txtName.Text
            adp.SelectCommand.Parameters.Add("@username", SqlDbType.NVarChar).Value = txtName.Text
            adp.SelectCommand.Parameters.Add("@password", SqlDbType.NVarChar).Value = txtPassword.Text
            dt = New DataTable()
            adp.Fill(dt) ' fill the records in datatable
            adp.Dispose()

            If dt.Rows.Count = 0 Then
                txtName.Text = ""
                txtPassword.Text = ""
                'if no user name and password found throw error message invalid credencial                
                MyMessageBox("Access Denied - Please verify that the information(s) are inputed correctly!")

            Else
                'if credencials are found redirect to aaplication form page 
                getloginInfo()
                Response.Redirect("~/Admin/dashboard.aspx?admin=" & adminId & "&user=" & name)
            End If
            con.Close()
        End If
    End Sub


#Region "Functions and procedure"
    Sub getloginInfo()
        'Try
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT tblAdmin.* FROM tblAdmin WHERE ((tblAdmin.email = @email) OR (tblAdmin.username = @username)) AND (tblAdmin.password = @password)", conn)
        cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = txtName.Text
        cmd.Parameters.Add("@username", SqlDbType.NVarChar).Value = txtName.Text
        cmd.Parameters.Add("@password", SqlDbType.NVarChar).Value = txtPassword.Text.Trim()
        Dim dr As SqlDataReader
        conn.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            adminId = dr("admin_id").ToString()
            name = dr("username").ToString.Trim()
            Session("LandingTime") = DateTime.Now
        End While
    End Sub

    Public Sub MyMessageBox(text As String)
        Dim script As String = (Convert.ToString("alert('") & text) + "');"
        ScriptManager.RegisterStartupScript(Me, [GetType](), "ServerControlScripts", script, True)
    End Sub
#End Region
End Class