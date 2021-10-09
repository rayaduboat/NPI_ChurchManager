<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Accounts.aspx.cs" Inherits="Minister_Accounts" %>

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
    <link href="assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
   
    <style>
        .sidenav {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 60px;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

            .sidenav a {
                padding: 8px 8px 8px 32px;
                text-decoration: none;
                font-size: 14px;
                color: #818181;
                display: block;
                transition: 0.3s;
            }

                .sidenav a:hover {
                    color: #f1f1f1;
                }

            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }

        #main {
            transition: margin-left .5s;
            padding: 16px;
        }

        a:active {
            background-color: #293955 !important;
        }
    </style>


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
    <section style="margin-top: 60px;">
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="#" style="display: block; color: white; margin-bottom: 3px;" class="btn " data-toggle="modal" data-target="#AdminAccount">Create Admin Login</a>
            <a href="#" style="display: block; color: white; margin-bottom: 3px;" class="btn " data-toggle="modal" data-target="#AdminAccountPermissionSet">Page Permission</a>
            <a href="#" style="display: block; color: white; margin-bottom: 3px;" class="btn " data-toggle="modal" data-target="#modalBranchAssignment">Branches Permissions</a>

            <%--            <a href="#" style="display: block; color: white; margin-bottom: 3px;" class="btn " data-toggle="modal" data-target="#CreateLocalBranch">Create Local Branch </a>--%>
            <a href="#" style="display: block; color: white; margin-bottom: 3px;" class="btn " data-toggle="modal" data-target="#AdminRevokeAccount">Revoke Login account</a>
            <a href="#" style="display: block; color: white; margin-bottom: 3px;" class="btn " data-toggle="modal" data-target="#AccountAuditTrail">Account Audit Trail</a>
            <a href="#" style="display: block; color: white; margin-bottom: 3px;" class="btn " data-toggle="modal" data-target="#ViewAssignedLogins">View Assigned Logins</a>
            <a id="activationPanel" href="#" style="display: block; color: white; margin-bottom: 3px;" class="btn " data-toggle="modal" data-target="#Activationpanel">Activation panel</a>
            <a href="#" style="display: block; color: white; margin-bottom: 3px;" class="btn " data-toggle="modal" data-target="#modalDataDump">Reporting widgets</a>
            <a href="#" style="display: block; color: white; margin-bottom: 3px;" class="btn " data-toggle="modal" data-target="#modalDeleteMember">Delete member</a>

        </div>

        <div id="main" class="container pt-5">
            <h2>Menu</h2>
            <p><span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776; </span>Click icon to select account type to manage.</p>

        </div>


    </section>
    <section class="modalbodyContent">
        <div class="container">


            <!-- The Modal -->
            <div class="modal fade" id="AdminAccount">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Admin account creating panel</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="btn-group p-0" style="border: 1px solid #e7e7e7; background-color: #e8e8e8; width: 100%">
                                <button onclick='showLoginTab("containerLogin")' id='btnloginsetup' class="btn-group-item" style='border: thin; border-right: 1px solid #818181; padding: 8px!important'>Login account setup</button>
                                <button onclick='showLoginTab("containerPasswords")' id='btnloginpasswords' class="btn-group-item" style='border: thin; border-right: 1px solid #818181; padding: 8px!important'>Passwords</button>
                                <button onclick='showLoginTab("containerComingSoon")' id='btncomingsoon' class="btn-group-item" style='border: thin; border-right: 1px solid #818181; padding: 8px!important'>Coming soon</button>
                            </div>
                            <div style="border: 1px solid #f1f1f1; padding: 10px;">
                                <div id="containerLogin">
                                    <h2>Login account setup</h2>
                                    <hr />
                                    <div class="row" style="margin-bottom: 10px!important;">
                                        <div class="col-sm-4">
                                            <label class="form-control-label">Account Type:</label>
                                        </div>
                                        <div class="col-sm-8">
                                            <select class="form-control" id="selectAdminAccountType">
                                                <option value="Select member Name">Select account Name</option>
                                                <option value="Member">Member</option>
                                                <option value="Presbyter">Presbyter</option>
                                                <option value="FinanceAdmin">FinanceAdmin</option>
                                                <option value="FinanceController">FinanceController</option>
                                                <option value="SuperUser">SuperUser</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="row" style="margin-bottom: 10px!important;">
                                        <div class="col-sm-4">
                                            <label class="form-control-label">BranchName:</label>
                                        </div>
                                        <div class="col-sm-8">
                                            <select id="selectBranchNames" class="form-control" onchange="{new $rab.Accounts.Branch().LoadBranchMembers($(this).val())}">
                                                <option value="Select member Name" selected>Select branch name</option>

                                            </select>
                                        </div>

                                    </div>
                                    <div class="row" style="margin-bottom: 10px!important;">
                                        <div class="col-sm-4">
                                            <label class="form-control-label">User Name:</label>
                                        </div>
                                        <div class="col-sm-8">
                                            <select class="form-control" id="selectMemberNames" onchange="{new $rab.Accounts.Branch().LoadMemberEmail(this)}">
                                                <option value="Select member Name">Select member Name</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="row" style="margin-bottom: 10px!important;">
                                        <div class="col-sm-4">
                                            <label class="form-control-label">Email address<b style="color: red; font-weight: 500">*</b></label>
                                        </div>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-sm-11">
                                                    <input type="text" disabled class="form-control bg-white" id="textboxAdminEmail" title="if email address is empty, please assign member email address in membership list" required placeholder="Email address" />

                                                </div>
                                                <div class="col-sm-1">
                                                    <input type="text" disabled class="form-control hidden bg-white" id="textboxAdminMemberID" value="" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row" style="margin-bottom: 10px!important;">
                                        <div class="col-sm-4">
                                            <label class="form-control-label">Password<b style="color: red; font-weight: 500">*</b></label>
                                        </div>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control bg-white text-black" id="textboxAdminPassword" required placeholder="enter password" />
                                        </div>

                                    </div>
                                    <div class="row" style="margin-bottom: 10px!important;">
                                        <div class="col-sm-4">
                                            <label class="form-control-label">Confirm password<b style="color: red; font-weight: 500">*</b></label>
                                        </div>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control bg-white text-black" id="textboxAdminConfirmPassword" required placeholder="confirm password" />
                                        </div>

                                    </div>
                                    <div class="row" style="margin-bottom: 10px!important;">
                                        <div class="col-sm-4">
                                        </div>
                                        <div class="col-sm-8">
                                            <button type="button" class="btn btn-secondary" onclick="{new $rab.Accounts.Branch().CreateAccount()}">Create</button>

                                        </div>

                                    </div>
                                </div>
                                <div id="containerPasswords" style="display: none">
                                    <h2>Password settings</h2>
                                    <hr />
                                    <div class="container">

                                        <div class="row  m-t-1">
                                            <div class="col-sm-6 p-2" style="text-align: center">Number of days to passwords expiry</div>
                                            <div class="col-sm-2" style="text-align: left">
                                                <input title="Members will be asked to change their password after the number days you specify since password was created" style="background-color: #ffffff" class="form-control text-center" type="text" id="textboxpasswordExpiryDays" />
                                            </div>
                                            <div class="col-sm-2 ">
                                                <button id="btnApplyDaysToExpiry" class="form-control" title="* The number of days entered will be used for changing passwords from the day they were set">
                                                    Apply</button>
                                            </div>
                                            <div class="col-sm-2">
                                                <img style="width: 50px; height: 50px" class="img img-circle" src="assets/images/clock.png" alt="Alternate Text" />
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="container">

                                        <div class="row m-t-1">
                                            <div class="col-sm-6 p-1" style="text-align: center">Force all members to change their passwords</div>
                                            <div class="col-sm-2" style="text-align: left"></div>
                                            <div class="col-sm-2">
                                                <button id="btnForcePasswordReset" class="form-control" title="*This will force all members to change their passwords">Force</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="containerComingSoon" style="display: none">
                                    <h2>Coming soon</h2>
                                    <hr />
                                </div>
                            </div>
                        </div>
                        <script>
                            function showLoginTab(tabName) {
                                if (tabName == 'containerPasswords') setExpiryValue();
                                ['containerLogin', 'containerPasswords', 'containerComingSoon'].forEach(function (value, index) {
                                    if (tabName == value) {
                                        $('#' + value).show();
                                    } else {
                                        $('#' + value).hide();
                                    }
                                });
                            }
                            function setExpiryValue() {
                                try {
                                    var items = $rab.Login.User.Config;
                                    if (items == null) return;
                                    //find item with name PasswordExpiry
                                    var result = items.filter(function (value, index) { return value.Name == 'PasswordExpiry' });
                                    if (result.length != 0) document.getElementById('textboxpasswordExpiryDays').value = result[0].Value;


                                } catch (e) {

                                }

                            }
                            btnForcePasswordReset.onclick = function () {
                                if (confirm('Click Ok to confirm you want to reset all passwords')) {
                                    new $rab.Server.Method().BeginInvoke("Accounts.aspx/ForcePasswordReset", {}, function (jsondata) {
                                        try {
                                            alert(jsondata);
                                        } catch (e) {

                                        }

                                    });

                                }
                            }
                            btnApplyDaysToExpiry.onclick = function () {
                                try {
                                    var days = textboxpasswordExpiryDays.value;
                                    if (days.length == 0) return;
                                    if (!isFinite(days)) { alert('Invalid  number entered, please enter a numeric number'); return; }
                                    new $rab.Server.Method().BeginInvoke("Accounts.aspx/SetExpiryDate",
                                        { numdays: days }, function (jsondata) {
                                            try {
                                                if (jsondata == 'success') { alert(jsondata + " log out and log back in to see propagated changes"); }
                                            } catch (e) {

                                            }
                                        });
                                } catch (e) {

                                }
                            }
                        </script>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <div class="container">


            <!-- The Modal -->
            <div class="modal fade" id="AdminAccountPermissionSet">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title"><kbd>Admin Page Account  Permission Set</kbd></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">



                            <div class="row" style="margin-bottom: 10px!important;">
                                <div class="col-sm-4">
                                    <label class="form-control-label">BranchName:</label>
                                </div>
                                <div class="col-sm-8">
                                    <select id="selectPermissionBranchNames" class="form-control" onchange="{new $rab.Accounts.Permission().LoadBranchMembers($(this).val())}">
                                        <option value="Select member Name" selected>Select branch name</option>

                                    </select>
                                </div>

                            </div>
                            <div class="row" style="margin-bottom: 10px!important;">
                                <div class="col-sm-4">
                                    <label class="form-control-label">Member Name:</label>
                                </div>
                                <div class="col-sm-8">
                                    <select class="form-control" id="selectPermissionMemberNames" onchange="{new $rab.Accounts.Permission().ViewPermission(selectPermissionBranchNames,selectPagePermissionAccountType,selectPermissionMemberNames); }">
                                        <option value="Select member Name">Select member Name</option>
                                    </select>
                                </div>

                            </div>
                            <div class="row" style="margin-bottom: 10px!important;">
                                <div class="col-sm-4">
                                    <label class="form-control-label">Page permission:</label>
                                </div>
                                <div class="col-sm-8">
                                    <select class="form-control" id="selectPagePermissionAccountType">
                                        <option value="Select member Name">Select page permission</option>
                                        <option value="Attendance">Attendance</option>
                                        <option value="Advanced search">Advanced search</option>
                                        <option value="Appointment">Appointment</option>
                                        <option value="Baptism">Baptism</option>
                                        <%--<option value="Census">Census</option>--%>
                                        <option value="Events">Events</option>
                                        <option value="Finances">Finances</option>
                                        <option value="Follow-up">Follow-up</option>
                                        <option value="Gift Aid">Gift Aid</option>
                                        <option value="Membership List">Membership List</option>
                                        <%--<option value="Preaching plan">Preaching plan</option>--%>
                                        <%--<option value="Standard Reports">Standard Reports</option>--%>
                                        <option value="Reports">Reports</option>
                                        <option value="Weekly service report">Weekly service report</option>
                                    </select>
                                </div>

                            </div>
                            <div class="row" style="margin-bottom: 10px!important;">
                                <div class="col-sm-4">
                                    <label class="form-control-label"></label>
                                </div>
                                <div class="col-sm-8" id="">
                                    <button type="button" class="btn btn-secondary" onclick="{new $rab.Accounts.Permission().AddPagePermission(selectPermissionBranchNames,selectPagePermissionAccountType,selectPermissionMemberNames)}">Add</button>
                                </div>

                            </div>
                            <div class="container">



                                <div class="tab">
                                    <button class="tablinks" onclick="openCity(event, 'ViewPermission')" id="defaultOpen">View Permission</button>
                                    <%--<button class="tablinks" onclick="openCity(event, 'RemovePermission')">Remove Permission</button>
                                            <button class="tablinks" onclick="openCity(event, 'AssignPermission')">Assign Permission</button>--%>
                                </div>

                                <div id="ViewPermission" class="tabcontent">
                                    <h3>Permission linked to member</h3>
                                    <div class="col-sm-8" id="table-permission-container"></div>

                                </div>

                                <div id="RemovePermission" class="tabcontent">
                                    <h3>TBC</h3>
                                    <p>....</p>
                                </div>

                                <div id="AssignPermission" class="tabcontent">
                                    <h3>TBC</h3>
                                    <p>.....</p>
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

        </div>
        <div class="container">


            <!-- The Modal -->
            <div class="modal fade" id="CreateLocalBranch">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title"><kbd>Church Branch Creation</kbd></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="container">
                                <div class="row mb-2">

                                    <div class="col-sm-3">Branch name</div>
                                    <div class="col-sm-8">
                                        <input type="text" id="textboxNewBranchName" class="form-control" />
                                    </div>

                                </div>
                            </div>
                            <div class="container">
                                <div class="row mb-2">

                                    <div class="col-sm-3">Address</div>
                                    <div class="col-sm-8">
                                        <input type="text" id="textboxNewBranchAddress" class="form-control" />
                                    </div>

                                </div>
                            </div>
                            <div class="container">
                                <div class="row mb-2">

                                    <div class="col-sm-3">Telephone</div>
                                    <div class="col-sm-8">
                                        <input type="text" id="textboxNewBranchTelephone" class="form-control" />
                                    </div>

                                </div>
                            </div>

                            <div class="container">
                                <div class="row mb-2">

                                    <div class="col-sm-3">Presiding Elder</div>
                                    <div class="col-sm-8">
                                        <input type="text" id="textboxNewBranchPresidingElder" class="form-control" />
                                    </div>

                                </div>
                            </div>
                            <div class="container">
                                <div class="row mb-2">

                                    <div class="col-sm-3">Website</div>
                                    <div class="col-sm-8">
                                        <input type="text" id="textboxNewBranchWebsite" class="form-control" />
                                    </div>

                                </div>
                            </div>
                            <div class="container">
                                <div class="row mb-2">

                                    <div class="col-sm-3">Email</div>
                                    <div class="col-sm-8">
                                        <input type="text" id="textboxNewBranchEmail" class="form-control" />
                                    </div>

                                </div>
                            </div>

                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button style="display: none;" type="button" class="btn btn-secondary">Update</button>
                            <button type="button" onclick="{new $rab.Accounts.Branch(textboxNewBranchName.value).CreateBranch()}" class="btn btn-secondary">Add</button>
                            <button type="button" id="closeNewBranchModal" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <div class="container">


            <!-- The Modal -->
            <div class="modal fade" id="modalBranchAssignment">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title"><kbd>Member Branches assginment  window</kbd></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body" id="modalbranchpermissions">
                            <div style="background-color: #f1f1f1">
                                <%--<button onclick='showBranchGrouping("containerBranchAssignment")'>Branch assignment</button>--%>
                                <button class="branchSetupButtonHeaders" id="btndefault" onclick='showBranchGrouping("containerGroupSetup")'>Area and District setup</button>
                                <button class="branchSetupButtonHeaders" onclick='showBranchGrouping("containerGroupAssignment")'>Branch group assignment</button>
                            </div>
                            <div class='border'>
                                <div id="containerBranchAssignment" style="display: none; padding: 20px; background-color: #d0caf2">
                                    <a href="#helpBranchAssignment" data-toggle="collapse" data-target="#helpBranchAssignment">Click to see help</a>
                                    <div id="helpBranchAssignment" class="collapse hide">
                                        Branch assignment is used in assigning local branches which form part of
                                an administrative area. Example minister can be assigned a number of branches
                                they oversee. Follow steps below to assign branches
                                <ol>
                                    <li>Click on the load button to load branches</li>
                                    <li>Select a branch where the member is part of.</li>
                                    <li>Select the member name.</li>
                                    <li>Select the branch where member is to oversee</li>
                                    <li>Click on add button to add. </li>
                                    <li>Click on image remove image to remove branch
                                        <img src="assets/images/delete.png" width="25" height="25" /></li>
                                </ol>
                                    </div>

                                    <div class="row" style="margin-bottom: 10px!important;">
                                        <div class="col-sm-4">
                                            <label class="form-control-label">BranchName:</label>
                                        </div>
                                        <div class="col-sm-4">
                                            <select id="selectBranchAssignmentBranchNames" class="form-control" onchange="{new $rab.BranchAssignment().LoadBranchMembers($(this).val())}">
                                                <option value="Select branch" selected>no branches loaded </option>

                                            </select>
                                        </div>
                                        <div class="col-sm-4 p-2">
                                            <button id="btnLoadAssignment"><i class="fa fa-refresh fa-lg"></i>Load </button>
                                            <script>
                                                btnLoadAssignment.onclick = function () {
                                                    try {
                                                        $('#selectBranchAssignmentBranchNames,#selectBranchAssignmentSelection,#selectBranchAssignmentMemberNames').empty();
                                                        $rab.Utilities.FillOptions(['Select branch'], 'selectBranchAssignmentBranchNames');
                                                        $rab.Utilities.FillOptions(['Select branch'], 'selectBranchAssignmentSelection');
                                                        $rab.Utilities.FillOptions(['Select member name'], 'selectBranchAssignmentMemberNames');
                                                        $rab.Church.LoadBranchNamesInSelectControls(['selectBranchAssignmentBranchNames', 'selectBranchAssignmentSelection']);
                                                    } catch (e) {

                                                    }
                                                }
                                            </script>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom: 10px!important;">
                                        <div class="col-sm-4">
                                            <label class="form-control-label">Member Name:</label>
                                        </div>
                                        <div class="col-sm-8">
                                            <select class="form-control" onchange="new $rab.BranchAssignment().buildTable(this.value)" id="selectBranchAssignmentMemberNames">
                                                <option value="Select member Name">Select member Name</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="row" style="margin-bottom: 10px!important;">
                                        <div class="col-sm-4">
                                            <label class="form-control-label">Branches to assign:</label>
                                        </div>
                                        <div class="col-sm-8">
                                            <select class="form-control" id="selectBranchAssignmentSelection">
                                            </select>
                                        </div>

                                    </div>
                                    <div class="row" style="margin-bottom: 10px!important;">
                                        <div class="col-sm-4">
                                            <label class="form-control-label"></label>
                                        </div>
                                        <div class="col-sm-8" id="">
                                            <button type="button" class="btn btn-secondary" onclick="new $rab.BranchAssignment().Add()">Add</button>
                                        </div>

                                    </div>
                                    <div class="container">

                                        <table class="table table-hover table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>Assigned Branch ID</th>
                                                    <th>Assigned Branch Name</th>
                                                    <th colspan="3">Management actions</th>

                                                </tr>
                                            </thead>
                                            <tbody id="tbodyAssignedBranches">
                                            </tbody>
                                        </table>

                                    </div>

                                </div>
                                <div id="containerGroupSetup" style="padding: 20px; background-color: #eeeeee">
                                    <a href="#helpBranchAssignment" data-toggle="collapse" data-target="#helpDistrictAreaSetup">Click to see help</a>
                                    <div id="helpDistrictAreaSetup" class="collapse ">
                                        To create a branch or a district please follow the steps below
                                <ol>
                                    <li>Click on the load button to load branches</li>
                                    <li>Select a branch where the member is part of.</li>
                                    <li>Select the member name.</li>
                                    <li>Select the branch where member is to oversee</li>
                                    <li>Click on add button to add. </li>
                                    <li>Click on image remove image to remove branch
                                        <img src="assets/images/delete.png" width="25" height="25" /></li>
                                </ol>
                                    </div>

                                    <div class="row" style="margin-bottom: 10px!important;">
                                        <div class="col-sm-4">
                                            <label class="form-control-label">Branches Grouping type:</label>
                                        </div>
                                        <div class="col-sm-4">
                                            <select id="selectBranchesGroupingType" class="form-control">
                                                <option value="Select grouping" selected>Select grouping </option>
                                                <option value="Area">Area </option>

                                                <option value="District">District </option>
                                               <%-- <option value="Country">Country </option>--%>
                                                 
                                            </select>
                                        </div>

                                    </div>
                                    <div class="row" style="margin-bottom: 10px!important;">
                                        <div class="col-sm-4">
                                            <label class="form-control-label  mbr-bold">Grouping Name:</label>
                                        </div>
                                        <div class="col-sm-8">
                                            <input id="textboxBranchGroupName" type="text" title="name to give to your newly created Area, District or Nation" class="form-control" value="" />
                                        </div>

                                    </div>
                                    <h4>Add branches that form Grouping</h4>
                                    <hr />
                                    <div class="row" style="margin-bottom: 10px!important;">
                                        <div class="col-sm-2 " style="text-align: right!important"></div>
                                        <div class="col-sm-8 " id="">
                                            <div class="container">
                                                <div class="row" style="background-color: #f1f1f1; padding: 0px!important">

                                                    <div class="col-sm-1 p-3 text-center"><i class="fa fa-search fa-lg pr-1"></i></div>
                                                    <div class="col-sm-11" style="padding: 0px!important">
                                                        <input id="textboxSearchAreaDistrictSetUp" class="form-control" style="margin: 0px!important" type="text" placeholder="enter search string" value="" />
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="row" style="margin-bottom: 10px!important;">
                                        <div class="col-sm-2 text-right text-center pt-2" style="text-align: right!important; padding-top: 10px!important">
                                            <button id="btnLoadAllBranches"><i class="fa fa-refresh fa-lg"></i>load</button>
                                            <script>
                                                btnLoadAllBranches.onclick = function () {
                                                    try {
                                                        $('#selectBranchGroupAdditions').empty();
                                                        $rab.Utilities.FillOptions(['Select branch'], 'selectBranchGroupAdditions');
                                                        $rab.Church.LoadBranchNamesInSelectControls(['selectBranchGroupAdditions']);
                                                        new $rab.BranchGroupingSetUp().initialiseTable();// load all branch grouping when loading branches
                                                    } catch (e) {

                                                    }
                                                }
                                            </script>

                                        </div>
                                        <div class="col-sm-8">
                                            <select class="form-control" id="selectBranchGroupAdditions">
                                                <option>select branch</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-2 p-2">
                                            <button onclick="new $rab.BranchGroupingSetUp().Add();">Add</button>

                                        </div>
                                    </div>

                                    <div class="container">

                                        <table class="table table-hover table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>BranchGroupingType  </th>
                                                    <th>GroupingName        </th>
                                                    <th>BranchName          </th>
                                                    <th>BranchID            </th>
                                                    <th>Action                  </th>
                                                </tr>
                                            </thead>
                                            <tbody id="tbodyGroupedTobeAssigned">
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                                <div id="containerGroupAssignment" style="display: none; background-color: #f6e2ba; padding: 5px">
                                    <a href="#" data-toggle="collapse" data-target="#helpgroupassignment">Click to see help</a>
                                    <hr />
                                    <div id="helpgroupassignment" class="collapse">
                                        <ol class=" text-white" style="color: black!important">
                                            <li>Select a branch where member belongs</li>
                                            <li>Select member name.</li>
                                            <li>Select branch grouping type e.g. Area or District</li>
                                            <li>Select name of Group e.g. Graceland District for grouping type District</li>
                                            <li>Click add to assign group to member</li>
                                            <li>Report of members with assigned groups is shown in table below</li>
                                            <li>To remove assigned group,click on the image
                                                <img src="assets/images/delete.png" style="width: 25px; height: 25px" />
                                                next to person name </li>
                                        </ol>
                                    </div>

                                    <!-- -->
                                    <div style="padding: 10px">
                                        <div class="row pb-2">
                                            <div class="col-sm-4">
                                                <label class="form-control-label  ">Member branch:</label>
                                            </div>
                                            <div class="col-sm-4">
                                                <select id="selectGroupsMemberBranch" class="form-control" onchange="{new $rab.GroupAssignment().LoadBranchMembers($(this).val())}">
                                                    <option value="Select branch" selected>no branches loaded </option>

                                                </select>
                                            </div>
                                            <div class="col-sm-4 ">
                                                <button id="btnLoadGroupAssignment"><i class="fa fa-refresh fa-lg"></i>Load </button>

                                            </div>
                                        </div>
                                        <div class="row" style="margin-bottom: 10px!important;">
                                            <div class="col-sm-4">
                                                <label class="form-control-label ">Member name</label>
                                            </div>
                                            <div class="col-sm-8">
                                                <select class="form-control" id="selectGroupsMemberNames">
                                                </select>
                                            </div>

                                        </div>
                                        <div class="row" style="margin-bottom: 10px!important;">
                                            <div class="col-sm-4">
                                                <label class="form-control-label  ">Branch Grouping type:</label>
                                            </div>
                                            <div class="col-sm-4">
                                                <select onchange="new $rab.GroupAssignment().loadFilter(this.value,'selectGroupsBranchGroupingNames')" class="form-control" id="selectGroupsBranchGroupingType">

                                                    <option value="Select grouping" selected>Select grouping </option>
                                                    <option value="Area">Area </option>
                                                    <option value="District">District </option>
                                                    <%-- <option value="Country">Country </option>--%>
                                                </select>

                                            </div>
                                            <div class="col-sm-4 ">
                                            </div>
                                        </div>
                                        <div class="row" style="margin-bottom: 10px!important;">
                                            <div class="col-sm-4">
                                                <label class="form-control-label  ">Branch Grouping name:</label>
                                            </div>
                                            <div class="col-sm-8">
                                                <select class="form-control" id="selectGroupsBranchGroupingNames">
                                                    <option value="Select group name">no names loaded</option>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="row" style="margin-bottom: 10px!important;">
                                            <div class="col-sm-4">
                                                <label class="form-control-label"></label>
                                            </div>
                                            <div class="col-sm-8" style="padding: 0px!important">
                                                <button type="button" class="btn btn-secondary" onclick="new $rab.AreaDistrictAssignment().Assign()">Add</button>
                                            </div>

                                        </div>
                                        <div class="container">
                                            <h4 class="">Report of members with assigned groups</h4>
                                            <hr />
                                            <table class="table table-hover table-responsive">
                                                <thead>
                                                    <tr>
                                                        <th>MemberName</th>
                                                        <th>Group assigned</th>
                                                        <th colspan="3">Management actions</th>

                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyAssignedGroups">
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                    <script>
                                        btnLoadGroupAssignment.onclick = function () {
                                            try {
                                                $('#selectGroupsMemberBranch,#selectGroupsMemberNames').empty();
                                                $rab.Utilities.FillOptions(['Select branch'], 'selectGroupsMemberBranch');

                                                $rab.Utilities.FillOptions(['Select member name'], 'selectGroupsMemberNames');
                                                $rab.Church.LoadBranchNamesInSelectControls(['selectGroupsMemberBranch']);
                                                new $rab.GroupAssignment().buildGroups();
                                            } catch (e) {

                                            }
                                        }
                                    </script>
                                </div>
                            </div>
                            <script>

                                function showBranchGrouping(id) {
                                    ["containerGroupAssignment",
                                        "containerGroupSetup",
                                        "containerBranchAssignment"].forEach(function (value, index) {
                                            if (value != id) $('#' + value).hide();
                                            if (value == id) $('#' + value).show();
                                        })
                                }
                            </script>
                            <style>
                                .border {
                                    border: 1px solid #d6dbe9;
                                    padding: 2px;
                                }

                                    .border input[type=text], .border select {
                                        background-color: white !important;
                                    }

                                .branchSetupButtonHeaders:focus {
                                    background-color: red !important;
                                    color: white !important;
                                    border:thin;
                                    padding:2px;
                                }
                            </style>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">

                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <div class="container">


            <!-- The Modal -->
            <div class="modal fade" id="AdminRevokeAccount">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Revoke Login Account</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="container">
                                <div class="row mb-2">
                                    <div class="col-sm-5">
                                        <button value="Load Branches" class="btn btn-secondary" onclick="{new $rab.PagesAudit().LoadBranches('selectRevokeBranch')}">Load Branches</button>
                                    </div>
                                    <div class="col-sm-7">
                                        <select class="form-control" id="selectRevokeBranch" onchange="{new $rab.AccountRevocation('selectRevokeMembers').GetMemberNames(selectRevokeBranch.value)}">
                                            <option value="Select branch">Select branch</option>
                                        </select>
                                    </div>

                                </div>
                            </div>
                            <div class="container">
                                <div class="row mb-2">
                                    <div class="col-sm-5">Member names</div>
                                    <div class="col-sm-7">
                                        <select class="form-control" id="selectRevokeMembers">
                                            <option value="Select member">Select member</option>
                                        </select>
                                    </div>

                                </div>
                            </div>

                            <div class="container">
                                <div class="row mb-2">

                                    <div class="col-sm-5">Revocation type</div>
                                    <div class="col-sm-7">
                                        <select class="form-control" id="seletRevocationType">
                                            <option value="Select revocation type">Select revocation type</option>
                                            <option value="Temporary lock">Temporary lock</option>
                                            <option value="Delete account">Delete account</option>
                                        </select>

                                    </div>

                                </div>
                            </div>
                        </div>


                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" onclick="{new $rab.AccountRevocation().Revoke(seletRevocationType.value)}">Revoke</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>



                </div>
            </div>
        </div>

        <div class="container">


            <!-- The Modal -->
            <div class="modal fade" id="AccountAuditTrail">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Audit Trail</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="container">
                                <div class="row mb-2">
                                    <div class="col-sm-4">
                                        <button value="Load Branches" class="form-control" onclick="{new $rab.PagesAudit().LoadBranches('selectAuditTrailBranch')}">Load Branches</button>
                                    </div>
                                    <div class="col-sm-4">
                                        <select class="form-control" id="selectAuditTrailBranch" onchange="{new $rab.PagesAudit().GetAuditTrail(this.value)}">
                                            <option value="Select branch">Select branch</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-4"></div>
                                </div>
                            </div>

                            <div class="container">
                                <table class="table-responsive" style="font-size: 18px!important; width: 100%; height: 100%">
                                    <thead style="background-color: #293955!important; color: white!important;">
                                        <tr style="background-color: #080000; color: white!important; border: 10px;" class="">
                                            <td>Branch Name</td>
                                            <td>Member name</td>
                                            <td>Date loggedin</td>
                                            <td>Time loggedin</td>
                                            <td>Pages visited</td>
                                        </tr>

                                    </thead>
                                    <tbody id="tbodyAuditTrailBody">
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <div class="container">


            <!-- The Modal -->
            <div class="modal fade" id="Activationpanel">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Activation panel</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">

                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-3" style="font-weight: 800;">Personal data update</div>
                                    <div class="col-sm-1">
                                        <input type="checkbox" id="checkboxPersonalData" class="form-control" name="name" value="" />
                                    </div>
                                    <div class="col-sm-4"><span id="flagPersonalDataStatus" style="display: block; color: red;">Activated</span></div>
                                    <div class="col-sm-4">

                                        <a href="MemberUpdate.aspx">MemberUpdate.aspx</a>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-sm-3" style="font-weight: 800">Census</div>
                                    <div class="col-sm-1">
                                        <input type="checkbox" id="checkboxCensus" class="form-control" name="name" value="" />
                                    </div>
                                    <div class="col-sm-4"><span id="flagCensus" style="display: block; color: green;">Deactivated</span></div>
                                    <div class="col-sm-4">

                                        <a href="Census.aspx">Census.aspx</a>
                                    </div>
                                </div>
                                <script>
                                    checkboxPersonalData.onchange = function () {
                                        var url = "";
                                        if (this.checked) url = "Accounts.aspx/PersonalDataUpdateActivate";
                                        if (!this.checked) url = "Accounts.aspx/PersonalDataUpdateDeActivate";

                                        new $rab.Server.Method().BeginInvoke(url,
                                            {},
                                            function (jsondata) {
                                                try {
                                                    if (jsondata == "failed") throw new Error("Failed changing status");
                                                    //IF jsondata is success then personal data is activated
                                                    if (jsondata == "Personal data update activated" ||
                                                        jsondata == "Personal data update deactivated" ||
                                                        jsondata == "Personal data update already active"
                                                    ) {
                                                        if (checkboxPersonalData.checked) {
                                                            flagPersonalDataStatus.style.color = "green";
                                                            flagPersonalDataStatus.innerHTML = "Activated";
                                                        } else {
                                                            flagPersonalDataStatus.style.color = "red";
                                                            flagPersonalDataStatus.innerHTML = "Deactivated";
                                                        }
                                                    }
                                                    alert(jsondata);
                                                    // if (jsondata == "Personal data update already active") throw new Error(jsondata);

                                                } catch (e) {
                                                    alert(e.message);
                                                }

                                            });
                                    }
                                    checkboxCensus.onchange = function () {

                                        var url = "";
                                        if (this.checked) url = "BranchCensus.aspx/Activate";
                                        if (!this.checked) url = "BranchCensus.aspx/DeActivate";

                                        new $rab.Server.Method().BeginInvoke(url,
                                            {},
                                            function (jsondata) {
                                                try {
                                                    if (jsondata.indexOf("failed") != -1) throw new Error("Failed changing status");
                                                    //IF jsondata is success then personal data is activated
                                                    if (jsondata == "Census activated" || jsondata == "Census deactivated") {
                                                        if (checkboxCensus.checked) {
                                                            flagCensus.style.color = "green";
                                                            flagCensus.innerHTML = "Activated";
                                                        } else {
                                                            flagCensus.style.color = "red";
                                                            flagCensus.innerHTML = "Deactivated";
                                                        }
                                                    }
                                                    //if
                                                    alert(jsondata);
                                                } catch (e) {
                                                    alert(e.message);
                                                }

                                            });
                                    }
                                    activationPanel.onclick = function () {
                                        try {
                                            var url = "Accounts.aspx/CheckPersonalDataUpdateStatus";
                                            new $rab.Server.Method().BeginInvoke(url, {}, function (jsondata) {
                                                try {
                                                    var parsed = JSON.parse(jsondata);
                                                    if (parsed.CensusStatus == "active") {
                                                        checkboxCensus.checked = true;
                                                        flagCensus.style.color = "green";
                                                        flagCensus.innerHTML = "Activated";
                                                    } else {
                                                        checkboxCensus.checked = false;
                                                        flagCensus.style.color = "red";
                                                        flagCensus.innerHTML = "Deactivated";
                                                    }
                                                    if (parsed.PersonalStatus == "active") {
                                                        checkboxPersonalData.checked = true;
                                                        flagPersonalDataStatus.style.color = "green";
                                                        flagPersonalDataStatus.innerHTML = "Activated";
                                                    } else {
                                                        checkboxPersonalData.checked = false;
                                                        flagPersonalDataStatus.style.color = "red";
                                                        flagPersonalDataStatus.innerHTML = "Deactivated";
                                                    }
                                                } catch (e) {
                                                    alert(e.message);
                                                }
                                            });
                                        } catch (e) {
                                            alert(e.message);
                                        }
                                    }
                                </script>
                            </div>

                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <div class="container">


            <!-- The Modal -->
            <div class="modal fade" id="ViewAssignedLogins" style="left: 20px!important;">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="width: 1250px!important; left: -320px!important; position: relative!important">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">People who have been given login access</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="container">
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <button value="Load logins" class="form-control" onclick="{$rab.Accounts.LoadAssignedLogins()}">Load logins</button>

                                    </div>
                                    <div class="col-sm-1 pt-2 text-lg-right"></div>
                                    <div class="col-sm-4">
                                        <input id="textboxsearchstring" type="text" class="form-control" placeholder="enter string" />

                                        <%-- <select class="form-control" id="selectbranchlogins">
                                            <option value="Select branch">Select branch</option>
                                        </select>--%>
                                    </div>
                                    <div class="col-sm-2 pt-2 text-lg-right"></div>
                                    <div class="col-sm-2">

                                        <%-- <select class="form-control" id="selectlogintype">
                                            <option value="Select login type">Select login type</option>
                                            <option value="Member">Member</option>
                                            <option value="Presbyter">Presbyter</option>
                                            <option value="FinanceAdmin">FinanceAdmin</option>
                                            <option value="FinanceController">FinanceController</option>
                                            <option value="SuperUser">SuperUser</option>
                                        </select>--%>
                                    </div>

                                </div>
                            </div>

                            <div class="container">
                                <h4 style="font-family: Calibri"><kbd>Check to assign page(s) to login accounts</kbd></h4>
                                <table class=" table table-stripped table-responsive">
                                    <thead>
                                        <tr>
                                            <%--<td>Branch name</td>--%>
                                            <td>Member name</td>
                                            <%--<td>Login type</td>--%>
                                            <td>Attendance                  </td>
                                            <td>Appointment                 </td>
                                            <td>Baptism                     </td>
                                            <td>Census                      </td>
                                            <td>Events                      </td>
                                            <td>Finances                    </td>
                                            <td>Follow-up                   </td>
                                            <td>Gift Aid                    </td>
                                            <td>Membership List             </td>
                                            <%--<td>Preaching plan              </td>--%>
                                            <%--<td>Standard Reports            </td>--%>
                                            <%--<td>Weekly service report       </td>--%>
                                            <%--<td>Preaching plan              </td>--%>
                                            <td>Standard Reports            </td>
                                            <td>Weekly service report       </td>
                                        </tr>

                                    </thead>
                                    <tbody id="tbodyAssignedLogins">
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <div class="container">


            <!-- The Modal -->
            <div class="modal fade" id="modalDataDump">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Reports widgets</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <h1>Using data dump[Runs on ONLY Windows]</h1>
                            <ol>
                                <li>Click on the link below to download application</li>
                                <li>If you are running Windows 10 you get a security promp to say file being downloaded is not safe, ignore message and click <kbd>More info</kbd></li>
                                <li>Click Run anyway to continue to install application</li>
                                <li>You then get another prompt with application author certificate warning, ignore and continue to install</li>
                                <li>After installation application runs, click connect to specify your email address and password</li>
                                <li>Your email address and password is the same as the one you use to login on the web.</li>
                            </ol>
                            <a href="published/setup.exe">Rabant data dump</a>

                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <div class="container">


            <!-- The Modal -->
            <div class="modal fade" id="modalDeleteMember">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Delete member modal</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <h1>How to delete a member</h1>
                            <ol>
                                <li>Select the branch to load members</li>
                                <li>Search a member(s) to delete by typing any part of their name into search textbox</li>
                                <li>Click delete button to delete member from branch</li>
                            </ol>
                            <div class="row">
                                <div class="col-sm-4 text-right p-3"></div>
                                <div class="col-sm-4">
                                </div>
                                <div class="col-sm-4"></div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-sm-6 text-right">
                                    <select onchange="{new $rab.update().getMembers();}" class="form-control" id="selectLoadBranchNames">
                                        <option value="Select branch name">Select branch name</option>
                                    </select>
                                </div>
                                <div class="col-sm-6">
                                    <input placeholder="enter member name ..." class="form-control" type="text" id="textboxsearch" value="" />

                                </div>

                            </div>
                            <h4>List of members in branch</h4>
                            <hr />
                            <table id="tableDelete" class="table table-responsible table-stripped">
                                <thead>
                                    <tr>
                                        <th>MemberID</th>
                                        <th>LastName</th>
                                        <th>FirstName</th>
                                        <th>MembershipType</th>
                                        <th>Action</th>
                                    </tr>

                                </thead>
                                <tbody id="tbodyMembersToDelete">
                                    <tr>
                                    </tr>
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
    <section style="height: 1500px; position: relative;">
        <div style="text-align: center; background-size: cover; background-position: center; background-repeat: no-repeat; height: 50%; background-image: url('../assets/images/photo-1.jpg')">
            <span style="margin: 0 auto; position: relative; font-size: 120pt; font-weight: 800!important;">Accounts manager</span>
        </div>

    </section>
    <section class="modal-dialog-1">
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
                        <a href="Standard.aspx" class="text-black">Standard</a>
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
    <script src="assets/script/Accounts.js"></script>
    <script src="assets/script/memberDelete.js"></script>
     
    <style>
        

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
        .tabcontent {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }
    </style>
    <script>
        function openCity(evt, cityName) {
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
        }

        // Get the element with id="defaultOpen" and click on it
        document.getElementById("defaultOpen").click();
    </script>
    <script>
        $rab.Security.Church.LoadBranches("selectBranchNames");
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
            document.getElementById("main").style.marginLeft = "250px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
            document.getElementById("main").style.marginLeft = "0";
        }
    </script>
    <script>
        $(document).ready(function () {
            // $rab.Church.LoadBranches("selectBranchNames");


            $("#textboxsearch").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#tbodyMembersToDelete tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
            $("#textboxsearchstring").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#tbodyAssignedLogins tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
</body>
</html>
