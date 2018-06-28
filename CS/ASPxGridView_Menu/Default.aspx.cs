using System;
using System.Linq;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e) {
        ASPxGridView grid = sender as ASPxGridView;
        e.Cell.Attributes["onclick"] = string.Format("OnCellClick({0}, {1}, {2}, event);",
            grid.ClientInstanceName, e.VisibleIndex, e.DataColumn.VisibleIndex);
    }
}