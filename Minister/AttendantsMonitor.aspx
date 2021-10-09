<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AttendantsMonitor.aspx.cs" Inherits="Minister_AttendantsMonitor" %>

<!DOCTYPE html>

<html>
<head>
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="Management">
    <title>AttendantsMonitor</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <%--<link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
    <link rel="stylesheet" href="assets/tether/tether.min.css">
    <link rel="stylesheet" href="assets/soundcloud-plugin/style.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="assets/dropdown/css/style.css">
    <link rel="stylesheet" href="assets/socicon/css/styles.css">
    <link rel="stylesheet" href="assets/theme/css/style.css">
    <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        .checkboxAttr {
            display: inline;
            width: 30px;
            height: 30px;
        }
         td {
            background-color:darkgreen !important;
            color:white !important;
        }

        .dtCls {
            background-color:darkgreen !important;
            color:white !important;
        }
        .hideMe {
            display: none !important;
        }

        .showMe {
            display: block !important;
        }
    </style>
</head>
<body style="background-color: #bf7e9a">
       <%--<section class="menu cid-qBsAZiDqUG" once="menu" id="menu1-4" data-rv-view="128">

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
                    <form runat="server">
                        <a class=" " href="#">
                            <asp:Button OnClick="aLogout_Click" CssClass="btn btn-sm btn-primary display-4" ID="aLogout" runat="server" Text="Log out" />
                            <span class="">&nbsp;</span>
                        </a>
                    </form>
                </div>
            </div>
        </nav>
    </section>--%>
   <div class="container-fluid">
        <div class="jumbotron" style="background-color: #bf7e9a">
            <h1 id="mainHeaderID" style="text-align: center; font-weight: 700;">ATTENDANCE MONITOR</h1>
            <div class="row" style="width: 50%; margin: auto;">
                <div class="col-md-4">
                    <select id="selectActivities" class="form-control">
                        <option value="-- Select Activity --">-- Select Activity --</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <select id="selectLevelCount" class="form-control">
                        <option value="-- Select Level --">-- Select Level --</option>
                        <option value="Area">Area</option>
                        <option value="District">District</option>
                        <option value="Local">Local</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <input class="btn btn-success" id="btnRollCall" type="submit" name="name" onclick="{ new $mon.Attendance.Activities().rollCall('selectActivities','selectLevelCount') }" value="Roll Call" /> <%--onclick="{ new $mon.Attendance.Activities().getList() }"--%>
                </div>

            </div>
            <hr />
        </div>

        <div id="divMain" class="row hideMe">
           <%-- <div>--%>
                <h1 id="activityTitleID" style="background-color: #126908; color: #fff; font-weight: 600; text-align: center;"></h1><%--Attendance for National Council Meeting--%>
            <%--</div>--%>
            <div id="divArea" class="col-md-12 hideMe">
                <div style="background-color: black; text-align: center;">
                    <input type="checkbox" class="checkboxAttr" name="name" value="" />
                    <h2 style="display: inline; color: white;">AREA</h2>
                </div>
                <div class="table-responsive">
                    <table id="tabArea" class="w3-table w3-striped w3-bordered w3-border w3-hoverable" style="font-size: 40px;font-weight:600;">
                      
                    </table>
                </div>
            </div>
            <div id="divDistrict" class="col-md-12 hideMe">
                <div style="background-color: black; text-align: center;">
                    <input type="checkbox" class="checkboxAttr" name="name" value="" />
                    <h2 style="display: inline; color: white;">DISTRICT</h2>
                </div>
                <div class="table-responsive">
                    <table id="tabDistrict" class="w3-table w3-striped w3-bordered w3-border w3-hoverable" style="font-size: 40px;font-weight:600;">
                        
                    </table>
                </div>
            </div>
            <div id="divLocal" class="col-md-12 hideMe">
                <div style="background-color: black; text-align: center;">
                    <input type="checkbox" class="checkboxAttr" name="name" value="" />
                    <h2 style="display: inline; color: white;">LOCAL</h2>
                </div>
                <div class="table-responsive">
                    <table id="tabLocal" class="w3-table w3-striped w3-bordered w3-border w3-hoverable" style="font-size: 40px;font-weight:600;">
                        
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            new $mon.Attendance.Activities().getList('selectActivities');
        });
    </script>
    
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="assets/web/assets/jquery/jquery.min.js"></script>
    <script src="assets/script/AccessJS.js"></script>
    <script src="assets/popper/popper.min.js"></script>
    <script src="assets/tether/tether.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/smooth-scroll/smooth-scroll.js"></script>
    <script src="assets/dropdown/js/script.min.js"></script>
    <script src="assets/touch-swipe/jquery.touch-swipe.min.js"></script>
    <script src="assets/data-tables/jquery.data-tables.min.js"></script>
    <script src="assets/data-tables/data-tables.bootstrap4.min.js"></script>
    <script src="assets/theme/js/script.js"></script>
    <script src="assets/formoid/formoid.min.js"></script>
    <script src="assets/script/AccessJS.js"></script>
    <script src="assets/script/membersJS.js"></script>
    <script src="assets/script/memberStatisticsJS.js"></script>
    <script src="assets/script/exportJS.js"></script>
    <script src="assets/script/memberTransfersJS.js"></script>
    <script src="assets/script/memberCellGroupsJS.js"></script>
    <script src="assets/script/memberAccountsJS.js"></script>
    <script src="assets/script/memberDelete.js"></script>
    <script src="assets/script/UtilitiesJS.js"></script>
    <script src="assets/script/MonitorJS.js"></script>
    <script src="assets/script/RefreshPageJS.js"></script>

<%--<script src="Scripts/UtilitiesJS.js"></script>

<script src="Scripts/MonitorJS.js"></script>
<script src="Scripts/RefreshPageJS.js"></script>--%>

