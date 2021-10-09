<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Baptism.aspx.cs" Inherits="Minister_Baptism" %>

<!DOCTYPE html>

<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="MembershipList">
    <title>Baptism</title>
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
    <link href="assets/css/baptismCSS.css" rel="stylesheet" />
   
</head>
<body style="width:100%!important">
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
    <section class="section-table" id="table1-0" data-rv-view="143" style="margin-top: 80px; margin-bottom:0px!important">


        <div class="container container-table">
            <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Baptism List</h2>
            <h3 class="mbr-section-subtitle mbr-fonts-style align-center pb-5 mbr-light display-5">List of members baptised
            </h3>

            
        </div>

    </section>
  
    <section>
        <section style="margin-top: -10px!important; margin-left: 20px!important; margin-right: 20px!important;width:100%!important">


            <div class="tab">
                <button class="tablinks" onclick="new $rab.Baptism.Initialise().tabs(event, 'tabReport')" id="buttontabReport">Report</button>
                <button class="tablinks" onclick="new $rab.Baptism.Initialise().tabs(event, 'tabMassUpdate')">Mass update</button>
                <button class="tablinks" onclick="new $rab.Baptism.Initialise().tabs(event, 'tabStatistics')">Coming soon</button>
            </div>

            <div id="tabReport" class="tabcontent" style="width:100%!important">
                <div class="container">
                      <a href="#" data-toggle="collapse" data-target="#demoReport"> Click to show help</a>
                   <div id="demoReport" class="collapse">
                       To update baptism info please follow the instruction below
                       <ol>
                           <li>Search for member by entering name in the search textbox below.</li>
                           <li>Click on the update button in the edit column to show the <b >Edit baptism information</b> form</li>
                           <li>Update information, note not all information are required. As and when more information is gotten, repeat this
                               process accordingly.
                           </li>
                           <li>Click the update button to update information.</li>
                           <li>Form disappears and changes is updated in the table list</li>
                           <li>Changes automatically reflects in the statictics, when <b >update stats</b> button is clicked</li>
                       </ol>
                   </div>
                </div>
                <!-- table goes here-->
                <div class="container-fluid">
                    <div class="container"> 
                    <div class="row">
                        <div class="col-md-2" style="text-align: right; padding-top: 10px;">
                            <label class="form-control-label">Branch</label>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">

                                <select id="selectBranchNames" class="form-control" onchange="$('#tbodyMembers').empty();">
                                    <option value="Please select branch">Please select branch</option>

                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">

                                <input type="text" style="background-color: white!important" class="form-control" id="textboxsearchstring" name="findText" value="" placeholder="enter search string" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <input type="button"  value="Search" class="form-control form-control" onclick="{ $rab.Baptism.LoadBaptism() }" />

                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <input type="button" id="buttonUpdateStats" value="Update stats" class="form-control form-control" />
                                <i id="imodal" data-toggle="modal" data-target="#modalStat"></i>

                            </div>
                        </div>
                    </div>
                    </div>
                    
                    <div class="container-fluid scroll">
                        <%--                    <button type="button" class="form-control" data-toggle="collapse" data-target="#stats">Statistics</button>--%>
                        <div id="stats" class="collapse ">
                            <table class="table table-stripped table-responsive">
                                <thead>
                                    <tr>


                                        <%--<th>MenTotal               </th>--%>
                                        <th>MenWaterBaptised       </th>
                                        <th>MenHolySpiritBaptised  </th>
                                        <%--<th>WomenTotal              <th>--%>
                                        <th>
                                        WomenWaterBaptised     
                                                <th>
                                        <th>
                                        WomenHolySpiritBaptised
                                                <th>
                                        <th>
                                        WaterBaptisedTotal     
                                                <th>
                                        <th>
                                        HolySpiritBaptisedTotal
                                                <th>
                                                    <%--<th>Total               </th>--%>
                                    </tr>
                                </thead>
                                <tbody id="tbodystats">
                                    <tr>



                                        <%--<td id='tdMenTotal'               >0</td>--%>
                                        <td id='tdMenWaterBaptised'>0</td>
                                        <td id='tdMenHolySpiritBaptised'>0</td>
                                        <%--<td id='tdWomenTotal'             >0 <td>--%>
                                        <td id='tdWomenWaterBaptised'>
                                        0
                                                <td>
                                        <td id='tdWomenHolySpiritBaptised'>
                                        0
                                                <td>

                                        <td id='tdWaterBaptisedTotal'>
                                        0
                                                <td>
                                        <td id='tdHolySpiritBaptisedTotal'>
                                        0
                                                <td>
                                                    <%--<td id='tdTotal'                  >0</td>--%>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <table class="table table-hover table-responsive" cellspacing="0" id="tableMemberListing">
                            <thead>
                                <tr >
                                    <th class="head-item mbr-fonts-style display-7">Edit</th>
                                    <th class="head-item mbr-fonts-style display-7">First Name                    </th>
                                    <th class="head-item mbr-fonts-style display-7">Last Name                     </th>
                                    <th class="head-item mbr-fonts-style display-7">Is Born  Again                  </th>
                                    <th class="head-item mbr-fonts-style display-7">Is Water Baptised              </th>
                                    <th class="head-item mbr-fonts-style display-7">Is Communicant                </th>
                                    <th class="head-item mbr-fonts-style display-7">Is Holy Spirit Baptised         </th>
                                    <th class="head-item mbr-fonts-style display-7">Date Born again                </th>
                                    <th class="head-item mbr-fonts-style display-7">Officiating Minister          </th>
                                    <th class="head-item mbr-fonts-style display-7">Date of Baptism                </th>
                                    <th class="head-item mbr-fonts-style display-7">Place Of Baptism               </th>
                                    <th class="head-item mbr-fonts-style display-7">Certification Date            </th>
                                    <th class="head-item mbr-fonts-style display-7">RHF Date                      </th>
                                    <th class="head-item mbr-fonts-style display-7">RHF Officer                   </th>
                                    <th class="head-item mbr-fonts-style display-7">Holy Spirit Baptised Date       </th>
                                    <th class="head-item mbr-fonts-style display-7">Is New Convert Water Baptised    </th>
                                    <th class="head-item mbr-fonts-style display-7">Is Old Member Holy Spirit Baptised</th>
                                </tr>
                            </thead>
                            <tbody id="tbodyMembers">
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

            <div id="tabMassUpdate" class="tabcontent">
                <h3>Mass update</h3>
                <div class="container">
                    <a href="#" data-toggle="collapse" data-target="#demo"> Click to show help</a>
                   <div id="demo" class="collapse">
                       To perform mass update do the following
                       <ol>
                           <li>First select Branch in Report tab</li>
                           <li>On this tab (Mass Update) click the load members button to load all members</li>
                           <li>Search for member of interest by typing their name in search textbox below</li>
                           <li>Fill all known information about member or members.</li>
                           <li>In the action column click on the update pencil<img style="width:25px;height:25px" src="assets/images/pencil.png" /> image</li>
                           <li>You will get a success message to say update successful</li>
                       </ol>
                   </div>
                    <div class="row">
                        <div class="col-sm-2 pt-3">Enter search string</div>
                        <div class="col-sm-3  pt-3"><input type="text" class="form-control" /></div>
                        <div class="col-sm-2  pt-3"><button onclick="new $rab.Baptism.MassUpdate().buildTable()"><i class="fa fa-area-chart"></i>load members</button></div>
                        <%--<div class="col-sm-2  pt-3"><button><i class="fa fa-address-book fa-lg"></i> Add new</button></div>--%>
                        <%--<div class="col-sm-2  pt-3"><button onclick="new $rab.Baptism.MassUpdate().updateAll()"><i class="fa fa-upload fa-lg"></i> Update all</button></div>--%>
                    </div>
                </div>
               <hr />
                <table class="table table-hover table-responsive">
                    <thead>
                         
                        <tr>
                            <th>Action                        </th> 
                            <th>Last Name                         </th>
                            <th>First Name                         </th>
                            <th>Is Born again                      </th>
                            <th>Is Water Baptised                  </th>
                            <th>Is Holy Spirit Baptised             </th>
                            <th>Is New  Convert Water Baptised        </th>
                            <th>Is Old Member Holy Spirit Baptised    </th>
                            <th>Is Communicant                    </th>
                            <th>Date Born again                    </th>
                            <th>Officiating Minister              </th>
                            <th>Date of Baptism                    </th>
                            <th>Place Of Baptism                   </th>
                            <th>Certificate Date                  </th>
                            <th>Certificate Number                </th>
                            <th>RHF Date                          </th>
                            <th>RHF Officer                       </th>
                            <th>Holy Spirit BaptisedDate           </th>
