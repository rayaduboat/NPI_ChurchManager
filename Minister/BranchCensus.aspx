<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BranchCensus.aspx.cs" Inherits="Minister_BranchCensus" %>

<!DOCTYPE html>

<html>
<head>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="Accounts">
    <title>Accounts</title>
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
                    <li class="nav-item dropdown open" style="display:none">
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
                    <li class="nav-item dropdown open" style="display:none">
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
    <section style="margin-top: 80px;">
         <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Census</h2>
        <h3 class="mbr-section-subtitle mbr-fonts-style align-center pb-5 mbr-light display-5">View historical census statistics </h3>
        <div class="container p-5">
            <div class="row">
                <div class="col-sm-4">
                    <select id="selectBranchNames" class="form-control">
                        <option>Select branch</option>
                    </select>
                </div>
                <div class="col-sm-2">

                    <input class="form-control" onclick="{ $rab.Census.Refresh(); }" type="button" id="buttonStatistics" value="Load Census" />
                </div>
                
                <div class="col-sm-4">
                    <div class="dropdown">
  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
    Manage
  </button>
  <div class="dropdown-menu">
     <input   onclick="button_ActivateCensus()"  class="dropdown-item " style="background-color:red;color:white;" type="button" id="buttonActivateCensus" title="Activating census will allow members to fill in census data for the year" value="Activate Census"  /> 
     <input   onclick="button_DectivateCensus()" class="dropdown-item " style="background-color:black;color:white;" type="button" id="buttonDeactivateCensus" title="Activating census will allow members to fill in census data for the year" value="Deactivate Census"   /> 
    <a class="dropdown-item" href="Census.aspx" target="_blank">Launch Census page</a>
  </div>
</div>
                    
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row mb-5">

                <div class="col-sm-12">
                    <div class="table-responsive">
                        <table class="table" id="tableEventListing">
                            <thead>
                                <tr>

                                    <th>BranchName</th>
                                    <th>CensusYear</th>
                                    <th>TotalRegistered</th>
                                    <th>TotalHolySpiritBaptised</th>
                                    <th>TotalWaterBaptised</th>
                                    <th>TotalBornAgain</th>

                                </tr>
                            </thead>
                            <tbody id="tbodyCensusStatistics">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-sm-3 text-right">
                        <label style="font-size: 18px; font-weight: 600; padding-top: 8px!important" class="form-control-label"><kbd>Select census year</kbd></label>
                    </div>
                    <div class="col-sm-4 mb-3">
                        <select class="form-control" id="selectCensusYear" onchange="{$rab.Census.CensusYear(this.value);}">
                            <option value="select Census year">Select Census year</option>
                            <%--<option value="All">All</option>
                            <option value="2018">2018</option>
                            <option value="2017">2017</option>--%>
                        </select>
                    </div>
                    <div class="col-sm-4"></div>

                </div>
            </div>
            <div class="row">

                <div class="col-sm-12">
                    <div class="table-responsive">
                        <table class="table" id="tableListing">
                            <thead>
                                <tr>

                                    <th>FirstName</th>
                                    <th>LastName</th>
                                    <th>Telephone</th>
                                    <th>IsHolySpiritBaptised</th>
                                    <th>IsWaterBaptised</th>
                                    <th>IsBornAgain</th>

                                </tr>
                            </thead>
                            <tbody id="tbodyRegisteredCensusStatistics">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="modal-section-1">
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
                       <a href="Standard.aspx" class="text-black">Standard</a> <br>
                       
                         
                       
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
                            <div class="soc-item" style="display:none;">
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
    <script src="assets/theme/js/script.js"></script>
    <script src="assets/formoid/formoid.min.js"></script>
    <script src="assets/script/AccessJS.js"></script>
    <script src="assets/script/branchCensusStatistics.js"></script>
    <style>
        button,input[type=button]{
            cursor:pointer!important;
        }
        tr:nth-child(2n) {
            background-color: #293955;
            color: white;
        }

        tr:nth-child(2n+1) {
            background-color: #d6dbe9;
            color: black;
        }

        tr {
            cursor: pointer;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#textboxSearch").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#tableListing tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
        function button_ActivateCensus() {
            try {
                var url = "BranchCensus.aspx/Activate";
                var obj = "";

                new $rab.Server.Method().BeginInvoke(url, {}, function (jsondata) {

                    try {
                        alert(jsondata);
                    } catch (e) {

                    }
                });
            } catch (e) {

            }
        }
        function button_DectivateCensus() {
            try {
                var url = "BranchCensus.aspx/Deactivate";
                var obj = "";

                new $rab.Server.Method().BeginInvoke(url, {}, function (jsondata) {

                    try {
                        alert(jsondata);
                    } catch (e) {

                    }
                });
            } catch (e) {

            }
        }
    </script>
</body>
</html>
