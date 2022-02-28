Public Class task_list
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub projectDDL1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles projectDDL1.SelectedIndexChanged
        If projectDDL1.SelectedValue = 0 Then
            txtSearch.Text = ""
            GridView1.Visible = True
            GridView2.Visible = False
        Else
            txtSearch.Text = ""
            GridView1.Visible = False
            GridView2.Visible = True
        End If
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        projectDDL1.SelectedValue = "0"
        GridView1.Visible = True
        GridView2.Visible = False
    End Sub
End Class