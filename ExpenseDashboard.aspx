<%@ Page Title="Log" Language="VB" MasterPageFile="~/Dashboard.Master" AutoEventWireup="false"
    CodeFile="ExpenseDashboard.aspx.vb" Inherits="About" %>


    <%@ Register TagPrefix="asp" Assembly="ExportToExcel" Namespace="KrishLabs.Web.Controls" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Team
        Spend
    </h2>
<p>
You can sort by clicking the header of any of the columns.
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="SqlDataSource12" ForeColor="#333333" GridLines="None" 
            style="text-align: center" PageSize="500" Width="712px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="AgentTeam" HeaderText="AgentTeam" 
                    SortExpression="AgentTeam" />
                <asp:BoundField DataField="AgentName" HeaderText="AgentName" 
                    SortExpression="AgentName" />
                <asp:BoundField DataField="Amount OverComped" HeaderText="Amount OverComped" 
                    SortExpression="Amount OverComped" ReadOnly="True" />
                <asp:BoundField DataField="EOW_Date" HeaderText="EOW_Date" 
                    SortExpression="EOW_Date" />
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
        <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString12 %>" 
            
            SelectCommand="SELECT Agent.AgentTeam, Agent.AgentName, MAX(ExpenseImageWarehouse.Difference) AS 'Amount OverComped', ExpenseImageWarehouse.EOW_Date FROM Agent INNER JOIN ExpenseImageWarehouse ON Agent.AgentName = ExpenseImageWarehouse.AgentName GROUP BY ExpenseImageWarehouse.EOW_Date, Agent.AgentTeam, Agent.AgentName ORDER BY ExpenseImageWarehouse.EOW_Date">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString7 %>" 
            
            
            
            SelectCommand="SELECT WriteID, ReadID, Budget, Budget -SUM(Difference) AS Remaining, EOW_Date FROM ExpenseImageAudit GROUP BY EOW_Date, WriteID, ReadID, Budget">
        </asp:SqlDataSource>
    </p>
<p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString8 %>" SelectCommand="SELECT WriteID, AgentName, ReadID, Budget, SUM(Difference) AS Difference, EOW_Date FROM ExpenseImageAudit WHERE (EOW_Date = DATEADD(day, - 1, DATEADD(week, DATEDIFF(week, 0, GETDATE()) + 1, 0))) GROUP BY EOW_Date, WriteID, AgentName, ReadID, Budget
"></asp:SqlDataSource>
</p>
    <p>
    
       
        &nbsp;</p>
    <p>
    
       
        &nbsp;</p>
    <p>
    
       <asp:ExportToExcel runat="server" ID="ExportToExcel1" GridViewID="GridView1" ExportFileName="ExportFileName.xls" Text="Export to Excel" IncludeTimeStamp="true" />
        &nbsp;</p>
</asp:Content>