<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Appointment.aspx.cs" Inherits="Appointment" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="MembershipList">
    <title>Appointments

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
<body ng-app="">
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
                 
            </div>
        </nav>
    </section>
    <section class="section-table cid-qBsl1UHSIu" id="table1-0"   >


        <div class="container container-table">
            <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Appointments</h2>
            <h3 class="mbr-section-subtitle mbr-fonts-style align-center pb-5 mbr-light display-5">Appointment list </h3> 
        </div> 
    </section>

    <section class="p-3" style="background-color: #d6dbe9!important;margin-top:-80px">
        <button onclick='showTab("report")'>View appointment</button>
        <button id="buttonNewAppointment" onclick='showTab("details")'>Add new appointment</button>
        <button onclick='showTab("roles")'>Roles</button>
        <button onclick='showTab("stats")'>Statistics</button>

        <script>
            function showTab(tabName) {
                ["report", "details", "stats", "roles"]
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
                                <select id="selectBranchNames" class="form-control" onchange="new $rab.Appointment().LoadAppointments() "  >
                                    <option selected value="Select branch">Please select branch</option>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <button class="m-2 p-2" type="button" id="buttonSearch"     onclick="{ new $rab.Appointment().LoadAppointments() }" >Load data</button>
                            </div>
                            <div class="col-sm-5">
                                <input type="text" style="background-color: white;" class="form-control" id="textboxsearchstring" name="findText" value="" placeholder="enter search string" />
                            </div>
                            <div class="col-sm-1">
                                <span id="spanAppointment" data-toggle="modal" data-target="#myModal"></span>
                                <%--<button   id="buttonAddNewAppointee"  >New</button>--%>
                                <%--<script>
                                    buttonAddNewAppointee.onclick = function () {
                                        if (selectBranchNames.value == "Select branch") { alert("Select branch"); return; }
                                        spanAppointment.click();
                                    }
                                </script>--%>
                            </div>
                            <div class="col-sm-1">
                                 
                            </div>
                        </div>
                    </div>
        
        <div class="container">
                    <div class="row m-2">
                        <div class="col-sm-4">
                             <span class="shadow" style="display:block;background-color:red;width:30px;height:20px;float:left; box-shadow:2px 3px ""></span>
                            <label style="float:right">Roles less than 3 months to expiry</label>
                            
                        </div>
                        <div class="col-sm-4">
                            <span class="shadow" style="display:block;background-color:orange;width:30px;height:20px;float:left; box-shadow:2px 3px "></span>
                            <label style="float:right">Roles less than 6 months to expiry</label>
                            
                        </div>
                        
                        <div class="col-sm-4">
                             <span class="shadow" style="display:block;background-color:darkgreen;width:30px;height:20px;float:left; box-shadow:2px 3px ""></span>
                            <label style="float:right">Roles less than 2 years to expiry</label>
                            
                        </div>
                    </div>
                    
                
                             
                </div>
         <table class="table table-hover table-responsive"   id="tableMembercontributions">
                        <thead>
                            <tr class="">

                                <th class="head-item mbr-fonts-style display-7">MemberID</th>
                                <th class="head-item mbr-fonts-style display-7">Last Name</th>
                                <th class="head-item mbr-fonts-style display-7">First Name</th>
                                <th class="head-item mbr-fonts-style display-7">Number Of Roles</th>
                                <th class="head-item mbr-fonts-style display-7">Days to expiry</th>
                                <th class="head-item mbr-fonts-style display-7">Flag</th>
                                <th class="head-item mbr-fonts-style display-7">Review</th>
                                <th class="head-item mbr-fonts-style display-7">CreatedOn</th>
                                <th class="head-item mbr-fonts-style display-7">LastUpdatedBy</th>


                            </tr>
                        </thead>
                        <tbody id="tbodyAppointees">
                        </tbody>
                    </table>
    </section>
    <section id='details' style="display: none;margin-top:-15px">
        <h4 class="text-center p-2">Add new appointment</h4>
        <hr style="" />
        <div class="container">
                            <div class="row mb-2 mt-2">
                                <div class="col-sm-3 text-right">
                                    Member
                                </div>
                                <div class="col-sm-7 pt-2">
                                    <select id="selectAppMemberID" class="form-control">
                                        <option value="Select member">Select member name</option>
                                    </select>
                                </div>

                                <div class="col-sm-2 pt-2">
                                    <button   onclick="{new $rab.Appointment().LoadBranchMembers()}">Load</button>
                                </div>
                            </div>
                            <div class="row mb-2 mt-2">
                                <div class="col-sm-3 text-right pt-2">
                                    Roles

                                </div>

                                <div class="col-sm-7 pt-2">
                                    <select id="selectAppRoleID" class="form-control">
                                        <option value="Select Role">Select Role</option>
                                    </select>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3 text-right pt-2">Start Date</div>
                                <div class="col-sm-7">
                                     
                                    <input name="myName" ng-model="myName" required id="textboxDateApptStart" placeholder="dd/mm/yyyy" type="text"   value="" class="form-control" />
                                    <span></span>
                                </div>

                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3 text-right pt-2">End Date</div>
                                <div class="col-sm-7">
                                    <input id="textboxDateApptEnd" placeholder="dd/mm/yyyy" type="text" name="name" value="" class="form-control" />
                                </div>

                            </div>
                            <div class="row mb-2" style="display:none;">
                                <div class="col-sm-3 text-right pt-2">Alert Notice Days</div>
                                <div class="col-sm-7 pt-2">
                                    <input id="selectAppAlertPeriod" placeholder="Input Days to Expiry Alert" title="Input Days to Expiry Alert" type="text" name="name" value="0" class="form-control" />
                                </div>

                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3 text-right pt-2">Location</div>
                                <div class="col-sm-7">
                                    <input id="textboxLocation" placeholder="Input Location" type="text" name="name" value="" class="form-control" />
                                </div>

                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3 text-right pt-2">Authorising Minister</div>
                                <div class="col-sm-7">
                                    <input id="textboxauthorisingofficial" placeholder="Input Authorising Minister" type="text" name="name" value="" class="form-control" />
                                </div>

                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3 text-right pt-2">Comment</div>
                                <div class="col-sm-9">
                                    <textarea rows="6" cols="6" id="textboxApptComment" class="form-control" placeholder="Input Comment"></textarea>

                                </div>

                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3 text-right pt-2">

                                </div>
                                <div class="col-sm-9">
                                       <button type="button" onclick="{new $rab.Appointment().Add()}"  >Add</button>
                                       <button type="button"   data-dismiss="modal" id="closenewappointmentmodal">Close</button>
                                </div>
                            </div>                            

        </div>
         <hr />
    </section>
    <section id='stats' style="display: none"></section>
    <section id='roles' style="display: none;margin-top:-10px">
        <hr class="m-2" />
                                <div class="container">
                                <h3>New role</h3>
                                <div class="row mb-3 ml-2">
                                    <div class="col-sm-3 text-right text-blue pt-3" style="font-weight: 800">Enter new roles</div>
                                    <div class="col-sm-9">
                                        <input type="text" id="textboxRoles" class="form-control" placeholder="enter new activties seperated by comma's" value="" />
                                        e.g Administrator,Secretary,Evangelism leader, 
                                    </div>
                                </div>
                                <div class="row mb-3 ml-2">
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-3">
                                        <button class="form-control" onclick="new $rab.Appointment.Roles().AddDictionary(textboxRoles.value)">Add</button>
                                    </div>
                                </div>
                                </div>
        <hr class="m-2" />
        <div class="container">
            <button onclick="new $rab.Appointment.Roles().GetRoles();" >load roles</button>
            <table class="table table-striped table-responsive">
                <caption title="Created roles"> Created roles</caption>
               <thead>
                 <tr>
                    <td> ID    </td>
                    <td> Role    </td>
                    <td> Action    </td>
                </tr>
               </thead>
                <tbody id="tbodyRoles">
                    <tr>
                    <td> #</td>
                    <td> No roles loaded    </td>
                    <td> <button>delete</button></td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>


    <section class="modal-dialog-1" >
        <div class="container" >


            <!-- The Modal -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title"><kbd>Appointment new role assignment</kbd></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                           <%-- <div class="row mb-2 mt-2">
                                <div class="col-sm-3 text-right">
                                    Member
                                </div>
                                <div class="col-sm-7 pt-2">
                                    <select id="selectAppMemberID" class="form-control">
                                        <option value="Select member">Select member name</option>
                                    </select>
                                </div>

                                <div class="col-sm-2 pt-2">
                                    <button class="form-control" onclick="{new $rab.Appointment().LoadBranchMembers()}">Load</button>
                                </div>
                            </div>
                            <div class="row mb-2 mt-2">
                                <div class="col-sm-3 text-right pt-2">
                                    Roles

                                </div>

                                <div class="col-sm-7 pt-2">
                                    <select id="selectAppRoleID" class="form-control">
                                        <option value="Select Role">Select Role</option>
                                    </select>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3 text-right pt-2">Start Date</div>
                                <div class="col-sm-7">
                                     
                                    <input name="myName" ng-model="myName" required id="textboxDateApptStart" placeholder="dd/mm/yyyy" type="text"   value="" class="form-control" />
                                    <span></span>
                                </div>

                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3 text-right pt-2">End Date</div>
                                <div class="col-sm-7">
                                    <input id="textboxDateApptEnd" placeholder="dd/mm/yyyy" type="text" name="name" value="" class="form-control" />
                                </div>

                            </div>
                            <div class="row mb-2" style="display:none;">
                                <div class="col-sm-3 text-right pt-2">Alert Notice Days</div>
                                <div class="col-sm-7 pt-2">
                                    <input id="selectAppAlertPeriod" placeholder="Input Days to Expiry Alert" title="Input Days to Expiry Alert" type="text" name="name" value="0" class="form-control" />
                                </div>

                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3 text-right pt-2">Location</div>
                                <div class="col-sm-7">
                                    <input id="textboxLocation" placeholder="Input Location" type="text" name="name" value="" class="form-control" />
                                </div>

                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3 text-right pt-2">Authorising Minister</div>
                                <div class="col-sm-7">
                                    <input id="textboxauthorisingofficial" placeholder="Input Authorising Minister" type="text" name="name" value="" class="form-control" />
                                </div>

                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-3 text-right pt-2">Comment</div>
                                <div class="col-sm-9">
                                    <textarea rows="6" cols="6" id="textboxApptComment" class="form-control" placeholder="Input Comment"></textarea>

                                </div>

                            </div>--%>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
<%--                            <button type="button" onclick="{new $rab.Appointment().Add()}" class="btn btn-secondary">Add</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="closenewappointmentmodal">Close</button>--%>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <!-- The modalappointment -->


    </section>
    <section class="modal-dialog-2">
        <div class="container">



            <!-- The Modal -->
            <div class="modal fade" id="attendance-panel">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Roles</h4>

                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            

                           <%-- <div id="newActivity" class="tabcontent-1">
                                <h3>New role</h3>
                                <div class="row mb-3 ml-2">
                                    <div class="col-sm-3 text-right text-blue pt-3" style="font-weight: 800">Enter new roles</div>
                                    <div class="col-sm-9">
                                        <input type="text" id="textboxRoles" class="form-control" placeholder="enter new activties seperated by comma's" value="" />
                                        e.g Administrator,Secretary,Evangelism leader, 
                                    </div>
                                </div>
                                <div class="row mb-3 ml-2">
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-3">
                                        <button class="form-control" onclick="new $rab.Appointment.Roles().AddDictionary(textboxRoles.value)">Add</button>
                                    </div>
                                </div>
                            </div>--%>




                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">

                            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close-appointment-panel">Close</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </section>

    <section class="modal-dialog-3">
        <button id="buttonOpenReviewModal" style="display: none;">Open Modal</button>
        <div id="reviewModal" class="modalReview">

            <!-- Modal content -->
            <div class="modalReview-content">
                <div class="modalReview-header">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2 id="assigned-roles-modal-header">Member assigned roles</h2>
                        </div>
                        <div class="col-sm-6"><span class="closereview" id="modalclosebutton">&times;</span></div>
                    </div>
                </div>
                <div class="modalReview-body">

                    <div class="tab">
                        <button class="tablinks" onclick="$rab.TabPanel(event, 'AssignedRole')" id="defaultOpen">Assigned roles</button>
                        <button class="tablinks" onclick="$rab.TabPanel(event, 'ReviewRole')"   id="buttontabReviewRole">Review role</button>
                        <button class="tablinks" onclick="$rab.TabPanel(event, 'Future')" id="buttonRolesReviewReport">Roles review report</button>
                    </div>

                    <div id="AssignedRole" class="tabcontent">
                        <h3>Assigned Role</h3>
                        <table class="table table-hover  table-responsive" cellspacing="0" id="tableMemberRoles">
                        <thead>
                            <tr class="">

                                <th class="head-item mbr-fonts-style display-7">BranchID             </th>
                                <th class="head-item mbr-fonts-style display-7">Appointment         </th>
                                <th class="head-item mbr-fonts-style display-7">Role                 </th>
                                <th class="head-item mbr-fonts-style display-7">DateOfAppointment    </th>
                                <th class="head-item mbr-fonts-style display-7">EndDateOfAppointment </th>
                                <th class="head-item mbr-fonts-style display-7">DaysToExpire         </th>
                                <th class="head-item mbr-fonts-style display-7">Location             </th>
                                <th class="head-item mbr-fonts-style display-7">AuthorisingOfficer   </th>
                                <th class="head-item mbr-fonts-style display-7">Comment              </th>










                            </tr>
                        </thead>
                        <tbody id="tbodyMemberRoles">
                        </tbody>
                    </table>
                    </div>

                    <div id="ReviewRole" class="tabcontent">
                        <h3 id="tabContentHeaderReviewRole" class="mt-3">Review Role</h3>
                        <div class="row mb-2">
                           <div class="col-sm-3 text-right">Role</div>
                           <div class="col-sm-2"><input class="form-control" maxlength="10" type="text" id="textboxReviewRole" value="" disabled/></div>
                           <div class="col-sm-1">Start date:</div>
                           <div class="col-sm-2"><input class="form-control" maxlength="10" type="text" id="textboxReviewRoleFrom" value="" disabled/></div>
                           <div class="col-sm-1">End date:</div>
                           <div class="col-sm-2"><input class="form-control" maxlength="10" type="text" id="textboxReviewRoleTo" value="" disabled/></div>
                       </div>
                        <div class="row mb-2">
                           <div class="col-sm-3 text-right">Review Date</div>
                           <div class="col-sm-3"><input type="text" id="textboxReviewDate" maxlength="10" class="form-control" placeholder="dd/mm/yyyy" title="enter review date" /></div>
                               
                       </div>
                        <div class="row mb-2">
                           <div class="col-sm-3 text-right">What has worked( e.g strengths)</div>
                           <div class="col-sm-6"><textarea class="form-control" cols="5" id="textboxReviewRoleStrengths" rows="5"></textarea></div>
                               
                       </div>
                        <div class="row mb-2">
                           <div class="col-sm-3 text-right">What is lacking( e.g weakness)</div>
                           <div class="col-sm-6"><textarea class="form-control" cols="5" id="textboxReviewRoleWeakness" rows="5"></textarea></div>
                               
                       </div>
                        <div class="row mb-2">
                           <div class="col-sm-3 text-right">Support offered( e.g more officers, leaders, finance etc.)</div>
                           <div class="col-sm-6"><textarea class="form-control" cols="5" id="textboxReviewRoleSupport" rows="5"></textarea></div>
                               
                       </div>
                        <div class="row mb-2">
                           <div class="col-sm-3 text-right">Review action</div>
                           <div class="col-sm-2">
                               <select class="form-control" id="selectReviewRoleAction">
                                   <option value="Select review action">Select review action</option>
                                    <%--<option value="Keep appointment">Keep appointment</option>--%>
                                    <option value="Extend appointment">Extend appointment</option>
                                   <%--<option value="Suspend appointment">Suspend</option>--%>
                                    <option value="Terminate appointment">Terminate appointment</option>

                               </select>
                               
                           </div>
                               
                       </div>

                         <div class="row mb-2">
                           <div class="col-sm-3 text-right">Comment( e.g why the action was necessary)</div>
                           <div class="col-sm-6"><textarea class="form-control" cols="5" id="textboxReviewComment" rows="5"></textarea></div>
                               
                       </div>
                        <div class="row">
                           <div class="col-sm-3"></div>
                           <div class="col-sm-2"><button class="form-control shadow" style="background-color:#ff3366;color:white;" onclick="{new $rab.Appointment.ReviewAction().Add()}" id="buttonSubmitReviewAction" >Submit</button></div>
                           <div class="col-sm-2"><button class="form-control shadow" style="background-color:#ff3366;color:white;" id="textboxclose">Close</button></div>
                                
                       </div>
                    <script>
                        selectReviewRoleAction.onchange = function () {
                            if (this.value == "Extend appointment") {
                                alert("Enter new extension date");
                                textboxReviewRoleTo.disabled = false;
                                textboxReviewRoleTo.style.backgroundColor = 'white';
                                textboxReviewRoleTo.className = 'btn btn-secondary-outline';
                                textboxReviewRoleTo.style.color = "black";
                                textboxReviewRoleTo.maxlength = 10;
                            } else {
                                textboxReviewRoleTo.disabled = true;
                                textboxReviewRoleTo.classList.remove('btn')
                                textboxReviewRoleTo.classList.remove('btn-secondary-outline')
                                textboxReviewRoleTo.className = "form-control"
                                textboxReviewRoleTo.style.color = "black";
                            }
                        }
                        textboxclose.onclick = function () { modalclosebutton.click(); }

                    </script>
                    </div>

                    <div id="Future" class="tabcontent">
                        <h3>Roles review report</h3>
                        <div>
                            <%--<div class="col-sm-3"><button class="btn btn-secondary" onclick="{new $rab.Appointment.ReviewAction().LoadReport();}">Load reviews</button></div>
                            <div class="col-sm-3"></div>--%>
                        </div>
                        <div id="container-roles-reviewed"></div>
                    </div>

                    

                </div>
                <div class="modalReview-footer">
                    <h3>AnthonyBobbie Limited Reports</h3>
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
    <script src="assets/script/appointmentJS.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <style>
        input[name=search] {
            margin: 0px !important;
            padding: 0px !important;
            cursor: pointer;
        }

        input[type=button] {
            cursor: pointer !important;
        }

       
        input[type=text], textarea, select {
            background-color: white !important;
        }
    </style>
    <style>
        /* The Modal (background) */
        .modalReview {
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

        /* Modal Content */
        .modalReview-content {
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
        .close {
            color: white;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

        .modalReview-header {
            padding: 2px 16px;
            background-color: #293955;
            color: white;
        }

        .modalReview-body {
            padding: 2px 16px;
        }

        .modalReview-footer {
            padding: 2px 16px;
            background-color: #293955;
            color: white;
        }
    </style>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        /* The Modal (background) */
        .modalReview {
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

        /* Modal Content */
        .modalReview-content {
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
        .closereview {
            color: white;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .closereview:hover,
            .closereview:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

        .modalReview-header {
            padding: 2px 16px;
            background-color: #293955;
            color: white;
        }

        .modalReview-body {
            padding: 2px 16px;
        }

        .modalReview-footer {
            padding: 2px 16px;
            background-color: #293955;
            color: white;
        }
    </style>
    <style>
        body {
            font-family: Arial;
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
        .tabcontent {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }
    </style>
   
    <script>
        $(document).ready(function () {
            // $rab.Church.LoadBranches("selectBranchNames");

            $("#textboxsearchstring").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#tbodyAppointees tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>



</body>
</html>
