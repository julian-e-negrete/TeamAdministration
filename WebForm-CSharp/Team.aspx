<%@ Page Title="Team" Language="C#" MasterPageFile="~/Site.Master"  EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Team.aspx.cs" Inherits="WebForm_CSharp.Team" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
    
        <style>
            /* Style for the tab buttons */
            .tab-button {
                display: inline-block;
                padding: 10px 20px;
                cursor: pointer;
                background-color: #f2f2f2;
                border: 1px solid #ccc;
                border-radius: 5px 5px 0 0;
            }
    
            /* Style for the active tab button */
            .tab-button.active {
                background-color: #fff;
                border-bottom-color: transparent;
            }
    
            /* Style for the tab content */
            .tab-content {
                display: none;
                padding: 20px;
                background-color: #fff;
                border: 1px solid #ccc;
                border-top: none;
                border-radius: 0 0 5px 5px;
            }
    
            /* Style for the active tab content */
            .tab-content.active-tab {
                display: block;
            }
    
        </style>
        
       
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
                    </Columns>
                
                </asp:GridView>
            </div>
    
</asp:Content>
