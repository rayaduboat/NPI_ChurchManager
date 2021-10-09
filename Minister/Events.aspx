<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Events.aspx.cs" Inherits="Minister_Events" %>

<!DOCTYPE html>

<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="Accounts">
    <title>Events</title>
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
    <link href="assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
   
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
                    <a onclick="new $rab.Initialise.Menus().Logout()" class=" " href="#">Log out<br>
                        <span class="">&nbsp;</span>
                    </a>
                </div>
            </div>
        </nav>
    </section>
    <section style="margin-top: 80px;">
        <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Events List</h2>
        <h3 class="mbr-section-subtitle mbr-fonts-style align-center pb-5 mbr-light display-5">List of all events organized 
        </h3>

        <div class="" style="margin-left: 10%; margin-right: 10%;">
            <div class="row">

                <div class="col-sm-12">
                    <div class="table-responsive">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="p-3" style="background-color: #d6dbe9!important">
        <button onclick='showTab("report")'>Add new events</button>
        <button onclick='showTab("details")'>Details</button>
        <button onclick='showTab("stats")'>Statistics</button>
        <script>
            function showTab(tabName) {
                ["report", "details", "stats"]
                    .forEach(function (value, index) {
                        if (tabName == value) {
                            $('#' + value).show();
                        } else {
                            $('#' + value).hide();
                        }
                    });
            }
        </script>
    </section>
    <section id='report'>
        <hr style="margin-top: -10px; padding: 0px;" />
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <select id="selectBranchNames" class="form-control" onchange="$rab.Branch.Events.LoadEvents(this.value)">
                        <option>Select branch</option>
                    </select>
                </div>
                <div class="col-sm-3">
                    <input type="button" id="LoadEvents" onclick="{ $rab.Branch.Events.LoadEvents(selectBranchNames.value); }" value="Load Events" />
                    <button onclick="fnExcelReport('tableEventListing')">Export</button>
                     <iframe id="txtArea1" style="display: none"></iframe>
                </div>
                <div class="col-sm-3">
                    <input type="text" id="textboxSearch" value="" placeholder="enter search string" class="form-control" />


                </div>
                <div class="col-sm-2">
                    <input type="button" id="buttonAdd" value="Add" onclick="{ $rab.Branch.Events.DisplayAddEventsWindow(); }" />
                </div>

            </div>
        </div>
        <hr style="margin-bottom: 5px; padding: 0px;" />
        <table id="tableEventListing" class="table table-striped table-responsive">
            <thead>
                <tr>
                    <th></th>
                    <th>Branch Name</th>
                    <th>Event Name</th>
                    <th>Purpose</th>
                    <th>Date</th>
                    <th>Location</th>
                    <th>Guest speaker</th>
                    <th>Presiding officer</th>
                    <th>Men count</th>
                    <th>Women count</th>
                    <th>Children count</th>
                    <th>Comment</th>
                    <th>Tithe and offering</th>
                    <th>Holy Spirit baptised</th>
                    <th>Souls won</th>
                    <th>Created on</th>
                    <th>Created By</th>
                </tr>
            </thead>
            <tbody id="tbodyEvents">
            </tbody>
        </table>
    </section>
    <section id='stats' style="display: none"></section>
    <section id='comingsoon' style="display: none"></section>

    <section id="modal-section-1">

        <!-- Button to Open the Modal -->
        <button id="buttonAddEventDialog" style="display: none" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModalDialog">
            Open modal
        </button>

        <!-- The Modal -->
        <div class="modal fade" id="addModalDialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title"><kbd>Add new event Window:</kbd>
                            <label id="errorLabel" style="color: red;"></label>
                        </h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">


                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Name<span style="color: red">*</span></label>
                            </div>
                            <div class="col-sm-5">

                                <select class="form-control" id="textboxName">
                                </select>
                            </div>
                            <div class="col-sm-2 pb-2">
                                <button title="Creates a new event filter" type="button" id="buttonAddEventFilter" class="form-control" data-toggle="collapse" data-target="#demo">New</button>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">

                                <div id="demo" class="collapse">
                                    <div class="row">
                                        <div class="col-sm-2">New event</div>
                                        <div class="col-sm-8">
                                            <input type="text" title="events should be entered eg xxx,xxxx,xxxx," placeholder="enter events seperated by comma.." class="form-control" id="textboxeventfilterlist" value="" />

                                        </div>
                                        <div class="col-sm-2">
                                            <button id="buttonaddfilter" class="form-control" onclick="new $rab.Branch.Events.Dictionary().AddDictionary(textboxeventfilterlist.value)">add</button>

                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Purpose<span style="color: red">*</span></label>
                            </div>
                            <div class="col-sm-10">
                                <%--  <input  type="text" id="textboxPurpose" name="name" value="" />--%>
                                <input class="form-control" type="text" id="textboxPurposes" value="" maxlength="250" placeholder="enter Purpose..." />
                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Date<span style="color: red">*</span></label>
                            </div>
                            <div class="col-sm-5">
                                <input class="form-control" maxlength="20" type="text" id="textboxDate" name="name" value="" placeholder="dd/mm/yyyy" />

                            </div>

                        </div>

                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Location<span style="color: red">*</span></label>
                            </div>
                            <div class="col-sm-5">
                                <input class="form-control" maxlength="50" type="text" id="textboxLocation" name="name" value="" placeholder="enter location..." />

                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Guest speaker (s)<span style="color: red">*</span></label>
                            </div>
                            <div class="col-sm-10">
                                <input class="form-control" maxlength="220" type="text" id="textboxGuestspeaker" name="name" value="" placeholder="enter guest speaker..." />

                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Presiding officer<span style="color: red">*</span></label>
                            </div>
                            <div class="col-sm-5">
                                <input class="form-control" maxlength="150" type="text" id="textboxPresidingofficer" name="name" value="" placeholder="enter presiding officer..." />

                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Men count<span style="color: red">*</span></label>
                            </div>
                            <div class="col-sm-5">
                                <input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" type="text" id="textboxMencount" name="name" value="" placeholder="enter men count..." />

                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Women count<span style="color: red">*</span></label>
                            </div>
                            <div class="col-sm-5">

                                <input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" type="text" id="textboxWomencount" name="name" value="" placeholder="enter women count..." />
                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Children count<span style="color: red">*</span></label>
                            </div>
                            <div class="col-sm-5">
                                <input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" type="text" id="textboxChildrencount" name="name" value="" placeholder="enter children count..." />
                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Tithe and offering<span style="color: red">*</span></label>

                            </div>
                            <div class="col-sm-5">
                                <input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" type="text" id="textboxtitheAndOffering" name="name" value="" placeholder="enter offering..." />
                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Holy Spirit baptised #<span style="color: red">*</span></label>

                            </div>
                            <div class="col-sm-5">
                                <input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" type="text" id="textboxHolySpiritBaptised" name="name" value="" placeholder="no. Holy spirit baptised..." />
                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Souls won<span style="color: red">*</span></label>
                            </div>
                            <div class="col-sm-5">
                                <input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" type="text" id="textboxsoulswon" name="name" value="" placeholder="enter souls won..." />
                            </div>

                        </div>





                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Comment</label>
                            </div>
                            <div class="col-sm-10">
                                <textarea cols="6" rows="6" class="form-control" id="textareaComment"></textarea>

                            </div>

                        </div>

                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">

                        <button style="display: none;" id="buttonUpdateEvent" type="button" onclick="{$rab.Branch.Events.Update(this)}" class="btn btn-secondary">Update</button>
                        <button id="buttonSubmitEvent" type="button" onclick="{$rab.Branch.Events.Add()}" class="btn btn-secondary">Submit</button>
                        <button type="button" id="buttonClose" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <section class="footer3 cid-qBsDDF26RJ" id="footer3-9" data-rv-view="138">


        <div class="container" style="margin-top: 5px">
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
    <script src="assets/script/branchEventJS.js"></script>
    <script src="assets/script/exportJS.js"></script>
    
    <script>
        $(document).ready(function () {
            $("#textboxSearch").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#tableEventListing tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
</body>
</html>
