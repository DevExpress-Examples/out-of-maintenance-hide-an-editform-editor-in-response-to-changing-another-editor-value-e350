<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Hide_EditFormEditors_OnClient"%>

<%-- BeginRegion Page setup --%>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.1"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>Hide an EditForm editor in response to changing another editor value</title>
	<script language="javascript" type="text/javascript">
		function OnSelectedIndexChanged(s, e) {
			var value = s.GetValue();
			if(value == 'Show')
				ASPxGridView1.GetEditor('Description').SetVisible(true);
			else
				ASPxGridView1.GetEditor('Description').SetVisible(false);
		}
	</script>
</head>

<body>
	<form id="form1" runat="server">

	<br/>
	Click the Edit button in a GridView row and then change the CategoryName's editor value
	<br/>
		<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT * FROM [Categories]"></asp:AccessDataSource>            
		<dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
			DataSourceID="AccessDataSource1" KeyFieldName="CategoryID" Width="779px">
			<Columns>
				<dxwgv:GridViewCommandColumn VisibleIndex="0">
					<EditButton Visible="True">
					</EditButton>
				</dxwgv:GridViewCommandColumn>
				<dxwgv:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="1">
					<EditFormSettings Visible="False" />
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataComboBoxColumn FieldName="CategoryName" VisibleIndex="2">
					<PropertiesComboBox ValueType="System.String">
						<ClientSideEvents SelectedIndexChanged="OnSelectedIndexChanged" />
						<Items>
							<dxe:ListEditItem Text="Show" Value="Show">
							</dxe:ListEditItem>
							<dxe:ListEditItem Text="Hide" Value="Hide">
							</dxe:ListEditItem>
						</Items>
					</PropertiesComboBox>
				</dxwgv:GridViewDataComboBoxColumn>
				<dxwgv:GridViewDataTextColumn FieldName="Description" VisibleIndex="3">
				</dxwgv:GridViewDataTextColumn>
			</Columns>
			<Settings ShowStatusBar="Visible" />
			<Templates>
				<StatusBar>
					<dxe:ASPxLabel ID="ASPxLabel1" runat="server" ForeColor="red" Font-Bold="true">
					</dxe:ASPxLabel>
				</StatusBar>
			</Templates>
		</dxwgv:ASPxGridView>
	</form>
</body>
</html>