<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/Site1.Master" AutoEventWireup="true" CodeBehind="doc-reg.aspx.cs" Inherits="WebApplication1.doc_reg1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Doctor Registration</title>
    <link rel="stylesheet" href="/styles/doc-reg.css">
    <style>
        .form {
            padding: 25px;
            width: 450px !important;
            max-width: 100% !important;
        }
        #form {
            margin-top:20px;
        }
        #form div {
            display: flex;
            flex-direction: column;
            gap:15px;
            margin-bottom: 10px
        }
        .submit {
            padding: 12px 0 !important;
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form">
      <h1>Doctor Registration</h1>  
      <div id="form">
          <div>
              <label for="docName">Name</label>
              <asp:TextBox ID="TextBox1" placeholder="Name" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic"></asp:RequiredFieldValidator>
          </div>
          <div>
              <label for="docUser">Username</label>
              <asp:TextBox ID="TextBox2" placeholder="Username" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic"></asp:RequiredFieldValidator>
          </div>
          <div>
              <label for="docPass">Password</label>
              <asp:TextBox ID="TextBox3" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic"></asp:RequiredFieldValidator>
          </div>
          <div>
              <label for="docPass">Specialist</label>
              <asp:DropDownList ID="DropDownList1" runat="server">
                  <asp:ListItem>Select Your Specialist</asp:ListItem>
                  <asp:ListItem>Anesthesiology</asp:ListItem>
                  <asp:ListItem>Medical genetics</asp:ListItem>
                  <asp:ListItem>Ophthalmology</asp:ListItem>
                  <asp:ListItem>Surgery</asp:ListItem>
                  <asp:ListItem>Pathology</asp:ListItem>
              </asp:DropDownList>
          </div>
          <asp:Button ID="Button1" class="submit" runat="server" Text="Sign Up" OnClick="Button1_Click" />
          <p>Already Have Account? <a href="/Doctor/doc-login.aspx">Sign In</a></p>
        </div>
    </div>
</asp:Content>
