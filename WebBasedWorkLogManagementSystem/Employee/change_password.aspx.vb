﻿Imports System.Data.SqlClient
Public Class change_password
    Inherits System.Web.UI.Page
    Dim con As SqlConnection = New SqlConnection
    Dim conn As SqlConnection = New SqlConnection
    Dim dt, dt1 As DataTable
    Dim adp, adp1 As SqlDataAdapter
    Public da As SqlDataAdapter
    Public ds As DataSet



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
 	Try
            'Connection string definition
            con.ConnectionString = ConfigurationManager.ConnectionStrings("REPO").ConnectionString
        Catch ex As Exception

        End Try
        getEmployeeInfo()
    End Sub

    Sub getEmployeeInfo()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT tblEmployee.* FROM tblEmployee WHERE (tblEmployee.employee_id = @employee_id)", conn)
        cmd.Parameters.Add("@employee_id", SqlDbType.Int).Value = Page.Request("eId")
        Dim dr As SqlDataReader
        conn.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            Image1.ImageUrl = dr("employee_image").ToString()
        End While
        conn.Close()
    End Sub

    Protected Sub btnChange_Click(sender As Object, e As EventArgs) Handles btnChange.Click
        If txtOldPassword.Text = "" Or txtNewPassword.Text = "" Or txtRPassword.Text = "" Then
            SuccessPanel.Visible = False
            ErrorPanel.Visible = True
            lblError.Text = "Please provide the information required of you before saving."
        End If
        If con.State = ConnectionState.Closed Then
            'TODO: Open connection to the database 
            con.Open()

            adp = New SqlDataAdapter("SELECT * FROM tblEmployee WHERE employee_id=@employee_id AND employee_password=@employee_password", con)
            adp.SelectCommand.Parameters.Add("@employee_id", SqlDbType.Int).Value = Page.Request("eId")
            adp.SelectCommand.Parameters.Add("@employee_password", SqlDbType.NVarChar).Value = txtOldPassword.Text
            dt = New DataTable()
            adp.Fill(dt) ' fill the records in datatable
            adp.Dispose()

            If dt.Rows.Count = 0 Then
                'if no user name and password found throw error message invalid credencial                 
                SuccessPanel.Visible = False
                ErrorPanel.Visible = True
                lblError.Text = "Incorrect password! The password you entered is not associated with your account. Please enter the correct password associated with your account."
            Else
                ErrorPanel.Visible = False
                SuccessPanel.Visible = False
                'if credencials are found redirect to application form page 
                savePassword()
            End If
        End If
        con.Close()
    End Sub

    Sub savePassword()
        Dim a As New SqlDataSource
        With a
            .ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
            .UpdateCommandType = SqlDataSourceCommandType.Text
            .UpdateCommand = "UPDATE tblEmployee SET employee_password=@employee_password WHERE employee_id=@employee_id"
            .UpdateParameters.Add("employee_password", txtNewPassword.Text)
            .UpdateParameters.Add("employee_id", Page.Request("eId"))
        End With
        Dim b As Integer
        b = a.Update
        clearfields()
        ErrorPanel.Visible = False
        SuccessPanel.Visible = True
        lblSuccess.Text = "Good Job! Your New Password has been saved."
    End Sub

    Sub clearfields()
        txtRPassword.Text = ""
        txtNewPassword.Text = ""
        txtOldPassword.Text = ""
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        If ((FileUpload.HasFile = True) _
                            AndAlso (Not (FileUpload.PostedFile) Is Nothing)) Then
            Dim _size As Int64 = 204800000000000
            ' equal 9 mb
            Dim _fileExt As String = System.IO.Path.GetExtension(FileUpload.FileName)
            If ((_fileExt.ToLower = ".gif") _
                        OrElse ((_fileExt.ToLower = ".jpeg") _
                        OrElse (_fileExt.ToLower = ".jpg") OrElse (_fileExt.ToLower = ".png"))) Then
                Dim firstid As String = Guid.NewGuid.ToString
                If (FileUpload.PostedFile.ContentLength <= _size) Then

                    Dim connection As SqlConnection = Nothing
                    Try
                        Dim img As FileUpload = CType(FileUpload, FileUpload)
                        'Dim imgByte As Byte() = Nothing
                        If img.HasFile AndAlso Not img.PostedFile Is Nothing Then
                            img.SaveAs(Server.MapPath("~/images/profile/") + img.FileName)
                            'To create a PostedFile
                            'Dim File As HttpPostedFile = FileUpload1.PostedFile
                            'Create byte Array with file len
                            'imgByte = New Byte(File.ContentLength - 1) {}
                            'force the control to load data in array
                            'File.InputStream.Read(imgByte, 0, File.ContentLength)
                        End If

                        ' Insert the employee name and image into db
                        Dim conn As String = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
                        connection = New SqlConnection(conn)
                        connection.Open()
                        Dim sql As String = "UPDATE tblEmployee SET employee_image=@employee_image WHERE employee_id=@employee_id"
                        Dim cmd As SqlCommand = New SqlCommand(sql, connection)
                        cmd.Parameters.AddWithValue("@employee_image", "~/images/profile/" + img.FileName)
                        cmd.Parameters.AddWithValue("@employee_id", Page.Request("eId"))
                        Dim id As Integer = Convert.ToInt32(cmd.ExecuteScalar())
                        ErrorPanel.Visible = False
                        SuccessPanel.Visible = True
                        lblSuccess.Text = "Awesome! Your profile image has been saved."
                        getEmployeeInfo()
                    Catch
                        SuccessPanel.Visible = False
                        ErrorPanel.Visible = True
                        lblError.Text = "There was an error"
                    Finally
                        connection.Close()
                    End Try

                Else
                    FileUpload.Focus()
                    SuccessPanel.Visible = False
                    ErrorPanel.Visible = True
                    lblError.Text = "Max file size is 20 MB"
                End If
            Else
                FileUpload.Focus()
                SuccessPanel.Visible = False
                ErrorPanel.Visible = True
                lblError.Text = "Only GIF or JPEG are allowed"
            End If
        Else
            FileUpload.Focus()
            SuccessPanel.Visible = False
            ErrorPanel.Visible = True
            lblError.Text = "Please upload a photo first"
        End If
    End Sub
End Class