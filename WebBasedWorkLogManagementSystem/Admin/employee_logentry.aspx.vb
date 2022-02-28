Imports System.Data.SqlClient
Public Class employee_logentry
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection = New SqlConnection
    Public da As SqlDataAdapter
    Public ds As DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        countWorkEntries()
    End Sub

    Sub countWorkEntries()
        For Each grow As GridViewRow In GridView1.Rows
            Try
                Dim lblEmployeeId As Label = TryCast(grow.FindControl("lblEmployeeId"), Label)
                Dim lblEntries As Label = TryCast(grow.FindControl("lblEntries"), Label)
                Dim connection As New SqlConnection
                connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
                Dim cmd As New SqlCommand("SELECT COUNT(*) as 'totalEntries' from tblWork WHERE employee_id=@employee_id", connection)
                cmd.Parameters.Add("@employee_id", SqlDbType.Int).Value = lblEmployeeId.Text
                Dim dr As SqlDataReader
                connection.Open()
                dr = cmd.ExecuteReader()
                While dr.Read()
                    lblEntries.Text = dr("totalEntries").ToString
                End While
                connection.Close()
            Catch ex As Exception
            End Try
        Next
    End Sub

End Class