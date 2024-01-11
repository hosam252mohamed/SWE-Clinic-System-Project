<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/Site1.Master" AutoEventWireup="true" CodeBehind="pat-homepage.aspx.cs" Inherits="WebApplication1.Patient.patient_reg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="/styles/patient-homepage.css">
        <style>
            * {
                font-family: Roboto !important;
            }
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
    <div class="Patient_interface" id="patientInterface">

        <div class="account">
            <div class="box_for_profile">
                <img src="/imgs/profile.png"  height="60px" width="60px">
                <p>Patient Name</p>
                <p>21 years</p>
            </div>

            <div class="box_for_account_info">
                <div class="account_info">
                    <img src="/imgs/weight.png"  height="30px" width="30px">
                    <p>weight</p>
                    <p>53 kg</p>
                </div>

                <div class="account_info">
                    <img src="/imgs/height.png"  height="30px" width="30px">
                    <p>height</p>
                    <p>165 cm</p>
                </div>
                <div class="account_info">
                    <img src="/imgs/sleep.png"  height="30px" width="30px">
                    <p>sleep</p>
                    <p>8h 30m</p>
                </div>
            </div>
            

        </div>

        <div class="body-container">
            <div class="wrapper">
                <header>
                    <p class="current-date">December 2023</p>
                    <div class="icons">
                        <span id="prev" class="material-symbols-rounded"><img src="/imgs/arrow_left.png" height="13px" width="13px"></span>
                        <span id="next" class="material-symbols-rounded"><img src="/imgs/arrow_right.png" height="13px" width="13px"></span>
                    </div>
                </header>
                
                <div class="calendar">
                    <ul class="weeks">
                        <li>Sun</li>
                        <li>Mon</li>
                        <li>Tue</li>
                        <li>Wed</li>
                        <li>Thu</li>
                        <li>Fri</li>
                        <li>Sat</li>
                    </ul>
                    <ul class="days">
                        <li class="inactive">28</li>
                        <li class="inactive">29</li>
                        <li class="inactive">30</li>
                        <li class="inactive">31</li>
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                        <li>4</li>
                        <li>5</li>
                        <li>6</li>
                        <li>7</li>
                        <li>8</li>
                        <li>9</li>
                        <li>10</li>
                        <li>11</li>
                        <li>12</li>
                        <li>13</li>
                        <li>14</li>
                        <li>15</li>
                        <li>16</li>
                        <li>17</li>
                        <li>18</li>
                        <li>19</li>
                        <li>20</li>
                        <li class="active">21</li>
                        <li>22</li>
                        <li>23</li>
                        <li>24</li>
                        <li>25</li>
                        <li>26</li>
                        <li>27</li>
                        <li>28</li>
                        <li>29</li>
                        <li>10</li>
                        <li class="inactive">1</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container_section">
        <div class="options_section" style="min-height: 100vh !important; height: initial">
            
            <a href="/Patient/pat-homepage.aspx"><img src="/imgs/profile.png"  height="60px" width="60px"></a>

            <div class="option-container"> 
                <div class="option">
                    <a href="/Patient/pat-homepage.aspx"><img src="/imgs/home-icon.png" height="20px" width="20px"></a> 
                </div>
                <div class="option">
                    <a href="/Patient/pat-appointments.aspx"><img src="/imgs/info-icon.png" height="20px" width="20px"></a> 
                </div>
                <div class="option">
                    <a href="/Patient/pat-manage.aspx"><img src="/imgs/user-icon.png" height="20px" width="20px"></a> 
                </div>
                
                <div class="option">
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"> <img src="/imgs/logout-icon.png" height="20px" width="20px"></asp:LinkButton>
                </div>
                
            </div>  

        </div>
        <div class="body">
            <div class="header">
                <div class="search_bar">
                    <button class="icon_search"></button>
                    <input type="text" placeholder="Search">
                </div>
                <div class="bell">
                    <button class="bell_button"><img src="/imgs/bell.png"></button>
                </div>
                
                <div class="this_week">
                    <button class="date" id="dateButton">This week<img src="/imgs/down-arrow-56.png"></button>
                </div>
            </div>
            
            <div class="section1">
                <div class="section1_info">
                    <h2>Hello, </h2><h2 style="color: rgb(236, 187, 41) !important;">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h2>
                    <p>Have a nice day and don't forget to take care of your health</p>
                    <a href="#">Read more ></a>
                </div>
                <div class="img_section1">
                    <img src="/imgs/nurse0.png">
                </div>
            </div>
            <div style="font-family: Roboto !important; background-color: white !important; padding: 25px 20px !important; margin-top: 20px">
                <h2>Add An Appointment</h2>
                <div class="card p-2 mt-3">
                    <div class="card-body d-grid ">
                        <div class="row">
                            <div class="form-group mb-3">
                              <label for="TextBox1" class="mb-1">Appointment ID</label>
                                <div class="input-group">
                                  <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="ID"></asp:TextBox>
                                  <asp:Button ID="Button2" runat="server" Text="Go" class="btn btn-primary" OnClick="Button2_Click"/>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Cannot Be Blank" ControlToValidate="TextBox1" ValidationGroup="v1" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group mb-3">
                              <label for="TextBox1" class="mb-1">Doctor</label>
                                <div class="input-group">
                                    <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="DoctorName" DataValueField="DoctorID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT * FROM [Doctor]"></asp:SqlDataSource>
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
                                <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" class="btn btn-primary w-100" ValidationGroup="EmptyName"/>
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="Button3" runat="server" Text="Update" OnClick="Button3_Click" class="btn btn-success w-100" ValidationGroup="v1"/>
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="Button6" runat="server" Text="Delete" OnClick="Button6_Click" class="btn btn-danger w-100" ValidationGroup="v1"/>
                            </div>
                        </div>
                    </div>
                </div>
            <hr class="my-3" />
            </div><div style="font-family: Roboto !important; background-color: white !important; padding: 25px 20px !important; margin-top: 20px">
                <h2>Appointments Details</h2>
                <div class="card p-2 mt-3">
                    <div class="card-body">
                        <asp:GridView ID="GridView1" runat="server" class="table-bordered table-hover w-100" AutoGenerateColumns="False" DataKeyNames="AppointmentID" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="AppointmentID" HeaderText="AppointmentID" InsertVisible="False" ReadOnly="True" SortExpression="AppointmentID" />
                                <asp:BoundField DataField="DoctorName" HeaderText="DoctorName" SortExpression="DoctorName" />
                                <asp:BoundField DataField="AppointmentDate" HeaderText="AppointmentDate" SortExpression="AppointmentDate" />
<asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                            </Columns>
                            <EmptyDataTemplate>
                                <h3 class="text-center fs-4 pt-2">No Appointments Found</h3>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT Appointment.AppointmentID, Appointment.AppointmentDate, Appointment.Status, Appointment.DoctorID, Appointment.PatientID, Doctor.DoctorName FROM Appointment INNER JOIN Doctor ON Appointment.DoctorID = Doctor.DoctorID WHERE (Appointment.PatientID = @PatientID)">
                            <SelectParameters>
                                <asp:SessionParameter Name="PatientID" SessionField="patientid" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
