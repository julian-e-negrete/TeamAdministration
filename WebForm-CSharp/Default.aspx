<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebForm_CSharp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #MainContent_TextBox1{
            background-color: #fff; /* Background color */
            color: #000000; /* Text color */
        }

        #MainContent_TextBox1:hover{
            background-color: #fff; /* Background color */
        }

        #MainContent_TextBox2{
            background-color: #fff; /* Background color */
            color: #000000; /* Text color */
        }

        #MainContent_TextBox2:hover{
            background-color: #fff; /* Background color */
        }
    </style>
    <main>
        <div class="form-group">              
                <table class="auto-style1">  
                    <tr>  
                        <td colspan="6" style="text-align: center; vertical-align: top">  
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Text="Log In "></asp:Label>  
                        </td>  
                    </tr>  
                    <tr>  
                        <td> </td>  
                        <td style="text-align: center">  
                            <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="Email :"></asp:Label>  
                        </td>  
                        <td style="text-align: center">  
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Class="form-control" Font-Size="X-Large"></asp:TextBox>  
                        </td>  
                    </tr>  
                    <tr>  
                        <td> </td>  
                        <td style="text-align: center">  
                            <asp:Label ID="Label3" runat="server" Font-Size="X-Large" Text="Password :"></asp:Label>  
                        </td>  
                        <td style="text-align: center">  
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Class="form-control" Font-Size="X-Large" TextMode="Password"></asp:TextBox>  
                        </td>  
                    </tr>  
                    <tr>  
                        <td style="text-align: center">  
                            <asp:Button ID="Button1" runat="server"  BorderStyle="None" Font-Size="X-Large" OnClick="Button1_Click" Text="Log In" />  
                        </td>  
                    </tr>  
                        <td style="text-align: center">  
                            <asp:Button ID="Button2" runat="server" BorderStyle="None" Font-Size="X-Large" OnClick="Button2_Click" Text="Sign Up" />  
                        </td>  
                    <tr>  
                        <td>  
                            <asp:Label ID="Label4" runat="server" Font-Size="X-Large"></asp:Label>  
                        </td>  
                        
                    </tr>  
                </table>  
              
            </div>  
    </main>

</asp:Content>
