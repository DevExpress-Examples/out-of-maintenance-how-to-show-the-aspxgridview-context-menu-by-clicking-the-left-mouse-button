<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>T200758</title>
    <script type="text/javascript">
        var rowVisibleIndex;
        function OnItemClick(s, e) {
            switch (e.item.name) {
                case "New": grid.AddNewRow(); break;
                case "Edit": grid.StartEditRow(rowVisibleIndex); break;
                case "Delete": grid.DeleteRow(rowVisibleIndex); break;
                case "Refresh": grid.Refresh(); break;
            }
            e.processOnServer = false;
        }
        function OnCellClick(s, row_index, col_index, event) {
            rowVisibleIndex = row_index;
            var fName = s.GetColumn(col_index).fieldName;
            if (fName == 'Description')
                menu.ShowAtPos(ASPxClientUtils.GetEventX(event), ASPxClientUtils.GetEventY(event));
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <dx:ASPxPopupMenu ID="ASPxMenu1" runat="server" ClientInstanceName="menu">
                <Items>
                    <dx:MenuItem Name="New" Text="New">
                        <Image IconID="actions_new_16x16"/>
                    </dx:MenuItem>
                    <dx:MenuItem Name="Edit" Text="Edit">
                        <Image IconID="edit_edit_16x16"/>
                    </dx:MenuItem>
                    <dx:MenuItem Name="Delete" Text="Delete">
                        <Image IconID="edit_delete_16x16"/>
                    </dx:MenuItem>
                    <dx:MenuItem BeginGroup="true" Name="Refresh" Text="Refresh">
                        <Image IconID="actions_refresh_16x16"/>
                    </dx:MenuItem>
                </Items>
                <ClientSideEvents ItemClick="OnItemClick" />
            </dx:ASPxPopupMenu>

            <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="grid"
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" 
                KeyFieldName="Id" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared">
                <Columns>
                    <dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="0">                        
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="1" ReadOnly="True" >
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Price" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
                TypeName="InvoiceDataContext" DataObjectTypeName="Invoice"
                SelectMethod="GetInvoices" InsertMethod="InsertInvoice"
                UpdateMethod="UpdateInvoice" DeleteMethod="DeleteInvoice">
            </asp:ObjectDataSource>
        </div>
    </form>
</body>
</html>