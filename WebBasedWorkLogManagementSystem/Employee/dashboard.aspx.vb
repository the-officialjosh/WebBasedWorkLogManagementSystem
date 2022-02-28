Imports System.Data.SqlClient
Public Class dashboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        countAllTasks()
        countCompletedTasks()
        countActiveTasks()
        countAllWork()
        countCompletedWork()
        countOngoingWork()
        countCancelledTasks()
        countCancelledWork()
        countTrashedTasks()
        countTrashedWork()
        lblCancelled.Text = Val(lblCancelTask.Text) + Val(lblCancelWork.Text)
        lblTrash.Text = Val(lblTrashTask.Text) + Val(lblTrashWork.Text)
    End Sub

    Sub countTrashedWork()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'trashedLog' FROM tblWork WHERE (tblWork.employee_id = @employee_id) AND (tblWork.work_delete = @work_delete)", connection)
        cmd.Parameters.Add("@employee_id", SqlDbType.Int).Value = Page.Request("eId")
        cmd.Parameters.Add("@work_delete", SqlDbType.Int).Value = 1
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblTrashWork.Text = dr("trashedLog").ToString()
        End While
        connection.Close()
    End Sub

    Sub countTrashedTasks()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'trashedTasks' FROM tblTask WHERE (tblTask.employee_id = @employee_id) AND (tblTask.task_delete = @task_delete)", connection)
        cmd.Parameters.Add("@employee_id", SqlDbType.Int).Value = Page.Request("eId")
        cmd.Parameters.Add("@task_delete", SqlDbType.Int).Value = 1
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblTrashTask.Text = dr("trashedTasks").ToString()
        End While
        connection.Close()
    End Sub

    Sub countCancelledWork()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'cancelledLog' FROM tblWork WHERE (tblWork.employee_id = @employee_id) AND (tblWork.work_status = @work_status)", connection)
        cmd.Parameters.Add("@employee_id", SqlDbType.Int).Value = Page.Request("eId")
        cmd.Parameters.Add("@work_status", SqlDbType.NVarChar).Value = "Cancelled"
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblCancelWork.Text = dr("cancelledLog").ToString()
        End While
        connection.Close()
    End Sub

    Sub countCancelledTasks()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'cancelledTasks' FROM tblTask WHERE (tblTask.employee_id = @employee_id) AND (tblTask.task_status = @task_status)", connection)
        cmd.Parameters.Add("@employee_id", SqlDbType.Int).Value = Page.Request("eId")
        cmd.Parameters.Add("@task_status", SqlDbType.NVarChar).Value = "Cancelled"
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblCancelTask.Text = dr("cancelledTasks").ToString()
        End While
        connection.Close()
    End Sub

    Sub countOngoingWork()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'ongoingWork' FROM tblWork WHERE (tblWork.employee_id = @employee_id) AND (tblWork.work_status = @work_status)", connection)
        cmd.Parameters.Add("@employee_id", SqlDbType.Int).Value = Page.Request("eId")
        cmd.Parameters.Add("@work_status", SqlDbType.NVarChar).Value = "Ongoing"
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblOngoingWork.Text = dr("ongoingWork").ToString()
        End While
        connection.Close()
    End Sub

    Sub countCompletedWork()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'compWork' FROM tblWork WHERE (tblWork.employee_id = @employee_id) AND (tblWork.work_status = @work_status)", connection)
        cmd.Parameters.Add("@employee_id", SqlDbType.Int).Value = Page.Request("eId")
        cmd.Parameters.Add("@work_status", SqlDbType.NVarChar).Value = "Completed"
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblCompletedWork.Text = dr("compWork").ToString()
        End While
        connection.Close()
    End Sub

    Sub countAllWork()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'allWorkEntry' FROM tblWork WHERE employee_id=@employee_id", connection)
        cmd.Parameters.Add("@employee_id", SqlDbType.Int).Value = Page.Request("eId")
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblAllWork.Text = dr("allWorkEntry").ToString()
        End While
        connection.Close()
    End Sub

    Sub countAllTasks()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'allTasks' FROM tblTask WHERE employee_id=@employee_id", connection)
        cmd.Parameters.Add("@employee_id", SqlDbType.Int).Value = Page.Request("eId")
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblAllTasks.Text = dr("allTasks").ToString()
        End While
        connection.Close()
    End Sub

    Sub countCompletedTasks()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'compTasks' FROM tblTask WHERE (tblTask.employee_id = @employee_id) AND (tblTask.task_status = @task_status)", connection)
        cmd.Parameters.Add("@employee_id", SqlDbType.Int).Value = Page.Request("eId")
        cmd.Parameters.Add("@task_status", SqlDbType.NVarChar).Value = "Completed"
        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblCompleted.Text = dr("compTasks").ToString()
        End While
        connection.Close()
    End Sub

    Sub countActiveTasks()
        Dim connection As New SqlConnection
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("WLOG").ConnectionString
        Dim cmd As New SqlCommand("SELECT COUNT(*) AS 'activeTasks' FROM tblTask WHERE (tblTask.employee_id = @employee_id) AND (tblTask.task_status = @task_status)", connection)
        cmd.Parameters.Add("@employee_id", SqlDbType.Int).Value = Page.Request("eId")
        cmd.Parameters.Add("@task_status", SqlDbType.NVarChar).Value = "Active"

        Dim dr As SqlDataReader
        connection.Open()
        dr = cmd.ExecuteReader()
        While dr.Read()
            lblActive.Text = dr("activeTasks").ToString()
        End While
        connection.Close()
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
        Else
            statusDDL.SelectedValue = "0"
            txtSearch.Text = ""
            txtFrom.Text = ""
            txtTo.Text = ""
            GridView1.Visible = False
            GridView2.Visible = True
            GridView3.Visible = False
            GridView4.Visible = False
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
    End Sub

    Protected Sub LinkButton3_Click(sender As Object, e As EventArgs) Handles LinkButton3.Click
        If txtTo.Text = "" Or txtFrom.Text = "" Then
            lblError1.Visible = True
            lblError2.Visible = True
            GridView1.Visible = True
            GridView2.Visible = False
            GridView3.Visible = False
            GridView4.Visible = False
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
        Else
            projectDDL1.SelectedValue = "0"
            txtSearch.Text = ""
            txtFrom.Text = ""
            txtTo.Text = ""
            GridView1.Visible = False
            GridView2.Visible = False
            GridView3.Visible = False
            GridView4.Visible = True
        End If
    End Sub
End Class