<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="admin-homepage.aspx.cs" Inherits="WebApplication1.Admin.admin_homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-grid justify-content-center align-items-center p-3" style="width: 100%; min-height: 100vh;">
        <div style="width: 400px; max-width: 100%; text-align: center;">
            <a href="/Admin/DoctorManage.aspx" class="btn btn-primary btn-lg mb-3 w-100 fs-3 p-3">Doctors Manage</a>
            <a href="/Admin/patientManage.aspx" class="btn btn-primary btn-lg mb-3 w-100 fs-3 p-3">Patients Manage</a>
            <a href="/Admin/AppointmentManage.aspx" class="btn btn-primary btn-lg mb-3 w-100 fs-3 p-3">Appointments Manage</a>
            <br />
            <asp:Button ID="Button1" class="btn btn-danger btn-lg w-100 fs-3 p-3" runat="server" Text="Logout" OnClick="Button1_Click" />
        </div>
    </div>
</asp:Content>
