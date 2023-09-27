<%@ Page Title="User Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetailsUser.aspx.cs" Inherits="WebForm_CSharp.DetailsUser" %>
    
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <div class="table-responsive">
            <asp:GridView ID="DetailsGridView" CssClass="table table-striped table-bordered table-hover table-usuarios" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" PageSize="50" ShowHeaderWhenEmpty="True" EmptyDataText="El usuario no tiene tareas" >
                <Columns>
                    <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                </Columns>
            </asp:GridView>
        </div>
</asp:Content>
