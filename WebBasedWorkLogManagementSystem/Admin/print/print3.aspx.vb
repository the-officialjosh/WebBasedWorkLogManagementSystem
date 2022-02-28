Public Class print3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblFrom.Text = Page.Request("from")
        lblTo.Text = Page.Request("to")
    End Sub

End Class