Imports System
Imports System.Linq
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As ASPxGridViewTableDataCellEventArgs)
        Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)
        e.Cell.Attributes("onclick") = String.Format("OnCellClick({0}, {1}, {2}, event);", grid.ClientInstanceName, e.VisibleIndex, e.DataColumn.VisibleIndex)
    End Sub
End Class