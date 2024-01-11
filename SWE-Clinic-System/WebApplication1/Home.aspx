<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="/styles/home-page.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="skewed-bg">
        <!-- <nav class="navbar"></nav> -->
                <div class="down">
                    <h1>New Account</h1>
                </div>
                <div class="home">Home</div>
         </div>

        <div class="content">

            <div class="header">
                <h2>Select Your Account Type</h2>
            </div>

            <div class="panel">
                <div class="account">
                    <img src="/imgs/user.png">
                    <h3 class="account-header">Patient</h3>
                    <ul class="account-features">
                        <li class="account-features-items">Communicate securely with your doctor</li>
                    </ul>
                    <a href="/Patient/pat-login.aspx" class="account-button">Login</a>
                </div>
                <div class="account">
                    <img src="/imgs/user.png">
                    <h3 class="account-header">Admin</h3>
                    <ul class="account-features">
                        <li class="account-features-items">Communicate securely with your doctor</li>
                    </ul>
                    <a href="/Admin/admin-login.aspx" class="account-button">Login</a>
                </div>
                <div class="account">
                    <img src="/imgs/user.png">
                    <h3 class="account-header">Doctor</h3>
                    <ul class="account-features">
                        <li>Organize and approve appointments</li>
                    </ul>
                    <a href="/Doctor/doc-login.aspx" class="account-button">Login</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
