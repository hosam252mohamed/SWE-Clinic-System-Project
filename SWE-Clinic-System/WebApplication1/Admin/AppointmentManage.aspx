<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="AppointmentManage.aspx.cs" Inherits="WebApplication1.Admin.AppointmentManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :focus {
            outline:none;
        }
        @media (min-width:768px) {
            .contain {
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid d-md-flex align-items-center justify-content-center" style="min-height:calc(100vh - 180px)">
            <div class="row gap-3 justify-content-center contain">
                <div class="card pt-2 col-md-5 m-lg-4">
                    <div class="card-body d-grid">
                        <h3 class="card-title text-center mb-3">Member Details</h3>
                        <hr />
                        <div class="row">
                            <div class="form-group mb-3 col-lg-6">
                              <label for="TextBox1" class="mb-1">Appointment ID</label>
                                <div class="input-group">
                                  <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="ID"></asp:TextBox>
                                  <asp:Button ID="Button2" runat="server" Text="Go" class="btn btn-primary" OnClick="Button2_Click"/>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Cannot Be Blank" ControlToValidate="TextBox1" ValidationGroup="v1" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group mb-3 col-lg-6">
                                <label for="TextBox4" class="mb-1">Status</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="TextBox4" runat="server" class="form-control" BackColor="LightGray" placeholder="Status" ReadOnly="true"></asp:TextBox>
                                            <asp:Button ID="Button5" runat="server" Text="✓" class="btn btn-primary fw-bold me-1" OnClick="Button5_Click"/>
                                            <asp:Button ID="Button7" runat="server" Text="X" class="btn btn-danger fw-semibold" OnClick="Button7_Click"/>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group mb-3 col-md-6">
                              <label for="TextBox1" class="mb-1">Patient ID</label>
                                <div class="input-group">
                                  <asp:TextBox ID="TextBox6" runat="server" class="form-control" placeholder="Patient ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group mb-3 col-md-6">
                              <label for="TextBox1" class="mb-1">Doctor ID</label>
                                <div class="input-group">
                                  <asp:TextBox ID="TextBox5" runat="server" class="form-control" placeholder="Doctor ID"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="form-group mb-3">
                                  <label for="TextBox1" class="mb-1">Appointment Date</label>
                                    <div class="input-group">
                                      <asp:TextBox ID="TextBox7" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                            </div>
                         </div>
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Button ID="Button1" runat="server" Text="Add" class="btn btn-primary w-100" OnClick="Button1_Click" ValidationGroup="EmptyName"/>
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="Button3" runat="server" Text="Update" class="btn btn-success w-100" OnClick="Button3_Click" ValidationGroup="v1"/>
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="Button6" runat="server" Text="Delete" class="btn btn-danger w-100" OnClick="Button6_Click" ValidationGroup="v1"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card pt-2 col-md-6">
                    <div class="card-body">
                        <h3 class="card-title text-center mb-3">Member List</h3>
                        <hr class="mb-3"/>
                        <asp:GridView ID="GridView1" runat="server" class="table table-bordered" AutoGenerateColumns="False" DataKeyNames="AppointmentID" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="AppointmentID" HeaderText="AppointmentID" ReadOnly="True" SortExpression="AppointmentID" InsertVisible="False" />
                                <asp:BoundField DataField="PatientID" HeaderText="PatientID" SortExpression="PatientID" />
                                <asp:BoundField DataField="DoctorID" HeaderText="DoctorID" SortExpression="DoctorID" />
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                <asp:BoundField DataField="AppointmentDate" HeaderText="ReservationDate" SortExpression="AppointmentDate" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT * FROM [Appointment]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
