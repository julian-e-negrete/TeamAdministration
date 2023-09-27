<%@ Page Title="Team" Language="C#" MasterPageFile="~/Site.Master"  EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Team.aspx.cs" Inherits="WebForm_CSharp.Team" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">

        <div class="panel panel-primary" style="background-color: #eee;">
            <div class="panel" style="background-color: #0f060631; width: 85%;">
                <div style=" width: 90%;">
                    <h2 id="title"><%: Title %></h2>
                </div>
                <div>
                    <asp:Button ID="btnCreateTeam" runat="server" Text="+ Create" OnClick="btnCreate_Click" style="background-color: transparent; color:black;" CssClass="btn-primary btn-sm" />    
                </div>
            </div>
            <div class="layout" style="background-color: transparent;">
                <asp:Button ID="btnSearchusers" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn-primary btn-sm" />        
            </div>
        </div>
   
        
        <!--<asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" /> -->
        

            <div id="tab1Content" class="table-responsive tab-content active-tab" runat="server">

                
                <asp:GridView ID="dataTableGridView" class="tab-content active-tab" CssClass="table table-striped table-bordered table-hover table-usuarios" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" PageSize="50" ShowHeaderWhenEmpty="True" EmptyDataText="El usuario no tiene a nadie asignado a su equipo"  >
                    <Columns>

                        <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" /> 
                        
                        
                        <asp:TemplateField HeaderText="View">
                            <ItemTemplate>
                                <asp:Button ID="viewButton" runat="server" Text="View" CommandName="ViewTask" 
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                PostBackUrl='<%# "DetailsUser.aspx?ID=" + DataBinder.Eval(Container.DataItem, "ID") %>'  OnClick="viewButton_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button ID="DeleteButton" runat="server" Text="Delete" CommandName="DeleteUser" 
                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'  OnClick="DeleteButton_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Asing">
                        <ItemTemplate>
                            <asp:Button ID="AsignBut" runat="server" Text="Asign Task" CommandName="AsignTask" 
                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'  OnClick="AsignButton_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                
                </asp:GridView>
            </div>
    
</asp:Content>
