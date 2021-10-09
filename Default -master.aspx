<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default -master.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="">
    <title>Home</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700&subset=latin,cyrillic">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Alegreya+Sans:400,700&subset=latin,vietnamese,latin-ext">
    <link rel="stylesheet" href="assets/tether/tether.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/soundcloud-plugin/style.css">
    <link rel="stylesheet" href="assets/puritym/css/style.css">
    <link rel="stylesheet" href="assets/dropdown-menu/style.light.css">
    <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
    <style>
        .btnclass {
            border-radius: 0px 0px !important;
            width: 100%;
            background-color: #293955 !important;
            color: white;
            padding: 20px;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <section id="dropdown-menu-2btn-0" data-rv-view="0" style="display: none">
        <nav class="navbar navbar-dropdown navbar-fixed-top">
            <div class="container">
                <div class="navbar-brand">
                    <a href="https://www.google.co.uk/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwjf-sHqhL_XAhUCPRoKHaY1CKoQjRwIBw&url=http%3A%2F%2Fwww.copbrooklyn.org%2Fwitness-movement&psig=AOvVaw39gCmY_edN-DX0V_2j1Utx&ust=1510782286825971" class="navbar-logo">
                        <img src="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" alt="Mobirise"></a>
                    <a class="text-black" href="#">
                        <h2>Presbytery</h2>
                    </a>
                </div>
                <button class="navbar-toggler pull-xs-right hidden-md-up" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                    <div class="hamburger-icon"></div>
                </button>
                <ul class="nav-dropdown collapse pull-xs-right navbar-toggleable-sm nav navbar-nav" id="exCollapsingNavbar">
                    <li class="nav-item dropdown open">
                        <a class="nav-link link dropdown-toggle" data-toggle="dropdown-submenu" href="#" aria-expanded="true">Admin</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="ConventionsAndConferences.aspx">Conventions and conferences</a>
                            <a class="dropdown-item" href="Minister/WeeklyServiceReport.aspx">Weekly service report</a>

                        </div>
                    </li>
                    <li class="nav-item"><a class="nav-link link" href="#">Help</a></li>
                    <li class="nav-item nav-btn"><a class="nav-link btn btn-black btn-black-outline" href="Minister/ManagementList.aspx">Management Panel</a></li>
                    <li class="nav-item nav-btn"><a class="nav-link btn btn-secondary btn-secondary-outline" href="#" id="logout" onclick="{ new $rab.Initialise.Menus().Logout()();  }">Log out</a></li>
                </ul>
            </div>
        </nav>
    </section>
    <section class="mbr-section mbr-section-full mbr-parallax-background mbr-after-navbar" id="header1-1" data-rv-view="2" style="background-image: url(minister/assets/images/mbr-2-1620x1080.jpg);">
        <div class="mbr-table-cell">

            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 text-xs-center">
                        <h3 id="h2loggeduser" class="mbr-section-title display-1">Rabant Church Manager</h3>
                        <!--

                        <div class="mbr-buttons--center"><a class="btn btn-lg btn-secondary-outline" href="#">Weekly service report</a> <a class="btn btn-lg btn-white" href="#">Learn More</a></div>-->
                        <div>

                            <div class="container" id="loginContainer">
                                <%--<form runat="server">--%>

                                    <div class="row">
                                        <div class="col-sm-2 p-t-1 text-right"><b>Email</b></div>
                                        <div class="col-sm-6">

                                            <asp:TextBox ID="textboxEmail" Text="" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-sm-2 p-t-1  "><b>Password</b></div>
                                        <div class="col-sm-6">

                                            <asp:TextBox ID="textboxPassword" Text="temp123" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                        </div>

                                    </div>


                                    <div class="row">
                                        <div class="col-sm-2"></div>
                                        <div class="col-sm-6">
                                            <%--<input type="button" onclick="{ new $rab.Login.Credentials().Validate(); }" value="Login" class="btn btn-secondary btn-lg" style="border-radius:0px 0px!important;width:100%;background-color:#293955!important;color:white;"/>--%>
                                            <%--<asp:Button ID="ButtonLogin" CssClass="btnclass" runat="server" Text="Login" OnClick="ButtonLogin_Click" OnClientClick="new $rab.Login.Credentials().Validate();" />--%>
                                            <!-- two stage login -->
                                            <button class="btn btn-primary">Login</button>
                                        </div>

                                    </div>

                                <%--</form>--%>

                            </div>


                        </div>

                    </div>
                </div>
            </div>
            <a class="mbr-arrow" href="#contacts1-2"><i class="fa fa-angle-down"></i></a>
        </div>
    </section>
    <!-- xomment-->

    <section>

        <!-- Button to Open the Modal -->
        <button id="buttonModal" style="display: none" type="button" class="form-control" data-toggle="modal" data-target="#myModal">
            Open modal
        </button>

        <!-- The Modal -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">OOPS</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body" id="modalBody">
                        <!-- modal content go here-->

                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
    </section>


    <script src="assets/web/assets/jquery/jquery.min.js"></script>
    <script src="assets/tether/tether.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/smooth-scroll/SmoothScroll.js"></script>
    <script src="assets/jarallax/jarallax.js"></script>
    <script src="assets/puritym/js/script.js"></script>
    <script src="assets/dropdown-menu/script.js"></script>
    <script src="assets/script/loginJS.js"></script>
    <script>
        window.onload = function () {

            $("#dropdown-menu-2btn-0").css("display", "none")

        };

    </script>
    <style>
        /*form {
            border: 3px solid #f1f1f1;
        }*/

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

            button:hover {
                opacity: 0.8;
            }

        .cancelbtn {
            width: auto;
            padding: 10px 18px;
            background-color: #f44336;
        }

        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
        }

        img.avatar {
            width: 40%;
            border-radius: 50%;
        }

        .container {
            padding: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }

        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }

            .cancelbtn {
                width: 100%;
            }
        }
    </style>
</body>
</html>
