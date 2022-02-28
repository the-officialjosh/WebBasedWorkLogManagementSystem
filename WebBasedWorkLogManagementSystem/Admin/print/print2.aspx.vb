Public Class print2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblProjectName.Text = Page.Request("pname")
    End Sub

End Class