<%@ Page Title="Log" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Search.aspx.vb" Inherits="About" %>


    <%@ Register TagPrefix="asp" Assembly="ExportToExcel" Namespace="KrishLabs.Web.Controls" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Spend
    </h2>
<p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
            style="text-align: center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="WriteID" HeaderText="WriteID" 
                    SortExpression="WriteID" />
                <asp:BoundField DataField="AgentName" HeaderText="AgentName" 
                    SortExpression="AgentName" />
                <asp:BoundField DataField="ReadID" HeaderText="ReadID" 
                    SortExpression="ReadID" />
                <asp:BoundField DataField="Budget" HeaderText="Budget" 
                    SortExpression="Budget" />
                <asp:BoundField DataField="Difference" HeaderText="Difference" ReadOnly="True" 
                    SortExpression="Difference" />
                <asp:BoundField DataField="Remaining" HeaderText="Remaining" 
                    SortExpression="Remaining" ReadOnly="True" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString7 %>" 
            
            SelectCommand="SELECT WriteID, AgentName, ReadID, Budget, SUM(Difference) AS Difference, Budget - SUM(Difference) AS Remaining, EOW_Date FROM ExpenseImageAudit GROUP BY EOW_Date, WriteID, AgentName, ReadID, Budget">
        </asp:SqlDataSource>
    </p>
<p>
        &nbsp;</p>
    <p>
    
       
        &nbsp;</p>
    <p>
    
       
        &nbsp;</p>
    <p>
    
       <asp:ExportToExcel runat="server" ID="ExportToExcel1" GridViewID="GridView1" ExportFileName="ExportFileName.xls" Text="Export to Excel" IncludeTimeStamp="true" />
        &nbsp;</p>
</asp:Content>