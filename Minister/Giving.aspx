<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Giving.aspx.cs" Inherits="GivingClass" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/logo.jpg" type="image/x-icon">
    <meta name="description" content="MembershipList">
    <title>Giving

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
    <section class="section-table cid-qBsl1UHSIu" id="table1-0" data-rv-view="143">


        <div class="container container-table">
            <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Gift aid management</h2>
            <h3 class="mbr-section-subtitle mbr-fonts-style align-center pb-5 mbr-light display-5">List of gift aiders 
            </h3>
            <div class="">





                <div class="container-fluid scroll">
                </div>

            </div>
        </div>
    </section>
    <section class="p-0" style="background-color: #d6dbe9">
        <div>
            <button onclick='showTab("report")'>Dashboard</button>
            <button onclick='showTab("Giftaiders")'>Gift aiders</button>
            <button onclick='showTab("Statistics")'>Statistics</button>
            <button onclick='showTab("Comingsoon")'>Coming soon</button>
            <script>
                function showTab(tabName) {
                    ["report", "Giftaiders", "Statistics", "Comingsoon"]
                        .forEach(function (value, index) {
                            if (value == tabName) {
                                $('#' + value).show();
                            } else {
                                $('#' + value).hide();
                            }
                        })
                }
            </script>
        </div>
    </section>
    <section id='report'>
        <div class="container  ">
            <div class="row p-3">
                <div class="col-sm-3">
                    <select id="selectBranchNames" class="form-control" onclick="{new $rab.GiftAid().ClearInputs();new $rab.GiftAid().LoadGiftAiders();}">
                        <option selected value="Select branch">Please select branch</option>

                    </select>
                </div>

                <div class="col-sm-3">

                    <input type="text" style="background-color: white;" class="form-control" id="textboxsearchstring" name="findText" value="" placeholder="enter search string" />


                </div>
                <div class="col-sm-6">
                    <button class='m-2 p-2' type="button" id="buttonSearch" name="search" value="Load Data" onclick="{ new $rab.GiftAid().LoadGiftAiders(); }">Load data</button>

                    <button class='m-2 p-2' id="buttonAddNewGiftAider" onclick="{$rab.GiftAid.DisplayForm('addGiftAid');}">Add new gift aiders</button>
                    <button class='m-2 p-2' onclick="{$rab.GiftAid.Statistics('statistics');}">Statistics</button>
                    <button onclick="fnExcelReport('tableMembercontributions')">Export</button>
                    <iframe id="txtArea1" style="display: none"></iframe>
                </div>



            </div>
        </div>
        <table class="table table-hover table-responsive" id="tableMembercontributions">
            <thead>
                <tr class="">

                    <th class="head-item mbr-fonts-style display-7">ID</th>
                    <th class="head-item mbr-fonts-style display-7">LastName</th>
                    <th class="head-item mbr-fonts-style display-7">FirstName</th>


                    <th class="head-item mbr-fonts-style display-7">Amount (£)</th>
                    <th class="head-item mbr-fonts-style display-7">GiftAid (£)</th>

                    <th class="head-item mbr-fonts-style display-7">Donation</th>
                    <th class="head-item mbr-fonts-style display-7">Last updated</th>

                </tr>
            </thead>
            <tbody id="tbodyTotalContribution">
            </tbody>
        </table>
    </section>
    <section id='Giftaiders' style='display: none'></section>
    <section id='Statistics' style='display: none'></section>
    <section id='Comingsoon' style='display: none'></section>

    <section class="modal-dialog-1">




        <!-- The modaldonation -->
        <div id="myModal" class="modaldonation">

            <!-- modaldonation content -->
            <div class="modaldonation-content">
                <div class="modaldonation-header">
                    <span class="modaldonationclose">&times;</span>
                    <h2>Gift aid window</h2>
                </div>
                <div class="modaldonation-body">


                    <div id="sectionGiftAid" class="container">
                        <h1 class="mt-2">Gift aid setup details</h1>
                        <hr />
                        <div class="row mb-2 mt-2">
                            <div class="col-sm-3 text-right">
                                <button style="background-color: #ff3366!important; color: white!important" onclick="{ $rab.Membership.GetMembersList(selectBranchNames.value, $rab.GiftAid.LoadMemberNames) }">Load Members</button>

                            </div>
                            <div class="col-sm-4 pt-2">
                                <select id="selectGiftMemberID" class="form-control">
                                    <option value="Select member">Select member name</option>
                                </select>
                            </div>
                            <div class="col-sm-4"></div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-3 text-right pt-2">GIft Aid Id</div>
                            <div class="col-sm-4">
                                <input type="text" id="textboxGIftAidId" placeholder="Input gift aid ID" name="name" value="" class="form-control" />
                            </div>
                            <div class="col-sm-4"></div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-3 text-right pt-2">Date registered</div>
                            <div class="col-sm-4">
                                <input id="textboxDateRegistered" placeholder="dd/mm/yyyy" type="text" name="name" value="" class="form-control" />
                            </div>
                            <div class="col-sm-4"></div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-3 text-right pt-2">NI Number</div>
                            <div class="col-sm-4">
                                <input id="textboxNINumber" placeholder="Input national insurance number" type="text" name="name" value="" class="form-control" />
                            </div>
                            <div class="col-sm-4"></div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-3 text-right"></div>
                            <div class="col-sm-2">
                                <button onclick="{new $rab.GiftAid().Add()}" id="buttonAddGiftAider" class="form-control" style="background-color: #ff3366!important; color: white!important">Add</button>
                            </div>
                            <div class="col-sm-2">
                                <button id="buttonclose" class="form-control" style="background-color: #ff3366!important; color: white!important" onclick="$rab.GiftAid.ShowAddInputs(tableMemberListing)">Close</button>
                            </div>
                        </div>
                    </div>
                    <div id="sectionBreakdown">
                        <div class="row mb-2 mt-2" style="visibility: hidden">
                            <div class="col-sm-2   text-right pt-2">
                                <label class="" style="font-weight: 600">Select member</label>
                            </div>
                            <div class="col-sm-2 text-left  ">
                                <select class="form-control" id="selectedMemberNames">
                                </select>

                            </div>
                            <div class="col-sm-2">

                                <select class="form-control" id="idGiftAidMonth">
                                    <option value="Dove Love">January</option>
                                    <option value="Joe Love">February</option>

                                </select>
                            </div>
                            <div class="col-sm-2">
                                <input type="button" id="textboxGetContribution" value="Get Contribution" class="form-control" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-4">
                                <img src="assets/images/joblogg.png" class="img " alt="Alternate Text" style="float: left" />
                                <div class="row ml-5" style="text-align: center; margin-top: 10px;">

                                    <div class="col-sm-6 text-right">Name: </div>
                                    <div class="col-sm-6 text-left">
                                        <span id="spanGiftAider" style="font-weight: 800">Gift Aider</span><br />
                                    </div>



                                </div>
                                <div class="row ml-5" style="text-align: center; margin-top: 10px;">

                                    <div class="col-sm-6 text-right">Gift aid ID: </div>
                                    <div class="col-sm-6 text-left"><span id="spanGiftAiderID" style="font-weight: 800">Gift Aider ID</span></div>



                                </div>

                            </div>






                        </div>
                        <br />
                        <div class="tab">
                            <button id="defaultOpen" class="tablinks" onclick="openCity(event, 'Donation')">Donations</button>
                            <button class="tablinks" onclick="openCity(event, 'Declaration')">Statistics</button>
                            <button class="tablinks" onclick="openCity(event, 'Pledges')">Plots</button>
                        </div>
                        <div class="row" style="margin-top: 20px!important">

                            <div class="col-sm-2">

                                <input type="button" name="name" value="Close" class="form-control" onclick="$rab.GiftAid.ShowAddInputs(tableMemberListing)" />
                            </div>
                            <div class="col-sm-6"></div>
                            <div class="col-sm-1 text-right">
                            </div>
                        </div>
                        <div id="Donation" class="tabcontent">
                            <h3>Donation</h3>
                            <p>List of all donation done by member</p>

                            <div class="container-fluid scroll">

                                <table class="table table-hover" id="tableMemberListing">
                                    <thead>
                                        <tr class="">

                                            <th class="head-item mbr-fonts-style display-7">ID</th>

                                            <th class="head-item mbr-fonts-style display-7">Date</th>
                                            <th class="head-item mbr-fonts-style display-7">Fund</th>
                                            <th class="head-item mbr-fonts-style display-7">Method</th>
                                            <th class="head-item mbr-fonts-style display-7">Amount (£)</th>
                                            <%--  <th class="head-item mbr-fonts-style display-7">GiftAid (£)</th>--%>
                                            <th class="head-item mbr-fonts-style display-7">...</th>
                                            <%--<th class="head-item mbr-fonts-style display-7">Status</th>
                                        <th class="head-item mbr-fonts-style display-7">Edit</th>

                                        <th class="head-item mbr-fonts-style display-7">CreatedOn</th>
                                        <th class="head-item mbr-fonts-style display-7">CreatedBy</th>--%>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyMembers">
                                        <tr id="trtoggleInput" style="background-color: #293955!important; color: white;">
                                            <td class="head-item mbr-fonts-style display-7">
                                                <label id="labelgivingID" class="form-control">XXX</label>
                                            </td>

                                            <td class="head-item mbr-fonts-style display-7">
                                                <input title="Please input date in US Format MM/DD/YYYY" class="form-control" type="text" id="textboxDonationDate" value="" placeholder="MM/DD/yyyy" title="date donation was made" />
                                            </td>
                                            <td class="head-item mbr-fonts-style display-7">
                                                <select class="form-control" id="selectFund">
                                                    <option value="Select fund">Select fund          </option>
                                                    <option value="Building project">Building project    </option>
                                                    <option value="Tithe and offering">Tithe and offering  </option>
                                                    <option value="Thanksgiving">Thanksgiving         </option>
                                                    <option value="Other">Other                </option>

                                                </select></td>
                                            <td class="head-item mbr-fonts-style display-7">
                                                <select class="form-control" id="selectMethod">
                                                    <option value="Select method">Select method  </option>
                                                    <option value="Cash">Cash</option>
                                                    <option value="Cheque">Cheque</option>
                                                    <option value="Standing order">Standing order </option>
                                                    <option value="Bank transfer">Bank transfer  </option>
                                                    <option value="Postal order">Postal order   </option>
                                                </select></td>
                                            <td class="head-item mbr-fonts-style display-7">
                                                <input class="form-control" type="text" id="txtDonatedAmount" placeholder="0.00" /></td>

                                            <%--<td class="head-item mbr-fonts-style display-7"><b style="color: red!important">UnClaimed</b></td>
                                            --%>
                                            <td class="head-item mbr-fonts-style display-7">
                                                <button id="buttonsavegiving" onclick="{new $rab.Giving().Add();}" class="form-control" style="background-color: #35c417; color: black">save</button></td>


                                        </tr>





                                    </tbody>
                                </table>
                                <table class="table table-hover" cellspacing="0">
                                    <thead>
                                        <tr class="">

                                            <th class="head-item mbr-fonts-style display-7">ID</th>

                                            <th class="head-item mbr-fonts-style display-7">Date</th>
                                            <th class="head-item mbr-fonts-style display-7">Fund</th>
                                            <th class="head-item mbr-fonts-style display-7">Method</th>
                                            <th class="head-item mbr-fonts-style display-7">Amount (£)</th>
                                            <th class="head-item mbr-fonts-style display-7">GiftAid (£)</th>
                                            <th class="head-item mbr-fonts-style display-7">Status</th>
                                            <th class="head-item mbr-fonts-style display-7">Edit</th>

                                            <th class="head-item mbr-fonts-style display-7">CreatedOn</th>
                                            <th class="head-item mbr-fonts-style display-7">CreatedBy</th>

                                        </tr>
                                    </thead>
                                    <tbody id="tbodyMembersdata">
                                        <tr>
                                            <td class="head-item mbr-fonts-style display-7">1000
                                            </td>

                                            <td class="head-item mbr-fonts-style display-7">12/12/2017</td>
                                            <td class="head-item mbr-fonts-style display-7">Building project</td>
                                            <td class="head-item mbr-fonts-style display-7">Direct debit</td>
                                            <td class="head-item mbr-fonts-style display-7">200</td>
                                            <td class="head-item mbr-fonts-style display-7">40</td>
                                            <td class="head-item mbr-fonts-style display-7"><b style="color: red!important">UnClaimed</b></td>
                                            <td class="head-item mbr-fonts-style display-7">
                                                <button>edit</button></td>
                                            <td class="head-item mbr-fonts-style display-7">20180405</td>
                                            <td class="head-item mbr-fonts-style display-7">Calvin Lakes</td>
                                        </tr>




                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div id="Declaration" class="tabcontent">
                            <h3>Statistics</h3>
                            <p>Member statistics goes here</p>
                        </div>

                        <div id="Pledges" class="tabcontent">
                            <h3>Plot</h3>
                            <p>Plot of member historic data goes here</p>

                        </div>
                        <div class="row mt-5">
                            <div class="col-sm-4"></div>
                            <div class="col-sm-4"></div>
                            <div class="col-sm-4"></div>
                        </div>
                    </div>
                    <div id="sectionStatistics">

                        <!--displays statistics table -->
                        <h1 class="">Monthly gift aid contribution</h1>
                        <table id="idtablestatistics" class="table table-responsive table-hover">

                            <thead>

                                <tr>
                                    <td>Month</td>
                                    <td>Year</td>
                                    <td>Amount(£)</td>
                                    <td>Gift aid(£)</td>
                                </tr>
                            </thead>
                            <tbody id="tbodystatistics">
                                <tr>
                                    <td>10</td>
                                    <td>2018</td>
                                    <td>2000</td>
                                    <td>400</td>
                                </tr>
                                <tr>
                                    <td>10</td>
                                    <td>2018</td>
                                    <td>2000</td>
                                    <td>400</td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
                <div class="modaldonation-footer">
                    <h3>Rabant solution Limited</h3>
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
    <script src="assets/script/exportJS.js"></script>
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

        button {
            cursor: pointer !important;
        }
    </style>



    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        /* The modaldonation (background) */
        .modaldonation {
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

        /* modaldonation Content */
        .modaldonation-content {
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
        .modaldonationclose {
            color: white;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .modaldonationclose:hover,
            .modaldonationclose:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

        .modaldonation-header {
            padding: 2px 16px;
            background-color: #293955;
            color: white;
        }

        .modaldonation-body {
            padding: 2px 16px;
        }

        .modaldonation-footer {
            padding: 2px 16px;
            background-color: #293955;
            color: white;
        }

        .button {
            background-color: #4CAF50 !important;
            border: none !important;
            color: white !important;
            padding: 20px !important;
            text-align: center !important;
            text-decoration: none !important;
            display: inline-block !important;
            font-size: 16px !important;
            margin: 4px 2px !important;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('[data-toggle="popover"]').popover();
        });
    </script>
    <script>
        $(document).ready(function () {
            // $rab.Church.LoadBranches("selectBranchNames");

            $("#textboxsearchstring").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#tableMembercontributions tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>

    <script>

</script>

    <script src="assets/script/giftaidJS.js"></script>
    <script src="assets/script/givingJS.js"></script>
</body>
</html>
