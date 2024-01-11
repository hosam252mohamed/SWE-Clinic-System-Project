<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="patientManage.aspx.cs" Inherits="WebApplication1.Doctor.patientManage" %>
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
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid d-md-flex align-items-center justify-content-center" style="min-height:calc(100vh - 180px)">
            <div class="row gap-3 justify-content-center contain">
                <div class="card pt-2 col-md-5 m-lg-4">
                    <div class="card-body d-grid">
                        <h3 class="card-title text-center mb-3">Patient Details</h3>
                        <hr />
                        <div class="row">
                            <div class="form-group mb-3 col-lg-6">
                              <label for="TextBox1" class="mb-1">Patient ID</label>
                                <div class="input-group">
                                  <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Patient ID"></asp:TextBox>
                                  <asp:Button ID="Button2" runat="server" Text="Go" class="btn btn-primary" OnClick="Button2_Click"/>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Cannot Be Blank" ControlToValidate="TextBox1" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group mb-3 col-lg-6">
                                <label for="TextBox4" class="mb-1">Account Status</label>
                                <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ID="TextBox4" runat="server" class="form-control" BackColor="LightGray" placeholder="Status" ReadOnly="true"></asp:TextBox>
                                            <asp:Button ID="Button5" runat="server" Text="✓" class="btn btn-primary fw-bold me-1" OnClick="Button5_Click"/>
                                            <asp:Button ID="Button6" runat="server" Text="–" class="btn btn-warning fw-bold me-1" OnClick="Button6_Click"/>
                                            <asp:Button ID="Button7" runat="server" Text="X" class="btn btn-danger fw-semibold" OnClick="Button7_Click"/>
                                        </div>
                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="form-group mb-3">
                                <label for="TextBox3" class="mb-1">Full Name</label>
                                <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Full Name"></asp:TextBox>
                            </div>
                         </div>
                        <div class="row">
                            <div class="col-6">
                                <asp:Button ID="Button3" runat="server" Text="Update" class="btn btn-primary px-4 px-md-3 w-100" OnClick="Button3_Click" />
                            </div>
                            <div class="col-6">
                                <asp:Button ID="Button4" runat="server" Text="Delete User" class="btn btn-danger px-4 px-md-3 w-100" OnClick="Button4_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card pt-2 col-md-6">
                    <div class="card-body">
                        <h3 class="card-title text-center mb-3">Patients List</h3>
                        <hr class="mb-3"/>
                        <asp:GridView ID="GridView1" runat="server" class="table table-bordered" AutoGenerateColumns="False" DataKeyNames="PatientID" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="PatientID" HeaderText="PatientID" InsertVisible="False" ReadOnly="True" SortExpression="PatientID" />
                                <asp:BoundField DataField="PatientName" HeaderText="PatientName" SortExpression="PatientName" />
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT * FROM [Patient]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
