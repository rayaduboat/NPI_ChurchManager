<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Followup.aspx.cs" Inherits="Minister_Followup" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="Accounts">
    <title>Follow up</title>
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
                     
                </div>
            </div>
        </nav>
    </section>
    <section style="margin-top: 80px;">
        <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Follow up List</h2>
        <h3 class="mbr-section-subtitle mbr-fonts-style align-center pb-5 mbr-light display-5">List of all members followed up
        </h3>
        <div style="border: 1px solid #c9cbd1">
            <div class="m-2" style="background-color: #f6f1f1; border: 1px solid #d6dbe9">
                <button class="p-2" onclick="showTab('report')">Follow-up report</button>
                <button id="btnVisitationTab" class="p-2" onclick="showTab('settings')">Visitation log and report</button>
                <button class="p-2" onclick="showTab('comingsoon')">Follow-up concerns</button>
            </div>
            <div class="mr-2 ml-2">
                <div id="report">
                    <div class="container">
                        <h2 class="text-center">Follow-up report</h2>
                        <hr />


                       
                    </div>

                    <div class="container">
                        <div class="row">
                            <div class="col-sm-3">
                                <select style='margin-top: 15px' id="selectBranchNames" class="form-control" onchange="{$rab.Followup.LoadFollowedUpByBranch(this.value);}">
                                    <option>Select branch</option>

                                </select>
                            </div>
                            <div class="col-sm-3 text-left pt-3">
                                <input type="text" id="textboxsearchstring" class="form-control" style="background-color: white!important" value="" placeholder="enter search text" />
                            </div>
                            <div class="col-sm-6 ">
                                <button style='margin-top: 15px' id="buttonSearch" onclick="{ $rab.Followup.LoadFollowedUpByBranch(selectBranchNames.value); }">Load feedback</button>
                                <button style='margin-top: 15px' id="buttonActivityAbsentees" data-toggle="modal" data-target="#myModal">Absentees</button>
                                <button style='margin-top: 15px' id="buttonAttendees" data-toggle="modal" data-target="#myModal">Attendees</button>
                                <button style='margin-top: 15px' onclick="btnVisitationTab.click()">Visitation</button>

                            </div>



                            <script>
                                buttonAttendees.onclick = function () {
                                    buttonActivityAbsentees.click();
                                    //change the header and make the button aware to call only attendees
                                    roleCallModal.innerHTML = "Programme attendees dialog window"
                                    //empty the 
                                };
                                buttonActivityAbsentees.onclick = function () {
                                    roleCallModal.innerHTML = "Activity absentees dialog window"
                                }

                            </script>
                        </div>
                    </div>



                </div>
                <div id="settings" style="display: none"></div>
                <div id="comingsoon" style="display: none"></div>
            </div>
        </div>

        <script>
            function showTab(tabname) {
                try {
                    ["report", "settings", "comingsoon"].forEach(function (value, index) {
                        if (tabname == value) {
                            $("#" + value).show();
                            $("#" + value + "1").show();
                        } else {
                            $("#" + value).hide();
                            $("#" + value + "1").hide();
                        }
                    })
                } catch (e) {

                }
            }
        </script>
    </section>

    <section id="report1">

        <div class="container">

            <button type="button" class="form-control" data-toggle="collapse" data-target="#demo">Staticstics</button>
            <div id="demo" class="collapse">
                <!--stats shows here -->
                <table id="tablePurposeStatistics" class="table table-striped">
                    <thead>
                        <tr>
                            <th>Total logged       </th>
                            <th>Absent1week        </th>
                            <th>Absent2weeks       </th>
                            <th>Backslider         </th>
                            <th>HealthProgressCheck</th>
                            <th>Other              </th>
                        </tr>
                    </thead>
                    <tbody id="tbodyPurposeStatistics">
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-sm-12">

            <div class="table-responsive">
                <table id="tableLoggedFollowUps" class="table">
                    <thead>
                        <tr>
                            <th>Edit</th>
                            <th>Member</th>
                             <th>Activity name</th>
                             <th>Activity date</th>

                            <th>Purpose</th>
                            <th>Mode of contact</th>
                            <th>Date</th>
                            <th>Concerns</th>
                            <th>Minister informed</th>
                            <th>Support offered</th>
                            <th>Followed up by</th>
                            <th>Comment</th>

                        </tr>
                    </thead>
                    <tbody id="tbodyLoggedFollowups">
                    </tbody>
                </table>
            </div>
        </div>

    </section>
    <section id="settings1" style="display: none">
        <div class="container">
            <h2 class="text-center">Visitation Log and report</h2>
            <hr />
            
            <hr />
        </div>

        <div id="visitationLog" class="container">
            <div class="container">
                <div class="row" style="margin-bottom: 5px!important; margin-top: 10px;">
                    <div class="col-sm-2">
                        <label id="Label1" class="form-control-label">Member Name</label>
                    </div>
                    <div class="col-sm-8">
                        <select id="selectMemberNames" class="form-control">
                            <option value="Select member name">Select member name</option>
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <button id="myBtn">load</button>

                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row" style="margin-bottom: 5px!important">
                    <div class="col-sm-2">
                        <label id="Label2" class="form-control-label">Date of visit</label>
                    </div>
                    <div class="col-sm-3">
                        <input required placeholder="dd/mm/yyyy" maxlength="10" type='text' id="TextBoxDateOfVisit" class="form-control" required="required" />
                    </div>

                </div>
            </div>
            <div class="container">
                <div class="row" style="margin-bottom: 5px!important">
                    <div class="col-sm-2">
                        <label id="Label3" class="form-control-label">Visiting officers</label>
                    </div>
                    <div class="col-sm-8">
                        <input type='text' id="TextBoxVisitingOfficers" class="form-control" required="required" />
                    </div>

                </div>
            </div>
            <div class="container">
                <div class="row" style="margin-bottom: 5px!important">
                    <div class="col-sm-2">
                        <label id="Label4" class="form-control-label">Purpose</label>
                    </div>
                    <div class="col-sm-8">
                        <input type='text' id="TextBoxPurpose" class="form-control" required="required" />
                    </div>

                </div>
            </div>
            <div class="container">
                <div class="row" style="margin-bottom: 5px!important">
                    <div class="col-sm-2">
                        <label id="Label5" class="form-control-label">Support offered/donation</label>
                    </div>
                    <div class="col-sm-8">
                        <input type='text' id="TextBoxSupportOffered" class="form-control" required="required" />
                    </div>

                </div>
            </div>
            <div class="container">
                <div class="row" style="margin-bottom: 5px!important">
                    <div class="col-sm-2">
                        <label id="Label6" class="form-control-label">Comment</label>
                    </div>
                    <div class="col-sm-8">
                        <textarea cols="6" rows="6" class="form-control" id="textboxcomment"></textarea>


                    </div>

                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-4">
                        <input type='button' id="ButtonAddVisitation" onclick="{ $rab.Followup.AddVisitation() }"  value="Save" />
                        <button style='margin-top: 15px' id="buttonVisitationReport">View logged Report   </button>

                    </div>
                    <div class="col-sm-4"></div>
                </div>
            </div>
        </div>
        <div id="visitationReport" class="p-2 "></div>


    </section>
    <section id="comingsoon1" style="display: none">
        <div class="container">
            <h2 class="text-center">Follow-up concerns </h2>
            <hr />
            <button style='margin-top: 15px' onclick="$rab.Followup.Concerns()" id="buttonConcerns">Load concerns </button>
            <hr />
        </div>
        <div id="followupconcerns" class="container"></div>
    </section>
    <section>


        <!-- Trigger/Open The Modal -->

        <!-- The Modal -->
        <div id="myModalVisitation" class="modalvision">

            <!-- Modal content -->
            <div class="modalvision-content">
                <div class="modalvision-header">
                    <span class="modalvisionclose">&times;</span>
                    <h2>Visitation actioned window</h2>
                </div>
                <div class="modalvision-body">
                    <%--  <div id="visitationLog" class="container">
                        <div class="container">
                            <div class="row" style="margin-bottom: 5px!important; margin-top: 10px;">
                                <div class="col-sm-2">
                                    <label id="Label1" class="form-control-label">Member Name</label>
                                </div>
                                <div class="col-sm-8">
                                    <select id="selectMemberNames" class="form-control">
                                        <option value="Select member name">Select member name</option>
                                    </select>
                                </div>

                            </div>
                        </div>
                        <div class="container">
                            <div class="row" style="margin-bottom: 5px!important">
                                <div class="col-sm-2">
                                    <label id="Label2" class="form-control-label">Date of visit</label>
                                </div>
                                <div class="col-sm-3">
                                    <input required placeholder="dd/mm/yyyy" maxlength="10" type='text' id="TextBoxDateOfVisit" class="form-control" required="required" />
                                </div>

                            </div>
                        </div>
                        <div class="container">
                            <div class="row" style="margin-bottom: 5px!important">
                                <div class="col-sm-2">
                                    <label id="Label3" class="form-control-label">Visiting officers</label>
                                </div>
                                <div class="col-sm-8">
                                    <input type='text' id="TextBoxVisitingOfficers" class="form-control" required="required" />
                                </div>

                            </div>
                        </div>
                        <div class="container">
                            <div class="row" style="margin-bottom: 5px!important">
                                <div class="col-sm-2">
                                    <label id="Label4" class="form-control-label">Purpose</label>
                                </div>
                                <div class="col-sm-8">
                                    <input type='text' id="TextBoxPurpose" class="form-control" required="required" />
                                </div>

                            </div>
                        </div>
                        <div class="container">
                            <div class="row" style="margin-bottom: 5px!important">
                                <div class="col-sm-2">
                                    <label id="Label5" class="form-control-label">Support offered/donation</label>
                                </div>
                                <div class="col-sm-8">
                                    <input type='text' id="TextBoxSupportOffered" class="form-control" required="required" />
                                </div>

                            </div>
                        </div>
                        <div class="container">
                            <div class="row" style="margin-bottom: 5px!important">
                                <div class="col-sm-2">
                                    <label id="Label6" class="form-control-label">Comment</label>
                                </div>
                                <div class="col-sm-8">
                                    <textarea cols="6" rows="6" class="form-control" id="textboxcomment"></textarea>


                                </div>

                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-4">
                                    <input type='button' id="ButtonAddVisitation" onclick="{ $rab.Followup.AddVisitation() }" class="btn btn-secondary btn-secondary-outline" value="Save" />
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                        </div>
                    </div>
                    <div id="visitationReport" class="container">
                    </div>
                    <div id="followupconcerns" class="container">
                    </div>--%>
                </div>
                <div class="modalvision-footer">
                    <h3>AnthonyBobbie Limited ©copyright 2018</h3>
                </div>
            </div>

        </div>


    </section>
    <section class="modal-dialog-2">
        <!-- The Modal -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" id="roleCallModal">Absentee members dialog window</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="container">
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <select id="selectActivity" onchange="{ $rab.Followup.LoadActivityDates('selectActivityDate',this.options[this.selectedIndex]);}" class="form-control">
                                        <option value="Select activity">Select activity name</option>
                                    </select>
                                </div>
                                <div class="col-sm-4">
                                    <select id="selectActivityDate" class="form-control">
                                        <option value="Select date">Select date</option>
                                    </select>
                                </div>
                                <div class="col-sm-2">
                                    <input onclick="{ $rab.Followup.StartUp(); }" type="button" class=" form-control" value="Search" />
                                </div>
                                <div class="col-sm-2">
                                           <input type="button" class=" form-control" value="Feedback" onclick="{ $rab.Followup.CommentModal() }" />
 
                                </div>
                            </div>
                        </div>

                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <button type="button" class="form-control" data-toggle="collapse" data-target="#stats">Statistics</button>
                                    <div id="stats" class="collapse ">
                                        <table class="table">
                                            <thead>
                                                <tr>

                                                    <th>Age category</th>

                                                    <th>Children (0-12)</th>
                                                    <th>Teenage(13-19)</th>
                                                    <th>Young Adults(20-35)</th>
                                                    <th>Above 35</th>

                                                </tr>
                                            </thead>
                                            <tbody id="tbodystats">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <table id="tableAbsentees" class="table table-dark table-striped">
                                        <thead>
                                            <tr>
                                                <th>Index</th>
                                                <th>Full name</th>
                                                <th>Telephone</th>
                                                <th>Email</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbodyAbsentees">
                                        </tbody>
                                    </table>

                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <section>
                                    <span id="spanModalAbsentee" data-toggle="modal" data-target="#divAbseenteeWindow"></span>
                                    <!-- The Modal -->
                                    <div class="modal fade" id="divAbseenteeWindow">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title"><kbd>Feeback documentation window</kbd></h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>

                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <div class="form-vertical">

                                                        <div class="row mb-2">
                                                            <label class="col-sm-3 control-label">Full name(s)</label>
                                                            <div class="col-sm-9">
                                                                <input type="email" class="form-control" id="textboxMemberName" placeholder="Enter email">
                                                            </div>
                                                        </div>
                                                        <div class="row mb-2">
                                                            <label class="col-sm-3 control-label">Activity name</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" id="textboxActivityName" placeholder="Enter activity name">
                                                            </div>
                                                        </div>
                                                        <div class="row mb-2">
                                                            <label class="col-sm-3 control-label">Activity date</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" id="textboxActivityDate" placeholder="Enter activity date">
                                                            </div>
                                                        </div>
                                                        <div class="row mb-2">
                                                            <label class="col-sm-3 control-label">Purpose of contact</label>
                                                            <div class="col-sm-9">
                                                                <select id="selectPurposeOfContact" class="form-control">
                                                                    <option value="Select purpose of contact">Select purpose of contact</option>
                                                                    <option value="Absent for more than two weeks">Absent for one week </option>
                                                                    <option value="Absent for more than two weeks">Absent for more than two weeks</option>
                                                                    <option value="Backslider">Backslider</option>
                                                                    <option value="Health condition progress check">Health condition progress check</option>
                                                                    <option value="Other">Other</option>

                                                                </select>

                                                            </div>
                                                        </div>
                                                        <div class="row mb-2">
                                                            <label class="col-sm-3 control-label">Mode of Contact</label>
                                                            <div class="col-sm-9">
                                                                <select id="selectModeOfContact" class="form-control">
                                                                    <option value="Select mode of contact">Select mode of contact</option>
                                                                    <option value="Email">Email</option>
                                                                    <option value="Letter">Letter</option>
                                                                    <option value="No contact">No contact</option>
                                                                    <option value="Phone call">Phone call</option>
                                                                    <option value="Text message">Text message</option>
                                                                    <option value="Visitation">Visitation</option>
                                                                    <option value="Other">Other</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-2">
                                                            <label class="col-sm-3 control-label">Date of contact</label>
                                                            <div class="col-sm-5">
                                                                <input type="text" class="form-control" id="textboxfollowupDate" placeholder="dd/mm/yyyy">
                                                            </div>
                                                        </div>
                                                        <div class="row mb-2">
                                                            <label class="col-sm-3 control-label">Concerns</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" id="textboxConcerns" placeholder="Enter concern">
                                                            </div>
                                                        </div>
                                                        <div class="row mb-2">
                                                            <label class="col-sm-3 control-label">Minister informed</label>
                                                            <div class="col-sm-9">
                                                                <select id="selectMinisterInformed" class="form-control">
                                                                    <option value="Select item">Select item</option>
                                                                    <option value="Yes">Yes</option>
                                                                    <option value="No">No</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-2">
                                                            <label class="col-sm-3 control-label">Support offered</label>
                                                            <div class="col-sm-9">
                                                                <%--<select id="selectSupportOffered" class="form-control">
                                                                                <option value="Select support offered">Select support offered</option>
                                                                                <option value="Counselling">Counselling</option>

                                                                                <option value="Financial">Financial</option>

                                                                                <option value="Prayers">Prayers</option>

                                                                                <option value="Training">Training</option>
                                                                                <option value="Other">Other</option>
                                                                            </select>--%>

                                                                <div class="container">


                                                                    <div class="form-check form-check-inline">
                                                                        <label class="form-check-label">
                                                                            <input type="checkbox" data-support="Prayer" class="form-check-input" value="">Prayer
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-check form-check-inline">
                                                                        <label class="form-check-label">
                                                                            <input type="checkbox" data-support="Counselling" class="form-check-input" value="">Counselling
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-check form-check-inline">
                                                                        <label class="form-check-label">
                                                                            <input type="checkbox" data-support="Training" class="form-check-input" value="">Training
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-check form-check-inline">
                                                                        <label class="form-check-label">
                                                                            <input type="checkbox" data-support="Other" class="form-check-input" value="">Other
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="row mb-2">
                                                            <label class="col-sm-3 control-label">Followed up by</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" disabled class="form-control" id="textboxFollowedUpBy" placeholder="enter person who followed up">
                                                            </div>
                                                        </div>
                                                        <div class="row mb-2">
                                                            <label class="col-sm-3 control-label">Comment</label>
                                                            <div class="col-sm-9">
                                                                <textarea class="form-control" cols="6" rows="6" id="textboxFollowupComment"></textarea>


                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button id="buttonfeedbackUpdate" onclick="{ $rab.Followup.Update()}" type="button" class="btn btn-secondary">Update</button>
                                                    <button id="buttonfeedbackAdd" onclick="{ $rab.Followup.Submit()}" type="button" class="btn btn-secondary">Submit</button>
                                                    <button id="buttonDocumentationClose" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>

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
    <script src="assets/popper/popper.min.js"></script>
    <script src="assets/tether/tether.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/smooth-scroll/smooth-scroll.js"></script>
    <script src="assets/dropdown/js/script.min.js"></script>
    <script src="assets/touch-swipe/jquery.touch-swipe.min.js"></script>
    <script src="assets/theme/js/script.js"></script>
    <script src="assets/formoid/formoid.min.js"></script>
    <script src="assets/script/AccessJS.js"></script>
    <script src="assets/script/followup.js"></script>

     
    <style>
        button {
            cursor: pointer;
        }
        /* The Modal (background) */
        .modalvision {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            th: 100%; /* Full width  */
            height: 100%; /* 
        t
             overflow: auto e  scroll if needed *
            ackground color: rg
            allback color */
            -color: rgba( Black w o
        }


         
    </style>
    <style>
        input[type = text],input[type = date], textarea, select {
            background-color: white !important;
        }
    </style>
    <script>
        $("#textboxsearchstring").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#tbodyLoggedFollowups tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    </script>
</body>
</html>
