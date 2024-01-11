<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/Site1.Master" AutoEventWireup="true" CodeBehind="doc-login.aspx.cs" Inherits="WebApplication1.doc_login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Doctor Login</title>
    <link rel="stylesheet" href="/styles/doc-log.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center" style="padding: 25px; padding-bottom: 15px;">
      <h1>Doctor Login</h1>
      <div>
        <div class="txt_field">
          <asp:TextBox ID="TextBox1" runat="server" placeholder="Username"></asp:TextBox>
        </div>
        <div class="txt_field">
          <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
        </div>
        <div class="pass">
          <input id="Remember" type="checkbox">
          <label for="Remember">Remember Me</label>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
        <div class="signup_link">
          Not a member? <a href="/Doctor/doc-reg.aspx">Signup</a>
        </div>
      </div>
    </div>
</asp:Content>
