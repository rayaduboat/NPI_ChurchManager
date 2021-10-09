<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Minister_Attendance" %>

<!DOCTYPE html>

<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="MembershipList">
    <title>Attendance</title>
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

                        <a onclick="new $rab.Initialise.Menus().Logout()" class="nav-link link text-white display-4">
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

            </div>
        </nav>
    </section>
    <section style="margin-top: 80px;">
        <div></div>
        <div class="container">
            <div class="container modal-dialog-h">
                <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Attendance List</h2>

                <div class="row">
                    <div class="col-sm-12">
                        <h3 class="mbr-section-subtitle mbr-fonts-style align-center pb-5 mbr-light display-5">List of all activities attendees for branch
                        </h3>
                    </div>

                </div>
            </div>

            <div class="tab">
                <button id="buttonMarker" class="tabclass" onclick="displayTab(event, 'Marker')">Marker</button>
                <button class="tabclass" onclick="displayTab(event, 'Statistics')">Statistics and plots</button>
                <%--<button class="tabclass" onclick="displayTab(event, 'Plots')">Coming soon</button>--%>
                <input class="checkCovid" id="checkCovidAttend" type="checkBox" name="name" value="" />COVID-Attendance
            </div>
        </div>
    </section>

    <section>
        <div class="container">
            <div id="Marker" class="tabpanel">
                <a href="#demo" data-toggle="collapse" data-target="#attendanceInfo">Click to see help</a>
                <div id="attendanceInfo" class="collapse">
                    To mark attendance follow the instructions below
                    <ol>
                        <li>Select a branch in the Select branch drop down list</li>
                        <li>Next, select the activity name of interest. eg. Sunday service, Retreat</li>
                        <li>This will automatically load all members in the branch</li>
                        <li>Tap any button with name if you are using a phone or click if you
                            are using a desktop
                        </li>
                        <li>You get a prompt to confirm if you want to mark attendance, answer <kbd>Mark</kbd>
                            to record attendance, cancel to cancel
                        </li>
                        <li>If you make a mistake in marking somebody present, you can umark attendance
                            by clicking the <kbd>Marked attendees names and statistics</kbd>
                        </li>
                        <li>Scroll down and find name of interest and click the
                            <button>umark</button>
                            button</li>
                    </ol>
                </div>
                <div class="row modal-dialog-h">
                    <div class="col-sm-3" style="text-align: right!important">

                        <select id="selectBranchNames" class="form-control" onchange="{new $rab.Attendance.Refresh().Data();}">
                            <option value="Please select branch" selected>Please select branch</option>

                        </select>


                    </div>
                    <div class="col-sm-2">
                        <!--buttons for marking attendance-->



                        <select id="selectActivityNames" class="form-control" onchange="{new $rab.Attendance.Refresh().Data();}">
                            <option value="Select activity name">Select activity </option>


                        </select>



                    </div>
                    <div class="col-sm-1">
                        <button onclick="{new $rab.Attendance.Refresh().Data();}" class=" p-2">Load</button>
                    </div>
                    <div class="col-sm-3">
                        <!--buttons for marking attendance-->


                        <input type="text" style="background-color: white;" id="textboxsearchstring" placeholder="enter name" class="form-control" />

                    </div>


                    <div class="col-sm-3">

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="dropdown">
                                    <button id="buttonReportMenu" type="button" class="p-2 dropdown-toggle" data-toggle="dropdown">
                                        View
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#attendance-panel" id="buttonAttendanceProfile">Reports</a>
                                        <a class="dropdown-item" href="#" id="linkkeyboard">Keyboard</a>
                                        <%--<a class="dropdown-item" href="#">Report</a>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="dropdown">
                                    <button type="button" class="p-2 dropdown-toggle" data-toggle="dropdown">
                                        Filter
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#" onclick="new $rab.Attendance.Refresh().Data();">Refresh</a>
                                        <a class="dropdown-item" href="#" onclick="new $rab.Attendance.Refresh().Adult();">Adult</a>
                                        <a class="dropdown-item" href="#" onclick="new $rab.Attendance.Refresh().Children();">Children</a>
                                        <a class="dropdown-item" href="#" onclick="new $rab.Attendance.Refresh().Youth();">Youth</a>
                                    </div>
                                </div>
                            </div>

                        </div>


                    </div>
                </div>
                <div class="row modal-dialog-h">
                    <div class="col-sm-12">

                        <button type="button" class="form-control fa-bold" data-toggle="collapse" data-target="#stats">Marked attendees names and statistics</button>
                        <div id="stats" class="collapse ">
                            <table class="table table-responsive table-hover">
                                <thead>
                                    <tr>




                                        <th>Total     </th>
                                        <th>Male       </th>
                                        <th>Female     </th>
                                        <th>Children   </th>
                                        <th>Teenage    </th>
                                        <th>YoungAdult </th>
                                        <th>Above35    </th>


                                    </tr>
                                </thead>
                                <tbody id="tbodystats">
                                    <tr>



                                        <td id='tdTotal'>0      </td>
                                        <td id='tdMale'>0       </td>
                                        <td id='tdFemale'>0     </td>
                                        <td id='tdChildren'>0   </td>
                                        <td id='tdTeenage'>0    </td>
                                        <td id='tdYoungAdult'>0 </td>
                                        <td id='tdAbove35'>0    </td>


                                    </tr>
                                </tbody>
                            </table>
                            <hr />
                            <div id="tabledynamicattendance">
                                <table style="width: 100%!important" class="table table-hover table-responsive ">
                                    <thead>
                                        <tr style="background-color: #293955; color: white;">
                                            <td>Marked attendees</td>
                                            <td>Edit</td>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodymarked">
                                        <tr>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>

                        </div>

                    </div>

                </div>
            </div>
            <div id="Statistics" class="tabpanel">
                <a href="#demo" data-toggle="collapse" data-target="#statsInfo">Click to see help</a>
                <div id="statsInfo" class="collapse">
                    To view attendance history follow the instructions below
                     <ol>
                         <li>Select branch of interest in the Marker tab</li>
                         <li>Next come back to this Statistics tab, select the activity name of interest
                             in the select activity dropdown list.
                         </li>
                         <li>Next,select the date of interest and click <kbd>View report</kbd> button</li>
                         <li>Plots of attendance is automatically generated</li>

                     </ol>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3 text-right pt-3" style="font-weight: 600; font-size: 14pt">
                            Select activity name

                        </div>
                        <div class="col-sm-3">
                            <select class="form-control" id="selectstatsActivityName" onchange="$rab.Attendance.LoadActivityDates('selectstatsActivityDate',this.options[this.selectedIndex]);">
                                <option value="Select activity name">Select activity name</option>
                            </select>

                        </div>
                        <div class="col-sm-3">
                            <select class="form-control" id="selectstatsActivityDate" onchange="new $rab.Attendance.Statistics().emptyContainers()">
                                <option value="Select activity date">Select activity date</option>
                            </select>

                        </div>
                        <div class="col-sm-3 pt-3">
                            <button onclick="new $rab.Attendance.Statistics().getStatistics();">View report</button>
                        </div>
                    </div>
                </div>
                <hr />
            </div>
            <div id="Plots" class="tabpanel">
                <h3>Plots</h3>

            </div>

        </div>
    </section>
    <section>
        <section style="margin-left: 5%; margin-right: 5%;">
            <div id="divAttendanceButtonContainer"></div>

            <div class="row mb-3">
                <div class="col-sm-6">
                    <div class="container" id="columnchart_material"></div>
                </div>
                <div class="col-sm-6">
                    <div class="container" id="columnchart_childrenPercentage"></div>
                </div>

            </div>
            <div class="row mb-3">
                <div class="col-sm-6">
                    <div class="container" id="columnchart_youth"></div>
                </div>
                <div class="col-sm-6">
                    <div class="container" id="columnchart_youthPercentage"></div>
                </div>

            </div>
            <div class="row mb-3">
                <div class="col-sm-6">
                    <div class="container" id="columnchart_youngadult"></div>
                </div>
                <div class="col-sm-6">
                    <div class="container" id="columnchart_youngadultPercentage"></div>
                </div>

            </div>
            <div class="row mb-3">
                <div class="col-sm-6">
                    <div class="container" id="columnchart_above35"></div>
                </div>
                <div class="col-sm-6">
                    <div class="container" id="columnchart_above35Percentage"></div>
                </div>

            </div>

        </section>
    </section>

    <section id="sectionCovid" ><%--style="display: none"--%>
        <div class="container">

            <!-- Button to Open the Modal -->
            <button style="visibility: collapse;" id="buttonModal" type="button" class="form-control" data-toggle="modal" data-target="#myModal">
                Open modal
            </button>

            <!-- The Modal -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Mark attendance</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body" id="modalContent">
                        </div>
                        <div id="modalTemperature">
                            <label class="col-form-label col-sm-3" style="color: red; font-weight: 600; font-size: 18px;">Body temperature:</label>
                            <input class="col-sm-6 textBoxFormatRep" id="txtTemperature" type="text" name="name" value=""
                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                            <span style="font-size: 20px; color: red;">&#8451;</span>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" id="buttonMarkAttendance" onclick="{ $rab.Attendance.Add(this)}" class="btn btn-secondary">Mark</button>
                            <button type="button" id="buttonCloseModal" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </section>
    <!--Attendance without COVID-->
    <section id="sectionNoCovid" ><%--style="display: none"--%>
        <div class="container">

            <!-- Button to Open the Modal -->
            <button style="visibility: collapse;" id="buttonModalNT" type="button" class="form-control" data-toggle="modal" data-target="#myModalNT">
                Open modal
            </button>

            <!-- The Modal -->
            <div class="modal fade" id="myModalNT">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Mark attendance</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body" id="modalContentNT">
                        </div>
                        <%--<div id="modalTemperature">
                            <label class="col-form-label col-sm-3" style="color:red;font-weight:600;font-size:18px;">Body temperature:</label>
                         <input class="col-sm-6 textBoxFormatRep" id="txtTemperature"  type="text" name="name" value="" 
                             oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /> <span style="font-size:20px;color:red;">&#8451;</span>
                        </div>--%>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" id="buttonMarkAttendanceNT" onclick="{ $rab.Attendance.Add(this)}" class="btn btn-secondary">Mark</button>
                            <button type="button" id="buttonCloseModalNT" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </section>
    <section class="modal-dialog-4">
        <!-- The Modal -->
        <input type="hidden" id="displayModalMaster" data-toggle="modal" data-target="#masterSelector" />
        <div class="modal fade" id="masterSelector">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Advanced members selection window</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body" id="modalMaster">


                        <h6>Click on load to load members in Category</h6>
                        <hr />
                        <table class="table table-striped table-responsive">
                            <thead style="font-weight: 800;">
                                <tr>

                                    <td class="text-center">Category</td>
                                    <td>Action</td>

                                </tr>
                            </thead>
                            <tbody>

                                <tr>

                                    <td class="text-center">Officers</td>
                                    <td>
                                        <button onclick="new $rab.MasterFilter().LoadOfficers()" id="btnLoadOfficers" class="mt-2 p-2">Get members in group</button></td>

                                </tr>
                                <tr>

                                    <td>

                                        <div class="row">
                                            <div class="col-sm-4 text-right">
                                                <button onclick="{new  $rab.MasterFilter().GetGroupNames();}" class="mt-2 p-2">Load group names</button>
                                            </div>
                                            <div class="col-sm-8 mt-2 p-2">
                                                <select id="selectGetGroupNames" class="form-control">
                                                    <option>Select group name</option>
                                                </select>
                                            </div>

                                        </div>



                                    </td>
                                    <td>
                                        <button onclick="new $rab.MasterFilter().LoadGroups(selectGetGroupNames.value)" id="btnCellGroupMembers" class="mt-2 p-2">Get members in group</button></td>

                                </tr>
                            </tbody>
                        </table>

                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" id="buttonCloseMasterModal" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <section class="modal-dialog-2">
        <div class="container">



            <!-- The Modal -->
            <div class="modal fade" id="attendance-panel">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Reports panel</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="tab">
                                <button class="tablinks" onclick="$rab.Attendance.OpenPanel(event, 'newActivity')" id="defaultOpen">New activity</button>
                                <button class="tablinks" onclick="$rab.Attendance.OpenPanel(event, 'branchProfile')">Attendance history</button>
                                <button class="tablinks" onclick="$rab.Attendance.OpenPanel(event, 'memberProfile')">Statistics</button>
                            </div>

                            <div id="newActivity" class="tabcontent">
                                <h3>New activity</h3>
                                <i class="fa fa-info fa-lg" style="font-size: 20pt;"></i><a href="#" data-toggle="collapse" data-target="#demo1">Click to see how to create new church activity</a>

                                <div id="demo1" class="collapse">
                                    <ol>
                                        <li>Enter a new church activity name in the textbox below eg Sunday service</li>
                                        <li>Alternatively you can add a list of church activity names by seperating each with comma
                                           e.g. Sunday service, Friday prayers, Retreat, Easter convention
                                        </li>
                                        <li>Click the add button when done. This will dismiss the modal form and immediately
                                           make activity name available for marking attendance.
                                        </li>
                                    </ol>
                                </div>

                                <div class="row mb-3 ml-2">
                                    <div class="col-sm-3 text-right text-blue pt-3" style="font-weight: 800">Enter activities</div>
                                    <div class="col-sm-9">
                                        <input type="text" id="textboxActivityNames" class="form-control" placeholder="enter new activties seperated by comma's" value="" />
                                        e.g Sunday service, Easter convention, Retreat, Training 
                                    </div>
                                </div>
                                <div class="row mb-3 ml-2">
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-3">
                                        <button class="form-control" onclick="new $rab.Attendance.Activity().AddDictionary(textboxActivityNames.value)">Add</button>
                                    </div>
                                </div>
                            </div>

                            <div id="branchProfile" class="tabcontent">
                                <i class="fa fa-info fa-lg" style="font-size: 20pt;"></i><a href="#" data-toggle="collapse" data-target="#demo">Click to see how to mark and unmark historic attendance</a>

                                <div id="demo" class="collapse">
                                    <ol>
                                        <li>To mark a member present/absent for a past event</li>
                                        <li>Select activity name and then select date.</li>
                                        <li>Click the view button to select Absentees(if you want to mark member present)
                                        or Attendees(if you want to mark member absent)
                                        </li>
                                        <li>In the list of names click the button mark/unmark to effect attendance</li>
                                    </ol>
                                </div>


                                <div class="row">
                                    <div class="col-sm-4">
                                        <select id="selectActivity" onchange="{$('#titleLoaded,#tbodyAbsentees, #tbodyActivitiestats').empty(); $rab.Attendance.LoadActivityDates('selectActivityDate',this.options[this.selectedIndex]);}" class="form-control">
                                            <option value="Select activity">Select activity name</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-4">
                                        <select id="selectActivityDate" class="form-control" onchange="{$('#titleLoaded, #tbodyAbsentees, #tbodyActivitiestats').empty()}">
                                            <option value="Select date">Select date</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-4">
                                        <%--<button >search</button>
                                           <input  type="button" class=" form-control" value="Search" />--%>
                                        <div class="dropdown">
                                            <button type="button" class="form-control dropdown-toggle" data-toggle="dropdown">
                                                View
                                            </button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#" onclick="{ $rab.Attendance.StartUp('Attendees'); }">Attendees</a>
                                                <a class="dropdown-item" href="#" onclick="{ $rab.Attendance.StartUp('Absentees'); }">Absentees</a>

                                            </div>
                                        </div>



                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <button type="button" class="form-control" data-toggle="collapse" data-target="#stats-1">Statistics</button>
                                        <div id="stats-1" class="collapse ">
                                            <table class="table">
                                                <thead>
                                                    <tr>

                                                        <th>Total </th>

                                                        <th>Children (0-12)</th>
                                                        <th>Teenage(13-19)</th>
                                                        <th>Young Adults(20-35)</th>
                                                        <th>Above 35</th>

                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyActivitiestats">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>


                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4 id="titleLoaded" style="color: red!important; text-align: center"></h4>
                                        <table id="tableAbsentees" class="table table-dark table-striped">

                                            <thead>

                                                <tr>

                                                    <th>Index</th>
                                                    <th>Full name</th>
                                                    <th colspan="2">Edit marked attendance</th>

                                                </tr>
                                            </thead>
                                            <tbody id="tbodyAbsentees">
                                            </tbody>
                                        </table>

                                    </div>

                                </div>

                            </div>

                            <div id="memberProfile" class="tabcontent">

                                <!--provide a way users can select all activities and view historic attendance-->
                                <div class="row">
                                    <div class="col-sm-3 p-3 text-right"><b>Activity Name</b></div>
                                    <div class="col-sm-3">
                                        <select class="form-control" id="selectactivityprofile" onchange=" $('#tbodyactivityprofile').empty();">
                                            <option value="Select activity">Select activity</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-2">
                                        <button class="mt-3 " onclick="$rab.Attendance.GetActivityProfile()">View</button>
                                    </div>
                                    <div class="col-sm-2">
                                        <button class="mt-3 " onclick="fnExcelReport('tableAttendanceHistory')">Export</button>
                                    </div>
                                    <iframe id="txtArea1" style="display: none"></iframe>
                                </div>
                                <div id="containertbodyactivityprofile" class="container">
                                    <table id="tableAttendanceHistory" class="table table-stripped table-responsive" style="background-color: #364e6f!important; color: white!important; width: 100%">
                                        <thead style="background-color: #364e6f!important; color: white!important;">
                                            <tr>
                                                <td>Date</td>
                                                <td>Children(0-12)</td>
                                                <td>Teenage(13-19)</td>
                                                <td>Young adults(20-35)</td>
                                                <td>Adults above 35</td>
                                                <td>MaleTotal</td>
                                                <td>FemaleTotal</td>
                                                <td>Total</td>
                                            </tr>
                                        </thead>
                                        <tbody id="tbodyactivityprofile"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close-attendance-panel">Close</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </section>

    <section class="modal-dialog-3" id="sectionkeyboard" style="display: none; margin-top: 0px;">
        <div class="container">
            <input type="text" class="form-control" id="textboxkeyboard" value="" readonly />
        </div>
        <div class="row mb-2">
            <div class="col-sm-1 keyboard">
                <button class="form-control">Q</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">W</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">E</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">R</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">T</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">Y</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">U</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">I</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">O</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">P</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">-</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">CLR</button>
            </div>

        </div>
        <div class="row mb-2">
            <div class="col-sm-2"></div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">A</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">S</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">D</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">F</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">G</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">H</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">J</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">K</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">L</button>
            </div>
            <div class="col-sm-1"></div>

        </div>
        <div class="row mb-2">
            <div class="col-sm-3"></div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">Z</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">X</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">C</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">V</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">B</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">N</button>
            </div>
            <div class="col-sm-1 keyboard">
                <button class="form-control">M</button>
            </div>

            <div class="col-sm-2"></div>
        </div>
    </section>
    <section class="footer3 cid-qBsDDF26RJ" id="footer3-9" data-rv-view="138" style="display: none">


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
    <%-- <script src="assets/script/AttendanceJS.js"></script>--%>
    <script src="assets/script/AttendanceJS.js"></script>
    <script src="assets/script/exportJS.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
        $(document).ready(function () {
            // $rab.Church.LoadBranches("selectBranchNames");
            $('#checkCovidAttend').click(function () {
                //var getAttendanceMarkModalCovid = document.getElementById('sectionCovid');
                //var getAttendanceMarkModalNoCovid = document.getElementById('sectionNoCovid');
                //if (this.checked) {
                //    getAttendanceMarkModalCovid.style.display = "block";
                //    getAttendanceMarkModalNoCovid.style.display = "none";
                //} else {
                //    getAttendanceMarkModalCovid.style.display = "none";
                //    getAttendanceMarkModalNoCovid.style.display = "block";
                //}
            })
            $("#textboxsearchstring").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#divAttendanceButtonContainer button").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
            $(".modal-dialog-3 button").each(function () {
                try {
                    this.onclick = function () {
                        if (this.innerHTML == "CLR") {
                            textboxsearchstring.value = "";
                            textboxkeyboard.value = "";
                            textboxsearchstring.focus();
                        } else {
                            textboxkeyboard.value = textboxkeyboard.value + this.innerHTML;
                            textboxsearchstring.value = textboxsearchstring.value + this.innerHTML;
                            textboxsearchstring.focus()
                        }
                        $(textboxsearchstring).trigger("keydown", { which: 50 });
                        $(textboxsearchstring).trigger('keyup');
                    }

                    //
                } catch (e) {

                }

            });

            $('#txtTemperature').keydown(function (e) {
                if (e.keyCode === 13 && this.length !== 0) {
                    $('#buttonMarkAttendance').click();
                    return false;
                }
            });
            //new $rab
            //    .Branch()
            //    .ApplyTableFilters([
            //        {
            //            textboxID: 'textboxsearchstring',
            //            tbodyID: 'tbodyMembers'
            //        },
            //        {
            //            textboxID: 'textboxRelationSearch',
            //            tbodyID: 'tbodyrelationtype'
            //        } 
            //    ]
            //    );

        });
    </script>
    <script>
        buttonMarker.click();
        function displayTab(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabpanel");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tabclass");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }
    </script>
    <script>
        linkkeyboard.onclick = function () {
            //when keyboard is clicked toggle keyboard
            var keyboard = document.getElementById("sectionkeyboard");
            if (keyboard.style.display == "none" || keyboard.style.display == "") {
                keyboard.style.display = "block";
                //keyboard.innerHTML="Keyboard on"
                $(".modal-dialog-h").hide();
                document.getElementById("linkkeyboard").innerHTML = "<span style='color:red'>Keyboard on</span>"
            } else {
                keyboard.style.display = "none"
                //keyboard.innerHTML = "Keyboard off"
                document.getElementById("linkkeyboard").innerHTML = "<span style='color:black'>Keyboard off</span>"
                $(".modal-dialog-h").show();
            }
        }
    </script>

    <style>
        .modal-dialog-3 input[type=text] {
            font-size: 22pt;
            font-weight: 800;
            text-align: center;
            background-color: white;
        }

        .checkCovid {
            width: 60px;
            height: 40px;
            margin-top: 5px;
        }

        .modal-dialog-3 {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: black;
            color: white;
            text-align: center;
        }

            .modal-dialog-3 button {
                background-color: #293956 !important;
                color: white !important;
                border-radius: 10px 12px
            }

        .buttonStyle {
            font-weight: 400;
            letter-spacing: 3px;
            font-size: 14pt;
            box-shadow: black 5px 5px;
            cursor: pointer !important;
            background-color: #293955 !important;
            color: white !important;
            /*animation: anim 4s;*/
        }

        @keyframes anim {
            0% {
                width: 0%;
            }

            100% {
                width: 100%;
            }
        }
    </style>
    <style>
        .textBoxFormatRep {
            display: inline-block;
            width: 15%;
            height: 40px;
            padding: 6px 12px;
            line-height: 1.42857143;
            color: black;
            background-color: khaki;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 10px;
            font-weight: 700;
            font-size: 20px;
            /*max-width: 280px;*/
        }
        /* Style the tab */
        .tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }

            /* Style the buttons inside the tab */
            .tab button {
                background-color: inherit;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                transition: 0.3s;
                font-size: 17px;
            }

                /* Change background color of buttons on hover */
                .tab button:hover {
                    background-color: #ddd;
                }

                /* Create an active/current tablink class */
                .tab button.active {
                    background-color: #ccc;
                }

        /* Style the tab content */
        .tabpanel, .tabcontent {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }

        html {
            background-color: #eeeeee !important;
        }
    </style>

</body>
</html>
