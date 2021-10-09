<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
    <section class="mbr-section mbr-section-full mbr-parallax-background mbr-after-navbar" id="header1-1" data-rv-view="2" style="background-image: url(minister/assets/images/mbr-1696x1080.jpg);">
        <div class="mbr-table-cell">

            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 text-xs-center">
                        <h3 id="h2loggeduser" class="mbr-section-title display-1">Rabant Church Manager</h3>
                        <!--

                        <div class="mbr-buttons--center"><a class="btn btn-lg btn-secondary-outline" href="#">Weekly service report</a> <a class="btn btn-lg btn-white" href="#">Learn More</a></div>-->
                        <div>

                            <div class="container" id="loginContainer">

                                <div class="form-group" id="emailBox">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <label for="exampleInputEmail1" class="text-uppercase" style="font-weight: 900; font-size: 18pt">Email address</label>
                                            </div>
                                            <div class="col-sm-8">
                                                <input  id="textboxUserName" type="text" class="form-control" placeholder="" />
                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <div class="form-group" id="passwordBox" style="display: none">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <label for="exampleInputPassword1" style="font-weight: 900; font-size: 18pt" class="text-uppercase">Password</label>
                                            </div>
                                            <div class="col-sm-8">
                                                <input id="textboxPassword" type="password" class="form-control" placeholder="" />
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <div id="loginFailure" class="form-group" style="display: none">
                                    <h2>Too many email/password guesses, session has now been terminated,
                                 refresh page if you wish to continue.
                                    </h2>
                                </div>
                                <div class="form-check">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-sm-4"></div>
                                            <div class="col-sm-8">
                                                <a href="ForgottenPassword.aspx" style="text-decoration:none!important" class="float-right text-decoration-none">Forgotten password</a>
                                                <button type="button" id="passwordbutton" onclick="new $rab.Login().Validate()" style="background-color: #364e6f; color: white; border-radius: 0px!important; border: thick!important; font-weight: 900; font-size: 18pt">Submit</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>


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
        <hr />
        <footer class="container" style="text-align: center!important; font-weight: 800; font-size: 18pt">
            © Copyright AnthonyBobbie Limited 2018 Company number 8893650 
        </footer>
    </section>


    <script src="assets/web/assets/jquery/jquery.min.js"></script>
    <script src="assets/tether/tether.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/smooth-scroll/SmoothScroll.js"></script>
    <script src="assets/jarallax/jarallax.js"></script>
    <script src="assets/puritym/js/script.js"></script>
    <script src="assets/dropdown-menu/script.js"></script>
    <script src="assets/script/loginJS.js"></script>
    <link href="assets/css/homecss.css" rel="stylesheet" />
    <script>
        window.onload = function () {

            $("#dropdown-menu-2btn-0").css("display", "none")

        };

    </script>
    
</body>
</html>
