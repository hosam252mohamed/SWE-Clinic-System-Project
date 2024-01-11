<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/Site1.Master" AutoEventWireup="true" CodeBehind="pat-reg.aspx.cs" Inherits="WebApplication1.Patient.pat_reg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/styles/pat-reg.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="display: flex;">
        <div class="wrapper">
            <div>
                <h1>Registration</h1>
                <div class="input-box">
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Name"></asp:TextBox>                    <i class='bx bxs-user'></i>
                </div>
                <div class="input-box">
                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Username"></asp:TextBox>
                    <i class='bx bxs-envelope'></i>
                </div>
                <div class="input-box">
                    <asp:TextBox ID="TextBox3" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                    <i class='bx bxs-lock-alt'>
                    </i>
                </div>
                <div style="text-align: center;">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Sign Up" style="padding: 8px 15px; background-color: lightseagreen; color: white;border: none;cursor: pointer  ; border-radius: 6px;"/>
                </div>
                <div class="login-link">
                    <p>Have an account? <a href='patient-log.html'>Login</a></p>
                </div>
            </div>
        </div>
        <img src="/imgs/registernurse.jpg" alt="">
    </div>
</asp:Content>
