<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-login.aspx.cs" Inherits="WebApplication1.Admin.admin_login1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Login</title>
        <link rel="stylesheet" href="/styles/home-page.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@400;500;700&display=swap" rel="stylesheet">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    
    </head>
    <body>
        <form id="form1" runat="server">
            <div class="w-100 d-flex justify-content-center align-items-center container" style="min-height:calc(100vh - 120px)">
                <div class="card m-auto pt-2" style="width: 25rem;">
                  <div class="card-body">
                    <h3 class="card-title text-center mb-3">*Admin Login*</h3>
                    <hr />
                      <div class="form-group">
                         <label for="TextBox1" class="mb-1">Username</label>
                        <asp:TextBox ID="TextBox1" runat="server" class="form-control mb-3" placeholder="Username"></asp:TextBox>
                      </div>
                      <div class="form-group mb-3">
                          <label for="TextBox2" class="mb-1">Password</label>
                          <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                      </div>
                      <div class="form-group my-2">
                          <asp:Button ID="Button1" runat="server" Text="Login" class="btn btn-success form-control" OnClick="Button1_Click"/>
                      </div>
                      <p class="text-center m-0 mt-3">
                        <a href="/Home.aspx">Login With Different Way</a>
                      </p>
                  </div>
                </div>
            </div>
        </form>
    </body>
</html>
