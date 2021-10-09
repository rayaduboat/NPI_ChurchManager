<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MonthlyPlanner.aspx.cs" Inherits="Minister_ManagementList" %>

<!DOCTYPE html>

<html>
<head>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="Management">
    <title>Management</title>
    <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
    <link rel="stylesheet" href="assets/tether/tether.min.css">
    <link rel="stylesheet" href="assets/soundcloud-plugin/style.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="assets/dropdown/css/style.css">
    <link rel="stylesheet" href="assets/socicon/css/styles.css">
    <link rel="stylesheet" href="assets/theme/css/style.css">
    <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">



</head>
<body>
   <section class="menu cid-qBsAZiDqUG" once="menu" id="menu1-4" data-rv-view="128">

        <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <div class="hamburger">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </button>
            <div class="menu-logo">
                <div class="navbar-brand">
                    <span class="navbar-logo">
                        <a href="#">
                            <img id='panel-logo-header' src="assets/images/rabant96by65.png" />
                        </a>
                    </span>
                    <span class="navbar-caption-wrap"><a id='aloginUser' class="navbar-caption text-white display-4" href="#">District Management Panel</a></span>
                </div>
            </div>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
                    <li class="nav-item">

                        <a class="nav-link link text-white display-4" href="ManagementList.aspx">
                            <span class="mbr-iconfont mbr-iconfont-btn"></span>
                            Home 
                        </a>
                    </li>
                     <li class="nav-item">
                         
                        <a onclick="new $rab.Initialise.Menus().Logout()" class="nav-link link text-white display-4" >
                            <i class="fa fa-lock fa-lg"></i> 
                            Logout 
                        </a>
                    </li>
                    <li class="nav-item dropdown open">
                        <a class="nav-link link text-white dropdown-toggle display-4" href="ManagementList.aspx" data-toggle="dropdown-submenu" aria-expanded="true">
                            <span class="mbri-home mbr-iconfont mbr-iconfont-btn"></span>&nbsp;Management
                        </a>
                        <div class="dropdown-menu">
                            <div class="dropdown">
                                <a class="text-white dropdown-item dropdown-toggle display-4" href="ManagementList.aspx" data-toggle="dropdown-submenu" aria-expanded="false">Branch</a>
                                <div class="dropdown-menu dropdown-submenu">

                                    <a class="text-white dropdown-item display-4" href="MembershipList.aspx">Membership List</a>

                                    <a class="text-white dropdown-item display-4" href="Attendance.aspx">Attendance</a><a class="text-white dropdown-item display-4" href="Appointment.aspx">Appointments</a>
                                    <a class="text-white dropdown-item display-4" href="Appointment.aspx">Appointments</a><a class="text-white dropdown-item display-4" href="Baptism.aspx">Baptism</a>
                                    <a class="text-white dropdown-item display-4" href="BranchCensus.aspx">Census</a>

                                    <a class="text-white dropdown-item display-4" href="Events.aspx">Events</a>
                                    <a class="text-white dropdown-item display-4" href="Finances.aspx">Finances</a>
                                    <a class="text-white dropdown-item display-4" href="Followup.aspx">Follow-up</a>
                                     <a class="text-white dropdown-item display-4" href="Giving.aspx">Giving</a>
                                    <a class="text-white dropdown-item display-4" href="WeeklyServiceReport.aspx">Weekly service report</a>
                                </div>
                            </div>

                            <a class="text-white dropdown-item display-4" href="Accounts.aspx">Accounts</a>


                            <div class="dropdown">
                                <a class="text-white dropdown-item dropdown-toggle display-4" href="ManagementList.aspx" data-toggle="dropdown-submenu" aria-expanded="false">Reports</a>
                                <div class="dropdown-menu dropdown-submenu">
                                    
                                    <a class="text-white dropdown-item display-4" href="Standard.aspx">Standard</a>

                                </div>
                            </div>
                        </div>

                    </li>
                    <li class="nav-item dropdown open">
                        <a class="nav-link link text-white dropdown-toggle display-4" href="#" data-toggle="dropdown-submenu" aria-expanded="true">
                            <span class="mbri-help mbr-iconfont mbr-iconfont-btn"></span>&nbsp;Help
                        </a>
                        <div class="dropdown-menu">
                            <div class="dropdown" style="display: none;">
                                <a class="text-white dropdown-item   display-4" href="FAQ.aspx" data-toggle="dropdown-submenu" aria-expanded="false">FAQ</a>

                            </div>
                            <a class="text-white dropdown-item display-4" href="FAQ.aspx">FAQ</a>
                           



                        </div>


                    </li>
                </ul>
                <div class="navbar-buttons mbr-section-btn">
                    <form runat="server">
                        <a class=" " href="#">
                            <asp:Button OnClick="aLogout_Click" CssClass="btn btn-sm btn-primary display-4" ID="aLogout" runat="server" Text="Log out" />
                            <%--<span class="">
                            <br>
                        </span>Log out<br>--%>
                            <span class="">&nbsp;</span>
                        </a>
                    </form>
                </div>
            </div>
        </nav>
    </section>
     
    <section class="header1 cid-qBsCPrxhwM mbr-parallax-background" style="height:1080px;background-image:url('assets/images/mbr-1667x1080.jpg')" id="header1-5" data-rv-view="130">


        <div class="container">
            <div class="row justify-content-md-center">
                <div class="mbr-white col-md-10">
                    <h2 class="mbr-section-title align-center mbr-bold pb-3 mbr-fonts-style display-1">Monthly release</h2>
                    <h4 class="mbr-section-subtitle align-center mbr-light pb-3 mbr-fonts-style display-2">Remain in the basic message of Christ
                    </h4>
                    <p class="mbr-text align-center pb-3 mbr-fonts-style display-5">Page under development</p>
                    <div class="mbr-section-btn align-center">
                        <a class="btn btn-md btn-primary display-4" href="#">
                            <span class="mbr-iconfont mbri-file"></span>View my planner
                        </a>
                        <a class="btn btn-md btn-white-outline display-4" href="#">
                            <span class="mbri-setting mbr-iconfont mbr-iconfont-btn"></span>
                            District planner
                        </a>
                        <a class="btn btn-md btn-white-outline display-4" href="#">
                            <span class="mbri-home mbr-iconfont mbr-iconfont-btn"></span>
                            Local planner
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="mbr-section content4 cid-qBsDlbmqlQ" id="content4-7" data-rv-view="133">

        <div class="container">
            <div class="media-container-row">
                <div class="title col-12 col-md-8">
                    <h2 class="align-center pb-3 mbr-fonts-style display-2">Smarter way of managing<br>
                        a team</h2>
                    <h3 class="mbr-section-subtitle align-center mbr-light mbr-fonts-style display-5">Devote your time to what matters, empower your team
                    </h3>

                </div>
            </div>
        </div>
    </section>
    <section class="mbr-section info2 cid-qBsDyflP9X" id="info2-8" data-rv-view="135">


        <div class="container">
            <div class="row justify-content-center">
                <div class="media-container-column col-12 col-lg-3 col-md-4">
                    <div class="mbr-section-btn align-left py-4">
                        <a class="form-control display-4" href="#">
                            <span class="mbri-users mbr-iconfont mbr-iconfont-btn"></span>

                            Presbyters
                        </a>
                    </div>
                </div>
                <div class="media-container-column title col-12 col-lg-7 col-md-6">
                    <h2 class="align-right mbr-bold mbr-white pb-3 mbr-fonts-style display-2">Great 
                    </h2>
                    <h3 class="mbr-section-subtitle align-right mbr-light mbr-white mbr-fonts-style display-5">Impacting the generation for Christ Jesus.
                    </h3>
                </div>
            </div>
        </div>
    </section>
    <section class="footer3 cid-qBsDDF26RJ" id="footer3-9" data-rv-view="138">


        <div class="container">
            <div class="media-container-row content">
                <div class="col-md-2 col-sm-4">
                    <div class="mb-3 img-xxx">
                        <a href="#">
                              <img id="panel-logo-footer" src="#" alt="#" />
                        </a>
                    </div>
                    
                </div>
                <div class="col-md-3 col-sm-4">
                    <p class="mb-4 mbr-fonts-style foot-title display-7">
                        Management
                    </p>
                    <p class="mbr-text mbr-links-column mbr-fonts-style display-7">
                        <a href="#" class="text-black">M</a>embers list<br>
                        Account&nbsp;<br>
                        <a href="#" class="text-black">P</a>resbyters
                        <br>
                        <a href="#" class="text-black">P</a>reaching plan<br>
                        <a href="#" class="text-black">M</a>onthly planner
                    </p>
                </div>
                <div class="col-md-3 col-sm-4">
                    <p class="mb-4 mbr-fonts-style foot-title display-7">
                        Ministeries
                    </p>
                    <p class="mbr-text mbr-fonts-style mbr-links-column display-7">
                        <a href="#" class="text-black">Evangelism</a>
                        <br>
                        Men<br>
                        <a href="#" class="text-black">Women</a>
                        <br>
                        <a href="#" class="text-black">Youth</a>
                        <br>
                        <a href="#" class="text-black">Children</a>
                    </p>
                </div>
                <div class="col-md-4 col-sm-12">
                    <p class="mb-4 mbr-fonts-style foot-title display-7">
                        What next?
                    </p>
                    <p class="mbr-text form-text mbr-fonts-style display-7">
                        Get monthly updates and free resources.
                    </p>
                    <div class="media-container-column" data-form-type="formoid">
                        <div data-form-alert="" hidden="" class="align-center">
                            Thanks for filling out the form!
                        </div>
                        <form class="form-inline" action="#/" method="post" data-form-title="Mobirise Form">
                            <input type="hidden" value="bOzsKWQt1f0rvEofRZvTRQDsDOrK7ZxJLglvCk83GfqZ5BNI2l3EVhL8WJ8OLIRBlOkHhbe2XXa5vFsM+7/xi85Hfi03DVV3pI+uuH9Rv+SzZtR4fQmEO/vf1QOTJeYI" data-form-email="true">
                            <div class="form-group">
                                <input type="email" class="form-control input-sm input-inverse my-2" name="email" required="" data-form-field="Email" placeholder="Email" id="email-footer3-9">
                            </div>
                            <div class="input-group-btn m-2">
                                <button href="" class="form-control display-4" type="submit" role="button">Subscribe</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="footer-lower">
                <div class="media-container-row">
                    <div class="col-sm-12">
                        <hr>
                    </div>
                </div>
                <div class="media-container-row">
                    <div class="col-sm-6 copyright">
                        <p class="mbr-text mbr-fonts-style display-7">
                            
                        </p>
                    </div>
                    <div class="col-md-6">
                        <div class="social-list align-right">
                            <div class="soc-item">
                                <a href="#" target="_blank">
                                    <span class="socicon-twitter socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                </a>
                            </div>
                            <div class="soc-item">
                                <a href="#" target="_blank">
                                    <span class="socicon-facebook socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                </a>
                            </div>
                            <div class="soc-item">
                                <a href="#" target="_blank">
                                    <span class="socicon-youtube socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                </a>
                            </div>
                            <div class="soc-item">
                                <a href="#" target="_blank">
                                    <span class="socicon-instagram socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                </a>
                            </div>
                            <div class="soc-item">
                                <a href="#" target="_blank">
                                    <span class="socicon-googleplus socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                </a>
                            </div>
                            <div class="soc-item">
                                <a href="#" target="_blank">
                                    <span class="socicon-behance socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="assets/web/assets/jquery/jquery.min.js"></script>
    <script src="assets/popper/popper.min.js"></script>
    <script src="assets/tether/tether.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/smooth-scroll/smooth-scroll.js"></script>
    <script src="assets/dropdown/js/script.min.js"></script>
    <script src="assets/touch-swipe/jquery.touch-swipe.min.js"></script>
    <script src="assets/jarallax/jarallax.min.js"></script>
    <script src="assets/theme/js/script.js"></script>
    <script src="assets/formoid/formoid.min.js"></script>
    <script src="assets/script/AccessJS.js"></script>

</body>
</html>
