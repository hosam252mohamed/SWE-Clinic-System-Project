<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/Site1.Master" AutoEventWireup="true" CodeBehind="pat-login.aspx.cs" Inherits="WebApplication1.Patient.pat_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="/styles/pat-log.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login_interface">
        <div id="image_login">
            <img src="/imgs/nurse.jpg">
        </div>

        <div class="login_form">
            <h2 id="title_login">Login</h2>

            <asp:TextBox ID="TextBox1" runat="server" class="label_login" placeholder="Username"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" class="label_login" placeholder="Password"></asp:TextBox>

            <div id="textcheck">
                <label for="check" title="save my data">Remember Me</label>
                <input type="checkbox" id="check" title="save my data check">

                <div class="forgot">
                    <a href="#" id="forgot_pass">Forgot Password ?</a>
                </div>
            </div>

            <asp:Button ID="Button1" runat="server" Onclick="Button1_Click" Text="Login" class="login-button"/>
            <div id="dont_have_account">
                <p>Don't have Account?</p>
                <div>|</div>
                <a href="/Patient/pat-reg.aspx">Signup</a>
            </div>

        </div>

    </div>
</asp:Content>
