<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebForm_CSharp.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        
        <!-- <h3>Your contact page.</h3> -->
        <address>
            One Microsoft Way<br />
            Redmond, WA 98052-6399<br />
            <abbr title="Phone">P:</abbr>
            425.555.0100
        </address>

        <address>
            <strong>Support:</strong>   <a href="mailto:julian.e.negrete@gmail.com">julian.e.negrete@gmail.com</a><br />
            <strong>Marketing:</strong> <a href="mailto:julian.e.negrete@gmail.com">julian.e.negrete@gmail.com</a>
        </address>
    </main>
</asp:Content>
