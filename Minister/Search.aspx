<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Minister_Search" ValidateRequest="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="generator" content="Rabant.com" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon" />
    <meta name="description" content="MembershipList" />

    <title>Search</title>
    <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css" />
    <link rel="stylesheet" href="assets/tether/tether.min.css" />
    <link rel="stylesheet" href="assets/soundcloud-plugin/style.css" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css" />
    <link rel="stylesheet" href="assets/dropdown/css/style.css" />
    <link rel="stylesheet" href="assets/socicon/css/styles.css" />
    <link rel="stylesheet" href="assets/theme/css/style.css" />
    <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css" />
    <link href="assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <section class="menu cid-qBsAZiDqUG" id="menu1-4" data-rv-view="128">

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
                        <li class="nav-item dropdown open" style="display: none">
                            <a class="nav-link link text-white dropdown-toggle display-4" href="ManagementList.aspx" data-toggle="dropdown-submenu" aria-expanded="true">
                                <span class="mbri-home mbr-iconfont mbr-iconfont-btn"></span>&nbsp;Management
                            </a>
                            <div class="dropdown-menu">
                                <div class="dropdown">
                                    <a class="text-white dropdown-item dropdown-toggle display-4" href="ManagementList.aspx" data-toggle="dropdown-submenu" aria-expanded="false">Branch</a>
                                    <div class="dropdown-menu dropdown-submenu">

                                        <a class="text-white dropdown-item display-4" href="MembershipList.aspx">Membership List</a>

                                        <a class="text-white dropdown-item display-4" href="Attendance.aspx">Attendance</a><a class="text-white dropdown-item display-4" href="Appointment.aspx">Appointments</a>
                                        <a class="text-white dropdown-item display-4" href="Baptism.aspx">Baptism</a>
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
                        <li class="nav-item dropdown open" style="display: none">
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

                        <a onclick="new $rab.Initialise.Menus().Logout()" class=" " href="#">Log out<br>
                            <span class="">&nbsp;</span>
                        </a>

                    </div>
                </div>
            </nav>
        </section>
        <section style="padding-top: 80px">
            <div class="container container-table">
                <h2 style="text-shadow: 1px 2px #e5dfdf" class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Membership search</h2>
                <hr />
                <div class="btn-group" style="width: 100%; background-color: #f3eeee; border: 1px solid #e5dfdf">
                    <input type="button" style='border: none; background-color: #ddebf7' class="p-4" value='Advanced member search panel' />

                </div>
                <div style="width: 100%; background-color: #f3eeee; border: 1px solid #e5dfdf">
                    <div id="containerReport">
                        <div class="container">
                            <div class="row m-2">
                                <div class="col-sm-3 p-2" style="font-size: 20px; letter-spacing: 1px; font-weight: 600">Enter search</div>
                                <div class="col-sm-5">
                                    <asp:TextBox CssClass="form-control" BackColor="White" ID="TextBoxSearch" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-sm-4    ">
                                    <asp:Button CssClass="form-control" OnClick="ButtonSearch_Click" ID="ButtonSearch" runat="server" Text="Search" />
                                </div>
                                <div class="col-sm-2  p-2">
                                    
                                    <asp:TextBox Visible="false" Enabled="false" Width="70" ID="TextBoxMemberID" runat="server"></asp:TextBox>
                                </div>


                            </div>
                        </div>

                    </div>
                    <div id="containerComingSoon"></div>
                </div>
            </div>

        </section>
        <section>
            <hr style="margin-top: 1px!important" />
            <div class="container">
                <div class="row">
                    <div class="col-sm-3 p-2">Members found: 
                        <asp:Label ID="textSearchResult" runat="server" /></div>
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-3"></div>
                </div>
            </div>
            <hr style="margin-top: 1px!important" />
        </section>
        <section class="p-3" id="containerSearchReport" runat="server">
            <!-- search result is displayed in this container-->
        </section>
        <section>
            <div class="container">

                <!-- Button to Open the Modal -->
                <button data-toggle="modal" data-target="#matchMember" style="display: none" type="button" class="btn btn-primary">
                    Open modal
                </button>

                <!-- The Modal -->
                <div class="modal fade" id="matchMember">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Members details</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                <table id="" class="table table-striped table-responsive">
                                    <thead>
                                        <tr>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyMember">
                                    </tbody>
                                </table>
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </section>
        <section class="footer3 cid-qBsDDF26RJ" id="footer3-9" style="width: 100%">


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
                            <a href="MembershipList.aspx" class="text-black">Membership List</a><br>
                            <a href="Events.aspx" class="text-black">Events</a><br>
                            <a href="WeeklyServiceReport.aspx" class="text-black">Weekly service report</a><br>
                            <a href="Baptism.aspx" class="text-black">Baptism</a>

                        </p>
                    </div>
                    <div class="col-md-3 col-sm-4">
                        <p class="mb-4 mbr-fonts-style foot-title display-7">
                            Reports
                        </p>
                        <p class="mbr-text mbr-fonts-style mbr-links-column display-7">
                            <a href="#" class="text-black">Standard</a>
                            <br>



                            <br>
                        </p>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <p class="mb-4 mbr-fonts-style foot-title display-7">
                        </p>
                        <p class="mbr-text form-text mbr-fonts-style display-7">
                        </p>
                        <div class="media-container-column" data-form-type="formoid">
                            <div data-form-alert="" hidden="" class="align-center">
                            </div>

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
                            <p class="mbr-text mbr-fonts-style display-7" id="panel-church-name">
                            </p>
                        </div>
                        <div class="col-md-6">
                            <div class="social-list align-right">
                                <div class="soc-item">
                                    <a href="#" target="_blank" id="panel-church-twitter">
                                        <span class="socicon-twitter socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                    </a>
                                </div>
                                <div class="soc-item">
                                    <a href="#" target="_blank" id="panel-church-facebook">
                                        <span class="socicon-facebook socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                    </a>
                                </div>
                                <div class="soc-item">
                                    <a href="#" target="_blank" id="panel-church-youtube">
                                        <span class="socicon-youtube socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                    </a>
                                </div>
                                <div class="soc-item">
                                    <a href="#" target="_blank" id="panel-church-instagram">
                                        <span class="socicon-instagram socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                    </a>
                                </div>
                                <div class="soc-item">
                                    <a href="#" target="_blank" id="panel-church-googleplus">
                                        <span class="socicon-googleplus socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                    </a>
                                </div>
                                <div class="soc-item" style="display: none;">
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
    </form>
    <script src="assets/web/assets/jquery/jquery.min.js"></script>
    <script src="assets/popper/popper.min.js"></script>
    <script src="assets/tether/tether.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/smooth-scroll/smooth-scroll.js"></script>
    <script src="assets/dropdown/js/script.min.js"></script>
    <script src="assets/touch-swipe/jquery.touch-swipe.min.js"></script>
    <script src="assets/theme/js/script.js"></script>
    <script src="assets/formoid/formoid.min.js"></script>
    <script src="assets/script/AccessJS.js"></script>
    <script src="assets/script/searchJS.js"></script>
    <style>
        .tablehead {
            font-weight: 600;
        }
    </style>
    <script>
        try {

        } catch (e) {

        }

    </script>
</body>
</html>
