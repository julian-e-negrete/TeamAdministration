<%@ Page Title="Create Team" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateTeam.aspx.cs" Inherits="WebForm_CSharp.CreateTeam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <div class="panel-body">
            <div class="form-horizontal">

                <div class="form-group">
                    <label for="txtTitulo" class="col-md-2 control-label">Titulo:</label>
                    <div class="col-md-4">
                            <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control"  placeholder="Ingrese el titulo" autofocus ValidationGroup="FORM" TabIndex="4"></asp:TextBox> 
                    </div>
                </div>

                <div class="form-group">
                    <label for="txtDescripcion" class="col-md-2 control-label">Descripcion:</label>
                    <div class="col-md-4">
                            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" placeholder="Ingrese la descripcion" autofocus ValidationGroup="FORM" TabIndex="4"></asp:TextBox> 
                    </div>
                </div>
                <asp:Button ID="btnCreateTeam" runat="server" Text="Create" OnClick="CreTask_Click" />
            </div>
        </div>
    </main>
</asp:Content>