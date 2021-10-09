<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="PlanningClass" %>

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
    <%--<link rel="stylesheet" href="assets/data-tables/data-tables.bootstrap4.min.css">--%>
    <link rel="stylesheet" href="assets/socicon/css/styles.css">
    <link rel="stylesheet" href="assets/theme/css/style.css">
    <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
    <link href="assets/theme/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <style>
        .textBoxFormat {
            display: block;
            width: 20%;
            height: 40px;
            padding: 6px 12px;
            font-size: 16px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
        }

        .selectFormat {
            display: block;
            width: 40%;
            height: 50px;
            padding: 6px 12px;
            font-size: 16px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
        }

        .validateMemFormat {
            width: 10%;
            height: 40px;
            margin-left: 5px;
            border-radius: 5px;
        }

        .btnFormat {
            width: 100%;
            height: 35px;
            margin-top: 5px;
            border-radius: 5px;
        }

        .labFormat {
            margin-right: 5px;
            margin-top: 10px;
        }

        @media (max-width:767px) {
            .labFormat {
                margin-right: 5px;
                margin-top: 10px;
                width: 100%;
                text-align: center;
            }

            .textBoxFormat {
                text-align: center !important;
                width: 100%;
                font-size: 14px;
            }

            .selectFormat {
                display: block;
                width: 35%;
                height: 50px;
            }

            .validateMemFormat {
                display: block;
                margin: auto;
                margin-top: 10px;
                border-radius: 10px;
                width: 90%;
                height: 50px;
                /* margin-right: 0px;
                margin-left: 0px;*/
            }

            #btnPlaceOrderDST {
                display: none !important;
            }

            .form-control {
                margin: 0 auto;
            }
        }
    </style>
</head>

