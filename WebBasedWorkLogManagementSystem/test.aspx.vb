Imports System.Globalization

Public Class test
    Inherits System.Web.UI.Page
    Dim startTime As String
    Dim endTime As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        startTime = "08:00"
        endTime = "09:40"
        Dim fig As String
        lblTime.Text = String.Empty
        Dim fromData As DateTime = Convert.ToDateTime(startTime.Trim())
        Dim toData As DateTime = Convert.ToDateTime(endTime.Trim())
        lblTime.Text = Me.CalculateDifference(fromData, toData)

    End Sub

    Private Function CalculateDifference(ByVal fromData As DateTime, ByVal toData As DateTime) As String
        Dim ts As TimeSpan = fromData - toData
        'Dim diff As String = String.Format("{0} hours, {1} minutes", ts.Hours, ts.Minutes)
        Dim diff As String = String.Format("{0}:{1}", ts.Hours, ts.Minutes.ToString.Replace("-", ""))
        Return diff
    End Function
End Class