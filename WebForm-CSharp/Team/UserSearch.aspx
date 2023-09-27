<%@ Page Title="User search" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" CodeBehind="UserSearch.aspx.cs" Inherits="WebForm_CSharp.UserSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

    <ContentTemplate>






<div class="pagebreak"> </div>


    
<div class="container-fluid">


  <div class="panel panel-primary" style="background-color: #eee;">
  <div class="panel-heading">
    <h2 class="panel-title">Filtros</h2>

  </div>
    
  <div class="panel-body">

    <div class="form-inline">
    <div id="GRILLA" />


        

    <div class="form-group">
      <label for="txtNro" ValidationGroup="FILTRO" class="info">Username: </label>
        <asp:TextBox CssClass="form-control" Width="100" ID="txtNro" runat="server"></asp:TextBox>

      <label for="txtCUIT" ValidationGroup="FILTRO" class="info">Email: </label>
        <asp:TextBox CssClass="form-control input-sm" Width="140" ID="txtCUIT" runat="server"></asp:TextBox>





      
      <asp:Button CssClass="btn-primary btn-sm" ID="cmdBuscar" runat="server" Text="Buscar" OnClick="btnSearch_Click" ValidationGroup="FILTRO"/>


    </div>
    
    </div>

   </div>
  
 </div>

</div>

  <div class="clearfix"></div>


<div class="container-fluid">
<div class="panel panel-primary" style="background-color: #eee;">
     <div class="panel-body">

     
     <div class="table-responsive">
        <asp:GridView ID="gvTramites" runat="server" CssClass="table table-striped table-bordered table-hover table-usuarios" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" PageSize="100" ShowHeaderWhenEmpty="True" EmptyDataText="No hay DDJJs en la base para los criterios proporcionados y CUIT." DataKeyNames="ID">
              <Columns>
                  
                  <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                  <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                  <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                  <asp:TemplateField HeaderText="Add">
                        <ItemTemplate>
                            <asp:Button ID="AddButton" runat="server" Text="Add" CommandName="AddUser" 
                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'  OnClick="AddButton_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
              </Columns>
              <HeaderStyle CssClass="info" />
              <PagerSettings Mode="NumericFirstLast"/>
              <PagerStyle CssClass="GridPager" />
         </asp:GridView>
      </div>

     <div class="help-block"></div>
     <div class="help-block"></div>

  </div>
</div>
</div>



<div class="clearfix"></div>


</ContentTemplate>

</asp:UpdatePanel>  
</asp:Content>
