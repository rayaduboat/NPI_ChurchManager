<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MembershipList.aspx.cs" Inherits="Minister_MembershipList" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="MembershipList">
    <title>MembershipList</title>
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
    <script src="assets/lib/fileloader.js"></script>
    <style>
        body, html {
            width: 100%
        }
    </style>

</head>
<body onclick="new $rab.menu().clear_context()" style="background-color: rgba(8, 0, 0, 0.70)">

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
                            <i class="fa fa-home fa-lg"></i>
                            Home 
                        </a>
                    </li>
                    <li class="nav-item" onclick="new $rab.Initialise.Menus().Logout()">

                        <a class="nav-link link text-white display-4">
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
    <section class="section-table cid-qBsl1UHSIu" id="table1-0" style="width: 100%">


        <div class="container-fluid container-table">
            <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Membership List</h2>
            <h3 class="mbr-section-subtitle mbr-fonts-style align-center pb-5 mbr-light display-5">List of members 
            </h3>
            <input type="hidden" id="buttonmodalpopup" data-toggle="modal" data-target="#myNewMemberModal" />
            <div class="">


                <div class="container-fluid scroll">

                    <div class="tab">
                        <button class="tablinks" onclick="activatePanel(event, 'Membership')" id='defaultOpen'>Membership</button>
                        <button id="buttonTabManagement" class="tablinks" onclick="activatePanel(event, 'Management')">Login Accounts</button>
                        <button id="buttonTabRelation" class="tablinks" onclick="activatePanel(event, 'Relation')">Relationships</button>
                        <button id="buttonTabCellGroups" class="tablinks" onclick="activatePanel(event, 'CellGroups')">Cell Groups</button>
                        <button id="buttonTabMassUpdate" class="tablinks" onclick="activatePanel(event, 'MassUpdate')">Masss update</button>

                    </div>

                    <div id="Membership" class="tabcontent">

                        <div class="container-fluid" style="margin-top: 50px!important">

                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="dropdown">
                                        <button id="buttonActivtateMemberUpdate" type="button" class="dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-user fa-lg"></i>Member update
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="#" onclick="{new $rab.Membership.Upate().activate()}" title="tool tip" data-toggle="popover" data-trigger="hover" data-content="Click to activate member update page">Activate</a>
                                            <a class="dropdown-item" href="#" onclick="{new $rab.Membership.Upate().deactivate()}" title="tool tip" data-toggle="popover" data-trigger="hover" data-content="Click to de-activate member update page">Deactivate</a>
                                            <a class="dropdown-item" href="#" onclick="{new $rab.Membership.Upate().launch()}" title="tool tip" data-toggle="popover" data-trigger="hover" data-content="Click to launch member update page">Launch page</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-5">

                                    <i class="fa fa-info-circle fa-lg"></i><a href="#" data-toggle="collapse" data-target="#help-membership">Click to show help on how to use membership</a>
                                    <div id="help-membership" class="collapse">
                                        <ol>
                                            <li>Select a branch, then select membership type,table will show list of members by type selected</li>
                                            <li>Filter list by entering either member first name or lastname in the textbox</li>
                                            <li>Manage settings by clicking button <i class="fa fa-info-circle fa-lg"></i></li>
                                            <li>In settings you can add filters for membership type and also member titles etc. </li>
                                            <li>Click export button to export membership list. Export will export data unfiltered. When prompted to save, select location and enter new name of file with a ".xls" extension. example membership.xls</li>
                                        </ol>
                                    </div>


                                </div>

                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <select id="selectBranchNames" class="form-control" onchange="$rab.Membership.GetMembersV2()">
                                        <option selected value="Please select branch">Please select branch</option>

                                    </select>

                                </div>
                                <div class="col-sm-3">

                                    <div class="row">
                                        <div class="col-sm-8">
                                            <select class="form-control" id="selectViewMembershipType" onchange="$rab.Membership.GetMembersV2()">
                                                <option value="Select membership type">Select membership type</option>
                                                <option selected value="Member">Member</option>
                                                <option value="Non-member">Visitor</option>
                                                <%--<option   value="Members">Statistics</option>--%>
                                            </select>
                                        </div>
                                        <div class="col-sm-4">
                                            <button id="buttonRefresh" title="tooltip" data-toggle="popover" data-trigger="hover" data-content="Click to refresh membership type filter, if your selection is not available, click settings button to create it" onclick="new $rab.Membership.Filters().Refresh()"><i class="fa fa-refresh fa-lg"></i></button>
                                        </div>

                                    </div>


                                </div>
                                <div class="col-sm-1 pt-2">
                                </div>
                                <div class="col-sm-2">
                                    <div class="dropdown pt-2">
                                    </div>


                                </div>


                                <div class="col-sm-1 pt-2">
                                    <%--<button id="buttonExportMembership" class="" onclick="fnExcelReport('tableMemberListing')">export</button>--%>
                                </div>

                            </div>

                            <div class="row">

                                <div class="col-sm-9">
                                    <div class="btn-group">
                                        <button onclick="{ $rab.Membership.Modal(false);}" class="m-2">Add member</button>
                                        <button onclick="new $rab.Membership.Tablebuttons().display('UpdateButton')" data-manage="Update" type="button" class="m-2">Update</button>
                                        <button onclick="new $rab.Membership.Tablebuttons().delete()" style="color: red" class="m-2"><i class="fa fa-recycle"></i>Delete</button>

                                        <button onclick="new $rab.Membership.Columns().displayDialog()" class="m-2">More headings</button>
                                        <button onclick="new $rab.Membership.Tablebuttons().display('FollowUpButton' )" data-manage="Family" type="button" class="m-2">Family</button>
                                        <button onclick="new $rab.Membership.Tablebuttons().display('GroupsButton'   )" data-manage="Groups" type="button" class="m-2">Groups</button>
                                        <button onclick="new $rab.Membership.Tablebuttons().display('TransfersButton')" data-manage="Transfer" type="button" class="m-2">Transfer</button>
                                        <button class="m-2" onclick="new $rab.Membership.Settings().displayDialog()" id="buttonSettings"><i class="fa  fa-spinner fa-lg"></i>Settings</button>
                                        <button class="m-2" title="tool tip" data-toggle="popover" data-trigger="hover" data-content="Click to export to Microsoft Excel, ONLY supported in Google Chrome" id="buttonExportMembership" onclick="fnExcelReport('tableMemberListing')"><i class="fa fa-envelope-square fa-lg"></i>Export</button>
                                        <button class="m-2" title="tool tip" data-toggle="popover" data-trigger="hover" data-content="Click to import membership data" id="buttonImportMembership"><i class="fa  fa-long-arrow-down fa-lg"></i>Import</button>

                                        <button class="m-2" title="tool tip" data-toggle="popover" data-trigger="hover" data-content="Click to show ONLY membership statistics" onclick="{$rab.Membership.Statistics();}"><i class="fa fa-dashboard fa-lg"></i>Statistics</button>
                                        <button class="m-2" onclick="new $rab.Membership.Reports().getBirthdays()" title="tool tip" data-toggle="popover" data-trigger="hover" data-content="Click to show ONLY membership statistics"><i class="fa fa-dashboard fa-lg"></i>View birthdays</button>

                                        <iframe id="txtArea1" style="display: none"></iframe>

                                    </div>
                                </div>
                                <script>
                                    buttonImportMembership.onclick = function () {
                                        $(buttonSettings).click();
                                        $("#buttonSettingsRelationships").click();
                                    }

                                </script>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" style="background-color: white!important;" id="textboxsearchstring" name="findText" value="" placeholder="enter search string" />
                                </div>
                            </div>

                        </div>
                        <table class="table table-hover table-responsive" id="tableMemberListing">

                            <thead>
                                <tr id="trheader">
                                    <th class="head-item mbr-fonts-style display-7 text-center" style="color: red!important; font-size: 14pt">View
                                    </th>
                                    <th class="head-item mbr-fonts-style display-7">Personal ID
                                    </th>
                                    <th class="head-item mbr-fonts-style display-7">Last Name
                                    </th>
                                    <th class="head-item mbr-fonts-style display-7">First Name
                                    </th>
                                    <th class="head-item mbr-fonts-style display-7">Gender
                                    </th>
                                    <th class="head-item mbr-fonts-style display-7">Telephone
                                    </th>
                                    <th class="head-item mbr-fonts-style display-7">Email  
                                    </th>
                                    <th class="head-item mbr-fonts-style display-7">Age Grouping
                                    </th>
                                    <th class="head-item mbr-fonts-style display-7">Age Category
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="tbodyMembers" onclick="new $rab.menu().clear_context()" oncontextmenu="new $rab.menu(event).display();">
                            </tbody>
                        </table>

                    </div>

                    <div id="Management" class="tabcontent">
                        <h4 class="jumbotron align-center">Create member login account</h4>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-4">
                                    <a style="margin: 30px" href="#" data-toggle="collapse" data-target="#help-accounts">Click to show help</a>
                                </div>
                                <div class="col-sm-4">
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                        </div>
                        <hr />
                        <div id="help-accounts" class="collapse">
                            <ol>
                                <li>On the Membership tab, select branch(if SuperUser) and load members</li>
                                <li>Create an email address for member if he hasnt already got one</li>
                                <li>On this page click the load members button below to load members</li>
                                <li>Enter their name in the search textbox below to filter for member name</li>
                                <li>Select the login type( either Member or Presbyter)</li>
                                <li>Enter Password and confirm entered password in the adjacent textboxes</li>
                                <li>Click the create button to create login account.</li>
                                <li>Click on the add button in the in the Page column to pop up the page addition window</li>
                                <li>Check the boxes for the pages you want to assign.</li>
                                <li>Finally logout and login with created account and check permission  to confirm the setup was successful</li>
                            </ol>
                        </div>


                        <div class="container">
                            <div class="row">
                                <div class="col-sm-2 text-right" style="font-weight: 600">Member names</div>
                                <div class="col-sm-4">

                                    <input id="textboxAdminName" type="text" class="form-control" placeholder="enter name..." />
                                </div>
                                <div class="col-sm-4">

                                    <button onclick="new $rab.memberAccounts().build()"><i class="fa fa-refresh"></i>load members</button>
                                    <button onclick="$('#defaultOpen').click()"><i class="fa fa-refresh"></i>Goto membership</button>

                                </div>
                            </div>
                        </div>
                        <hr />
                        <table class="table table-stripped table-responsive">
                            <thead>
                                <tr>

                                    <th>LastName</th>
                                    <th>FirstName</th>
                                    <th>LoginType</th>
                                    <th>Password</th>
                                    <th>ConfirmPassword</th>
                                    <th colspan="3">Action</th>

                                </tr>
                            </thead>
                            <tbody id="tbodyAccountMembers">
                            </tbody>
                        </table>
                    </div>
                    <div id="Relation" class="tabcontent">
                        <h4 class="jumbotron align-center">Create member relationships</h4>

                        <div class="container">
                            <div class="row">
                                <div class="col-sm-4">
                                    <i class="fa fa-info-circle fa-lg"></i><a href="#" data-toggle="collapse" data-target="#demorelation">Click to show help</a>
                                </div>
                                <div class="col-sm-4">
                                    <button onclick="$('#defaultOpen').click()"><i class="fa fa-refresh"></i>Goto membership</button>
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                        </div>

                        <div id="demorelation" class="collapse">
                            To create a relationship please follow the steps
                            <ol>
                                <li>Select a member name</li>
                                <li>Select a relative branch, this will populate table with list of members in that branch</li>
                                <li>Search for relative name in the search text box</li>
                                <li>Select the relationship type in the relation type column</li>
                                <li>Click relate button to relate.</li>
                            </ol>
                        </div>
                        <hr />
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-2 text-right pt-2" style="font-weight: 600; font-size: 12pt;">Member name</div>
                                <div class="col-sm-3">
                                    <select class="form-control" id="selectRelationMember">
                                        <option value="Select member name">Select member name</option>
                                    </select>
                                </div>
                                <div class="col-sm-2 text-right pt-2">
                                    <label class="font-weight-bold">Relative branch</label>

                                </div>
                                <div class="col-sm-2">
                                    <select onchange="new $rab.Membership.Relatives().LoadMemberRelativesNames();" id="selectRelativeBranch" class="form-control">
                                        <option value="Select branch">Select branch</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" id="textboxRelationSearch" class="form-control" placeholder="enter name" value="" />

                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <table class="table table-stripped table-responsive">
                                <thead>
                                    <tr>
                                        <th>Member ID</th>
                                        <th>LastName</th>
                                        <th>FirstName</th>
                                        <th>RelationType</th>
                                        <%--<th>YouAreRelatedAs</th>--%>
                                        <%--<th>RelativeLocation</th>--%>
                                        <%--<th>RelativeBranch</th>--%>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="tbodyrelationtype">
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div id="CellGroups" class="tabcontent">
                        <h4 class="jumbotron align-center">Create Branch Cell Groups</h4>

                        <div class="container">
                            <div class="row">
                                <div class="col-sm-4">
                                    <i class="fa fa-info-circle fa-lg"></i><a href="#" data-toggle="collapse" data-target="#demoCellGroups">Click to show help</a>
                                </div>
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4"></div>
                            </div>
                        </div>
                        <hr />
                        <div class="collapse" id="demoCellGroups">
                            <ol>
                                <li>To assign a member to a cell group, group must exist</li>
                                <li>To create group you must be a user with FinanceAdmin/SuperUser permission</li>
                                <li>Goto Membership tab and click on settings, Click the Cell group tab</li>
                                <li>Follow the instruction on the tab to create group</li>
                                <li>Come back to this page and click load members button to load members </li>
                                <li>Type in the member name in the search box to filter </li>
                                <li>Enter all required fields and click on button join cell to join member</li>
                                <li>Member is now related to the group and can be viewed from the membership page</li>
                            </ol>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-2  pt-2" style="font-weight: 600">Member name </div>
                                <div class="col-sm-4">
                                    <input id="textboxsearchcellgroups" type="text" placeholder="enter search name" class="form-control" name="name" value="" />
                                </div>
                                <div class="col-sm-6 pt-2">
                                    <button onclick="new $rab.cellgroups().build()"><i class="fa fa-refresh fa-lg"></i>Load members</button>
                                    <button onclick="$('#defaultOpen').click()"><i class="fa fa-refresh"></i>Goto membership</button>

                                </div>

                            </div>
                        </div>

                        <table class="table  table-stripped table-responsive">
                            <thead>
                                <tr>
                                    <th>MemberID</th>
                                    <th>FirstName</th>
                                    <th>LastName</th>
                                    <th>GroupName </th>
                                    <th>Meeting Location </th>
                                    <th>Role </th>
                                    <th>Meeting day </th>
                                    <th>Time </th>
                                    <th>DateJoined </th>
                                    <th>IsActive </th>
                                    <th>Action </th>


                                </tr>
                            </thead>
                            <tbody id="tbodycellgroups">
                            </tbody>
                        </table>


                    </div>
                    <div id="Transfers" class="tabcontent">
                        <h3>Transfers</h3>
                        <hr />
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-2  pt-2 p-2" style="font-weight: 600">Member name </div>
                                <div class="col-sm-4">
                                    <input type="text" placeholder="enter search name" class="form-control" name="name" value="" />
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                        </div>
                        <div class="container">
                            <table class="table  table-stripped table-responsive">
                                <thead>
                                    <tr>

                                        <th>FirstName</th>
                                        <th>LastName</th>
                                        <th>TransferMode </th>
                                        <th>TransferType </th>
                                        <th>ToBranch </th>
                                        <th>FromBranch </th>

                                        <th>TransferDate </th>
                                        <th>Action</th>




                                    </tr>
                                </thead>
                                <tbody id="tbodytransfer">
                                    <tr>

                                        <td>Joe</td>
                                        <td>Rivers</td>
                                        <td>
                                            <select>
                                                <option>Select mode</option>
                                                <option selected="selected">incoming</option>
                                                <option>outgoing</option>
                                            </select>
                                        </td>
                                        <td>
                                            <select>
                                                <option>Select type</option>
                                                <option>internal</option>
                                                <option selected="selected">external</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="button" value="select branch" />
                                        </td>
                                        <td>
                                            <input type="button" value="select branch" />
                                        </td>

                                        <td>
                                            <input type="text" placeholder="dd/mm/yyyy" />
                                        </td>
                                        <td>
                                            <button>transfer</button></td>



                                    </tr>
                                </tbody>
                            </table>
                        </div>



                    </div>

                    <div id="MassUpdate" class="tabcontent">

                        <hr />
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-3 pt-3" style="font-size: 14pt; font-weight: 600">
                                    Enter search string 

                                </div>
                                <div class="col-sm-3">
                                    <input id="textboxMassupdatesearch" type="text" class="form-control" placeholder="enter search ...." />

                                </div>
                                <div class="col-sm-6  ">
                                    <button onclick=" new $rab.MassUpate().buildTable()">Load members</button>
                                    <button onclick="$('#defaultOpen').click()"><i class="fa fa-refresh"></i>Goto membership</button>

                                </div>

                            </div>
                        </div>

                        <table class="table table-stripped table-responsive">
                            <thead>
                                <tr>

                                    <th>..</th>

                                    <th>Title        </th>

                                    <th>FirstName    </th>
                                    <th>LastName     </th>
                                    <th>Address1     </th>
                                    <th>Address2     </th>
                                    <th>PostCode     </th>
                                    <th>Town         </th>
                                    <th>Email        </th>
                                    <th>DOB          </th>
                                    <th>Country      </th>
                                    <th>Status       </th>
                                    <th>Telephone    </th>
                                    <th>AgeCategory  </th>
                                    <th>Comment      </th>
                                    <th>Gender       </th>
                                    <th>CountryOfNationality  </th>
                                    <th>MaritalStatus</th>
                                    <th>Profession   </th>
                                    <th>Ethnicity    </th>

                                </tr>
                            </thead>
                            <tbody id="tbodyMassUpdate">
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <div class="p-1" id="context-menu-table" style="box-shadow: 3px 4px #293956; background-color: white; width: 240px; position: absolute; height: 300px; left: -1000px; top: -1000px">
        <div class="list-group">
            <a href="#" style='padding: 3px!important' onclick="{ $rab.Membership.Modal(false);}" class="list-group-item list-group-item-action"><i class="p-1 fa fa-plus-square fa-lg"></i>Add new member</a>
            <a href="#" style='padding: 3px!important' onclick="new $rab.Membership.Tablebuttons().display('UpdateButton')" class="list-group-item list-group-item-action"><i class="p-1 fa fa-upload fa-lg"></i>Update details</a>
            <a href="#" style='padding: 3px!important' onclick="new $rab.Membership.Tablebuttons().delete()" class="list-group-item list-group-item-action"><i class="p-1 fa fa-recycle fa-lg"></i>Delete</a>
            <a href="#" style='padding: 3px!important' onclick="new $rab.memberAccounts().build();$('#buttonTabManagement').click()" class="list-group-item list-group-item-action"><i class="p-1 fa fa-lock fa-lg"></i>Assign login account</a>
            <a href="#" style='padding: 3px!important' onclick="" class="list-group-item list-group-item-action"><i class="p-1 fa fa-history fa-lg"></i>View profile</a>
            <a href="#" style='padding: 3px!important' onclick="activatePanel(event, 'Relation')" class="list-group-item list-group-item-action"><i class="p-1 fa fa-male fa-lg"></i>Add relatives</a>
            <a href="#" style='padding: 3px!important' onclick="activatePanel(event, 'CellGroups')" class="list-group-item list-group-item-action"><i class="p-1 fa fa-group fa-lg"></i>Add to group</a>

            <a href="#" style='padding: 3px!important' onclick="new $rab.menu().display_next_of_kin()" class="list-group-item list-group-item-action"><i class="p-1 fa fa-connectdevelop fa-lg"></i>Add Next of kin</a>

        </div>
        <%--<div class="container">
            <div class="dropdown dropright m-1">
                <button type="button" class="btn  dropdown-toggle" data-toggle="dropdown">
                    Manage
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Update</a>
                    <a class="dropdown-item" href="#">Delete</a>
                    <a class="dropdown-item" href="#">History</a>
                </div>
            </div>

            <div class="dropdown dropright m-1">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                    Dropright button
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Link 1</a>
                    <a class="dropdown-item" href="#">Link 2</a>
                    <a class="dropdown-item" href="#">Link 3</a>
                </div>
            </div>
        </div>--%>
    </div>



    <section class="modal-dialog-2">
        <div class="container">

            <!-- Button to Open the Modal -->
            <button id="buttonDialog" style="display: none" type="button" class="form-control" data-toggle="modal" data-target="#myModal">
                Open modal
            </button>

            <!-- The Modal -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Edit member details</h4>
                            <button id="closeButton" type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">


                            <div class="row mt2" style="margin-bottom: 10px!important">
                                <label class="col-sm-3 control-label" for="exampleInputEmail">ID</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" disabled id="memberID" name="name" value="" />
                                </div>
                            </div>
                            <div class="row mt2" style="margin-bottom: 10px!important">
                                <label class="col-sm-3 control-label" for="exampleInputEmail">First name</label>
                                <div class="col-sm-9">
                                    <input type="text" disabled class="form-control" id="textboxFirstName" placeholder="Enter email">
                                </div>
                            </div>
                            <div class="row mt2" style="margin-bottom: 10px!important">
                                <label class="col-sm-3 control-label" for="exampleInputEmail">Last name</label>
                                <div class="col-sm-9">
                                    <input type="text" disabled class="form-control" id="textboxLastName" placeholder="Enter email">
                                </div>
                            </div>
                            <div class="row mt2" style="margin-bottom: 10px!important">
                                <label class="col-sm-3 control-label" for="exampleInputEmail"><i class="fa fa-edit fa-lg"></i>Telephone</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="textboxTelephone" placeholder="Enter telephone" title="Header" data-toggle="popover" data-trigger="hover" data-content="Edit telephone">
                                </div>
                            </div>
                            <div class="row mt2" style="margin-bottom: 10px!important">
                                <label class="col-sm-3 control-label" for="exampleInputEmail"><i class="fa fa-edit fa-lg"></i>Email</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="textboxEmail" placeholder="Enter email" title="Header" data-toggle="popover" data-trigger="hover" data-content="Edit email">
                                </div>
                            </div>
                            <div class="row mt2">
                                <label class="col-sm-3 control-label" for="exampleInputEmail"><i class="fa fa-edit fa-lg"></i>Membership type</label>
                                <div class="col-sm-9">
                                    <select class="form-control" id="selectMemType" title="Header" data-toggle="popover" data-trigger="hover" data-content="Edit membership type">
                                        <option selected value="Select membership type">Select membership type</option>
                                        <option selected value="Member">Member</option>
                                        <option value="Non-Member">Visitor</option>


                                    </select>
                                </div>
                            </div>

                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button onclick="{new $rab.Membership.Table().Update(); }" type="submit" class="btn btn-secondary">Update</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>

        <!--modal 2-->

    </section>
    <section class="modal-dialog-1">
        <div class="container-fluid">

            <!-- Button to Open the Modal -->


            <!-- The Modal -->
            <div class="modal fade" id="myNewMemberModal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title"><kbd>Fill in member details</kbd></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="row mb-2">

                                <div class="col-sm-3">Title</div>
                                <div class="col-sm-4">
                                    <select id="selectNewMemberTitle" class="form-control">
                                        <option value="Select title">Select title</option>
                                        <option value="Mr">Mr</option>
                                        <option value="Mrs">Mrs</option>
                                        <option value="Master">Master</option>
                                        <option value="Miss">Miss</option>
                                        <option value="Elder">Elder</option>
                                        <option value="Deacon">Deacon</option>
                                        <option value="Deaconess">Deaconess</option>
                                        <option value="Pastor">Pastor</option>
                                        <option value="Brother">Brother</option>
                                        <option value="Sister">Sister</option>
                                        <option value="Reverend">Reverend</option>
                                    </select>
                                </div>
                                <div class="col-sm-2 pt-2">
                                    <button id="buttonRefreshtitle" title="tooltip" data-toggle="popover" data-trigger="hover" data-content="Click to refresh title. If your prefered choice is not available, click on the settings button to create a new title" onclick="new $rab.Membership.Filters().RefreshTitle()"><i class="fa fa-refresh fa-lg"></i></button>

                                </div>
                            </div>
                            <div class="row mb-2">

                                <div class="col-sm-3">Gender</div>
                                <div class="col-sm-4">

                                    <select id="selectNewMemberGender" class="form-control">
                                        <option value="Select gender">Select gender</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>

                                    </select>

                                </div>
                            </div>


                            <div class="row mb-2">
                                <div class="col-sm-3">
                                    <label class="form-label-control">FirstName</label>
                                </div>
                                <div class="col-sm-8">
                                    <input id="textboxNewMemberFirstName" class="form-control" type="text" name="textbox" value="" placeholder="enter .." />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3">
                                    <label class="form-label-control">LastName</label>
                                </div>
                                <div class="col-sm-8">
                                    <input id="textboxNewMemberLastName" class="form-control" type="text" name="textbox" value="" placeholder="enter .." />
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-sm-3">Marital status</div>
                                <div class="col-sm-8">

                                    <select id="textboxMaritalStatus" class="form-control">
                                        <option value="Select marital status">Select marital status</option>
                                        <option value="Married">Child</option>
                                        <option value="Married">Married</option>
                                        <option value="Single">Single</option>
                                        <option value="Divorced">Divorced</option>
                                        <option value="Widow">Widow</option>
                                        <option value="Widower">Widower</option>
                                    </select>
                                </div>

                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3">DOB</div>
                                <div class="col-sm-8">
                                    <input id="textboxNewMemberDOB" class="form-control" maxlength="10" type="text" name="textbox" value="" placeholder="dd/mm/yyyy .." />
                                </div>

                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3">Country of Nationality</div>
                                <div class="col-sm-8">
                                    <select id="textboxNationality" class="form-control">
                                        <option value="Select country">Select country</option>
                                        <option value="Afghanistan">Afghanistan</option>
                                        <option value="Albania">Albania</option>
                                        <option value="Algeria">Algeria</option>
                                        <option value="American Samoa">American Samoa</option>
                                        <option value="Andorra">Andorra</option>
                                        <option value="Angola">Angola</option>
                                        <option value="Anguilla">Anguilla</option>
                                        <option value="Antigua and Barbuda ">Antigua and Barbuda</option>
                                        <option value="Argentina ">Argentina </option>
                                        <option value="Armenia ">Armenia</option>
                                        <option value="Aruba ">Aruba </option>
                                        <option value="Australia ">Australia </option>
                                        <option value="Austria ">Austria</option>
                                        <option value="Azerbaijan">Azerbaijan</option>
                                        <option value="Bahamas ">Bahamas</option>
                                        <option value="Bahrain ">Bahrain</option>
                                        <option value="Bangladesh">Bangladesh</option>
                                        <option value="Barbados">Barbados</option>
                                        <option value="Belarus">Belarus</option>
                                        <option value="Belgium">Belgium</option>
                                        <option value="Belize">Belize</option>
                                        <option value="Benin">Benin </option>
                                        <option value="Bermuda">Bermuda</option>
                                        <option value="Bhutan">Bhutan</option>
                                        <option value="Bolivia">Bolivia</option>
                                        <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                        <option value="Botswana">Botswana</option>
                                        <option value="Brazil">Brazil</option>
                                        <option value="British Virgin Islands">British Virgin Islands</option>
                                        <option value="Brunei">Brunei</option>
                                        <option value="Bulgaria">Bulgaria</option>
                                        <option value="Burkina Faso">Burkina Faso</option>
                                        <option value="Burundi ">Burundi</option>
                                        <option value="Côte d'Ivoire ">Côte d'Ivoire</option>
                                        <option value="Cabo Verde">Cabo Verde</option>
                                        <option value="Cambodia">Cambodia</option>
                                        <option value="Cameroon">Cameroon</option>
                                        <option value="Canada">Canada</option>
                                        <option value="Caribbean Netherlands">Caribbean Netherlands </option>
                                        <option value="Cayman Islands">Cayman Islands </option>
                                        <option value="Central African Republic">Central African Republic</option>
                                        <option value="Chad">Chad</option>
                                        <option value="Channel Islands ">Channel Islands</option>
                                        <option value="Chile">Chile</option>
                                        <option value="China">China</option>
                                        <option value="Colombia">Colombia</option>
                                        <option value="Comoros">Comoros</option>
                                        <option value="Congo (Congo-Brazzaville)">Congo (Congo-Brazzaville)</option>
                                        <option value="Cook Islands">Cook Islands</option>
                                        <option value="Costa Rica">Costa Rica</option>
                                        <option value="Croatia">Croatia</option>
                                        <option value="Cuba">Cuba</option>
                                        <option value="Curaçao ">Curaçao</option>
                                        <option value="Cyprus">Cyprus</option>
                                        <option value="Czech Republic">Czech Republic </option>
                                        <option value="Democratic Republic of the Congo">Democratic Republic of the Congo</option>
                                        <option value="Denmark">Denmark</option>
                                        <option value="Djibouti">Djibouti</option>
                                        <option value="Dominica">Dominica</option>
                                        <option value="Dominican Republic">Dominican Republic </option>
                                        <option value="Ecuador">Ecuador</option>
                                        <option value="Egypt">Egypt </option>
                                        <option value="El Salvador">El Salvador </option>
                                        <option value="Equatorial Guinea">Equatorial Guinea</option>
                                        <option value="Eritrea">Eritrea</option>
                                        <option value="Estonia">Estonia</option>
                                        <option value="Ethiopia">Ethiopia</option>
                                        <option value="Faeroe Islands">Faeroe Islands </option>
                                        <option value="Falkland Islands (Islas Malvinas)">Falkland Islands (Islas Malvinas) </option>
                                        <option value="Fiji">Fiji</option>
                                        <option value="Finland">Finland</option>
                                        <option value="France">France</option>
                                        <option value="French Guiana">French Guiana</option>
                                        <option value="French Polynesia">French Polynesia </option>
                                        <option value="Gabon">Gabon </option>
                                        <option value="Gambia">Gambia</option>
                                        <option value="Georgia">Georgia</option>
                                        <option value="Germany">Germany</option>
                                        <option value="Ghana">Ghana </option>
                                        <option value="Gibraltar">Gibraltar </option>
                                        <option value="Greece">Greece</option>
                                        <option value="Greenland ">Greenland </option>
                                        <option value="Grenada ">Grenada</option>
                                        <option value="Guadeloupe">Guadeloupe</option>
                                        <option value="Guam">Guam</option>
                                        <option value="Guatemala ">Guatemala </option>
                                        <option value="Guinea">Guinea</option>
                                        <option value="Guinea-Bissau">Guinea-Bissau</option>
                                        <option value="Guyana">Guyana</option>
                                        <option value="Haiti">Haiti </option>
                                        <option value="Holy See">Holy See</option>
                                        <option value="Honduras">Honduras</option>
                                        <option value="Hong Kong (S.A.R. of China)">Hong Kong (S.A.R. of China) </option>
                                        <option value="Hungary">Hungary</option>
                                        <option value="Iceland">Iceland</option>
                                        <option value="India">India </option>
                                        <option value="Indonesia">Indonesia </option>
                                        <option value="Iran">Iran </option>
                                        <option value="Iraq ">Iraq</option>
                                        <option value="Ireland">Ireland</option>
                                        <option value="Isle of Man">Isle of Man</option>
                                        <option value="Israel ">Israel</option>
                                        <option value="Italy">Italy </option>
                                        <option value="Jamaica">Jamaica</option>
                                        <option value="Japan">Japan </option>
                                        <option value="Jordan ">Jordan</option>
                                        <option value="Kazakhstan ">Kazakhstan </option>
                                        <option value="Kenya">Kenya </option>
                                        <option value="Kiribati ">Kiribati </option>
                                        <option value="Kuwait ">Kuwait</option>
                                        <option value="Kyrgyzstan ">Kyrgyzstan </option>
                                        <option value="Laos ">Laos</option>
                                        <option value="Latvia ">Latvia</option>
                                        <option value="Lebanon">Lebanon</option>
                                        <option value="Lesotho">Lesotho</option>
                                        <option value="Liberia">Liberia</option>
                                        <option value="Libya">Libya </option>
                                        <option value="Liechtenstein ">Liechtenstein</option>
                                        <option value="Lithuania">Lithuania </option>
                                        <option value="Luxembourg">Luxembourg</option>
                                        <option value="Macao (S.A.R. of China)">Macao (S.A.R. of China) </option>
                                        <option value="Macedonia (FYROM)">Macedonia (FYROM)</option>
                                        <option value="Madagascar ">Madagascar </option>
                                        <option value="Malawi ">Malawi</option>
                                        <option value="Malaysia ">Malaysia </option>
                                        <option value="Maldives ">Maldives </option>
                                        <option value="Mali ">Mali</option>
                                        <option value="Malta">Malta </option>
                                        <option value="Marshall Islands ">Marshall Islands </option>
                                        <option value="Martinique">Martinique </option>
                                        <option value="Mauritania">Mauritania </option>
                                        <option value="Mauritius ">Mauritius</option>
                                        <option value="Mayotte ">Mayotte</option>
                                        <option value="Mexico">Mexico</option>
                                        <option value="Micronesia">Micronesia </option>
                                        <option value="Moldova ">Moldova</option>
                                        <option value="Monaco">Monaco</option>
                                        <option value="Mongolia">Mongolia </option>
                                        <option value="Montenegro">Montenegro </option>
                                        <option value="Montserrat">Montserrat </option>
                                        <option value="Morocco ">Morocco</option>
                                        <option value="Mozambique">Mozambique </option>
                                        <option value="Myanmar (formerly Burma)">Myanmar (formerly Burma)</option>
                                        <option value="Namibia ">Namibia</option>
                                        <option value="Nauru">Nauru </option>
                                        <option value="Nepal">Nepal </option>
                                        <option value="Netherlands ">Netherlands </option>
                                        <option value="New Caledonia ">New Caledonia</option>
                                        <option value="New Zealand ">New Zealand </option>
                                        <option value="Nicaragua ">Nicaragua </option>
                                        <option value="Niger">Niger </option>
                                        <option value="Nigeria ">Nigeria</option>
                                        <option value="Niue ">Niue</option>
                                        <option value="North Korea ">North Korea </option>
                                        <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                                        <option value="Norway">Norway</option>
                                        <option value="Oman ">Oman</option>
                                        <option value="Pakistan">Pakistan</option>
                                        <option value="Palau">Palau </option>
                                        <option value="Palestine State ">Palestine State</option>
                                        <option value="Panama">Panama</option>
                                        <option value="Papua New Guinea">Papua New Guinea </option>
                                        <option value="Paraguay">Paraguay</option>
                                        <option value="Peru ">Peru</option>
                                        <option value="Philippines ">Philippines </option>
                                        <option value="Poland">Poland</option>
                                        <option value="Portugal">Portugal</option>
                                        <option value="Puerto Rico ">Puerto Rico </option>
                                        <option value="Qatar">Qatar </option>
                                        <option value="Réunion ">Réunion</option>
                                        <option value="Romania">Romania</option>
                                        <option value="Russia">Russia</option>
                                        <option value="Rwanda">Rwanda</option>
                                        <option value="Saint Helena">Saint Helena</option>
                                        <option value="Saint Kitts and Nevis">Saint Kitts and Nevis </option>
                                        <option value="Saint Lucia">Saint Lucia </option>
                                        <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon </option>
                                        <option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
                                        <option value="Samoa">Samoa </option>
                                        <option value="San Marino">San Marino</option>
                                        <option value="Sao Tome and Principe">Sao Tome and Principe </option>
                                        <option value="Saudi Arabia ">Saudi Arabia</option>
                                        <option value="Senegal">Senegal</option>
                                        <option value="Serbia ">Serbia</option>
                                        <option value="Seychelles ">Seychelles</option>
                                        <option value="Sierra Leone ">Sierra Leone</option>
                                        <option value="Singapore">Singapore </option>
                                        <option value="Sint Maarten ">Sint Maarten</option>
                                        <option value="Slovakia ">Slovakia</option>
                                        <option value="Slovenia ">Slovenia</option>
                                        <option value="Solomon Islands">Solomon Islands</option>
                                        <option value="Somalia">Somalia</option>
                                        <option value="South Africa ">South Africa</option>
                                        <option value="South Korea">South Korea </option>
                                        <option value="South Sudan">South Sudan </option>
                                        <option value="Spain">Spain </option>
                                        <option value="Sri Lanka">Sri Lanka </option>
                                        <option value="Sudan">Sudan </option>
                                        <option value="Suriname ">Suriname</option>
                                        <option value="Swaziland">Swaziland </option>
                                        <option value="Sweden ">Sweden</option>
                                        <option value="Switzerland">Switzerland </option>
                                        <option value="Syria">Syria </option>
                                        <option value="Taiwan ">Taiwan</option>
                                        <option value="Tajikistan ">Tajikistan</option>
                                        <option value="Tanzania ">Tanzania</option>
                                        <option value="Thailand ">Thailand</option>
                                        <option value="Timor-Leste">Timor-Leste </option>
                                        <option value="Togo">Togo</option>
                                        <option value="Tokelau">Tokelau</option>
                                        <option value="Tonga">Tonga </option>
                                        <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                                        <option value="Tunisia">Tunisia</option>
                                        <option value="Turkey">Turkey</option>
                                        <option value="Turkmenistan">Turkmenistan</option>
                                        <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                                        <option value="Tuvalu">Tuvalu</option>
                                        <option value="Uganda">Uganda</option>
                                        <option value="Ukraine">Ukraine</option>
                                        <option value="United Arab Emirates">United Arab Emirates</option>
                                        <option selected value="United Kingdom">United Kingdom </option>
                                        <option value="United States of America">United States of America</option>
                                        <option value="United States Virgin Islands">United States Virgin Islands</option>
                                        <option value="Uruguay">Uruguay</option>
                                        <option value="Uzbekistan">Uzbekistan</option>
                                        <option value="Vanuatu">Vanuatu</option>
                                        <option value="Venezuela">Venezuela </option>
                                        <option value="Viet Nam">Viet Nam</option>
                                        <option value="Wallis and Futuna Islands">Wallis and Futuna Islands </option>
                                        <option value="Western Sahara">Western Sahara </option>
                                        <option value="Yemen">Yemen </option>
                                        <option value="Zambia">Zambia</option>
                                        <option value="Zimbabwe">Zimbabwe</option>

                                    </select>
                                </div>

                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3">
                                    Ethnic background
                                </div>
                                <div class="col-sm-8">
                                    <select class="form-control dropdown" id="ethnicity" name="ethnicity">
                                        <option value="" selected="selected" disabled="disabled">-- select one --</option>
                                        <optgroup label="White">
                                            <option value="White English">English</option>
                                            <option value="White Welsh">Welsh</option>
                                            <option value="White Scottish">Scottish</option>
                                            <option value="White Northern Irish">Northern Irish</option>
                                            <option value="White Irish">Irish</option>
                                            <option value="White Gypsy or Irish Traveller">Gypsy or Irish Traveller</option>
                                            <option value="White Other">Any other White background</option>
                                        </optgroup>
                                        <optgroup label="Mixed or Multiple ethnic groups">
                                            <option value="Mixed White and Black Caribbean">White and Black Caribbean</option>
                                            <option value="Mixed White and Black African">White and Black African</option>
                                            <option value="Mixed White Other">Any other Mixed or Multiple background</option>
                                        </optgroup>
                                        <optgroup label="Asian">
                                            <option value="Asian Indian">Indian</option>
                                            <option value="Asian Pakistani">Pakistani</option>
                                            <option value="Asian Bangladeshi">Bangladeshi</option>
                                            <option value="Asian Chinese">Chinese</option>
                                            <option value="Asian Other">Any other Asian background</option>
                                        </optgroup>
                                        <optgroup label="Black">
                                            <option value="Black African">African</option>
                                            <option value="Black African American">African American</option>
                                            <option value="Black Caribbean">Caribbean</option>
                                            <option value="Black Other">Any other Black background</option>
                                        </optgroup>
                                        <optgroup label="Other ethnic groups">
                                            <option value="Arab">Arab</option>
                                            <option value="Hispanic">Hispanic</option>
                                            <option value="Latino">Latino</option>
                                            <option value="Native American">Native American</option>
                                            <option value="Pacific Islander">Pacific Islander</option>
                                            <option value="Other">Any other ethnic group</option>
                                        </optgroup>
                                    </select>
                                </div>


                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3">
                                    <label class="form-label-control">Address line one</label>
                                </div>
                                <div class="col-sm-8">
                                    <input id="textboxNewMemberAddressLineone" class="form-control" type="text" name="textbox" value="" placeholder="enter .." />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3">
                                    <label class="form-label-control">Address line two</label>
                                </div>
                                <div class="col-sm-8">
                                    <input id="textboxNewMemberAddressLinetwo" class="form-control" type="text" name="textbox" value="" placeholder="enter .." />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3">
                                    <label class="form-label-control">Postcode</label>
                                </div>
                                <div class="col-sm-8">
                                    <input id="textboxNewMemberPostcode" maxlength="10" class="form-control" type="text" name="textbox" value="" placeholder="enter .." />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3">
                                    <label class="form-label-control">Town/County</label>
                                </div>
                                <div class="col-sm-8">

                                    <div class="row mb-2">
                                        <div class="col-sm-6">
                                            <input id="textboxNewMemberTown" class="form-control" type="text" name="Town" value="" placeholder="town.." />
                                        </div>
                                        <div class="col-sm-6">
                                            <select id="selectNewMemberCountry" class="form-control">
                                                <option value="Select country">Select country</option>
                                                <option value="Afghanistan">Afghanistan</option>
                                                <option value="Albania">Albania</option>
                                                <option value="Algeria">Algeria</option>
                                                <option value="American Samoa">American Samoa</option>
                                                <option value="Andorra">Andorra</option>
                                                <option value="Angola">Angola</option>
                                                <option value="Anguilla">Anguilla</option>
                                                <option value="Antigua and Barbuda ">Antigua and Barbuda</option>
                                                <option value="Argentina ">Argentina </option>
                                                <option value="Armenia ">Armenia</option>
                                                <option value="Aruba ">Aruba </option>
                                                <option value="Australia ">Australia </option>
                                                <option value="Austria ">Austria</option>
                                                <option value="Azerbaijan">Azerbaijan</option>
                                                <option value="Bahamas ">Bahamas</option>
                                                <option value="Bahrain ">Bahrain</option>
                                                <option value="Bangladesh">Bangladesh</option>
                                                <option value="Barbados">Barbados</option>
                                                <option value="Belarus">Belarus</option>
                                                <option value="Belgium">Belgium</option>
                                                <option value="Belize">Belize</option>
                                                <option value="Benin">Benin </option>
                                                <option value="Bermuda">Bermuda</option>
                                                <option value="Bhutan">Bhutan</option>
                                                <option value="Bolivia">Bolivia</option>
                                                <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                                <option value="Botswana">Botswana</option>
                                                <option value="Brazil">Brazil</option>
                                                <option value="British Virgin Islands">British Virgin Islands</option>
                                                <option value="Brunei">Brunei</option>
                                                <option value="Bulgaria">Bulgaria</option>
                                                <option value="Burkina Faso">Burkina Faso</option>
                                                <option value="Burundi ">Burundi</option>
                                                <option value="Côte d'Ivoire ">Côte d'Ivoire</option>
                                                <option value="Cabo Verde">Cabo Verde</option>
                                                <option value="Cambodia">Cambodia</option>
                                                <option value="Cameroon">Cameroon</option>
                                                <option value="Canada">Canada</option>
                                                <option value="Caribbean Netherlands">Caribbean Netherlands </option>
                                                <option value="Cayman Islands">Cayman Islands </option>
                                                <option value="Central African Republic">Central African Republic</option>
                                                <option value="Chad">Chad</option>
                                                <option value="Channel Islands ">Channel Islands</option>
                                                <option value="Chile">Chile</option>
                                                <option value="China">China</option>
                                                <option value="Colombia">Colombia</option>
                                                <option value="Comoros">Comoros</option>
                                                <option value="Congo (Congo-Brazzaville)">Congo (Congo-Brazzaville)</option>
                                                <option value="Cook Islands">Cook Islands</option>
                                                <option value="Costa Rica">Costa Rica</option>
                                                <option value="Croatia">Croatia</option>
                                                <option value="Cuba">Cuba</option>
                                                <option value="Curaçao ">Curaçao</option>
                                                <option value="Cyprus">Cyprus</option>
                                                <option value="Czech Republic">Czech Republic </option>
                                                <option value="Democratic Republic of the Congo">Democratic Republic of the Congo</option>
                                                <option value="Denmark">Denmark</option>
                                                <option value="Djibouti">Djibouti</option>
                                                <option value="Dominica">Dominica</option>
                                                <option value="Dominican Republic">Dominican Republic </option>
                                                <option value="Ecuador">Ecuador</option>
                                                <option value="Egypt">Egypt </option>
                                                <option value="El Salvador">El Salvador </option>
                                                <option value="Equatorial Guinea">Equatorial Guinea</option>
                                                <option value="Eritrea">Eritrea</option>
                                                <option value="Estonia">Estonia</option>
                                                <option value="Ethiopia">Ethiopia</option>
                                                <option value="Faeroe Islands">Faeroe Islands </option>
                                                <option value="Falkland Islands (Islas Malvinas)">Falkland Islands (Islas Malvinas) </option>
                                                <option value="Fiji">Fiji</option>
                                                <option value="Finland">Finland</option>
                                                <option value="France">France</option>
                                                <option value="French Guiana">French Guiana</option>
                                                <option value="French Polynesia">French Polynesia </option>
                                                <option value="Gabon">Gabon </option>
                                                <option value="Gambia">Gambia</option>
                                                <option value="Georgia">Georgia</option>
                                                <option value="Germany">Germany</option>
                                                <option value="Ghana">Ghana </option>
                                                <option value="Gibraltar">Gibraltar </option>
                                                <option value="Greece">Greece</option>
                                                <option value="Greenland ">Greenland </option>
                                                <option value="Grenada ">Grenada</option>
                                                <option value="Guadeloupe">Guadeloupe</option>
                                                <option value="Guam">Guam</option>
                                                <option value="Guatemala ">Guatemala </option>
                                                <option value="Guinea">Guinea</option>
                                                <option value="Guinea-Bissau">Guinea-Bissau</option>
                                                <option value="Guyana">Guyana</option>
                                                <option value="Haiti">Haiti </option>
                                                <option value="Holy See">Holy See</option>
                                                <option value="Honduras">Honduras</option>
                                                <option value="Hong Kong (S.A.R. of China)">Hong Kong (S.A.R. of China) </option>
                                                <option value="Hungary">Hungary</option>
                                                <option value="Iceland">Iceland</option>
                                                <option value="India">India </option>
                                                <option value="Indonesia">Indonesia </option>
                                                <option value="Iran">Iran </option>
                                                <option value="Iraq ">Iraq</option>
                                                <option value="Ireland">Ireland</option>
                                                <option value="Isle of Man">Isle of Man</option>
                                                <option value="Israel ">Israel</option>
                                                <option value="Italy">Italy </option>
                                                <option value="Jamaica">Jamaica</option>
                                                <option value="Japan">Japan </option>
                                                <option value="Jordan ">Jordan</option>
                                                <option value="Kazakhstan ">Kazakhstan </option>
                                                <option value="Kenya">Kenya </option>
                                                <option value="Kiribati ">Kiribati </option>
                                                <option value="Kuwait ">Kuwait</option>
                                                <option value="Kyrgyzstan ">Kyrgyzstan </option>
                                                <option value="Laos ">Laos</option>
                                                <option value="Latvia ">Latvia</option>
                                                <option value="Lebanon">Lebanon</option>
                                                <option value="Lesotho">Lesotho</option>
                                                <option value="Liberia">Liberia</option>
                                                <option value="Libya">Libya </option>
                                                <option value="Liechtenstein ">Liechtenstein</option>
                                                <option value="Lithuania">Lithuania </option>
                                                <option value="Luxembourg">Luxembourg</option>
                                                <option value="Macao (S.A.R. of China)">Macao (S.A.R. of China) </option>
                                                <option value="Macedonia (FYROM)">Macedonia (FYROM)</option>
                                                <option value="Madagascar ">Madagascar </option>
                                                <option value="Malawi ">Malawi</option>
                                                <option value="Malaysia ">Malaysia </option>
                                                <option value="Maldives ">Maldives </option>
                                                <option value="Mali ">Mali</option>
                                                <option value="Malta">Malta </option>
                                                <option value="Marshall Islands ">Marshall Islands </option>
                                                <option value="Martinique">Martinique </option>
                                                <option value="Mauritania">Mauritania </option>
                                                <option value="Mauritius ">Mauritius</option>
                                                <option value="Mayotte ">Mayotte</option>
                                                <option value="Mexico">Mexico</option>
                                                <option value="Micronesia">Micronesia </option>
                                                <option value="Moldova ">Moldova</option>
                                                <option value="Monaco">Monaco</option>
                                                <option value="Mongolia">Mongolia </option>
                                                <option value="Montenegro">Montenegro </option>
                                                <option value="Montserrat">Montserrat </option>
                                                <option value="Morocco ">Morocco</option>
                                                <option value="Mozambique">Mozambique </option>
                                                <option value="Myanmar (formerly Burma)">Myanmar (formerly Burma)</option>
                                                <option value="Namibia ">Namibia</option>
                                                <option value="Nauru">Nauru </option>
                                                <option value="Nepal">Nepal </option>
                                                <option value="Netherlands ">Netherlands </option>
                                                <option value="New Caledonia ">New Caledonia</option>
                                                <option value="New Zealand ">New Zealand </option>
                                                <option value="Nicaragua ">Nicaragua </option>
                                                <option value="Niger">Niger </option>
                                                <option value="Nigeria ">Nigeria</option>
                                                <option value="Niue ">Niue</option>
                                                <option value="North Korea ">North Korea </option>
                                                <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                                                <option value="Norway">Norway</option>
                                                <option value="Oman ">Oman</option>
                                                <option value="Pakistan">Pakistan</option>
                                                <option value="Palau">Palau </option>
                                                <option value="Palestine State ">Palestine State</option>
                                                <option value="Panama">Panama</option>
                                                <option value="Papua New Guinea">Papua New Guinea </option>
                                                <option value="Paraguay">Paraguay</option>
                                                <option value="Peru ">Peru</option>
                                                <option value="Philippines ">Philippines </option>
                                                <option value="Poland">Poland</option>
                                                <option value="Portugal">Portugal</option>
                                                <option value="Puerto Rico ">Puerto Rico </option>
                                                <option value="Qatar">Qatar </option>
                                                <option value="Réunion ">Réunion</option>
                                                <option value="Romania">Romania</option>
                                                <option value="Russia">Russia</option>
                                                <option value="Rwanda">Rwanda</option>
                                                <option value="Saint Helena">Saint Helena</option>
                                                <option value="Saint Kitts and Nevis">Saint Kitts and Nevis </option>
                                                <option value="Saint Lucia">Saint Lucia </option>
                                                <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon </option>
                                                <option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
                                                <option value="Samoa">Samoa </option>
                                                <option value="San Marino">San Marino</option>
                                                <option value="Sao Tome and Principe">Sao Tome and Principe </option>
                                                <option value="Saudi Arabia ">Saudi Arabia</option>
                                                <option value="Senegal">Senegal</option>
                                                <option value="Serbia ">Serbia</option>
                                                <option value="Seychelles ">Seychelles</option>
                                                <option value="Sierra Leone ">Sierra Leone</option>
                                                <option value="Singapore">Singapore </option>
                                                <option value="Sint Maarten ">Sint Maarten</option>
                                                <option value="Slovakia ">Slovakia</option>
                                                <option value="Slovenia ">Slovenia</option>
                                                <option value="Solomon Islands">Solomon Islands</option>
                                                <option value="Somalia">Somalia</option>
                                                <option value="South Africa ">South Africa</option>
                                                <option value="South Korea">South Korea </option>
                                                <option value="South Sudan">South Sudan </option>
                                                <option value="Spain">Spain </option>
                                                <option value="Sri Lanka">Sri Lanka </option>
                                                <option value="Sudan">Sudan </option>
                                                <option value="Suriname ">Suriname</option>
                                                <option value="Swaziland">Swaziland </option>
                                                <option value="Sweden ">Sweden</option>
                                                <option value="Switzerland">Switzerland </option>
                                                <option value="Syria">Syria </option>
                                                <option value="Taiwan ">Taiwan</option>
                                                <option value="Tajikistan ">Tajikistan</option>
                                                <option value="Tanzania ">Tanzania</option>
                                                <option value="Thailand ">Thailand</option>
                                                <option value="Timor-Leste">Timor-Leste </option>
                                                <option value="Togo">Togo</option>
                                                <option value="Tokelau">Tokelau</option>
                                                <option value="Tonga">Tonga </option>
                                                <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                                                <option value="Tunisia">Tunisia</option>
                                                <option value="Turkey">Turkey</option>
                                                <option value="Turkmenistan">Turkmenistan</option>
                                                <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                                                <option value="Tuvalu">Tuvalu</option>
                                                <option value="Uganda">Uganda</option>
                                                <option value="Ukraine">Ukraine</option>
                                                <option value="United Arab Emirates">United Arab Emirates</option>
                                                <option selected value="United Kingdom">United Kingdom </option>
                                                <option value="United States of America">United States of America</option>
                                                <option value="United States Virgin Islands">United States Virgin Islands</option>
                                                <option value="Uruguay">Uruguay</option>
                                                <option value="Uzbekistan">Uzbekistan</option>
                                                <option value="Vanuatu">Vanuatu</option>
                                                <option value="Venezuela">Venezuela </option>
                                                <option value="Viet Nam">Viet Nam</option>
                                                <option value="Wallis and Futuna Islands">Wallis and Futuna Islands </option>
                                                <option value="Western Sahara">Western Sahara </option>
                                                <option value="Yemen">Yemen </option>
                                                <option value="Zambia">Zambia</option>
                                                <option value="Zimbabwe">Zimbabwe</option>

                                            </select>
                                        </div>

                                    </div>



                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3">
                                    <label class="form-label-control">Telephone</label>
                                </div>
                                <div class="col-sm-8">
                                    <input id="textboxNewMemberTelephone" class="form-control" type="text" name="textbox" value="" placeholder="enter .." />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3">
                                    <label class="form-label-control">Profession</label>
                                </div>
                                <div class="col-sm-8">
                                    <input id="textboxProfession" placeholder="enter profession" class="form-control" type="text" name="textbox" value="" />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3">
                                    <label class="form-label-control">Email</label>
                                </div>
                                <div class="col-sm-8">
                                    <input id="textboxNewMemberEmail" placeholder="person@mail.com" class="form-control" type="text" name="textbox" value="" />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3">
                                    <label class="form-label-control">Age category</label>

                                </div>
                                <div class="col-sm-8">

                                    <div class="row">
                                        <div class="col-sm-6">

                                            <select id="selectNewMemberAgeCategory" class="form-control">
                                                <option value="Select age category">Select age category</option>

                                                <option value="Children (0-12)">Children (0-12)</option>
                                                <option value="Teenage(13-19)">Teenage(13-19)</option>
                                                <option value="Young Adults(20-35)">Young Adults(20-35)</option>
                                                <option value="Above 35">Above 35</option>
                                            </select>

                                        </div>
                                        <div class="col-sm-6">
                                            <select id="selectMembershipType" class="form-control">
                                                <option value="Select type of membership">Select type of membership</option>
                                                <option value="Member">Member</option>
                                                <option value="Non-member">Non member</option>

                                            </select>
                                        </div>
                                    </div>





                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3">
                                    <label class="form-label-control">Comment</label>
                                </div>
                                <div class="col-sm-8">
                                    <input id="textboxNewMemberComment" class="form-control" type="text" name="textbox" value="" placeholder="enter .." />
                                </div>
                            </div>

                            <div id="modal-footer-container" class="modal-footer">
                                <button onclick="{$rab.Membership.UpdateNewMember()}" type="button" id="buttonSubmitUpdateMember" class="btn btn-secondary">Update</button>
                                <button onclick="{$rab.Membership.AddNewMember()}" type="button" id="buttonSubmitNewMember" class="btn btn-secondary">Submit</button>
                                <button type="button" id="buttonCloseNewMember" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                    <!-- Modal footer -->


                </div>
            </div>
        </div>


    </section>
    <section id="modal-1">
        <button id="buttonStatistics" style="display: none;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalStatistics">
            Open modal
        </button>

        <!-- The Modal -->
        <div class="modal fade" id="modalStatistics">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" id="modal-stats-title">Membership statistics</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">

                        <div class="row mt-2 mb-3">
                            <div id="tablecontainer1" class="col-sm-12">
                                <table class="table table-responsive ">
                                    <thead>
                                        <tr>
                                            <td style="width: 40%"></td>
                                            <td style="width: 20%">Male</td>
                                            <td style="width: 20%">Female</td>
                                            <td style="width: 20%">Total</td>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodygender">
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <%--<div id="tablecontainer2" class="col-sm-6">
                                <table class="table table-responsive table-striped">
                                    <thead>
                                        <tr>
                                            <td>Membership type</td>
                                            <td>Member</td>
                                            <td>Non-member</td>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodymembershiptype">
                                        <tr></tr>
                                    </tbody>
                                </table>
                            </div>--%>
                        </div>
                        <div class="row mt-2 mb-3">
                            <div id="tablecontainer3" class="col-sm-12">
                                <table class="table table-responsive table-striped">
                                    <thead>
                                        <tr>
                                            <td style="width: 40%">AgeCategory </td>
                                            <td style="width: 20%">Male </td>
                                            <td style="width: 20%">FeMale </td>
                                            <td style="width: 20%">Total </td>


                                        </tr>
                                    </thead>
                                    <tbody id="tbodyAgeAbove35">
                                        <tr></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3">
                            <div id="tablecontainer4" class="col-sm-12">
                                <table class="table table-responsive table-striped">
                                    <thead>
                                        <tr>
                                            <td style="width: 40%">AgeCategory </td>
                                            <td style="width: 20%">Male </td>
                                            <td style="width: 20%">Female </td>
                                            <td style="width: 20%">Total </td>


                                        </tr>
                                    </thead>
                                    <tbody id="tbodyChildren_0_to_12">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3">
                            <div id="tablecontainer5" class="col-sm-12">
                                <table class="table table-responsive table-striped">
                                    <thead>
                                        <tr>
                                            <td style="width: 40%">AgeCategory </td>
                                            <td style="width: 20%">Male </td>
                                            <td style="width: 20%">Female </td>
                                            <td style="width: 20%">Total </td>


                                        </tr>
                                    </thead>
                                    <tbody id="tbodyTeenage_13_to_19">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3">
                            <div id="tablecontainer6" class="col-sm-12">
                                <table class="table table-responsive table-striped">
                                    <thead>
                                        <tr>
                                            <td style="width: 40%">AgeCategory </td>
                                            <td style="width: 20%">Male </td>
                                            <td style="width: 20%">Female </td>
                                            <td style="width: 20%">Total </td>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyYoungAdult_20_to_35">
                                    </tbody>
                                </table>
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
    <section id="modal-5">
        <button id="buttonRelationship" style="display: none;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalRelationship">
            Open modal
        </button>

        <!-- The Modal -->
        <div class="modal fade" id="modalRelationship">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title"><kbd>Members related to: </kbd><span id="modal-View-title"></span></h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">

                        <div class="row mt-2 mb-3">
                            <div id="tablecontainerRelationships" class="col-sm-12">
                                <table class="table table-responsive ">
                                    <thead>
                                        <tr>

                                            <th>IsRelatedTo    </th>
                                            <th>RelationType    </th>
                                            <th>Telephone</th>
                                            <th>RelativeBranch       </th>
                                            <th>CreatedBy       </th>
                                            <th>Edit       </th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyMemberRelations">
                                    </tbody>
                                </table>
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
    <section id="modal-6">
        <span data-toggle="modal" data-target="#modalSettings"></span>
        <!-- The Modal -->
        <div class="modal fade" id="modalSettings">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Membership settings</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <button onclick="toggletab('membership')" id="buttonSettingsMembership">Membership</button>
                        <button onclick="toggletab('cellgroups')" id="buttonSettingsCellGroups">Cell Groups</button>
                        <button onclick="toggletab('transfers')" id="buttonSettingsTransfers">Transfers</button>
                        <button onclick="toggletab('relations')" id="buttonSettingsRelationships">Importing</button>
                        <hr />
                        <div id="membership" class="setting-tab" style="background-color: #293956; color: white">
                            <!--this is where settings body goes-->
                            <!--user should be able to add new membership type-->
                            <h2>To add new dropdown membership type</h2>

                            <ol>
                                <li>Enter membership type names into textbox below e.g Student,Visiting, PENSA etc. </li>
                                <li>Click submit button when done. Entered names is now available to select when adding a new member or updating their status</li>
                            </ol>
                            <div class="row">
                                <div class="col-sm-4">
                                    <span style="font-weight: 600">Enter membership type</span>

                                </div>
                                <div class="col-sm-6">
                                    <input id="textboxfilterMembershiptypes" type="text" class="form-control" placeholder="enter types here" /><br />
                                    enter list comma seperated e.g Member, Non-member, PENSA
                                </div>
                                <div class="col-sm-2">
                                    <button onclick="new $rab.Membership.Filters().AddMembershipType(textboxfilterMembershiptypes.value)">Submit</button>


                                </div>

                            </div>

                            <!--user should be able to add new titles-->
                            <hr style="border: 2px solid blue" />
                            <h2>To add new member dropdown title</h2>
                            <ol>
                                <li>Enter membership tile names into textbox below e.g Elder,Deacon, Bishop etc. </li>
                                <li>Click submit button when done. Entered names is now available as filters to select when adding a new member or updating their titles</li>
                            </ol>
                            <div class="row">
                                <div class="col-sm-4 text-right">
                                    <span style="font-weight: 600" class="text-right">Enter  title</span>

                                </div>
                                <div class="col-sm-6">
                                    <input id="textboxfilterMembershipTitles" type="text" class="form-control" placeholder="enter title here" /><br />
                                    enter list comma seperated e.g Mr, Mrs, Elder, Deacon
                                </div>
                                <div class="col-sm-2">
                                    <button onclick="new $rab.Membership.Filters().AddMembershipTitle(textboxfilterMembershipTitles.value)">Submit</button>
                                </div>

                            </div>

                            <!---->
                        </div>
                        <div id="cellgroups" class="setting-tab">
                            <h4>Cell group settings</h4>
                            <hr />
                            Enter cell group names comma seperated eg. James Group, John Group etc.
                            This then becomes available as a pick list to associate members in the cell group panel.
                            
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-3 pt-2 text-right" style="font-weight: 600">Cell group names</div>
                                    <div class="col-sm-7">
                                        <input id="textboxfilterGroupName" class="form-control" data-toggle="popover" title="tool tip" data-hover="hover" data-content="enter group names comma seperated" type="text" id="textboxGroupNames" placeholder="enter group names here ..." />
                                    </div>
                                    <div class="col-sm-2 pt-2">
                                        <button onclick="new $rab.Membership.Filters().AddCellGroupNames(textboxfilterGroupName.value)"><i class="fa fa-send fa-lg"></i>Submit</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div id="transfers" class="setting-tab">
                            <h1>transfers settings</h1>
                        </div>
                        <div id="relations" class="setting-tab">
                            <h3>Importing bulk membership data</h3>
                            <form runat="server">
                                <table style="width: 100%">
                                    <asp:HiddenField Value="" ID="HiddenFieldBranchID" runat="server" />
                                    <asp:HiddenField Value="" ID="HiddenFieldCreatedBy" runat="server" />

                                    <tr>
                                        <td>File path</td>
                                        <td>
                                            <asp:FileUpload CssClass="form-control" ID="fileUpload" runat="server" />
                                        </td>
                                        <td>
                                            <asp:Button OnClick="buttonImport_Click" ID="buttonImport" Text="import" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                                <hr />
                                How to upload bulk members
                                <ol>
                                    <li>Click on the link below to download template</li>
                                    <li>Populate template with data</li>
                                    <li>Upload the template clicking the import button</li>
                                    <li>Upload your membership to see changes</li>
                                </ol>
                                <a class=" mt-2" href="upload/Template.csv">Click to Download Template</a>

                            </form>
                        </div>

                        <script>
                            var containers = document.getElementsByClassName("setting-tab");
                            for (var i = 0; i < containers.length; i++) {
                                if (i != 0) {
                                    containers[i].style.display = "none";
                                }
                            }
                            function toggletab(id) {
                                for (var i = 0; i < containers.length; i++) {
                                    if (containers[i].id != id) {
                                        containers[i].style.display = "none";
                                    } else {
                                        containers[i].style.display = "block";
                                    }
                                }
                                //get branch id and place value in hidden field
                                var fieldBranch = document.getElementById('HiddenFieldBranchID');
                                var textboxCreatedBy = document.getElementById('HiddenFieldCreatedBy');
                                textboxCreatedBy.value = $rab.Login.User.MemberID;
                                fieldBranch.value = new $rab.Branch().BranchInfo.BranchID;

                            }
                        </script>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" id="buttonclosememberfilter" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </div>

            </div>
        </div>


    </section>
    <section id="modal-7">
        <button id="buttonRelationshipGroups" style="display: none;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalGroups">
            Open modal
        </button>

        <!-- The Modal -->
        <div class="modal fade" id="modalGroups">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title"><kbd>Member Groups </kbd><span id="modal-View-group-title"></span></h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">

                        <div class="container mt-2 mb-3">
                            <div id="tableRelations" class="col-sm-12">
                                <table class="table table-responsive ">
                                    <thead>
                                        <tr>

                                            <th>Groupname   </th>
                                            <th>Role        </th>
                                            <%-- <th>Datejoined  </th>--%>
                                            <th>ActiveStatus</th>
                                            <th>Meetingday  </th>
                                            <th>Meetingtime </th>
                                            <th>Location </th>
                                            <th>Edit</th>


                                        </tr>
                                    </thead>
                                    <tbody id="tbodyMemberGroups">
                                    </tbody>
                                </table>
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
    <section id="modal-8">
        <button id="buttonGeneral" style="display: none;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalGeneral">
            Open modal
        </button>

        <!-- The Modal -->
        <div class="modal fade" id="modalGeneral">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title"><kbd id="modal-general-title"></kbd></h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">

                        <div class="container mt-2 mb-3">
                            <h2 id="h2generalLabel"></h2>
                            <div id="tablegeneral" class="col-sm-12">
                                <table class="table table-responsive table-striped">
                                    <thead style="font-weight: 600" id="theadgeneral">
                                    </thead>
                                    <tbody id="tbodygeneral">
                                    </tbody>
                                </table>
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
    <section id="modal-9">
        <button id="buttontransfer" style="display: none;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#modaltransfer">
            Open modal
        </button>

        <!-- The Modal -->
        <div class="modal fade" id="modaltransfer">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Transfer member:<kbd id="modal-modaltransfer-title"></kbd></h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <a href="#" data-toggle="collapse" data-target="#help-transfer">Click to show help on how to transfer member</a>
                        <div id="help-transfer" class="collapse">
                            <ol>
                                <li>Select transfer type, that is whether internal/external transfer .</li>
                                <li>If internal transfer, select the branch they are going. </li>
                                <li>If external, type in the branch or church they are going.</li>
                                <li>Enter transfer date and then click submit button.</li>
                                <li>If transfer is internal, member will be removed from listing in table to reflect in branch transferred.</li>
                                <li>If is an external transfer, membership status of member becomes non-member.</li>
                            </ol>
                        </div>


                        <div class="container">
                            <div class="row mb-3">
                                <div class="col-sm-4">
                                    Select transfer type
                                </div>
                                <div class="col-sm-8">
                                    <select id="selectTransferType" class="form-control">
                                        <option value="Select transfer type">--select item--</option>
                                        <option>External</option>
                                        <option>Internal</option>
                                    </select>
                                </div>

                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-4">
                                    Select Area name
                                </div>
                                <div class="col-sm-8">
                                    <select id="selectAreaName" class="form-control" onchange="new $rab.Membership.Transfers().LoadDistricts(this.options[this.selectedIndex].AreaName)">
                                        <option value="Select area">--select item--</option>

                                    </select>
                                </div>

                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-4">
                                    Select District name
                                </div>
                                <div class="col-sm-8">
                                    <select id="selectDistrictName" class="form-control" onchange="new $rab.Membership.Transfers().LoadLocals(this.options[this.selectedIndex].DistrictName)">
                                        <option value="Select District">--select item--</option>

                                    </select>
                                </div>

                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-4">
                                    <label id="labelselectbranch">Select branch</label>
                                </div>
                                <div class="col-sm-8">
                                    <div id="containerinternalbranch">
                                        <select id="selectTransferToBranch" data-toggle="popover" title="tool tip" data-content="select the internal branch member is being transfered to" class="form-control">
                                            <option value="Select branch">--select item--</option>
                                            <option>Branch one</option>
                                            <option>Branch one</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="row mb-3" style="display: none">
                                <div class="col-sm-4">
                                    <label id="labelinputname">Enter new branch name</label>
                                </div>
                                <div class="col-sm-8">
                                    <div id="containerexternalbranch">
                                        <input data-toggle="popover" title="tool tip" data-content="Enter new branch name" class="form-control" type="text" id="textboxNewBranch" placeholder="enter new branch" value="" />

                                    </div>
                                </div>

                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-4">
                                    <label id="labelinputdate">Enter transfer date</label>
                                </div>
                                <div class="col-sm-4">

                                    <input data-toggle="popover" title="tool tip" data-content="enter date in the format dd/mm/yyyy eg 02/05/2017" class="form-control" type="text" id="textboxtransferDate" placeholder="dd/mm/yyyy" value="" />


                                </div>

                            </div>


                            <div class="row  mb-3">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-3">
                                    <button onclick="new $rab.Membership.Transfers().Add()" id="buttonsubmittransfer" class="form-control">Submit</button>

                                </div>


                            </div>
                            <script>
                                //selectTransferType.onchange = function () {
                                //    try {
                                //        switch (this.selectedIndex) {
                                //            case 0:
                                //                labelselectbranch.style.display = "none";
                                //                labelinputname.style.display = "none";
                                //                containerinternalbranch.style.display = "none";
                                //                containerexternalbranch.style.display = "none";
                                //                break;
                                //            case 1:
                                //                containerinternalbranch.style.display = "none";
                                //                containerexternalbranch.style.display = "block";
                                //                labelselectbranch.style.display = "none";
                                //                labelinputname.style.display = "block";
                                //                break;
                                //            case 2:
                                //                containerinternalbranch.style.display = "block";
                                //                containerexternalbranch.style.display = "none";
                                //                labelselectbranch.style.display = "block";
                                //                labelinputname.style.display = "none";
                                //                break;
                                //            default:
                                //        }
                                //    } catch (e) {

                                //    }
                                //}
                            </script>
                        </div>

                        <div class="container mt-2 mb-3">

                            <h2 style="background-color: #293955; color: white; padding: 20px;">transfer history</h2>
                            <hr />

                            <table class="table table-responsive table-stripped">

                                <thead style="font-weight: 600" id="theadmodaltransfer">
                                    <tr>
                                        <th>AreaName;       </th>
                                        <th>DistrictName;   </th>
                                        <th>FromBranch;     </th>
                                        <th>ToBranch;       </th>
                                        <th>TransferDate;   </th>
                                        <%--<th>CreatedBy;      </th>
                                        <th>   CreatedOn;   </th>--%>
                                    </tr>
                                </thead>
                                <tbody id="tbodymodaltransfer">
                                </tbody>
                            </table>


                        </div>


                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button id="buttoncloseTransfer" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>


    </section>
    <section>

        <!-- The Modal -->
        <button type="button" style="display: none" class="btn btn-primary" data-toggle="modal" data-target="#myBlank">Open modal</button>
        <div class="modal fade" id="myBlank">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" id="alertTitle"></h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body" id="alertBody">
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="buttonDismissAlert">Dont display alert</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>

    </section>

    <section id="sectiongeneral">

        <!-- The Modal -->
        <button type="button" id="buttongeneralBlank" style="display: none" class="btn btn-primary" data-toggle="modal" data-target="#generalBlank">Open modal</button>
        <div class="modal fade" id="generalBlank">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" id="generalTitle">Select columns to display</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body" id="generalBody">
                        <div class="row">
                            <div class="col-sm-5">
                                <table class="table table-responsive" style="width: 100%">
                                    <thead>
                                        <tr>
                                            <td>Columns</td>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyforward">
                                        <tr>
                                            <td>MemberID      </td>
                                        </tr>
                                        <tr>
                                            <td>Title         </td>
                                        </tr>
                                        <tr>
                                            <td>Branch        </td>
                                        </tr>
                                        <tr>
                                            <td>FirstName     </td>
                                        </tr>
                                        <tr>
                                            <td>LastName      </td>
                                        </tr>
                                        <tr>
                                            <td>AddressLineone</td>
                                        </tr>
                                        <tr>
                                            <td>AddressLinetwo</td>
                                        </tr>
                                        <tr>
                                            <td>Postcode      </td>
                                        </tr>
                                        <tr>
                                            <td>Town          </td>
                                        </tr>
                                        <tr>
                                            <td>Email         </td>
                                        </tr>
                                        <tr>
                                            <td>DOB           </td>
                                        </tr>
                                        <tr>
                                            <td>Country       </td>
                                        </tr>
                                        <tr>
                                            <td>Type          </td>
                                        </tr>
                                        <tr>
                                            <td>Telephone     </td>
                                        </tr>
                                        <tr>
                                            <td>AgeCategory   </td>
                                        </tr>
                                        <tr>
                                            <td>Comment       </td>
                                        </tr>
                                        <tr>
                                            <td>Gender        </td>
                                        </tr>
                                        <tr>
                                            <td>Nationality   </td>
                                        </tr>
                                        <tr>
                                            <td>MaritalStatus </td>
                                        </tr>


                                    </tbody>
                                </table>
                            </div>
                            <div class="col-sm-2 align-center">
                                <hr />
                                <button onclick="new $rab.Membership.Columns().forward()" id="buttonForward" class="m-3"><i class="fa fa-forward fa-lg"></i></button>
                                <button onclick="new $rab.Membership.Columns().backward()" id="buttonBackward"><i class="fa fa-backward fa-lg"></i></button>
                            </div>
                            <div class="col-sm-5">
                                <table class="table table-responsive" style="width: 100%">
                                    <thead>
                                        <tr>
                                            <td>DisplayColumns</td>
                                        </tr>

                                    </thead>
                                    <tbody id="tbodybackward">
                                    </tbody>
                                </table>
                            </div>

                            <script>
                                var tbodycolumns = document.getElementById('tbodyColumns');
                                var buttonForward = document.getElementById('buttonForward');
                                var buttonBackward = document.getElementById('buttonBackward');
                                var tbodybackward = document.getElementById('tbodybackward');

                                for (var i = 0; i < tbodyforward.rows.length; i++) {
                                    tbodyforward.rows[i].cells[0].onclick = function () {
                                        try {
                                            if (this.style.backgroundColor == 'red') {
                                                this.style.backgroundColor = '';
                                                this.style.color = 'black';
                                                this.selected = false;
                                            }
                                            else if (this.style.backgroundColor == '') {
                                                this.style.backgroundColor = 'red';
                                                this.style.color = 'white';
                                                this.selected = true;
                                            }

                                        } catch (e) {

                                        }
                                    }
                                    tbodyforward.rows[i].cells[0].onmouseover = function () {
                                        this.style.animation = "bounce 1s infinite alternate;";
                                    }
                                    tbodyforward.rows[i].cells[0].onmouseout = function () {
                                        this.style.animation = "";
                                    }
                                }

                            </script>
                        </div>

                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <input onclick="new $rab.Membership.Columns().updateView()" type="button" class="btn btn-primary" value="Update report" />

                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>

    </section>

    <section>

        <!-- The Modal -->
        <button type="button" style="display: none" class="btn btn-primary" data-toggle="modal" data-target="#modalGenericScale">Open modal</button>
        <div class="modal fade" id="modalGenericScale">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" id="modalGenericScaleTitle"></h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="container">


                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <%--<li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#home">Details</a>
                                </li>--%>
                                <li class="nav-item">
                                    <a class="nav-link  active" data-toggle="tab" href="#menu1">Attendance</a>

                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#menu2">Contributions</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#menu4">Appointments</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div id="home" class="container tab-pane ">
                                    <br>
                                    <h3>Details</h3>
                                    <div id="modalGenericScaleBody">Comment..  </div>
                                    .
                                </div>
                                <div id="menu1" class="container tab-pane fade active">
                                    <br>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input id="textsearchAttendance" type="text" placeholder="enter filter" class="form-control" />
                                        </div>
                                        <div class="col-sm-6 p-3 " style="color: red!important; font-size: 14pt">Activities member attended</div>
                                    </div>

                                    <table class="table table-responsive table-striped">
                                        <thead>
                                            <tr>
                                                <th>Activity name</th>
                                                <th>Month-Year</th>
                                                <th>Attendance count</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbodyAttendanceHistory">
                                            <tr></tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="menu2" class="container tab-pane fade">

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input id="textsearchContribution" type="text" placeholder="enter filter" class="form-control" />
                                        </div>
                                        <div class="col-sm-6 p-3 " style="color: red!important; font-size: 14pt">Financial contributions</div>
                                    </div>

                                    <table class="table table-responsive table-striped">
                                        <thead>
                                            <tr>
                                                <th>Fund</th>
                                                <th>Month-Year</th>
                                                <th>Amount (£)</th>
                                            </tr>
                                        </thead>

                                        <tbody id="tbodyContributionHistory">
                                            <tr></tr>
                                        </tbody>
                                    </table>

                                </div>
                                <div id="menu3" class="container tab-pane fade">
                                    <br>
                                    <h3>Not used</h3>
                                    <p>...</p>
                                </div>
                                <div id="menu4" class="container tab-pane fade">
                                    <br />
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <input id="textsearchAppointment" type="text" placeholder="enter filter" class="form-control" />
                                        </div>
                                        <div class="col-sm-6 p-3 " style="color: red!important; font-size: 14pt">Appointments held</div>
                                    </div>

                                    <table class="table table-responsive table-striped">
                                        <thead>
                                            <tr>
                                                <th>Role</th>
                                                <th>Start date</th>
                                                <th>End date </th>
                                            </tr>
                                        </thead>

                                        <tbody id="tbodyAppointmentHistory">
                                            <tr></tr>
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
        <!-- The Modal -->
        <div class="modal fade" id="divNextOfKin">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 id="nextOfKinTitle" class="modal-title">Next of kin details</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="container">
                            
                            <br>
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#nextofkin">Create new next of kin</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#existingnextofkins">View next of kins</a>
                                </li>

                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div id="nextofkin" class="container tab-pane active">
                                    <br>
                                    
                                      <div class="container">
                            <div class="form-group">
                                <label for="email">FullName:</label>
                                <input type="text" class="form-control" id="nkfullname" placeholder="Enter full name" name="email">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Relation type:</label>
                                <input type="text" class="form-control" id="nkrelationtype" placeholder="Enter relation type eg brother" name="pswd">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Telephone:</label>
                                <input type="text" class="form-control" id="nktelephone" placeholder="Enter telephone" name="pswd">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Email:</label>
                                <input type="email" class="form-control" id="nkemail" placeholder="Enter email" name="pswd">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Address:</label>
                                <input type="text" class="form-control" id="nkaddress" placeholder="Enter full addresss" name="pswd">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Country:</label>
                                <input type="text" class="form-control" id="nkcountry" placeholder="Enter country" name="pswd">
                            </div>


                        </div>
                                     
                                   <input onclick="new $rab.menu().add_next_of_kin()" type="button" class="btn btn-primary" value='Submit' />
                                </div>
                                <div id="existingnextofkins" class="container tab-pane fade">
                                    <br>
                                    <p>Available next of kin</p>
                                    <table   class="table table-striped table-responsive">
                                   <thead>

                                        <tr>
                                            <td>FullName</td>
                                            <td>Address</td>
                                            <td>Telephone</td>
                                            <td>Email</td>
                                            <td>Relation type</td>
                                        </tr>
                                    
                                   </thead>
                                        <tbody id="table_next_of_kin" >

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

    <script src="assets/web/assets/jquery/jquery.min.js"></script>
    <%--<script src="assets/script/AccessJS.js"></script>--%>
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

    <style>
        input[name=search] {
            margin: 0px !important;
            padding: 0px !important;
            cursor: pointer;
        }

        input[type=button] {
            cursor: pointer !important;
        }
    </style>

    <script>
        $(document).ready(function () {
            $('[data-toggle="popover"]').popover();
        });
    </script>
    <script>
        $(document).ready(function () {

            new $rab
                .Branch()
                .ApplyTableFilters([
                    {
                        textboxID: 'textboxsearchstring',
                        tbodyID: 'tbodyMembers'
                    },
                    {
                        textboxID: 'textboxRelationSearch',
                        tbodyID: 'tbodyrelationtype'
                    },
                    {
                        textboxID: 'textboxsearchcellgroups',
                        tbodyID: 'tbodycellgroups'
                    },
                    {
                        textboxID: 'textboxAdminName',
                        tbodyID: 'tbodyAccountMembers'
                    },
                    {
                        textboxID: 'textboxMassupdatesearch',
                        tbodyID: 'tbodyMassUpdate'
                    },
                    {
                        textboxID: 'textsearchAttendance',
                        tbodyID: 'tbodyAttendanceHistory'
                    },
                    {
                        textboxID: 'textsearchContribution',
                        tbodyID: 'tbodyContributionHistory'
                    },
                    {
                        textboxID: 'textsearchAppointment',
                        tbodyID: 'tbodyAppointmentHistory'
                    },
                ]
                );

        });
    </script>
    <script>
        //$('[data-toggle="popover"]').popover();
        function activatePanel(evt, cityName) {
            try {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";

            } catch (e) {

            }
        }

        // Get the element with id="defaultOpen" and click on it
        document.getElementById("defaultOpen").click();
    </script>



</body>
</html>
