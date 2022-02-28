Imports System.Data.SqlClient
Public Class create_account
    Inherits System.Web.UI.Page
    Dim con As SqlConnection = New SqlConnection
    Dim conn As SqlConnection = New SqlConnection
    Dim dt As DataTable
    Dim adp As SqlDataAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnCreate_Click(sender As Object, e As EventArgs) Handles btnCreate.Click
        Dim strcon As String = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim con As New SqlConnection(strcon)
        con.Open()
        If txtFname.Text = "" Or txtLName.Text = "" Or txtEmail.Text = "" Or txtPhone.Text = "" Or txtPassword.Text = "" Or txtRPassword.Text = "" Then
            'Error Message             
            UserMsgBox(sMsg:="Please complete the form before proceeding!")
        Else
            Dim theQuery As String = "SELECT * FROM tblEmployee WHERE (employee_email=@employee_email OR employee_phone=@employee_phone)"
            Dim cmd1 As SqlCommand = New SqlCommand(theQuery, con)
            cmd1.Parameters.AddWithValue("@employee_email", txtEmail.Text.ToLower)
            cmd1.Parameters.AddWithValue("@employee_phone", txtPhone.Text.Trim)

            Using reader As SqlDataReader = cmd1.ExecuteReader()
                If reader.HasRows Then
                    ' User already exists                    
                    UserMsgBox(sMsg:="The Email/Phone Number you entered has already been used by another Employee. Please try something different!")

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
            .InsertCommand = "INSERT INTO tblEmployee (employee_fname,employee_lname,employee_email,employee_phone,employee_password,account_status,employee_registered) VALUES (@employee_fname,@employee_lname,@employee_email,@employee_phone,@employee_password,@account_status,@employee_registered)"
            .InsertParameters.Add("employee_fname", txtFname.Text.ToUpper)
            .InsertParameters.Add("employee_lname", txtLName.Text.ToUpper)
            .InsertParameters.Add("employee_email", txtEmail.Text.ToLower)
            .InsertParameters.Add("employee_phone", txtPhone.Text.Trim)
            .InsertParameters.Add("employee_password", txtPassword.Text)
            .InsertParameters.Add("account_status", "0")
            .InsertParameters.Add("employee_registered", DateTime.Now.ToString("dd-MMM-yyyy"))
        End With
        Dim b As Integer
        b = a.Insert
        UserMsgBox(sMsg:="Your Account has been created! Please wait for account activation before logging in.")
        txtFname.Text = ""
        txtLName.Text = ""
        txtEmail.Text = ""
        txtPhone.Text = ""
        txtPassword.Text = ""
        txtRPassword.Text = ""
    End Sub

    Public Sub UserMsgBox(ByVal sMsg As String)
        Dim sb As New StringBuilder()
        Dim oFormObject As System.Web.UI.Control
        sMsg = sMsg.Replace("'", "\'")
        sMsg = sMsg.Replace(Chr(34), "\" & Chr(34))
        sMsg = sMsg.Replace(vbCrLf, "\n")
        sMsg = "<script language=javascript>alert(""" & sMsg & """)</script>"
        sb = New StringBuilder()
        sb.Append(sMsg)

        For Each oFormObject In Me.Controls
            If TypeOf oFormObject Is HtmlForm Then
                Exit For
            End If
        Next

        oFormObject.Controls.AddAt(oFormObject.Controls.Count, New LiteralControl(sb.ToString()))
    End Sub
End Class