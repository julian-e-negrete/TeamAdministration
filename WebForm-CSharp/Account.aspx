<%@ Page Title="Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="WebForm_CSharp.Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #MainContent_txtUsername{
        background-color: #fff; /* Background color */
        color: #000000; /* Text color */
        }

        #MainContent_txtUsername:hover {
            background-color: #fff; /* Background color */
        }

        #MainContent_txtEmail{
            background-color: #fff; /* Background color */
            color: #000000; /* Text color */
        }

        #MainContent_txtEmail:hover {
            background-color: #fff; /* Background color */
        }
        #MainContent_txtpass{
            background-color: #fff; /* Background color */
            color: #000000; /* Text color */
        }

        #MainContent_txtpass:hover {
            background-color: #fff; /* Background color */
        }
    </style>

    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <div class="panel-body">
            <div class="form-horizontal">

                <div class="form-group">
                    <label for="txtUsername" class="col-md-2 control-label">Username:</label>
                    <div class="col-md-4">
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Class="form-control" placeholder="Ingrese el usuario" ReadOnly ="true"  TabIndex="4"></asp:TextBox> 
                    </div>
                </div>

                <div class="form-group">
                    <label for="txtEmail" class="col-md-2 control-label">Email:</label>
                    <div class="col-md-4">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Ingrese el mail del usuario" ReadOnly ="true"  TabIndex="4"></asp:TextBox> 
                    </div>
                </div>

                <div class="form-group">
                    <label for="txtpass" class="col-md-2 control-label">password:</label>
                    <div class="col-md-4">
                            <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" TabIndex="4" TextMode="Password"  ></asp:TextBox>  
                    </div>
                </div>
                
            </div>
            <asp:Button ID="EditButton" runat="server" Text="Edit" OnClick="EditButton_Click" /> 
        </div>
    </main>


</asp:Content>
