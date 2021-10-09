<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Finances.aspx.cs" Inherits="Minister_Finances" %>


<!DOCTYPE html>

<html>
<head>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="Accounts">
    <title>Finance</title>
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
                <div class="navbar-buttons mbr-section-btn">
                    <a onclick="new $rab.Initialise.Menus().Logout()" class=" " href="#">Log out<br>
                        <span class="">&nbsp;</span>
                    </a>
                </div>
            </div>
        </nav>
    </section>
    <section style="margin-top: 80px;">
        <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Finances</h2>
            <h3 class="mbr-section-subtitle mbr-fonts-style align-center pb-5 mbr-light display-5">List of finances 
            </h3>
        <div class="container p-5">
            <div class="row">
                <div class="col-sm-4">
                    <select id="selectBranchNames" class="form-control">
                        <option value="Select branch">Select branch</option>
                        <option value="All">All</option>
                    </select>
                </div>
                <div class="col-sm-4">

                    <select class="form-control" id="selectAccountTypeNames">
                        <option value="Select account type">Select account type</option>

                        <option value="All">All</option>
                        <option value="Assets">Assets</option>

                        <option value="Bank transactions">Bank transactions</option>
                        <option value="Expenditure">Expenditure</option>
                        <option value="Income">Income</option>
                        <option value="Liability">Liability</option>
                    </select>
                </div>
                <div class="col-sm-2">
                    <input class="form-control" type="button" onclick="{ $rab.Finance.LoadAccounts(); }" id="buttonLoadAccounts" value="Load Accounts" />
                </div>
                <div class="col-sm-2">
                    <input class="form-control" type="button" id="buttonAdd" value="Add" onclick="{ $rab.Finance.Transaction(); }" />
                </div>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-sm-3"></div>
            <div class="col-sm-3">

                <input type="text" id="textboxSearch" value="" placeholder="enter search string" class="form-control" />

            </div>
            <div class="col-sm-3">
                <button id="myBtn" class="btn btn-secondary btn-secondary-outline">Reports</button>
            </div>
            <div class="col-sm-3"></div>


        </div>
        <div class="container">
            
            <div class="row">

                <div class="col-sm-12">
                    <div class="table-responsive">
                        <table class="table" id="tableEventListing">
                            <thead>
                                <tr>
                                    <th>#ID</th>
                                    <th>Branch name</th>
                                    <th>Date</th>
                                    <th>Acount type</th>
                                    <th>Name       </th>
                                    <th>Description</th>
                                    <th>Source     </th>
                                    <th>Pay mode   </th>
                                    <th>Amount (£)    </th>
                                    <th>Created By </th>
                                    <th>Created on </th>

                                </tr>
                            </thead>
                            <tbody id="tbodyFinance">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="modal-section-1">

        <!-- Button to Open the Modal -->
        <button id="buttonAddFinanceDialog" style="display: none" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModalDialog">
            Open modal
        </button>

        <!-- The Modal -->
        <div class="modal fade" id="addModalDialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title"><kbd>Finance Window:</kbd>
                            <label id="errorLabel" style="color: red;"></label>
                        </h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">


                        <div class="tab">
                            <button class="tablinks" onclick="openCity(event, 'Accounts')" id="defaultOpen">Accounts</button>
                            <%-- <button class="tablinks" onclick="openCity(event, 'Income')" id="defaultOpen">Income</button>--%>
                            <%--<button class="tablinks" onclick="openCity(event, 'Expenditure')">Expenditure</button>
                            <button class="tablinks" onclick="openCity(event, 'Assets')">Assets</button>
                            --%>
                            <button class="tablinks" onclick="openCity(event, 'BankTransactionsFilter')">Accounts Filter</button>
                            <button class="tablinks" onclick="openCity(event, 'BankTransactions')">Bank Accounts Transactions</button>
                        </div>
                        <div id="Accounts" class="tabcontent">
                            
                            <div>

                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label"><strong>Account type</strong></label>
                                    </div>
                                    <div class="col-sm-4">

                                        <select class="form-control" id="selectAccountType" onclick="{ $rab.Finance.LoadAccountTypeNameFilters(this.value);}">
                                            <option value="Select account type">Select account type</option>


                                           <%-- <option value="Assets">Assets</option>--%>

                                            <%-- <option value="Bank transactions">Bank transactions</option>--%>
                                            <option value="Expenditure">Expenditure</option>
                                            <option value="Income">Income</option>
                                           <%-- <option value="Liability">Liability</option>--%>
                                        </select>
                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label"><strong>Date</strong></label>
                                    </div>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" id="textboxAccountDate" name="name" value="" placeholder="dd/mm/yyyy" />

                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label"><strong>Name</strong></label>
                                    </div>
                                    <div class="col-sm-4">
                                       <%-- <input class="form-control" type="text" id="textboxAccountName" name="name" value="" placeholder="" />--%>
                                        <select  class="form-control"   id="textboxAccountName" onchange="{$rab.Finance.LoadIncomeDescription(selectAccountType.value,this.value);}">
                                            

                                        </select>
                                    </div>

                                </div>

                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label"><strong>Description</strong></label>
                                    </div>
                                    <div class="col-sm-5">
                                        <%--<input class="form-control" type="text" id="textboxAccountDescription" name="name" value="" placeholder="" />--%>
                                        <select class="form-control" id="textboxAccountDescription">
                                            <option value="value">Select income description</option>
                                        </select>
                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label"><strong>Source</strong></label>
                                    </div>
                                    <div class="col-sm-3">
                                        <input class="form-control" type="text" id="textboxAccountSource" name="name" value="" placeholder="" />

                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label"><strong>Pay mode</strong></label>
                                    </div>
                                    <div class="col-sm-3">
                                        <input class="form-control" type="text" id="textboxAccountPaymode" name="name" value="" placeholder="" />
                                       <%-- <select class="form-control"   id="textboxAccountPaymode" >
                                            
                                        </select>--%>
                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2 mt-2">
                                        <label class="form-control-label"><strong>Amount: £</strong></label>
                                    </div>
                                    <div class="col-sm-2">

                                        <input placeholder="0.00" type="text" id="textboxAccountAmount" class="form-control" value="" />
                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label"></label>
                                    </div>
                                    <div class="col-sm-10">
                                        <label style="color: red" id="labelAccountsError" class="form-control-label"></label>

                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label"></label>
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-4"> 
                                                <input type="button" id="buttonAccountAdd" onclick="{ new $rab.Finance.Acount().Add(); }" class="btn btn-secondary" value="Add" />
                                                <input type="button" id="buttonAccountUpdate" onclick="{ new $rab.Finance.Acount().Update(); }" class="btn btn-secondary" value="Update" />
                                            </div>
                                            <div class="col-sm-4">
                                                

                                            </div>
                                        </div>
                                        
                                       

                                    </div>

                                </div>
                            </div>
                        </div>
                       
                        <div id="BankTransactions" class="tabcontent">
                            <h3>BankTransactions</h3>
                            <div>

                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label">ID</label>
                                    </div>
                                    <div class="col-sm-10">

                                        <input class="form-control" type="text" id="textboxTransactionID" name="name" value="" placeholder="" />
                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label">Authorising Person</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" id="textboxTransactionPerson" name="name" value="" placeholder="" />

                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label">Date</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" id="textboxTransactionDate" name="name" value="" placeholder="" />

                                    </div>

                                </div>

                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label">Transaction type</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" id="textboxTransactionType" name="name" value="" placeholder="" />

                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label">Ref No:</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" id="textboxTransactionReference" name="name" value="" placeholder="" />

                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label">Location</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" id="textboxTransactionLocation" name="name" value="" placeholder="" />

                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label">Amount</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" value="" id="textboxTransactionAmount" />

                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label">Paymode</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" value="" id="textboxTransactionPaymode" />

                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label"></label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="button" onclick="{ new $rab.Finance.BankTransaction().Add(); }" class="btn btn-secondary btn-secondary-outline" value="Add" />

                                    </div>

                                </div>
                            </div>
                        </div>
                        <div id="BankTransactionsFilter" class="tabcontent">
                            <h3>Accounts filter</h3>
                            <div>

                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label">Account type</label>
                                    </div>
                                    <div class="col-sm-5">
                                        <select class="form-control" id="selectAccountTypeFilter" >
                                            <option value="Select account type">Select account type</option>
                                            <%--<option value="Assets">Assets</option>--%>
                                            <option value="Expenditure">Expenditure</option>
                                            <option value="Income">Income</option>
                                           <%-- <option value="Liability">Liability</option>--%>
                                        </select>
                                    </div>

                                </div>
                               <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label">Name</label>
                                    </div>
                                    <div class="col-sm-5">
                                        <input id="textboxfilterName" class="form-control" value="" />
                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label">Description</label>
                                    </div>
                                    <div class="col-sm-5">
                                        <input id="textboxfilterDescription" class="form-control" value="" />
                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <label class="form-control-label">Source</label>
                                    </div>
                                    <div class="col-sm-5">
                                        <input id="textboxfilterSourceDescription" class="form-control" value="" />
                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        
                                    </div>
                                    <div class="col-sm-5">
                                        <button type="button" id="buttonAddAccounttypefilter" class="btn btn-primary" onclick="{new $rab.Finance.AccountFilters().Add();}" >Add</button>
                                    </div>

                                </div>
                                
                            </div>
                        </div>

                        
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">


                        <button type="button" id="buttonClose" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <section id="modal-section-2">


        <!-- The Modal -->
        <div id="myModal" class="mymodal">

            <!-- Modal content -->
            <div class="mymodal-content">
                <div class="mymodal-header">
                    <h2>Finance report window <span id="closeStatReportWindow">&times;</span></h2>


                </div>
                <div class="mymodal-body">

                    <div class="container">
                        <div class="row mb-2 mt-2">

                             <div class="col-sm-2 text-right">from date:</div>
                            <div class="col-sm-2">
                                <input class="form-control" maxlength="10" type="text" id="textboxFromDate" placeholder="dd/mm/yyyy" value="" title="enter date in format dd/mm/yyyy eg 12/01/2018" />
                            </div>
                             <div class="col-sm-1 text-right">To date:</div>
                            <div class="col-sm-2">                          
                                <input class="form-control"   maxlength="10" type="text" id="textboxToDate" placeholder="dd/mm/yyyy" value="" title="enter date in format dd/mm/yyyy eg 12/01/2018"/>
                            </div>
                            
                            <div class="col-sm-2">
                                <input onclick="{ new $rab.Finance.Aggregation().Compute(); }" class="form-control" type="button" value="Generate Report" />
                            </div>
                           
                                 
                            
                        </div>
                       
                         <h2><kbd>Income </kbd></h2>
                        <div class="row mb-2">
                            <div class="col-sm-12">
                                <div class="table-responsive">
                                    <!-- income breakdown-->
                                    <table class="table">
                                        <thead class="theaders" data-account="income">
                                        </thead>
                                        <tbody id="tbodyBranchBreakDown">
                                           
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                          <h2><kbd>Expenditure</kbd></h2>
                        <div class="row mb-2">
                            <div class="col-sm-12">
                                <div class="table-responsive">
                                     <!-- expense breakdown-->
                                    <table class="table">
                                        <thead class="theaders" data-account="expenditure">
                                        </thead>
                                        <tbody id="tbodyBranchExpenseBreakDown">
                                           
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
<h2><kbd>Deficit</kbd></h2>
                        <div class="row mb-2">
                            <div class="col-sm-12">
                                <div class="table-responsive" id="containerdeficit">
                                     <!-- deficit breakdown-->
                                     <table class="table" id="tabledeficitOrsurplus">
                                        <thead class="theaders" data-account="deficitOrsurplus">
                                        </thead>
                                        <tbody id="tbodydeficit">
                                           
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div id="piechart"  "></div>
                                </div>
                                 <div class="col-sm-6">
                                    <div id="piechart2"  "></div>
                                </div>
                            </div>
                         
                    </div>
                </div>
                <div class="mymodal-footer">

                    <h3>Rabant Solutions Reports</h3>
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
                       <a href="Standard.aspx" class="text-black">Standard</a> <br>
                       
                         
                       
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
                            <div class="soc-item" style="display:none;">
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
    <script src="assets/script/financeJS.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
       
     
    <script>
        $(document).ready(function () {
            $("#textboxSearch").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#tableEventListing tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });

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
        // Get the modal
        var modal = document.getElementById('myModal');

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementById("closeStatReportWindow");

        // When the user clicks the button, open the modal
        btn.onclick = function () {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

    </script>
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
    <style>
        /* The Modal (background) */
        .mymodal {
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
        .mymodal-content {
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
        #closeStatReportWindow {
            color: white;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            #closeStatReportWindow:hover,
            #closeStatReportWindow:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

        .mymodal-header {
            padding: 2px 16px;
            background-color: #293955;
            color: white;
        }

        .mymodal-body {
            padding: 2px 16px;
        }

        .mymodal-footer {
            padding: 2px 16px;
            background-color: #293955;
            color: white;
        }
        strong{
            font-size:16px;
        }
    </style>
</body>
</html>

