# How to show the ASPxGridView context menu by clicking the left mouse button

ASPxGridView doesn't provide any client-side methods to show the built-in row popup menu. However, it is possible to implement this functionality by adding a separate ASPxPopupMenu control with necessary items (New, Edit, Delete) and show it manually by invoking the client-side [ShowAtPos()](https://documentation.devexpress.com/AspNet/DevExpress.Web.Scripts.ASPxClientPopupMenu.ShowAtPos.method) method.

To show the menu on pressing the left mouse button, handle the server-side [HtmlDataCellPrepared](https://documentation.devexpress.com/AspNet/DevExpress.Web.ASPxGridView.HtmlDataCellPrepared.event) event and implement logic that subscribes to the HTML cell object's **onclick** event.

    protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e) {
    	ASPxGridView grid = sender as ASPxGridView;
    	e.Cell.Attributes["onclick"] = string.Format("OnCellClick({0}, {1}, {2}, event);",
        		grid.ClientInstanceName, e.VisibleIndex, e.DataColumn.VisibleIndex);
    }

In the example, the ASPxPopupMenu is shown when the Description column is clicked. When a menu item is clicked, a corresponding client-side method is invoked to perform an action. For example, when a user clicks the Edit item, the [ASPxClientGridView.StartEditRow](https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientGridView_StartEditRowtopic) method is invoked, and the edit form is displayed for the currently clicked row. 

To learn more about ASPxGridView client-side methods, follow the link: [ASPxClientGridView Members](https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientGridViewMembersTopicAll)

To provide icons similar to icons in grid's menu, you can use icons from the [Icon Collection](https://documentation.devexpress.com/AspNet/15861/Common-Concepts/Icon-Collection)
