<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WeeklyServiceReport.aspx.cs" Inherits="Minister_Events" %>

<!DOCTYPE html>

<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="Accounts">
    <title>Weekly service report</title>
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
                <div class="navbar-buttons mbr-section-btn">
                    <a onclick="new $rab.Initialise.Menus().Logout()" class=" " href="#">Log out<br>
                        <span class="">&nbsp;</span>
                    </a>
                </div>
            </div>
        </nav>
    </section>
    <section style="margin-top: 80px;">
        <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Weekly Service Report List</h2>
        <h3 class="mbr-section-subtitle mbr-fonts-style align-center pb-5 mbr-light display-5">List of all documented service reports 
        </h3>

    </section>
    <section style="margin-top: -10px!important">
        <div class="p-2" style="border: 1px solid rgba(0,0,0,0.2); background-color: #d6dbe9">
            <button id="report1button"  onclick="showTab('report1')"     class="p-1 flatbutton">Weekly service report</button>
            <button id="stats1button"  onclick="showTab('stats1')"      class="p-1 flatbutton">Monthly Report</button>
            <button id="comingsoon1button"  onclick="showTab('comingsoon1')" class="p-1 flatbutton">Monthly Statistics</button>

            <style>
                .flatbutton {
                    padding: 10px !important;
                    border: 1px none #d6dbe9;
                }

                    .activeButton {
                        background-color: rgb(0,0,0);
                        color: white;
                        font-weight: 700;
                    }
            </style>
            <script>
                function showTab(tabname) {
                    ['report1', 'stats1', 'comingsoon1']
                        .forEach(function (value, index) {
                            if (value == tabname) {
                                $("#" + value).show();
                                //apply flat style
                                document.getElementById(value+'button').classList.add('activeButton');
                            } else {
                                $("#" + value).hide();
                                //remove flat style
                                 document.getElementById(value+'button').classList.remove('activeButton');
                            }
                        });
                }
            </script>
        </div>
    </section>
    <section id="report1">
        <hr style="margin-top: 0px" />
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <select id="selectBranchNames" class="form-control" onchange="$('#tbodyWeeklyService').empty();$rab.Branch.LoadWeeklyService(selectBranchNames.value);">
                        <option value="Select branch">Select branch</option>
                    </select>
                </div>
                <div class="col-sm-2">
                    <input class="form-control" type="button" id="LoadWeeklyService" onclick="{ $rab.Branch.LoadWeeklyService(selectBranchNames.value); }" value="Load report" />
                    <input id="buttonmodalpopup" type="hidden" name="name" data-toggle="modal" data-target="#addModalDialog" />
                </div>
                <div class="col-sm-3">
                    <input type="text" id="textboxSearch" value="" placeholder="enter search string" class="form-control" />


                </div>
                <div class="col-sm-4 p-2">
                    <%--<input type="button" id="buttonAdd" value="Add"/>--%>
                    <button onclick="{ $rab.Branch.Modal(false) }">Add new service</button>
                    <%--<button onclick="{ $rab.WeeklyService.Statistics(); }">Offering statistics</button>--%>
                    <button onclick="fnExcelReport('tableEventListing')">Export</button>
                </div>

            </div>
        </div>

        <iframe id="txtArea1" style="display: none"></iframe>
        <hr />
        <div class="table-responsive">
            <table class="table" id="tableEventListing">
                <thead>
                    <tr>
                        <th></th>
                        <th>BranchName      </th>
                        <th>Service Date          </th>
                        <th id="thServiceName"> Service Name</th>
                        <th>Sermon Title           </th>
                        <th>Sermon Speaker         </th>
                        <th>Sermon Summary         </th>
                        <th>SoulsWon              </th>
                        <th>Holy Spirit Baptised    </th>
                        <th>Water Baptised         </th>
                        <th>Missionary Offering (£)    </th>
                        <th>Other              (£)   </th>
                        <th>Tithes             (£)   </th>
                        <th>Children         </th>
                        <th>Women            </th>
                        <th>Men               </th>
                        <th>Visitation actioned            </th>
                        <%--<th>CreatedBy             </th>--%>
                        <th>Delete             </th>

                    </tr>
                </thead>
                <tbody id="tbodyWeeklyService">
                </tbody>
            </table>
        </div>
    </section>
    <section id="stats1" style="display: none">
        <hr style="margin-top: 0px" />
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <select id="selectMonth" class="form-control">
                    </select>
                    <script>
                        var monthtext = ['Select Month', 'January', 'February', 'March',
                            'April', 'May', 'June', 'July', 'August', 'September',
                            'October', 'November', 'December'];
                        var select = document.getElementById('selectMonth');

                        for (var i = 0; i < monthtext.length; i++) {
                            try {
                                var option = document.createElement('option');
                                option.innerHTML = monthtext[i];
                                option.value = i
                                select.appendChild(option);

                            } catch (e) {

                            }
                        }
                    </script>
                </div>
                <div class="col-sm-2">

                    <select class="form-control" id="selectYear">
                        <option value="0">Select Year</option>
                        <option value="2018">2018</option>
                        <option value="2019">2019</option>
                        <option value="2020">2020</option>
                    </select>
                </div>
                <div class="col-sm-3">
                    <select id="selectBranch" class="form-control">
                        <option value="Select branch">Select branch</option>
                    </select>

                </div>
                <div class="col-sm-4 p-2">
                    <button style="padding: 10px;" onclick="{ new $rab.AddSearch().search(); }">Search</button>
                    <button style="padding: 10px;" onclick="fnExcelReport('tableAdvancedDetail')">Export</button>
                </div>
                <script>
                    var month = document.getElementById('selectMonth');
                    var year = document.getElementById('selectYear');
                    var branch = document.getElementById('selectBranch');
                    [month, year, branch].forEach(function (value, index) {
                        value.onchange = function () {
                            $('#tbodyAdvancedReport').empty();
                        }
                    });
                </script>
            </div>
        </div>
        <hr style="margin-top: 10px" />
        <div class="table-responsive">
            <table class="table" id="tableAdvancedDetail">
                <thead>
                    <tr>
                        <th></th>
                        <th>BranchName      </th>
                        <th>Service Date          </th>
                        <th>Service Name           </th>
                        <th>Sermon Title           </th>
                        <th>Sermon Speaker         </th>
                        <th>Sermon Summary         </th>
                        <th>SoulsWon              </th>
                        <th>Holy Spirit Baptised    </th>
                        <th>Water Baptised         </th>
                        <th>Missionary Offering (£)    </th>
                        <th>Other              (£)   </th>
                        <th>Tithes             (£)   </th>
                        <th>Children         </th>
                        <th>Women            </th>
                        <th>Men               </th>
                        <th>Visitation actioned            </th>
                        <%--<th>CreatedBy             </th>--%>
                        <th>CreatedOn             </th>

                    </tr>
                </thead>
                <tbody id="tbodyAdvancedReport">
                </tbody>
            </table>
        </div>

    </section>
    <section id="comingsoon1" style="display: none">
        <hr style="margin-top: 0px" />
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                </div>
                <div class="col-sm-2">
                </div>
                <div class="col-sm-3">
                </div>
                <div class="col-sm-4 p-2">
                    <button class="form-control" style="padding: 10px;" onclick="fnExcelReport('tableAdvancedStat')">Export</button>
                </div>

            </div>
        </div>
        <hr style="margin-top: 10px" />
        <table class="table" id="tableAdvancedStat">
            <thead>
                <tr>
                    <th></th>
                    <th>BranchName             </th>
                    <th>Month</th>
                    <th>Year</th>
                    <th>Missionary Offering (£)</th>
                    <th>Other              (£) </th>
                    <th>Tithes             (£) </th>
                    <th>SoulsWon        </th>
                    <th>WaterBaptised   </th>
                    <th>ChildrenCount   </th>
                    <th>WomenCount      </th>
                    <th>MenCount        </th>
                    <th>Visitation      </th>

                </tr>
            </thead>
            <tbody id="tbodyReportStats">
            </tbody>
        </table>

    </section>


    <section class="modal-section-1">

        <!-- Button to Open the Modal -->
        <button id="buttonAddEventDialog" style="display: none" type="button" class="btn btn-primary">
            Open modal
        </button>

        <!-- The Modal -->
        <div class="modal fade" id="addModalDialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title"><kbd>Weekly Service Report Window:</kbd>
                            <label id="errorLabel" style="color: red;"></label>
                        </h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="#/" method="post" data-form-title="Mobirise Form">

                            <div class="form-vertical">

                                <div class="row mb-2">
                                    <label class="control-label col-sm-2" for="pwd">Service Date:</label>
                                    <div class="col-sm-5">
                                        <input maxlength="10" type="text" required class="form-control" id="textboxDate" placeholder="dd/mm/yyyy" name="mydate">
                                        <label style="color: red;" id="labelValidateServicateDate"></label>
                                        <script>
                                            var textboxDate = document.getElementById("textboxDate");
                                            textboxDate.onkeyup = function () {

                                                if (this.value.toString().length != 10) {
                                                    labelValidateServicateDate.innerHTML = "Invalid date, expected dd/mm/yyyy";

                                                }
                                                else if (this.value.toString().indexOf('/') == -1) {
                                                    labelValidateServicateDate.innerHTML = "Invalid date, expected dd/mm/yyyy";

                                                }
                                                else if (this.value.toString().split('/').length != 3) {
                                                    labelValidateServicateDate.innerHTML = "Invalid date, expected dd/mm/yyyy";

                                                }
                                                else if (!isFinite(this.value.toString().split('/')[0])) {
                                                    labelValidateServicateDate.innerHTML = "Invalid date, expected dd/mm/yyyy";

                                                }
                                                else if (!isFinite(this.value.toString().split('/')[1])) {
                                                    labelValidateServicateDate.innerHTML = "Invalid date, expected dd/mm/yyyy";

                                                }
                                                else if (!isFinite(this.value.toString().split('/')[2])) {
                                                    labelValidateServicateDate.innerHTML = "Invalid date, expected dd/mm/yyyy";

                                                }
                                                else {
                                                    labelValidateServicateDate.innerHTML = "";
                                                }
                                            }
                                        </script>
                                    </div>

                                    <label class="control-label col-sm-2" for="pwd">Men Count:</label>
                                    <div class="col-sm-2">
                                        <input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" required class="form-control" id="textBoxMenCount">
                                    </div>


                                </div>


                                <div class=" row mb-2">
                                    <label class="control-label col-sm-2" for="pwd">Women Count:</label>
                                    <div class="col-sm-5">
                                        <input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" required class="form-control" id="textBoxWomenCount">
                                    </div>

                                    <label class="control-label col-sm-2" for="pwd">Children Count:</label>
                                    <div class="col-sm-2">
                                        <input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" class="form-control" id="textBoxChildrenCount">
                                    </div>


                                </div>
                                <div class=" row mb-2">
                                    <label class="control-label col-sm-2" for="pwd">Service name:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="textBoxServiceName">
                                    </div>
                                </div>
                                <div class=" row mb-2">
                                    <label class="control-label col-sm-2" for="pwd">Speaker:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="textBoxSermonSpeaker">
                                    </div>
                                </div>
                                <div class=" row mb-2">
                                    <label class="control-label col-sm-2" for="pwd">Sermon Title:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="textBoxSermonTitle">
                                    </div>
                                </div>
                                <div class=" row mb-2">
                                    <label class="control-label col-sm-2" for="pwd">Sermon Summary:</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="textBoxSermonSummary" rows="6" cols="6"></textarea>
                                    </div>
                                </div>
                                <div class=" row mb-2">
                                    <label class="control-label col-sm-2" for="pwd">Tithes(£):</label>
                                    <div class="col-sm-4">
                                        <input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" placeholder="0.00" class="form-control" id="textBoxTithes" title="Tithes offering entered as a number, input 0 if none">
                                    </div>

                                    <label class="control-label col-sm-2" for="pwd">Missionary Offering(£):</label>
                                    <div class="col-sm-4">
                                        <input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" placeholder="0.00" class="form-control" id="textBoxMissionaryOffering" title="Missionary offering entered as a number, input 0 if none">
                                    </div>

                                </div>

                                <div class=" row mb-2">

                                    <label class="control-label col-sm-2" for="pwd" title="Other offering entered as a number, input 0 if none">Other:</label>
                                    <div class="col-sm-10">
                                        <div class="row">

                                            <div class="col-sm-3">Other offering(£)<input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="0.00" type="text" class="form-control" id="textBoxOther" value="" title="Other offering entered as a number, input 0 if none" /></div>

                                            <div class="col-sm-5">Specify(description of offering)<input type="text" class="form-control" id="textBoxSpecify" value="" /></div>
                                        </div>
                                    </div>
                                </div>
                                <div class=" row mb-2">
                                    <label class="control-label col-sm-2" for="pwd">Souls won</label>
                                    <div class="col-sm-3">
                                        <input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" required class="form-control" id="textBoxSoulsWon">
                                    </div>

                                    <label class="control-label col-sm-2" for="pwd">Holy baptised:</label>
                                    <div class="col-sm-2">
                                        <input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" class="form-control" id="textBoxHolySpiritBaptised">
                                    </div>


                                </div>
                                <div class=" row mb-2">
                                    <label class="control-label col-sm-2" for="pwd">Water baptised</label>
                                    <div class="col-sm-3">
                                        <input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" required class="form-control" id="textBoxWaterBaptised">
                                    </div>
                                </div>
                                <div class=" row mb-2">
                                    <label class="control-label col-sm-2" for="pwd">Visitation actioned :</label>
                                    <div class="col-sm-3">
                                        <input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" class="form-control" id="textBoxVisitation" />
                                    </div>
                                </div>
                                <div class=" row mb-2">
                                    <label class="control-label col-sm-2" for="pwd">Names and Telephones numbers of New Member/visitors:</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="textBoxNewMembers" rows="6" cols="6"></textarea>
                                    </div>
                                </div>

                                <div class=" row mb-2">
                                    <label class="control-label col-sm-2" for="pwd">Names of members who have been absent for 2 weeks or more:</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="textBoxAbsentTwoWeeks" rows="6" cols="6"></textarea>
                                    </div>
                                </div>

                                <div class=" row mb-2">
                                    <label class="control-label col-sm-2" for="pwd">Bible studies teaching topic and general response: No.:</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="textBoxBibleStudyTopic" rows="6" cols="6"></textarea>
                                    </div>
                                </div>

                                <div class=" row mb-2">
                                    <label class="control-label col-sm-2" for="pwd">Midweek Service attendance and service summary: :</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="textBoxMidWeek" rows="6" cols="6"></textarea>
                                    </div>
                                </div>
                                <div class=" row mb-2">
                                    <label class="control-label col-sm-2" for="pwd">Key information that the district minister needs to know (e.g. spectacular event, Holy Spirit baptism, etc): N/A :</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" rows="10" cols="6" id="textBoxKeyInformation"></textarea>
                                    </div>
                                </div>
                                <div class=" row mb-2">
                                    <label style="background-color: dimgrey" class="control-label col-sm-2" for="pwd">Created By :</label>
                                    <div class="col-sm-3">
                                        <label class="form-control" onload="this.innerHTML=$rab.Login.User.MemberID" id="labelCreatedBy"></label>
                                    </div>
                                </div>
                                <div class=" row mb-2">
                                    <label style="background-color: dimgrey" class="control-label col-sm-2" for="pwd">Created On :</label>
                                    <div class="col-sm-3">
                                        <label class="form-control" onload="this.innerHTML=$rab.Login.User.MemberID" id="labelCreatedOn"></label>
                                    </div>
                                </div>
                            </div>

                        </form>

                        <!-- End Grid -->
                        <div class="modal-footer">

                            <button id="buttonSubmitUpdate" type="submit" onclick="{new $rab.Branch.WeeklyService().Update()}" class="btn btn-secondary">Update</button>
                            <button id="buttonSubmitAdd" type="submit" onclick="{new $rab.Branch.WeeklyService().Add()}" class="btn btn-secondary">Submit</button>
                            <button role="button" type="submit" id="buttonClose" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>


                </div>
            </div>

            <!-- Modal footer -->


        </div>

    </section>
    <section class="modal-dialog-2">
        <!-- The modalWeeklyService -->
        <div id="mymodalWeeklyService" class="modalWeeklyService">

            <!-- modalWeeklyService content -->
            <div class="modalWeeklyService-content">
                <div class="modalWeeklyService-header">
                    <span class="modalWeeklyServiceclose">&times;</span>
                    <h2>Weekly service window</h2>
                </div>
                <div class="modalWeeklyService-body">
                    <div id="tablecontainer"></div>
                </div>
                <div class="modalWeeklyService-footer">
                    <h3>AnthonyBobbie Limited</h3>
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
    <script src="assets/script/weeklyserviceJS.js"></script>
    <script src="assets/script/exportJS.js"></script>
    <style>
        /* The modalWeeklyService (background) */
        .modalWeeklyService {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* modalWeeklyService Content */
        .modalWeeklyService-content {
            position: relative;
            background-color: #fefefe;
            margin: auto;
            padding: 0;
            border: 1px solid #888;
            width: 80%;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
            -webkit-animation-name: animatetop;
            -webkit-animation-duration: 0.4s;
            animation-name: animatetop;
            animation-duration: 0.4s
        }

        /* Add Animation */
        @-webkit-keyframes animatetop {
            from {
                top: -300px;
                opacity: 0
            }

            to {
                top: 0;
                opacity: 1
            }
        }

        @keyframes animatetop {
            from {
                top: -300px;
                opacity: 0
            }

            to {
                top: 0;
                opacity: 1
            }
        }

        /* The Close Button */
        .modalWeeklyServiceclose {
            color: white;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .modalWeeklyServiceclose:hover,
            .modalWeeklyServiceclose:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

        .modalWeeklyService-header {
            padding: 2px 16px;
            background-color: #293955;
            color: white;
        }

        .modalWeeklyService-body {
            padding: 2px 16px;
        }

        .modalWeeklyService-footer {
            padding: 2px 16px;
            background-color: #293955;
            color: white;
        }
    </style>

    <script>
        $(document).ready(function () {
                $("#textboxSearch").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#tbodyWeeklyService tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
    </script>
</body>
</html>
