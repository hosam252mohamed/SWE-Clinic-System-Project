<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/Site2.Master" AutoEventWireup="true" CodeBehind="doc-homepage.aspx.cs" Inherits="WebApplication1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<title>Doctor Homepage</title>
    <link rel="stylesheet" href="/styles/doc-homepage.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <style>
        .appointments div {
            overflow: auto;
        }
        ::-webkit-scrollbar {
            display: none;
        }
        table {
            border-color: #ddd;
            border-spacing: 0 2px;
            border-collapse: separate !important;
            font-size: 17px;
        }
        td, th {
            padding: 10px;
            border: 2px solid #ddd;
            border-width: 2px 0px;
        }
        th {
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="content5">
        <div class="overlay5"></div>
        <p class="greeting5">Welcome, <span>Dr. </span>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
          </p>
        <div class="appointment-calender">
          <div class="box5 appointed">
            <div class="left5">
              <i class="fa-solid fa-calendar-check"></i>
            </div>
            <div class="right5">
              <h4>appointments</h4>
              <span class="number">
                  <asp:Label ID="Label2" runat="server" Text="09"></asp:Label></span>
            </div>
          </div>
          <div class="box5 cancelled">
            <div class="left5">
              <i class="fa-solid fa-rectangle-xmark"></i>
            </div>
            <div class="right5">
              <h4>Cancelled</h4>
              <span class="number">
                  <asp:Label ID="Label3" runat="server" Text="03"></asp:Label></span>
            </div>
          </div>
        </div>
        <div class="appointments">
          <h2>Appointments</h2>
            <asp:GridView ID="GridView1" class="table1 w-100" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="366px" DataKeyNames="AppointmentID" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="AppointmentID" HeaderText="AppointmentID" InsertVisible="False" ReadOnly="True" SortExpression="AppointmentID" />
                    <asp:BoundField DataField="AppointmentDate" HeaderText="AppointmentDate" SortExpression="AppointmentDate" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:BoundField DataField="PatientID" HeaderText="PatientID" SortExpression="PatientID" />
                </Columns>
                <EmptyDataTemplate>
                    <h4 class="text-center pt-2">No Appointments Found</h4>
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT * FROM [Appointment] WHERE ([DoctorID] = @DoctorID)">
                <SelectParameters>
                    <asp:SessionParameter Name="DoctorID" SessionField="docID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
      </div>
</asp:Content>
