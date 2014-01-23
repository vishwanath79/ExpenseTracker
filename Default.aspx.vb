Imports System.Data.SqlClient
Imports System.Data



Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub DetailsView1_ItemInserted(ByVal Sender As Object, e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        GridView2.Visible = False
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "MyScript", "alert('Expense Record Updated'); window.location='Default.aspx';", True)
     
    End Sub


    Protected Sub CustomValidator1_ServerValidate1(source As Object, args As ServerValidateEventArgs)
        args.IsValid = False
        For Each drv As Data.DataRowView In SqlDataSource3.[Select](DataSourceSelectArguments.Empty)
            If drv("WriteID") = args.Value Then
                args.IsValid = True
                Exit For
            End If
        Next
    End Sub


    'Sub CustomerDetail_ItemInserting(ByVal sender As Object, _
    'ByVal e As DetailsViewInsertEventArgs)

    Protected Sub CustomerDetail_ItemInserting(sender As Object, e As System.Web.UI.WebControls.DetailsViewInsertEventArgs)
        'Dim args As String = e.Values("WriteID").ToString()

        'For Each drv As Data.DataRowView In SqlDataSource3.[Select](DataSourceSelectArguments.Empty)
        '    If drv("WriteID") = args Then


        '        Dim ConnString As String = "Data Source=75409CHQ4034\SQLEXPRESS;Initial Catalog=ExpenseTracker;Integrated Security=True"
        '        Dim SQLConn As New SqlConnection()
        '        Dim SQLCmd As New SqlCommand()
        '        Dim SQLdr As SqlDataReader

        '        SQLConn.ConnectionString = ConnString 'Set the Connection String
        '        SQLConn.Open() 'Open the connection
        '        SQLCmd.Connection = SQLConn 'Sets the Connection to use with the SQL Command
        '        SQLCmd.CommandText = "Select  Top 1 Budget - Difference as 'Remaining' FROM ExpenseImageAudit where WriteID =" + "'" + args + "' Group by ID, Budget-Difference order by ID desc "

        '        'Sets the SQL String
        '        SQLdr = SQLCmd.ExecuteReader 'Gets Data

        '        While SQLdr.Read() 'While Data is Present
        '            TextBox8.Text = SQLdr("Remaining")
        '            'Dim script As String = "<script language='javascript'>var a=' " + TextBox8.Text & "'; var answer = confirm('Based on your last transaction, your amount left is '+ a + ' Do you want to proceed?'); </script>"

        '            'Page.ClientScript.RegisterStartupScript(Me.[GetType](), "script", script)

        '            '  Dim script As String = "<script language='javascript'>var a=' " + TextBox8.Text & "'; {if (!confirm('Based on your last transaction, your amount left is '+ a + ' Do you want to proceed?')) return false; else return true; }</script>"
        '            'Dim script As String = "<script language='javascript'>var a=' " + TextBox8.Text & "'; var answer = confirm('Based on your last transaction, your amount left is '+ a + '. Do you want to proceed?'); return answer ;</script>"
        '            'Page.ClientScript.RegisterStartupScript(Me.[GetType](), "answer", script)
        '            Dim script As String = String.Format("<script type='text/javascript'>confirmBudget({0});</script>", TextBox8.Text)
        '            Page.ClientScript.RegisterStartupScript(Me.[GetType](), "script", script)

        '        End While
        '    SQLdr.Close() 'Close the SQLDataReader
        '    SQLConn.Close() 'Close the connection

        '    End If

        'Next


    End Sub


    Protected Sub Button7_Click(sender As Object, e As System.EventArgs) Handles Button7.Click

        GridView2.Visible = True

        'If GridView2.SelectedRow.Co = 0 Then
        '    labNoData.Visible = True
        '    labNoData.Text = "You have 250$"
        'End If


    End Sub

 
    Protected Sub ObjectDataSourceStatusEventHandler(source As [Object], e As SqlDataSourceStatusEventArgs)
        labNoData.Visible = False



        Dim rows As Integer = e.AffectedRows
        If rows = 0 Then
            labNoData.Visible = True
            labNoData.Text = "You have your entire budget remaining"
        End If
    End Sub

   
End Class

