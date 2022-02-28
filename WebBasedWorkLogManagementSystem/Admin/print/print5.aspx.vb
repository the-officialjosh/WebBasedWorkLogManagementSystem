Imports System.Data.SqlClient
Public Class print5
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection = New SqlConnection
    Public da As SqlDataAdapter
    Public ds As DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
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
            lblEmployeeName.Text = dr("employee_lname").ToString() & " " & dr("employee_fname").ToString()
        End While
        conn.Close()
    End Sub

End Class