<%--                            <th>CreatedOn                        </th>
                            <th>CreatedBy                        </th>--%>

                        </tr>

                    </thead>
                   <tbody id="tbodyMassUpdate">
                          
                                  
                    </tbody>
                </table>
            </div>

            <div id="tabStatistics" class="tabcontent">
                <h3>Coming soon</h3>
                
            </div>
        </section>
    </section>
   
     <section class="tabs2 cid-qBsnEquP9y" id="tabs2-1" data-rv-view="167" style="display:none;">


        <div class="container">
            <h2 class="mbr-section-title align-center pb-5 mbr-fonts-style display-2">Smarter links to manage membership
            </h2>
            <div class="media-container-row">
                <div class="col-12 col-md-8">
                    <ul class="nav ">
                        <li class="nav-item">
                            <a class="nav-link mbr-fonts-style active display-7 text-center" style="display: block; padding: 20px; border-radius: 15px 16px; width: 200px; background-color: #ec1212!important; margin: 10px; color: white!important" href="Followup.aspx">Follow up
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mbr-fonts-style active display-7  text-center" style="display: block; padding: 20px; border-radius: 15px 16px; width: 200px; background-color: #ec1212!important; margin: 10px; color: white!important" href="MembershipList.aspx" aria-expanded="true">Membership
                            </a>

                        </li>
                        <li class="nav-item">
                            <a class="nav-link mbr-fonts-style active display-7  text-center" style="display: block; padding: 20px; border-radius: 15px 16px; width: 200px; background-color: #ec1212!important; margin: 10px; color: white!important" href="Attendance.aspx" aria-expanded="true">Attendance
                            </a>
                        </li>



                    </ul>

                </div>
            </div>
        </div>
    </section>
    <section>
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
                            <h4 class="modal-title" id="divModaltitle"></h4>
                            <button id="closeButton" type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">


                            <h4>About faith in Christ</h4>
                            <hr />
                            <div class="row mt2" style="margin-bottom: 10px!important">
                                <label class="col-sm-5 control-label" for="">Is Born again</label>
                                <div class="col-sm-3">
                                    <select id="selectIsBornAgain" class="form-control" data-toggle="popover" data-trigger="hover" data-content="Select Yes if born again No if not">
                                        <option value="Select item">Select item</option>
                                        <option value="No">No</option>
                                        <option value="Yes">Yes</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <input style="visibility: collapse" type="text" id="textboxDateBornAgain" class="form-control" placeholder="dd/mm/yyyyy" />
                                    <script>
                                        selectIsBornAgain.onchange = function () {
                                            if (this.value == "Yes") {
                                                textboxDateBornAgain.style.visibility = "visible";
                                            } else {
                                                textboxDateBornAgain.style.visibility = "collapse";
                                            }
                                        }
                                    </script>
                                </div>
                            </div>

                            <h4>About water baptism</h4>
                            <hr />
                            <div class="row mt2" style="margin-bottom: 10px!important">
                                <label class="col-sm-5 control-label" for="">Is water baptised</label>
                                <div class="col-sm-4">
                                    <select id="selectIsWaterBaptised" class="form-control" data-toggle="popover" data-trigger="hover" data-content="Select Yes if water baptised and No if not">
                                        <option value="Select item">Select item</option>
                                        <option value="No">No</option>
                                        <option value="Yes">Yes</option>
                                    </select>
                                </div>
                                <script>
                                    selectIsWaterBaptised.onchange = function () {
                                        if (this.value == "Yes") {
                                            aboutwaterbaptism.style.display = "block";
                                        } else {
                                            aboutwaterbaptism.style.display = "none";
                                        }
                                    }
                                </script>
                            </div>
                            <div id="aboutwaterbaptism" style="display: none">


                                <div class="row mt2" style="margin-bottom: 10px!important">
                                    <label class="col-sm-5 control-label" for="exampleInputEmail">IsNewConvertWaterBaptised</label>
                                    <div class="col-sm-4">
                                        <select id="selectIsNewConvertWaterBaptised" class="form-control" data-toggle="popover" data-trigger="hover" data-content="Select Yes if Holy Spirit baptised No if not">
                                            <option value="Select item">Select item</option>
                                            <option value="No">No</option>
                                            <option value="Yes">Yes</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mt2" style="margin-bottom: 10px!important">
                                    <label class="col-sm-5 control-label" for="exampleInputEmail">Officitiating minister</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="textboxOfficiatingMinister" placeholder="Enter officiating minister" data-toggle="popover" data-trigger="hover" data-content="Enter officiating minister">
                                    </div>
                                </div>
                                <div class="row mt2" style="margin-bottom: 10px!important">
                                    <label class="col-sm-5 control-label" for="exampleInputEmail">Date baptised </label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="textboxDateBaptised" placeholder="dd/mm/yyyy" data-toggle="popover" data-trigger="hover" data-content="Enter date of water baptism">
                                    </div>
                                </div>
                                <div class="row mt2" style="margin-bottom: 10px!important">
                                    <label class="col-sm-5 control-label" for="exampleInputEmail">Location</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="textboxLocation" placeholder="Enter location of baptism" title="Header" data-toggle="popover" data-trigger="hover" data-content="Enter location of water baptism">
                                    </div>
                                </div>
                                <div class="row mt2" style="margin-bottom: 10px!important">
                                    <label class="col-sm-5 control-label" for="exampleInputEmail">Certification date</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="textboxCertificationDate" placeholder="dd/mm/yyyy" title="Certification date" data-toggle="popover" data-trigger="hover" data-content="Enter the date that member was issued with a baptism certificate">
                                    </div>
                                </div>
                            </div>
                            <h4>About right hand of fellowship</h4>
                            <hr />
                            <div class="row mt2" style="margin-bottom: 10px!important">
                                <label class="col-sm-5 control-label" for="">Is communicant</label>
                                <div class="col-sm-4">
                                    <select id="selectIsCommunicant" class="form-control" data-toggle="popover" data-trigger="hover" data-content="Select Yes if born again No if not">
                                        <option value="Select item">Select item</option>
                                        <option value="No">No</option>
                                        <option value="Yes">Yes</option>
                                    </select>
                                </div>

                            </div>
                            <div id="aboutcommunicant" style="display: none">
                                <div class="row mt2" style="margin-bottom: 10px!important">
                                    <label class="col-sm-5 control-label" for="exampleInputEmail">Date of right hand of fellowship</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="textboxRHDFellowshipDate" placeholder="dd/mm/yyyy" title="Header" data-toggle="popover" data-trigger="hover" data-content="Enter date of right hand of fellowship">
                                    </div>
                                </div>
                                <div class="row mt2">
                                    <label class="col-sm-5 control-label" for="exampleInputEmail">Officer extending right hand of fellowship</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="textboxRHFElderMinister" placeholder="blank" data-toggle="popover" data-trigger="hover" data-content="Enter officer extending right hand of fellowship" />
                                    </div>
                                </div>
                            </div>
                            <h4>About Holy Spirit baptism</h4>
                            <hr />
                            <div class="row mt2" style="margin-bottom: 10px!important">
                                <label class="col-sm-5 control-label" for="">Is Holy Spirit baptised</label>
                                <div class="col-sm-4">
                                    <select id="SelectIsHolySpiritBaptised" class="form-control" data-toggle="popover" data-trigger="hover" data-content="Select Yes if Holy Spirit baptised No if not">
                                        <option value="Select item">Select item</option>
                                        <option value="No">No</option>
                                        <option value="Yes">Yes</option>
                                    </select>
                                </div>
                            </div>
                            <div id="holyspiritcontent" style="margin-bottom: 10px!important; visibility: collapse">
                                <div class="row mt2 mb-2">
                                    <label class="col-sm-5 control-label" for="">Date Holy Spirit baptised</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="textboxDateHolySpiritBaptised" placeholder="dd/mm/yyyy" data-toggle="popover" data-trigger="hover" data-content="Enter date Holy Spirit baptised" />

                                    </div>
                                </div>
                                <div class="row mt2" style="margin-bottom: 10px!important">
                                    <label class="col-sm-5 control-label" for="exampleInputEmail">Is Old Member Holy Spirit Baptised</label>
                                    <div class="col-sm-4">
                                        <select id="selectIsOldMemberHolySpiritBaptised" class="form-control" data-toggle="popover" data-trigger="hover" data-content="Select Yes if Is Old Member Holy Spirit Baptised No if not">
                                            <option value="Select item">Select item</option>
                                            <option value="No">No</option>
                                            <option value="Yes">Yes</option>
                                        </select>
                                    </div>
                                </div>
                            </div>


                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <%--<button id="buttonAdd" onclick="{new $rab.Baptism.Add() }" type="submit" class="btn btn-secondary">Create</button>--%>
                            <button id="buttonUpdate" onclick="{new $rab.Baptism.Update(); }" type="submit" class="btn btn-secondary">Update</button>
                            <button id="buttonCloseModal" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <div class="container">

            <!-- Button to Open the Modal -->


            <!-- The Modal -->
            <div class="modal fade" id="modalStat">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h1 class="modal-title" id="h4statsheader">Baptism statistics</h1>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">

                            <table class="table table-responsive table-stripped">
                                <thead>
                                    <tr>
                                        <td style="width: 25%">Water baptised</td>
                                        <td style="width: 25%">Male</td>
                                        <td style="width: 25%">Female</td>
                                        <td style="width: 25%">Total</td>
                                    </tr>
                                </thead>
                                <tbody id="tbodywaterbaptised">
                                </tbody>
                            </table>
                            <hr />
                            <table class="table table-responsive table-stripped">
                                <thead>
                                    <tr>
                                        <td style="width: 25%">Holy Spirit baptised</td>
                                        <td style="width: 25%">Male</td>
                                        <td style="width: 25%">Female</td>
                                        <td style="width: 25%">Total</td>
                                    </tr>
                                </thead>
                                <tbody id="tbodyholyspiritbaptised">
                                </tbody>
                            </table>
                            <hr />
                            <table class="table table-responsive table-stripped">
                                <thead>
                                    <tr>
                                        <td style="width: 25%">Communicants</td>
                                        <td style="width: 25%">Male</td>
                                        <td style="width: 25%">Female</td>
                                        <td style="width: 25%">Total</td>
                                    </tr>
                                </thead>
                                <tbody id="tbodycommunicant">
                                </tbody>
                            </table>
                            <hr />
                            <table class="table table-responsive table-stripped">
                                <thead>
                                    <tr>
                                        <td style="width: 25%">Born again</td>
                                        <td style="width: 25%">Male</td>
                                        <td style="width: 25%">Female</td>
                                        <td style="width: 25%">Total</td>
                                    </tr>
                                </thead>
                                <tbody id="tbodybornagain">
                                </tbody>
                            </table>
                        </div>
                        <script>
                            buttonUpdateStats.onclick = function () {
                                if (selectBranchNames.value == 'Please select branch')
                                { alert('Please select branch'); }
                                else {

                                    var branchid = new $rab.Branch().BranchInfo.BranchID;
                                    new $rab.Server.Method().BeginInvoke("Baptism.aspx/GetBranchBaptismStatistics",
                                        { branchid: branchid },
                                        function (val) {

                                            try {
                                                $("#tbodywaterbaptised,#tbodyholyspiritbaptised,#tbodycommunicant,#tbodybornagain").empty()
                                                val = JSON.parse(val).result;
                                                tbodywaterbaptised.insertRow(0);
                                                tbodywaterbaptised.rows[0].insertCell(0).innerHTML = "Water baptised";
                                                tbodywaterbaptised.rows[0].insertCell(1).innerHTML = val.MaleWaterBaptised;
                                                tbodywaterbaptised.rows[0].insertCell(2).innerHTML = val.FemaleWaterBaptised;
                                                tbodywaterbaptised.rows[0].insertCell(3).innerHTML = val.FemaleWaterBaptised + val.MaleWaterBaptised;

                                                tbodyholyspiritbaptised.insertRow(0)
                                                tbodyholyspiritbaptised.rows[0].insertCell(0).innerHTML = "HolySpirit";;
                                                tbodyholyspiritbaptised.rows[0].insertCell(1).innerHTML = val.MaleHolySpiritBaptised
                                                tbodyholyspiritbaptised.rows[0].insertCell(2).innerHTML = val.FemaleHolySpiritBaptised
                                                tbodyholyspiritbaptised.rows[0].insertCell(3).innerHTML = val.MaleHolySpiritBaptised + val.FemaleHolySpiritBaptised;

                                                tbodycommunicant.insertRow(0);
                                                tbodycommunicant.rows[0].insertCell(0).innerHTML = "Communicant";
                                                tbodycommunicant.rows[0].insertCell(1).innerHTML = val.MaleCommunicant
                                                tbodycommunicant.rows[0].insertCell(2).innerHTML = val.FemaleCommunicant
                                                tbodycommunicant.rows[0].insertCell(3).innerHTML = val.FemaleCommunicant + val.MaleCommunicant;

                                                tbodybornagain.insertRow(0);
                                                tbodybornagain.rows[0].insertCell(0).innerHTML = "Born again";
                                                tbodybornagain.rows[0].insertCell(1).innerHTML = val.MaleBornAgain
                                                tbodybornagain.rows[0].insertCell(2).innerHTML = val.FemaleBornAgain
                                                tbodybornagain.rows[0].insertCell(3).innerHTML = val.FemaleBornAgain + val.MaleBornAgain;

                                                imodal.click();
                                            } catch (e) {

                                            }
                                        });
                                }
                            }

                        </script>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <%--<button id="buttonstatsUpdate" type="submit" class="btn btn-secondary">Update</button>--%>
                            <button id="buttonstatsCloseModal" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </section>

    <section class="footer3 cid-qBsDDF26RJ" id="footer3-9" data-rv-view="138" style="width:100%!important">


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
    <script src="assets/script/BaptismJS.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>

    <script>
        buttontabReport.click();
        selectIsCommunicant.onchange = function () {
            if (this.value == "Yes") {
                aboutcommunicant.style.display = "block";
            } else {
                aboutcommunicant.style.display = "none";
            }

        }
        SelectIsHolySpiritBaptised.onchange = function () {
            if (this.value == "Yes") {
                holyspiritcontent.style.visibility = "visible";
            } else {
                holyspiritcontent.style.visibility = "collapse";
            }
        }
    </script>
    <style>
        html,body,.tab-content,.footer3{
            width:100%!important;
            height:100%!important;
        }
        input[name=search] {
            margin: 0px !important;
            padding: 0px !important;
            cursor: pointer;
        }

        input[type=button], button {
            cursor: pointer !important;
        }

        tr {
            cursor: pointer;
        }

        h4 {
            color: #0094ff;
            font-weight: 600;
        }
    </style>
    <style>
        input[name=search] {
            margin: 0px !important;
            padding: 0px !important;
            cursor: pointer;
        }

        input[type=button] {
            cursor: pointer !important;
        }

         
        #aboutwaterbaptism {
            /*animation: animateContainer 1s ease;*/
        }

        @keyframes animateContainer {
            from {
                height: 0%;
            }

            to {
                height: 45%;
            }
        }

        @keyframes animateContainerup {
            from {
                height: 45%;
            }

            to {
                height: 0%;
            }
        }
    </style>


</body>
</html>

