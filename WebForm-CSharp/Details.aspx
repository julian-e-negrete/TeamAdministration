<%@ Page Title="Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" EnableEventValidation="false" Inherits="WebForm_CSharp.Details" %>
    
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <div class="table-responsive">
            <asp:GridView ID="DetailsGridView" CssClass="table table-striped table-bordered table-hover table-usuarios" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" PageSize="50" ShowHeaderWhenEmpty="True" EmptyDataText="El usuario no tiene tareas" >
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" SortExpression="Created_Date" />
                    <asp:BoundField DataField="Finished_Date" HeaderText="Finished_Date" SortExpression="Finished_Date" />
                </Columns>
            </asp:GridView>
        </div>
</asp:Content>
