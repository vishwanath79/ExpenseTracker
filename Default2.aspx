<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataKeyNames="ID" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                <asp:TemplateField HeaderText="AgentName" SortExpression="AgentName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AgentName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Test</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("AgentName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ReadID" HeaderText="ReadID" 
                    SortExpression="ReadID" />
                <asp:BoundField DataField="WriteID" HeaderText="WriteID" 
                    SortExpression="WriteID" />
                <asp:BoundField DataField="Budget" HeaderText="Budget" 
                    SortExpression="Budget" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString2 %>" 
            DeleteCommand="DELETE FROM [Agent] WHERE [ID] = @original_ID AND (([AgentName] = @original_AgentName) OR ([AgentName] IS NULL AND @original_AgentName IS NULL)) AND (([ReadID] = @original_ReadID) OR ([ReadID] IS NULL AND @original_ReadID IS NULL)) AND (([WriteID] = @original_WriteID) OR ([WriteID] IS NULL AND @original_WriteID IS NULL)) AND (([Budget] = @original_Budget) OR ([Budget] IS NULL AND @original_Budget IS NULL))" 
            InsertCommand="INSERT INTO [Agent] ([AgentName], [ReadID], [WriteID], [Budget]) VALUES (@AgentName, @ReadID, @WriteID, @Budget)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Agent]" 
            UpdateCommand="UPDATE [Agent] SET [AgentName] = @AgentName, [ReadID] = @ReadID, [WriteID] = @WriteID, [Budget] = @Budget WHERE [ID] = @original_ID AND (([AgentName] = @original_AgentName) OR ([AgentName] IS NULL AND @original_AgentName IS NULL)) AND (([ReadID] = @original_ReadID) OR ([ReadID] IS NULL AND @original_ReadID IS NULL)) AND (([WriteID] = @original_WriteID) OR ([WriteID] IS NULL AND @original_WriteID IS NULL)) AND (([Budget] = @original_Budget) OR ([Budget] IS NULL AND @original_Budget IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_AgentName" Type="String" />
                <asp:Parameter Name="original_ReadID" Type="String" />
                <asp:Parameter Name="original_WriteID" Type="String" />
                <asp:Parameter Name="original_Budget" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AgentName" Type="String" />
                <asp:Parameter Name="ReadID" Type="String" />
                <asp:Parameter Name="WriteID" Type="String" />
                <asp:Parameter Name="Budget" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AgentName" Type="String" />
                <asp:Parameter Name="ReadID" Type="String" />
                <asp:Parameter Name="WriteID" Type="String" />
                <asp:Parameter Name="Budget" Type="Int32" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_AgentName" Type="String" />
                <asp:Parameter Name="original_ReadID" Type="String" />
                <asp:Parameter Name="original_WriteID" Type="String" />
                <asp:Parameter Name="original_Budget" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