<body>
    <form runat="server" id="preview_form">
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


        <section class="section-table cid-qBsl1UHSIu" id="table1-0" data-rv-view="143">


            <div class="container container-table" style="margin-left: auto; margin-right: auto; width: 1300px;">
                <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Reports</h2>
                <h3 class="mbr-section-subtitle mbr-fonts-style align-center pb-5 mbr-light display-5">List of all upcoming events 
                </h3>
                <div class="">
                    <div class="container">


                        <div class="row">
                            <div class="col-sm-12">
                                <select id="BranchName" class="selectFormat">
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
                    <button id="buttonfullReport" class='' onclick="show('fullReport')">Full report</button>
                    <button class='' onclick="show('newReport')">Add new report</button>
                    <button class='' onclick="show('attendanceReport')">COVID Attendance Report</button>
                    <%--<asp:Button onClientClick="show('containerPreachingPlan')" ID="ButtonNewReport" runat="server" Text="Add new report" />
                    <button class='' onclick="show('containerProgrammeOutline')">Program outline</button>--%>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <section>
            <div class="container-fluid scroll" style="margin-right: 10%!important;">
                <div id="fullReport" style="border: 1px solid #bebcbc">
                    <hr />
                    <div class="container">
                        <a href="#" data-toggle="collapse" data-target="#demo">Click to view help</a>

                    </div>
                    <hr />
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-9">
                                <input type="button" onclick="show('newReport')" value="Add new report">
                                <input type="button" onclick="new $rab.reports().update()" value="Update">
                                <button style="color: red" onclick="new $rab.reports().delete()"><i class="fa fa-recycle"></i>Delete</button>
                                <input type="button" onclick="new $rab.reports().loadfullreport()" value="Load full report">
                                <input type="button" onclick="new $rab.reports().selectColumns()" value="More headings">
                                <input type="button" onclick="fnExcelReport('tableFullReport')" value="Export report">
                            </div>
                            <div class="col-sm-3">

                                <input placeholder="Enter search string" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" value="" />
                            </div>
                        </div>
                    </div>

                    <div id="containertableAnnouncement" runat="server">
                        <!--iframe for exporting report-->
                        <iframe id="txtArea1" style="display: none"></iframe>
                        <table id="tableFullReport" class="table table-hover table-responsive">
                            <thead id="theadfullreport">
                            </thead>
                            <tbody id="tbodyfullreport">
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="newReport" style="border: 1px solid #bebcbc; display: none">
                    <div class="container m-2">

                        <div class="row">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-3 p-2 align-center align-content-lg-center">Reporting Period</div>
                            <div class="col-sm-3">
                                <select id="reportingPeriod" class="form-control">
                                    <option value="Select">Select</option>
                                    <option value="First quater">First quarter</option>
                                    <option value="Mid-year">Mid-year</option>
                                    <option value="Third quarter">Third quarter</option>
                                    <option value="End of year">End of year</option>
                                </select>
                            </div>
                            <div class="col-sm-3">
                                <select id="ReportYear" class="form-control">
                                    <option selected value="Select Reporting year">Select Reporting year</option>
                                    <option>2019</option>
                                    <option>2020</option>
                                    <option>2021</option>
                                    <option>2022</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="container p-3" style="background-color: white!important">

                        <h2 class="p-2" style="border-radius: 3px 4px; background-color: #8bc5f7; color: #f8f6f6">About Membership</h2>
                        <table style="width: 100%" class="mb-2 ">
                            <tr>
                                <td class="p-3">
                                    <div class="form-vertical">
                                        <%--<div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="BranchName">BranchName</label>

                                            </div>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" placeholder="..." id="BranchName">
                                            </div>
                                        </div>--%>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="Total">Total Membership</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" placeholder="..." id="Total">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">MenTotal</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" placeholder="..." id="MenTotal">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">WomenTotal</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" placeholder="..." id="WomenTotal">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">WaterBaptisedTotal</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="WaterBaptisedTotal" class="form-control" placeholder="..." name="WaterBaptisedTotal">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">HolySpiritBaptisedTotal</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="HolySpiritBaptisedTotal" class="form-control" placeholder="..." name="HolySpiritBaptisedTotal">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">Age35Total</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="Age35Total" class="form-control" placeholder="..." name="Age35Total">
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="p-3">
                                    <div class="form-vertical">

                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">Children_0_to_12Total</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="Children_0_to_12Total" class="form-control" placeholder="..." name="Children_0_to_12Total">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">Teenage_13_to_19Total</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="Teenage_13_to_19Total" class="form-control" placeholder="..." name="Teenage_13_to_19Total">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">YoungAdult_20_to_35Total</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="YoungAdult_20_to_35Total" class="form-control" placeholder="..." name="YoungAdult_20_to_35Total">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">GhanaianMembership</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="GhanaianMembership" class="form-control" placeholder="..." name="GhanaianMembership">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">NoOfNationalsIndigenes</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="NoOfNationalsIndigenes" class="form-control" placeholder="..." name="NoOfNationalsIndigenes">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">NoOfOtherNationals</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="NoOfOtherNationals" class="form-control" placeholder="..." name="NoOfOtherNationals">
                                            </div>
                                        </div>
                                    </div>


                                </td>
                            </tr>
                        </table>
                        <h2 class="p-2" style="border-radius: 3px 4px; background-color: #9f9f9f; color: #f8f6f6">About Leadership</h2>
                        <table style="width: 100%" class="mb-2">
                            <tr>




                                <td class="p-3">
                                    <div class="form-vertical">
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">Elders</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="Elders" class="form-control" placeholder="..." name="email">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">Deacons</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="Deacons" class="form-control" placeholder="..." name="email">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">Deaconessess</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="Deaconessess" class="form-control" placeholder="..." name="email">
                                            </div>
                                        </div>


                                    </div>
                                </td>
                                <td class="p-3" style="width: 50%"></td>
                            </tr>
                        </table>
                        <h2 class="p-2" style="border-radius: 3px 4px; background-color: #166bb5; color: #f8f6f6">About Souls and Baptisms</h2>
                        <table style="width: 100%" class="mb-2">
                            <tr>


                                <td class="p-3">
                                    <div class="form-vertical">
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">AdultsSoulsWon</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" placeholder="..." id="AdultsSoulsWon">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">OldMembersHolySpiritBaptised</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" placeholder="..." id="OldMembersHolySpiritBaptised">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">NewConvertsWaterBaptised</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" placeholder="..." id="NewConvertsWaterBaptised">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">NewConvertsHolySpiritBaptised</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" placeholder="..." id="NewConvertsHolySpiritBaptised">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">TransferIn_0_to_19</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="TransferIn_0_to_19" class="form-control" placeholder="..." name="email">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">TransferIn_19_to_Above</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="TransferIn_19_to_Above" class="form-control" placeholder="..." name="email">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">TransferInTotal</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="TransferInTotal" class="form-control" placeholder="..." name="email">
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="p-3">
                                    <div class="form-vertical">

                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">TransferOut_0_to_19</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="TransferOut_0_to_19" class="form-control" placeholder="..." name="email">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">TransferOut_19_to_Above</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="TransferOut_19_to_Above" class="form-control" placeholder="..." name="email">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">TransferOutTotal</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="TransferOutTotal" class="form-control" placeholder="..." name="email">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">BackSliderWonBack</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="BackSliderWonBack" class="form-control" placeholder="..." name="email">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">BackSlidersBeingFollowed</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="BackSlidersBeingFollowed" class="form-control" placeholder="..." name="email">
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-8 p-2 align-center">
                                                <label class="control-label " for="email">NumberOfHomeCells</label>

                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="NumberOfHomeCells" class="form-control" placeholder="..." name="email">
                                            </div>
                                        </div>
                                    </div>


                                </td>
                            </tr>
                        </table>
                        <h2 class="p-2" style="border-radius: 3px 4px; background-color: #22b5f6; color: #f8f6f6">About Events</h2>
                        <div class="form-vertical">
                            <div class="row mb-2">
                                <div class="col-sm-2 p-2 align-center">
                                    <label class="control-label " for="email">Rallies Held</label>

                                </div>
                                <div class="col-sm-2">
                                    <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" placeholder="..." id="RalliesHeld">
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-2 p-2 align-center">
                                    <label class="control-label " for="email">AdultDeath</label>

                                </div>
                                <div class="col-sm-2">
                                    <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" placeholder="..." id="AdultDeath">
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-2 p-2 align-center">
                                    <label class="control-label " for="email">Birth</label>

                                </div>
                                <div class="col-sm-2">
                                    <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" placeholder="..." id="Birth">
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-2 p-2 align-center">
                                    <label class="control-label " for="email">DeathAdultsAndChildren</label>

                                </div>
                                <div class="col-sm-2">
                                    <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" placeholder="..." id="DeathAdultsAndChildren">
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-2 p-2 align-center">
                                    <label class="control-label " for="email">MarriagesBlessed</label>

                                </div>
                                <div class="col-sm-2">
                                    <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" placeholder="..." id="MarriagesBlessed">
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-2 p-2 align-center">
                                    <label class="control-label " for="email">ChildrenDedicated</label>

                                </div>
                                <div class="col-sm-2">
                                    <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="ChildrenDedicated" class="form-control" placeholder="..." name="email">
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-sm-2 p-2 align-center">
                                </div>
                                <div class="col-sm-2">
                                    <input onclick="new $rab.reports().submit();" type="button" value="Submit" class="form-control" id="submit">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div id="attendanceReport" style="border: 1px solid #bebcbc; display: none; padding-left: 10px; padding-right: 10px;">
                    <div class="row" style="margin: 10px;">
                        <label class="labFormat">All Branches</label>
                        <input id="checkAllBranches" class="textBoxFormat" type="checkbox" name="name" value="" />
                        <label class="labFormat">Activity</label>
                        <select id="selectActivityNames" class="textBoxFormat">
                            <option value="--Select your Activity--">--Select your Activity--</option>
                        </select>
                        <label class="labFormat">Date</label>
                        <input type="text" id="attenDate" value="" placeholder="dd/mm/yyyy" class="textBoxFormat" />
                        <button class="btn-primary validateMemFormat" type="button" id="btnGetattendance" onclick=" new $rab.reports().GetReport('checkAllBranches','BranchName','selectActivityNames','attenDate')">Get Report</button>
                        <button class="btn-primary validateMemFormat" type="button" onclick="fnExcelReport('mainTable')">Export</button>
                    </div>
                    <div class="table-responsive">
                        <label>Total Attendance:</label>
                        <table id="mainTable" class="table table-hover" border="1">
                            <thead style="background-color: teal; text-align: center; color: black;">
                                <tr>
                                    <th>FirstName.
                                    </th>

                                    <th>LastName
                                    </th>

                                    <th>Temperature
                                    </th>
                                    <th>Telephone
                                    </th>
                                    <th>Activity
                                    </th>
                                    <th>AttendanceDate
                                    </th>
                                    <th>BranchName
                                    </th>
                                    <%-- <th style="text-align: center">Action</th>--%>
                                </tr>
                            </thead>
                            <tbody id="attendTableBody" style="background-color: lightcoral; text-align: center;">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
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

                ['fullReport', 'newReport', 'containerProgrammeOutline', 'attendanceReport'].forEach(function (value, index) {
                    try {
                        if (value == containerID) document.getElementById(value).style.display = 'block';
                        else document.getElementById(value).style.display = 'none';
                        let covid ='covidactivities'
                        console.log('about to load covidactivities  ');
                        new $rab.reports().loadCovidActivities('selectActivityNames');
                        console.log('loaded covid activities');
                    } catch (e) {

                    }
                })
            }
        </script>

        <%--</div>--%>

        <%-- </section>--%>
        <section>

            <!-- The Modal -->
            <button type="button" style="display: none" class="btn btn-primary" data-toggle="modal" data-target="#mydefault">Open modal</button>
            <div class="modal fade" id="mydefault">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultTitle"></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body" id="defaultBody">
                            <hr />
                            <div class="row">
                                <div class="col-sm-4">
                                    <div id="availableColumns">
                                        <!--columns to select from is displayed here-->
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <input onclick="new $rab.reports().btnSelectItems()" type="button" id="btnforward" value=">>" />
                                    <input onclick="new $rab.reports().btnUnselectItems()" type="button" id="btnbackward" value="<<" />
                                </div>
                                <div class="col-sm-4">

                                    <div id="columnsToDisplay">
                                        <!--columns   selected   displayed here-->
                                        <table>
                                            <tbody id="tbodycolumnsToDisplay">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>


                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" onclick="new $rab.reports().load_selectionColumns()">Load</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
        <script src="assets/script/reportJS.js"></script>
        <script src="assets/script/exportJS.js"></script>
        <%--<script src="assets/script/AttendanceJS.js"></script>--%>


    </form>

</body>
</html>
