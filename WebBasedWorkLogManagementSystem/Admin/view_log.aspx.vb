Imports System.Data.SqlClient
Public Class view_log
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
            'lblEmpName.Text = dr("employee_lname").ToString() & " " & dr("employee_fname").ToString()
        End While
        conn.Close()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim url As String = "print/print5.aspx?q=" & txtSearch.Text & "&admin=" & Request.QueryString("admin") & "&user=" & Request.QueryString("user") & "&eId=" & Request.QueryString("eId")
        Dim fullURL As String = ("window.open('" _
                    + (url + "', '_blank', 'height=2000,width=2000,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resiza" &
                    "ble=no,titlebar=no' );"))
        Button1.Attributes.Add("OnClick", fullURL)
    End Sub
End Class