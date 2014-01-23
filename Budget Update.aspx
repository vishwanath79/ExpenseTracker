<%@ Page Title="Expense" Language="VB" MasterPageFile="~/Dashboard.Master" AutoEventWireup="false"
    CodeFile="Budget Update.aspx.vb" Inherits="_Default" MaintainScrollPositionOnPostback="true" %>

      

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
 

</asp:Content>



 





<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">




    <p>
        To 
        add a new Agent, enter Details and click Insert.
        <br />
        * Make sure Agent Team names are spelled correctly as per existing entries.</p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2" 
            ForeColor="#333333" GridLines="None" Height="50px"  
            Width="125px" DefaultMode="Insert">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="AgentName" HeaderText="AgentName" 
                    SortExpression="AgentName" />
                <asp:BoundField DataField="ReadID" HeaderText="ReadID" 
                    SortExpression="ReadID" />
                <asp:BoundField DataField="WriteID" HeaderText="WriteID" 
                    SortExpression="WriteID" />
                <asp:BoundField DataField="Budget" HeaderText="Budget" 
                    SortExpression="Budget" />
                <asp:BoundField DataField="AgentTeam" HeaderText="AgentTeam" 
                    SortExpression="AgentTeam" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
    </p>
    <p>
        To enter the Budget data,&nbsp; click Edit and Update:</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
            DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" 
            PageSize="100">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                <asp:TemplateField HeaderText="AgentName" SortExpression="AgentName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AgentName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("AgentName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ReadID" SortExpression="ReadID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ReadID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ReadID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="WriteID" SortExpression="WriteID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("WriteID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("WriteID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Budget" SortExpression="Budget">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Budget") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Budget") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="AgentTeam" SortExpression="AgentTeam">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("AgentTeam") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("AgentTeam") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </p>
    <p>
        &nbsp;</p>

    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString4 %>" 
            DeleteCommand="DELETE FROM [Agent] WHERE [ID] = @original_ID AND (([AgentName] = @original_AgentName) OR ([AgentName] IS NULL AND @original_AgentName IS NULL)) AND (([ReadID] = @original_ReadID) OR ([ReadID] IS NULL AND @original_ReadID IS NULL)) AND (([WriteID] = @original_WriteID) OR ([WriteID] IS NULL AND @original_WriteID IS NULL)) AND (([Budget] = @original_Budget) OR ([Budget] IS NULL AND @original_Budget IS NULL)) AND (([AgentTeam] = @original_AgentTeam) OR ([AgentTeam] IS NULL AND @original_AgentTeam IS NULL))" 
            InsertCommand="INSERT INTO [Agent] ([AgentName], [ReadID], [WriteID], [Budget], [AgentTeam]) VALUES (@AgentName, @ReadID, @WriteID, @Budget, @AgentTeam)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Agent] ORDER BY [AgentTeam], [AgentName]" 
            
            
            
            UpdateCommand="UPDATE [Agent] SET [AgentName] = @AgentName, [ReadID] = @ReadID, [WriteID] = @WriteID, [Budget] = @Budget, [AgentTeam] = @AgentTeam WHERE [ID] = @original_ID AND (([AgentName] = @original_AgentName) OR ([AgentName] IS NULL AND @original_AgentName IS NULL)) AND (([ReadID] = @original_ReadID) OR ([ReadID] IS NULL AND @original_ReadID IS NULL)) AND (([WriteID] = @original_WriteID) OR ([WriteID] IS NULL AND @original_WriteID IS NULL)) AND (([Budget] = @original_Budget) OR ([Budget] IS NULL AND @original_Budget IS NULL)) AND (([AgentTeam] = @original_AgentTeam) OR ([AgentTeam] IS NULL AND @original_AgentTeam IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_AgentName" Type="String" />
                <asp:Parameter Name="original_ReadID" Type="String" />
                <asp:Parameter Name="original_WriteID" Type="String" />
                <asp:Parameter Name="original_Budget" Type="Int32" />
                <asp:Parameter Name="original_AgentTeam" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AgentName" Type="String" />
                <asp:Parameter Name="ReadID" Type="String" />
                <asp:Parameter Name="WriteID" Type="String" />
                <asp:Parameter Name="Budget" Type="Int32" />
                <asp:Parameter Name="AgentTeam" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AgentName" Type="String" />
                <asp:Parameter Name="ReadID" Type="String" />
                <asp:Parameter Name="WriteID" Type="String" />
                <asp:Parameter Name="Budget" Type="Int32" />
                <asp:Parameter Name="AgentTeam" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_AgentName" Type="String" />
                <asp:Parameter Name="original_ReadID" Type="String" />
                <asp:Parameter Name="original_WriteID" Type="String" />
                <asp:Parameter Name="original_Budget" Type="Int32" />
                <asp:Parameter Name="original_AgentTeam" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>" 
            DeleteCommand="DELETE FROM [Expense] WHERE [ID] = @original_ID AND (([WriteID] = @original_WriteID) OR ([WriteID] IS NULL AND @original_WriteID IS NULL)) AND (([CaseName] = @original_CaseName) OR ([CaseName] IS NULL AND @original_CaseName IS NULL)) AND (([Reason] = @original_Reason) OR ([Reason] IS NULL AND @original_Reason IS NULL)) AND (([Approval] = @original_Approval) OR ([Approval] IS NULL AND @original_Approval IS NULL)) AND (([Matrix] = @original_Matrix) OR ([Matrix] IS NULL AND @original_Matrix IS NULL)) AND (([Compensation] = @original_Compensation) OR ([Compensation] IS NULL AND @original_Compensation IS NULL)) AND (([Difference] = @original_Difference) OR ([Difference] IS NULL AND @original_Difference IS NULL)) " 
            InsertCommand="INSERT INTO [Expense] ([WriteID], [CaseName], [Reason], [Approval], [Matrix], [Compensation]) VALUES (@WriteID, @CaseName, @Reason, @Approval, @Matrix, @Compensation)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT ID, WriteID, CaseName, Reason, Approval, Matrix, Compensation, Difference, TimeStamp, EOW_Date FROM Expense" 
            
            
            UpdateCommand="UPDATE [Expense] SET [WriteID] = @WriteID, [CaseName] = @CaseName, [Reason] = @Reason, [Approval] = @Approval, [Matrix] = @Matrix, [Compensation] = @Compensation, [Difference] = @Difference WHERE [ID] = @original_ID AND (([WriteID] = @original_WriteID) OR ([WriteID] IS NULL AND @original_WriteID IS NULL)) AND (([CaseName] = @original_CaseName) OR ([CaseName] IS NULL AND @original_CaseName IS NULL)) AND (([Reason] = @original_Reason) OR ([Reason] IS NULL AND @original_Reason IS NULL)) AND (([Approval] = @original_Approval) OR ([Approval] IS NULL AND @original_Approval IS NULL)) AND (([Matrix] = @original_Matrix) OR ([Matrix] IS NULL AND @original_Matrix IS NULL)) AND (([Compensation] = @original_Compensation) OR ([Compensation] IS NULL AND @original_Compensation IS NULL)) AND (([Difference] = @original_Difference) OR ([Difference] IS NULL AND @original_Difference IS NULL)) ">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_WriteID" Type="String" />
                <asp:Parameter Name="original_CaseName" Type="String" />
                <asp:Parameter Name="original_Reason" Type="String" />
                <asp:Parameter Name="original_Approval" Type="String" />
                <asp:Parameter Name="original_Matrix" Type="Int32" />
                <asp:Parameter Name="original_Compensation" Type="Int32" />
                <asp:Parameter Name="original_Difference" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="WriteID" Type="String" />
                <asp:Parameter Name="CaseName" Type="String" />
                <asp:Parameter Name="Reason" Type="String" />
                <asp:Parameter Name="Approval" Type="String" />
                <asp:Parameter Name="Matrix" Type="Int32" />
                <asp:Parameter Name="Compensation" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="WriteID" Type="String" />
                <asp:Parameter Name="CaseName" Type="String" />
                <asp:Parameter Name="Reason" Type="String" />
                <asp:Parameter Name="Approval" Type="String" />
                <asp:Parameter Name="Matrix" Type="Int32" />
                <asp:Parameter Name="Compensation" Type="Int32" />
                <asp:Parameter Name="Difference" Type="Int32" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_WriteID" Type="String" />
                <asp:Parameter Name="original_CaseName" Type="String" />
                <asp:Parameter Name="original_Reason" Type="String" />
                <asp:Parameter Name="original_Approval" Type="String" />
                <asp:Parameter Name="original_Matrix" Type="Int32" />
                <asp:Parameter Name="original_Compensation" Type="Int32" />
                <asp:Parameter Name="original_Difference" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label7" runat="server" ViewStateMode="Disabled"></asp:Label>
</p>
    <p>

        &nbsp;<p>
    
    
    </p>
    
       
        </p>
</asp:Content>