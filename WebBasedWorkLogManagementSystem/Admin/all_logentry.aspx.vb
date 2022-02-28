Public Class all_logentry
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub projectDDL1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles projectDDL1.SelectedIndexChanged
        If projectDDL1.SelectedValue = "0" Then
            statusDDL.SelectedValue = "0"
            txtSearch.Text = ""
            txtFrom.Text = ""
            txtTo.Text = ""
            GridView1.Visible = True
            GridView2.Visible = False
            GridView3.Visible = False
            GridView4.Visible = False
            Button1.Visible = True
            Button2.Visible = False
            Button3.Visible = False
            Button4.Visible = False
        Else
            statusDDL.SelectedValue = "0"
            txtSearch.Text = ""
            txtFrom.Text = ""
            txtTo.Text = ""
            GridView1.Visible = False
            GridView2.Visible = True
            GridView3.Visible = False
            GridView4.Visible = False
            Button1.Visible = False
            Button2.Visible = True
            Button3.Visible = False
            Button4.Visible = False
        End If
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        projectDDL1.SelectedValue = "0"
        statusDDL.SelectedValue = "0"
        txtFrom.Text = ""
        txtTo.Text = ""
        GridView1.Visible = True
        GridView2.Visible = False
        GridView3.Visible = False
        GridView4.Visible = False
        Button1.Visible = True
        Button2.Visible = False
        Button3.Visible = False
        Button4.Visible = False
    End Sub

    Protected Sub LinkButton3_Click(sender As Object, e As EventArgs) Handles LinkButton3.Click
        If txtTo.Text = "" Or txtFrom.Text = "" Then
            lblError1.Visible = True
            lblError2.Visible = True
            GridView1.Visible = True
            GridView2.Visible = False
            GridView3.Visible = False
            GridView4.Visible = False
            Button1.Visible = True
            Button2.Visible = False
            Button3.Visible = False
            Button4.Visible = False
            projectDDL1.SelectedValue = "0"
            statusDDL.SelectedValue = "0"
            txtSearch.Text = ""
        Else
            lblError1.Visible = False
            lblError2.Visible = False
            GridView1.Visible = False
            GridView2.Visible = False
            GridView3.Visible = True
            GridView4.Visible = False
            Button1.Visible = False
            Button2.Visible = False
            Button3.Visible = True
            Button4.Visible = False
            projectDDL1.SelectedValue = "0"
            statusDDL.SelectedValue = "0"
            txtSearch.Text = ""
        End If
    End Sub

    Protected Sub statusDDL_SelectedIndexChanged(sender As Object, e As EventArgs) Handles statusDDL.SelectedIndexChanged
        If statusDDL.SelectedValue = "0" Then
            projectDDL1.SelectedValue = "0"
            txtSearch.Text = ""
            txtFrom.Text = ""
            txtTo.Text = ""
            GridView1.Visible = True
            GridView2.Visible = False
            GridView3.Visible = False
            GridView4.Visible = False
            Button1.Visible = True
            Button2.Visible = False
            Button3.Visible = False
            Button4.Visible = False
        Else
            projectDDL1.SelectedValue = "0"
            txtSearch.Text = ""
            txtFrom.Text = ""
            txtTo.Text = ""
            GridView1.Visible = False
            GridView2.Visible = False
            GridView3.Visible = False
            GridView4.Visible = True
            Button1.Visible = False
            Button2.Visible = False
            Button3.Visible = False
            Button4.Visible = True
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim url As String = "print/print1.aspx?q=" & txtSearch.Text & "&admin=" & Request.QueryString("admin") & "&user=" & Request.QueryString("user")
        Dim fullURL As String = ("window.open('" _
                    + (url + "', '_blank', 'height=2000,width=2000,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resiza" &
                    "ble=no,titlebar=no' );"))
        Button1.Attributes.Add("OnClick", fullURL)
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Dim url As String = "print/print2.aspx?pId=" & projectDDL1.SelectedValue & "&admin=" & Request.QueryString("admin") & "&user=" & Request.QueryString("user") & "&pname=" & projectDDL1.SelectedItem.ToString
        Dim fullURL As String = ("window.open('" _
                    + (url + "', '_blank', 'height=2000,width=2000,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resiza" &
                    "ble=no,titlebar=no' );"))
        Button2.Attributes.Add("OnClick", fullURL)
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs)
        Dim url As String = "print/print3.aspx?from=" & txtFrom.Text & "&to=" & txtTo.Text & "&admin=" & Request.QueryString("admin") & "&user=" & Request.QueryString("user")
        Dim fullURL As String = ("window.open('" _
                    + (url + "', '_blank', 'height=2000,width=2000,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resiza" &
                    "ble=no,titlebar=no' );"))
        Button3.Attributes.Add("OnClick", fullURL)
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs)
        Dim url As String = "print/print4.aspx?status=" & statusDDL.SelectedValue & "&admin=" & Request.QueryString("admin") & "&user=" & Request.QueryString("user")
        Dim fullURL As String = ("window.open('" _
                    + (url + "', '_blank', 'height=2000,width=2000,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resiza" &
                    "ble=no,titlebar=no' );"))
        Button4.Attributes.Add("OnClick", fullURL)
    End Sub
End Class