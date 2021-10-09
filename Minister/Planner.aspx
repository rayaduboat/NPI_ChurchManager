<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Planner.aspx.cs" Inherits="PlanningClass" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="MembershipList">
    <title>Calendar

    </title>
    <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
    <link rel="stylesheet" href="assets/tether/tether.min.css">
    <link rel="stylesheet" href="assets/soundcloud-plugin/style.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="assets/dropdown/css/style.css">
    <link rel="stylesheet" href="assets/data-tables/data-tables.bootstrap4.min.css">
    <link rel="stylesheet" href="assets/socicon/css/styles.css">
    <link rel="stylesheet" href="assets/theme/css/style.css">
    <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
    <link href="assets/theme/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />


</head>
<body>
    <form runat="server">
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

                        <a class=" " href="#">
                            <asp:Button OnClick="aLogout_Click" CssClass="btn btn-sm btn-primary display-4" ID="aLogout" runat="server" Text="Log out" />
                            <%--<span class="">
                            <br>
                        </span>Log out<br>--%>
                            <span class="">&nbsp;</span>
                        </a>

                    </div>
                </div>
            </nav>
        </section>

        <section class="section-table cid-qBsl1UHSIu" id="table1-0" data-rv-view="143">


            <div class="container container-table" style="margin-left: auto; margin-right: auto; width: 1300px;">
                <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Planner</h2>
                <h3 class="mbr-section-subtitle mbr-fonts-style align-center pb-5 mbr-light display-5">List of all upcoming events 
                </h3>
                <div class="">
                    <div class="container">

                        <%--<div class="row mb-1">
                        <div class="col-sm-3">

                        </div>

                        <div class="col-sm-2 pt-3 text-right">

                                From date:
                             
                        </div>
                        <div class="col-sm-2">
                            <input type="text" style="background-color: white;" class="form-control" id="textboxFromDate" value="" placeholder="dd/mm/yyyy" />

                             
                        </div>
                        <div class="col-sm-1 pt-3">

                                 To date:
                             
                        </div>
                        <div class="col-sm-2">
                            <input type="text" style="background-color: white;" class="form-control" id="textboxToDate" value="" placeholder="dd/mm/yyyy" />
                             
                        </div>
                        <div class="col-sm-2">

                            <input type="button" id="buttonSearch" name="search" value="Load planner" class="form-control form-control" onclick="{  }" />


                        </div>


                    </div>--%>
                        <div class="row">
                            <div class="col-sm-3">
                                <select id="selectBranchNames" class="form-control" onclick=" ">
                                    <option selected value="Select branch">Please select branch</option>

                                </select>
                            </div>
                            <div class="col-sm-3 pt-3 text-right">
                            </div>
                            <div class="col-sm-6  ">
                            </div>
                        </div>

                    </div>



                </div>
            </div>

        </section>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div style="background-color: #807676; padding: 5px;">
                    <asp:Button onClientClick="show('containerAnnouncement')" ID="Button1" runat="server" Text="Button" />
                    <button class='' onclick="show('containerAnnouncement')">Announcement</button>
                    <button class='' onclick="show('containerPreachingPlan')">Preaching plan</button>
                    <button class='' onclick="show('containerProgrammeOutline')">Program outline</button>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <section>
            <div class="container-fluid scroll" style="margin-right: 10%!important;">


                <div id="containerAnnouncement" style="border: 1px solid #bebcbc">
                    <hr />
                    <div class="container">
                        <a href="#" data-toggle="collapse" data-target="#demo">Click to view help</a>

                    </div>
                    <hr />
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-3">Enter search string</div>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" value="" />
                            </div>
                            <div class="col-sm-3"></div>
                            <div class="col-sm-3">
                                <button>Add new</button>
                            </div>
                        </div>
                    </div>
                  
                    <div id="containertableAnnouncement" runat="server">
                    <table class="table table-hover table-responsive" id="tablePlanning">
                        <thead>
                            <tr class="">

                                <th class="head-item mbr-fonts-style display-7">ID             </th>
                                <th class="head-item mbr-fonts-style display-7">FromDate       </th>
                                <th class="head-item mbr-fonts-style display-7">ToDate         </th>
                                <th class="head-item mbr-fonts-style display-7">StartTime      </th>
                                <th class="head-item mbr-fonts-style display-7">EndTime        </th>
                                <th class="head-item mbr-fonts-style display-7">ActivityName   </th>
                                <th class="head-item mbr-fonts-style display-7">Description    </th>
                                <th class="head-item mbr-fonts-style display-7">GuestSpeaker(s)</th>
                                <th class="head-item mbr-fonts-style display-7">Location       </th>
                                <th class="head-item mbr-fonts-style display-7">CreatedOn      </th>
                                <th class="head-item mbr-fonts-style display-7">CreatedBy      </th>

                            </tr>
                        </thead>
                        <tbody id="tbodyAnnouncement">
                            <!-- dynamic list goes here-->
                            <tr class="">

                                <td class="head-item mbr-fonts-style display-7">1000
                                <button>edit</button></td>
                                <td class="head-item mbr-fonts-style display-7">01/04/2018</td>
                                <td class="head-item mbr-fonts-style display-7">01/04/2018</td>
                                <td class="head-item mbr-fonts-style display-7">18:00</td>
                                <td class="head-item mbr-fonts-style display-7">20:30</td>
                                <td class="head-item mbr-fonts-style display-7">Wednesday prayers</td>
                                <td class="head-item mbr-fonts-style display-7">Midweek prayer service</td>
                                <td class="head-item mbr-fonts-style display-7">Elder River Doe</td>
                                <td class="head-item mbr-fonts-style display-7">Lake side, Coventry</td>
                                <td class="head-item mbr-fonts-style display-7">12/02/2018</td>
                                <td class="head-item mbr-fonts-style display-7">Jay Blake</td>

                            </tr>
                            <tr class="">

                                <td class="head-item mbr-fonts-style display-7">1001
                                <button>edit</button></td>
                                <td class="head-item mbr-fonts-style display-7">06/04/2018</td>
                                <td class="head-item mbr-fonts-style display-7">06/04/2018</td>
                                <td class="head-item mbr-fonts-style display-7">2000</td>
                                <td class="head-item mbr-fonts-style display-7">2300</td>
                                <td class="head-item mbr-fonts-style display-7">London North Area Evangelism meeting</td>
                                <td class="head-item mbr-fonts-style display-7">All local and district evangelism leaders are expected to attend this important meeting</td>
                                <td class="head-item mbr-fonts-style display-7">Evangelism Leader</td>
                                <td class="head-item mbr-fonts-style display-7">1 Tower Lane, Wembley, London, HA9 7NB</td>
                                <td class="head-item mbr-fonts-style display-7">12/02/2018</td>
                                <td class="head-item mbr-fonts-style display-7">Jay Deep</td>

                            </tr>
                        </tbody>
                    </table>
                    </div>
                </div>
                <div id="containerPreachingPlan" style="border: 1px solid #bebcbc; display: none">
                    <table class="table table-hover table-responsive" id="tablePreachingplan">
                        <thead>
                            <tr class="">

                                <th class="head-item mbr-fonts-style display-7">ID                  </th>
                                <th class="head-item mbr-fonts-style display-7">Date                </th>
                                <th class="head-item mbr-fonts-style display-7">DayOfWeek           </th>
                                <th class="head-item mbr-fonts-style display-7">ServiceName         </th>
                                <th class="head-item mbr-fonts-style display-7">Speaker/Exhortation </th>
                                <th class="head-item mbr-fonts-style display-7">Location            </th>

                            </tr>
                        </thead>
                        <tbody id="tbodyPreachingplan">
                            <!-- dynamic list goes here-->
                            <tr class="">

                                <td class="head-item mbr-fonts-style display-7">1000
                                <button>edit</button></td>
                                <td class="head-item mbr-fonts-style display-7">01/04/2018</td>
                                <td class="head-item mbr-fonts-style display-7">01/04/2018</td>
                                <td class="head-item mbr-fonts-style display-7">18:00</td>
                                <td class="head-item mbr-fonts-style display-7">20:30</td>
                                <td class="head-item mbr-fonts-style display-7">Wednesday prayers</td>
                                <td class="head-item mbr-fonts-style display-7">Midweek prayer service</td>
                                <td class="head-item mbr-fonts-style display-7">Elder River Doe</td>
                                <td class="head-item mbr-fonts-style display-7">Lake side, Coventry</td>
                                <td class="head-item mbr-fonts-style display-7">12/02/2018</td>
                                <td class="head-item mbr-fonts-style display-7">Jay Blake</td>

                            </tr>
                            <tr class="">

                                <td class="head-item mbr-fonts-style display-7">1001
                                <button>edit</button></td>
                                <td class="head-item mbr-fonts-style display-7">06/04/2018</td>
                                <td class="head-item mbr-fonts-style display-7">06/04/2018</td>
                                <td class="head-item mbr-fonts-style display-7">2000</td>
                                <td class="head-item mbr-fonts-style display-7">2300</td>
                                <td class="head-item mbr-fonts-style display-7">London North Area Evangelism meeting</td>
                                <td class="head-item mbr-fonts-style display-7">All local and district evangelism leaders are expected to attend this important meeting</td>
                                <td class="head-item mbr-fonts-style display-7">Evangelism Leader</td>
                                <td class="head-item mbr-fonts-style display-7">1 Tower Lane, Wembley, London, HA9 7NB</td>
                                <td class="head-item mbr-fonts-style display-7">12/02/2018</td>
                                <td class="head-item mbr-fonts-style display-7">Jay Deep</td>

                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="containerProgrammeOutline" style="border: 1px solid #bebcbc; display: none">
                    <table class="table table-hover table-responsive" id="tablePlanningProgramoutline">
                        <thead>
                            <tr class="">

                                <th class="head-item mbr-fonts-style display-7">ID                </th>
                                <th class="head-item mbr-fonts-style display-7">Date              </th>
                                <th class="head-item mbr-fonts-style display-7">DayOfWeek         </th>
                                <th class="head-item mbr-fonts-style display-7">OpeningPrayer     </th>
                                <th class="head-item mbr-fonts-style display-7">Conductor         </th>
                                <th class="head-item mbr-fonts-style display-7">Worship           </th>
                                <th class="head-item mbr-fonts-style display-7">Praises           </th>
                                <th class="head-item mbr-fonts-style display-7">Exhortation       </th>
                                <th class="head-item mbr-fonts-style display-7">Prayer            </th>
                                <th class="head-item mbr-fonts-style display-7">PreachingPlanID   </th>
                                <th class="head-item mbr-fonts-style display-7">Location          </th>












                            </tr>
                        </thead>
                        <tbody id="tbodyprorammeoutline">
                            <!-- dynamic list goes here-->
                            <tr class="">

                                <td class="head-item mbr-fonts-style display-7">1000
                                <button>edit</button></td>
                                <td class="head-item mbr-fonts-style display-7">01/04/2018</td>
                                <td class="head-item mbr-fonts-style display-7">01/04/2018</td>
                                <td class="head-item mbr-fonts-style display-7">18:00</td>
                                <td class="head-item mbr-fonts-style display-7">20:30</td>
                                <td class="head-item mbr-fonts-style display-7">Wednesday prayers</td>
                                <td class="head-item mbr-fonts-style display-7">Midweek prayer service</td>
                                <td class="head-item mbr-fonts-style display-7">Elder River Doe</td>
                                <td class="head-item mbr-fonts-style display-7">Lake side, Coventry</td>
                                <td class="head-item mbr-fonts-style display-7">12/02/2018</td>
                                <td class="head-item mbr-fonts-style display-7">Jay Blake</td>

                            </tr>
                            <tr class="">

                                <td class="head-item mbr-fonts-style display-7">1001
                                <button>edit</button></td>
                                <td class="head-item mbr-fonts-style display-7">06/04/2018</td>
                                <td class="head-item mbr-fonts-style display-7">06/04/2018</td>
                                <td class="head-item mbr-fonts-style display-7">2000</td>
                                <td class="head-item mbr-fonts-style display-7">2300</td>
                                <td class="head-item mbr-fonts-style display-7">London North Area Evangelism meeting</td>
                                <td class="head-item mbr-fonts-style display-7">All local and district evangelism leaders are expected to attend this important meeting</td>
                                <td class="head-item mbr-fonts-style display-7">Evangelism Leader</td>
                                <td class="head-item mbr-fonts-style display-7">1 Tower Lane, Wembley, London, HA9 7NB</td>
                                <td class="head-item mbr-fonts-style display-7">12/02/2018</td>
                                <td class="head-item mbr-fonts-style display-7">Jay Deep</td>

                            </tr>
                        </tbody>
                    </table>
                </div>
                <script>
                    function show(containerID) {

                        ['containerAnnouncement', 'containerPreachingPlan', 'containerProgrammeOutline'].forEach(function (value, index) {
                            if (value == containerID) document.getElementById(value).style.display = 'block';
                            else document.getElementById(value).style.display = 'none';
                        })
                    }
                </script>
                <style>
                    button {
                        cursor: pointer !important;
                        padding: 5px !important;
                        color: black;
                        background-color: #bebcbc;
                        border: thin;
                    }

                        button:active {
                            background-color: #808080;
                        }

                        button:hover {
                            background-color: #293955;
                        }
                </style>
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
        <%-- <script src="assets/script/exportJS.js"></script>--%>
        <style>
            tr:nth-child(2n) {
                color: white;
                background-color: #293955
            }

            tr:nth-child(2n+1) {
                color: black;
                background-color: #d6dbe9
            }
        </style>


        <script>
            $(document).ready(function () {
                //initialise('tablePlanning');
                //getLibrary();

                $("#textboxsearchstring").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#tablePlanning tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>


    </form>

</body>
</html>
