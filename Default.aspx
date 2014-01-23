<%@ Page Title="Expense" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="True">
    </asp:ScriptManager>
    <script type="text/javascript">

        function CheckWriteID() {
            var Budget = document.getElementById('TextBox7');



            if (Budget > Comp) {

                alert("Please check your remaining amount first.");

                return (false);
            }
        
            return (true);

        }

    </script>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString11 %>" OnSelected="ObjectDataSourceStatusEventHandler"
        SelectCommand="SELECT WriteID, Budget - Difference AS Remaining FROM ExpenseImageAudit WHERE (WriteID = @WriteID) AND (DATEPART(week, EOW_Date) &gt; DATEPART(week, GETDATE()))">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox7" Name="WriteID" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <br />
            <div>
                Enter your WriteID to determine the Amount you have remaining</div>
            <br />
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <asp:Button ID="Button7" runat="server" Text="How much do I have?" CausesValidation="false" />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5"
                CellPadding="4" ForeColor="#333333" GridLines="None" ViewStateMode="Enabled">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="WriteID" HeaderText="WriteID" SortExpression="WriteID" />
                    <asp:BoundField DataField="Remaining" HeaderText="Remaining $" ReadOnly="True" SortExpression="Remaining" />
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox7"
                Display="Dynamic" ErrorMessage="Please check your remaining amount."></asp:RequiredFieldValidator>
            <asp:Label ID="labNoData" runat="server" Visible="False"></asp:Label>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Button7" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <br />
    Enter the Expense data and click Insert:<p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4"
            DataKeyNames="ID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None"
            Height="50px" Width="885px" DefaultMode="Insert" OnItemInserting="CustomerDetail_ItemInserting">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="ID" />
                <asp:TemplateField HeaderText="WriteID" SortExpression="WriteID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("WriteID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("WriteID") %>'></asp:TextBox>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Enter Correct Write ID"
                            OnServerValidate="CustomValidator1_ServerValidate1" Text='<%# Eval("WriteID") %>'
                            ControlToValidate="TextBox1" Display="Dynamic"></asp:CustomValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                            Display="Dynamic" ErrorMessage="Enter Write ID"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("WriteID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CaseName" SortExpression="CaseName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CaseName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CaseName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                            Display="Dynamic" ErrorMessage="Enter Case Name"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CaseName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Issue" SortExpression="Issue">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Issue") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Issue") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox9"
                            Display="Dynamic" ErrorMessage="Enter Issue"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Issue") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reason" SortExpression="Reason">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Reason") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("Reason") %>'>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Bad Ops</asp:ListItem>
                            <asp:ListItem>Multiple Issues</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                            <asp:ListItem>Personnel</asp:ListItem>
                            <asp:ListItem>Process</asp:ListItem>
                            <asp:ListItem>Training</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1"
                            Display="Dynamic" ErrorMessage="Select Reason" Text='<%# Eval("Reason") %>'></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Reason") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comment" SortExpression="Comment">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Height="145px" Text='<%# Bind("Comment") %>'
                            TextMode="MultiLine" Width="306px" MaxLength="500" Rows="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox5"
                            Display="Dynamic" ErrorMessage="Must enter Comments"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Matrix" SortExpression="Matrix">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Matrix") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Matrix") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6"
                            Display="Dynamic" ErrorMessage="Enter Matrix Required"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox6"
                            Display="Dynamic" ErrorMessage="Greater than 0" MaximumValue="1000000000000000000000000000000000000000"
                            MinimumValue="0" SetFocusOnError="True" Type="Double"></asp:RangeValidator>
                        <asp:PopupControlExtender ID="DetailsView1_PopupControlExtender" runat="server" DynamicServicePath=""
                            Enabled="True" ExtenderControlID="" TargetControlID="TextBox6" PopupControlID="Panel1"
                            Position="Right">
                        </asp:PopupControlExtender>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" 
                            ControlToValidate="TextBox6" Display="Dynamic" 
                            ErrorMessage="Matrix amount should be greater than 0" MaximumValue="100000" 
                            MinimumValue="1" Type="Double"></asp:RangeValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Matrix") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Compensation" SortExpression="Compensation">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Compensation") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Compensation") %>'></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox6"
                            ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Compensation amount to be greater than Matrix Amount"
                            Operator="GreaterThan" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox7"
                            Display="Dynamic" ErrorMessage="Enter Compensation Amount"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Compensation") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString4 %>" DeleteCommand="DELETE FROM [Expense] WHERE [ID] = @original_ID AND (([WriteID] = @original_WriteID) OR ([WriteID] IS NULL AND @original_WriteID IS NULL)) AND (([CaseName] = @original_CaseName) OR ([CaseName] IS NULL AND @original_CaseName IS NULL)) AND (([Reason] = @original_Reason) OR ([Reason] IS NULL AND @original_Reason IS NULL)) AND (([Comment] = @original_Comment) OR ([Comment] IS NULL AND @original_Comment IS NULL)) AND (([Matrix] = @original_Matrix) OR ([Matrix] IS NULL AND @original_Matrix IS NULL)) AND (([Compensation] = @original_Compensation) OR ([Compensation] IS NULL AND @original_Compensation IS NULL)) AND (([Difference] = @original_Difference) OR ([Difference] IS NULL AND @original_Difference IS NULL)) AND (([TimeStamp] = @original_TimeStamp) OR ([TimeStamp] IS NULL AND @original_TimeStamp IS NULL)) AND (([EOW_Date] = @original_EOW_Date) OR ([EOW_Date] IS NULL AND @original_EOW_Date IS NULL))"
            InsertCommand="INSERT INTO [Expense] ([WriteID], [CaseName], [Issue],[Reason], [Comment], [Matrix], [Compensation]) VALUES (@WriteID, @CaseName, @Issue, @Reason, @Comment, @Matrix, @Compensation)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Expense]"
            UpdateCommand="UPDATE [Expense] SET [WriteID] = @WriteID, [CaseName] = @CaseName,[Issue] = @Issue, [Reason] = @Reason, [Comment] = @Comment, [Matrix] = @Matrix, [Compensation] = @Compensation, [Difference] = @Difference, [TimeStamp] = @TimeStamp, [EOW_Date] = @EOW_Date WHERE [ID] = @original_ID AND (([WriteID] = @original_WriteID) OR ([WriteID] IS NULL AND @original_WriteID IS NULL)) AND (([CaseName] = @original_CaseName) OR ([CaseName] IS NULL AND @original_CaseName IS NULL)) AND (([Reason] = @original_Reason) OR ([Reason] IS NULL AND @original_Reason IS NULL)) AND (([Comment] = @original_Comment) OR ([Comment] IS NULL AND @original_Comment IS NULL)) AND (([Matrix] = @original_Matrix) OR ([Matrix] IS NULL AND @original_Matrix IS NULL)) AND (([Compensation] = @original_Compensation) OR ([Compensation] IS NULL AND @original_Compensation IS NULL)) AND (([Difference] = @original_Difference) OR ([Difference] IS NULL AND @original_Difference IS NULL)) AND (([TimeStamp] = @original_TimeStamp) OR ([TimeStamp] IS NULL AND @original_TimeStamp IS NULL)) AND (([EOW_Date] = @original_EOW_Date) OR ([EOW_Date] IS NULL AND @original_EOW_Date IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_WriteID" Type="String" />
                <asp:Parameter Name="original_CaseName" Type="String" />
                <asp:Parameter Name="original_Issue" Type="String" />
                <asp:Parameter Name="original_Reason" Type="String" />
                <asp:Parameter Name="original_Comment" Type="String" />
                <asp:Parameter Name="original_Matrix" Type="Decimal" />
                <asp:Parameter Name="original_Compensation" Type="Decimal" />
                <asp:Parameter Name="original_Difference" Type="Decimal" />
                <asp:Parameter Name="original_TimeStamp" Type="DateTime" />
                <asp:Parameter Name="original_EOW_Date" Type="DateTime" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="WriteID" Type="String" />
                <asp:Parameter Name="CaseName" Type="String" />
                <asp:Parameter Name="Issue" Type="String" />
                <asp:Parameter Name="Reason" Type="String" />
                <asp:Parameter Name="Comment" Type="String" />
                <asp:Parameter Name="Matrix" Type="Decimal" />
                <asp:Parameter Name="Compensation" Type="Decimal" />
                <asp:Parameter Name="Difference" Type="Decimal" />
                <asp:Parameter Name="TimeStamp" Type="DateTime" />
                <asp:Parameter Name="EOW_Date" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="WriteID" Type="String" />
                <asp:Parameter Name="CaseName" Type="String" />
                <asp:Parameter Name="Issue" Type="String" />
                <asp:Parameter Name="Reason" Type="String" />
                <asp:Parameter Name="Comment" Type="String" />
                <asp:Parameter Name="Matrix" Type="Decimal" />
                <asp:Parameter Name="Compensation" Type="Decimal" />
                <asp:Parameter Name="Difference" Type="Decimal" />
                <asp:Parameter Name="TimeStamp" Type="DateTime" />
                <asp:Parameter Name="EOW_Date" Type="DateTime" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_WriteID" Type="String" />
                <asp:Parameter Name="original_CaseName" Type="String" />
                <asp:Parameter Name="original_Issue" Type="String" />
                <asp:Parameter Name="original_Reason" Type="String" />
                <asp:Parameter Name="original_Comment" Type="String" />
                <asp:Parameter Name="original_Matrix" Type="Decimal" />
                <asp:Parameter Name="original_Compensation" Type="Decimal" />
                <asp:Parameter Name="original_Difference" Type="Decimal" />
                <asp:Parameter Name="original_TimeStamp" Type="DateTime" />
                <asp:Parameter Name="original_EOW_Date" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Panel ID="Panel1" runat="server" CssClass="popupControl">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Label runat="server">If Matrix amount is 0, check with Supervisor</asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </p>
    <p>
        <asp:Label ID="Label7" runat="server" ViewStateMode="Disabled"></asp:Label>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString4 %>"
            SelectCommand="SELECT DISTINCT [WriteID] FROM [Agent]"></asp:SqlDataSource>
    </p>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString9 %>"
        SelectCommand="SELECT WriteID, Budget - Difference AS Remaining FROM ExpenseImageAudit">
    </asp:SqlDataSource>
    &nbsp;
</asp:Content>
