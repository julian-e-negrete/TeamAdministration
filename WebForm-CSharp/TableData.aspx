<%@ Page Title="Tareas" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="TableData.aspx.cs" Inherits="WebForm_CSharp.TableData" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
    <!-- <h2 id="title"><%: Title %>.</h2> -->

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
    
        <div class="tabs">
            <ul>
                <asp:Button ID="btnTab1" runat="server" CssClass="tab-button " Text="Activas" OnClick="btnTab1_Click" />
                <asp:Button ID="btnTab2" runat="server" CssClass="tab-button" Text="Completadas" OnClick="btnTab2_Click" />
                <!-- <li onclick="showTab(0)" class="active" >Tab 1</li>
                <li onclick="showTab(1)" style="cursor: pointer;">Tab 2</li> -->
                <!-- Add more tabs as needed -->
                <asp:Button ID="btnCreTask" runat="server" Text="Create" OnClick="CreTask_Click" CssClass="btn-primary btn-sm" />
            </ul>
            

        </div>

        <div id="tab1Content" class="table-responsive tab-content active-tab" runat="server">
            <asp:GridView ID="dataTableGridView" class="tab-content active-tab" CssClass="table table-striped table-bordered table-hover table-usuarios" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" PageSize="50" ShowHeaderWhenEmpty="True" EmptyDataText="El usuario no tiene tareas" OnSorting="dataTableGridView_Sorting" >
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" SortExpression="Created_Date" />
                    <asp:BoundField DataField="Finished_Date" HeaderText="Finished_Date" SortExpression="Finished_Date" />
                    <asp:TemplateField HeaderText="View">
                        <ItemTemplate>
                            <asp:Button ID="viewButton" runat="server" Text="View" CommandName="ViewTask" 
                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                            PostBackUrl='<%# "Details.aspx?ID=" + DataBinder.Eval(Container.DataItem, "ID") %>'  OnClick="viewButton_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:Button ID="editButton" runat="server" Text="Edit" CommandName="EditTask" 
                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                            PostBackUrl='<%# "Edit.aspx?ID=" + DataBinder.Eval(Container.DataItem, "ID") %>'  OnClick="EditButton_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Complete">
                        <ItemTemplate>
                            <asp:Button ID="CompleteButton" runat="server" Text="Complete" CommandName="CompleteTask" 
                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'  OnClick="CompleteButton_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>



        <div id="tab2Content"  class="table-responsive tab-content active-tab" runat="server">
            <asp:GridView ID="tab2" class="tab-content active-tab" CssClass="table table-striped table-bordered table-hover table-usuarios" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" PageSize="50" ShowHeaderWhenEmpty="True" EmptyDataText="El usuario no tiene tareas" >
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Created_Date" HeaderText="Created_Date" SortExpression="Created_Date" />
                    <asp:BoundField DataField="Finished_Date" HeaderText="Finished_Date" SortExpression="Finished_Date" />
                    <asp:TemplateField HeaderText="View">
                        <ItemTemplate>
                            <asp:Button ID="viewButton" runat="server" Text="View" CommandName="ViewTask" 
                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                            PostBackUrl='<%# "Details.aspx?ID=" + DataBinder.Eval(Container.DataItem, "ID") %>'  OnClick="viewButton_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button ID="DeleteButton" runat="server" Text="Delete" CommandName="DeleteTask" 
                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'  OnClick="DeleteButton_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </main>
</asp:Content>
