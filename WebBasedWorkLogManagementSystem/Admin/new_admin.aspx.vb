Imports System.Data.SqlClient
Public Class new_admin
    Inherits System.Web.UI.Page
    Dim con As SqlConnection = New SqlConnection
    Dim conn As SqlConnection = New SqlConnection
    Dim dt As DataTable
    Dim adp As SqlDataAdapter
    Dim adminName As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        getAdminInfo()
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
            'Session("LandingTime") = DateTime.Now
        End While
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim strcon As String = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim con As New SqlConnection(strcon)
        con.Open()
        If txtFName.Text = "" Or txtUsername.Text = "" Or txtEmail.Text = "" Or roleDDL.SelectedValue = "0" Or txtPassword.Text = "" Then
            'Error Message
            SuccessPanel.Visible = False
            ErrorPanel.Visible = True
            lblError.Text = "Please complete the form before proceeding!"
        Else
            SuccessPanel.Visible = False
            ErrorPanel.Visible = False
            Dim theQuery As String = "SELECT * FROM tblAdmin WHERE email = @email"
            Dim cmd1 As SqlCommand = New SqlCommand(theQuery, con)
            cmd1.Parameters.AddWithValue("@email", txtEmail.Text.ToLower)

            Using reader As SqlDataReader = cmd1.ExecuteReader()
                If reader.HasRows Then
                    ' User already exists
                    SuccessPanel.Visible = False
                    ErrorPanel.Visible = True
                    lblError.Text = "The Email you entered has already been used by another Admin. Please try something different!"

                Else
                    createAccount()
                End If
            End Using
            con.Close()
        End If
    End Sub

    Sub createAccount()
        Dim a As New SqlDataSource
        With a
            .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            .InsertCommandType = SqlDataSourceCommandType.Text
            .InsertCommand = "INSERT INTO tblAdmin (fullname,role,username,email,password,status,date_created,created_by) VALUES (@fullname,@role,@username,@email,@password,@status,@date_created,@created_by)"
            .InsertParameters.Add("fullname", txtFName.Text)
            .InsertParameters.Add("role", roleDDL.SelectedItem.ToString)
            .InsertParameters.Add("username", txtUsername.Text.Trim)
            .InsertParameters.Add("email", txtEmail.Text.ToLower)
            .InsertParameters.Add("password", txtPassword.Text)
            .InsertParameters.Add("status", "1")
            .InsertParameters.Add("date_created", DateTime.Now.ToString("dd-MMM-yyyy"))
            .InsertParameters.Add("created_by", adminName)
        End With
        Dim b As Integer
        b = a.Insert
        GridView1.DataBind()
        ErrorPanel.Visible = False
        SuccessPanel.Visible = True
        lblSuccess.Text = "Gread Job! Admin Account has been created successfully!"
        txtFName.Text = ""
        txtEmail.Text = ""
        roleDDL.SelectedValue = "0"
        txtPassword.Text = ""
        txtUsername.Text = ""
    End Sub


    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        If e.CommandName = "activeAdmin" Then
            Dim adminId As String = Convert.ToString(e.CommandArgument)
            Dim strmgr As String = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            Dim con2 As New SqlConnection(strmgr)
            con2.Open()
            Dim bb As New SqlDataSource
            With bb
                .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ToString
                .UpdateCommandType = SqlDataSourceCommandType.Text
                .UpdateCommand = "UPDATE tblAdmin SET status=@status WHERE admin_id=@admin_id"
                .UpdateParameters.Add("status", 1)
                .UpdateParameters.Add("admin_id", adminId)
            End With
            Dim aa As Integer
            aa = bb.Update
            GridView1.DataBind()
        End If

        If e.CommandName = "inactiveAdmin" Then
            Dim adminId As Integer = Convert.ToInt32(e.CommandArgument)
            Dim strcon As String = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            Dim con2 As New SqlConnection(strcon)
            con2.Open()
            Dim bbb As New SqlDataSource
            With bbb
                .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ToString
                .UpdateCommandType = SqlDataSourceCommandType.Text
                .UpdateCommand = "UPDATE tblAdmin SET status=@status WHERE admin_id=@admin_id"
                .UpdateParameters.Add("status", 0)
                .UpdateParameters.Add("admin_id", adminId)
            End With
            Dim aaa As Integer
            aaa = bbb.Update
            GridView1.DataBind()
        End If
    End Sub
End Class