<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BugsAndFeatures.aspx.cs" Inherits="Minister_Events" %>

<!DOCTYPE html>

<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="Accounts">
    <title>BUGS AND FEATURES</title>
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
                    <li class="nav-item dropdown open">
                        <a class="nav-link link text-white dropdown-toggle display-4" href="ManagementList.aspx" data-toggle="dropdown-submenu" aria-expanded="true">
                            <span class="mbri-home mbr-iconfont mbr-iconfont-btn"></span>&nbsp;Management
                        </a>
                        <div class="dropdown-menu">
                            <div class="dropdown">
                                <a class="text-white dropdown-item dropdown-toggle display-4" href="ManagementList.aspx" data-toggle="dropdown-submenu" aria-expanded="false">Branch</a>
                                <div class="dropdown-menu dropdown-submenu">

                                    <a class="text-white dropdown-item display-4" href="MembershipList.aspx">Membership List</a>

                                    <a class="text-white dropdown-item display-4" href="Attendance.aspx">Attendance</a><a class="text-white dropdown-item display-4" href="Appointment.aspx">Appointments</a>
                                    <a class="text-white dropdown-item display-4" href="Appointment.aspx">Appointments</a><a class="text-white dropdown-item display-4" href="Baptism.aspx">Baptism</a>
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
                    <li class="nav-item dropdown open">
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
        <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2 text-center">How to use application</h2>
        <h3 class="mbr-section-subtitle mbr-fonts-style align-center pb-5 mbr-light display-5">Documentation</h3>
         
        <div class="container"  >
            <div class=" row">
                <h2 class="text-center" style="font-weight:600">Help documentation</h2>

                <button class="accordion">How do I get support for application</button>
                <div class="panel">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>

                <button class="accordion">How can manage membership</button>
                <div class="panel">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>

                <button class="accordion">I opened a linked church, how do I setup my officers</button>
                <div class="panel">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>

                 <button class="accordion">How do I get support for application</button>
                <div class="panel">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>

                <button class="accordion">How can manage membership</button>
                <div class="panel">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>

                <button class="accordion">I opened a linked church, how do I setup my officers</button>
                <div class="panel">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>


            </div>
        </div>
    </section>
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
                                <label class="form-control-label">Name</label>
                            </div>
                            <div class="col-sm-10">

                                <select class="form-control" id="textboxName">
                                    <option value="Select event">Select event</option>
                                    <option value="Naming ceremony">Naming ceremony</option>
                                    <option value="Dedication ceremony">Dedication ceremony</option>
                                    <option value="Naming and dedication ceremony">Naming and dedication ceremony</option>
                                    <option value="Conference">Conference</option>
                                    <option value="Open heavens">Open heavens</option>
                                    <option value="District youth unveiled">District youth unveiled</option>
                                    <option value="Retreat">Retreat</option>
                                    <option value="Evangelism">Evangelism</option>
                                </select>
                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Purpose</label>
                            </div>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" id="textboxPurpose" name="name" value="" placeholder="enter Purpose..." />

                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Date</label>
                            </div>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" id="textboxDate" name="name" value="" placeholder="enter Guest speaker..." />

                            </div>

                        </div>

                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Location</label>
                            </div>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" id="textboxLocation" name="name" value="" placeholder="enter location..." />

                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Guest speaker (s)</label>
                            </div>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" id="textboxGuestspeaker" name="name" value="" placeholder="enter guest speaker..." />

                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2">
                                <label class="form-control-label">Presiding officer</label>
                            </div>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" id="textboxPresidingofficer" name="name" value="" placeholder="enter presiding officer..." />

                            </div>

                        </div>


                        <div class="row mb-2">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-3">
                                <input class="form-control" type="text" id="textboxMencount" name="name" value="" placeholder="enter men count..." />
                            </div>
                            <div class="col-sm-3">
                                <input class="form-control" type="text" id="textboxWomencount" name="name" value="" placeholder="enter women count..." />
                            </div>
                            <div class="col-sm-3">
                                <input class="form-control" type="text" id="textboxChildrencount" name="name" value="" placeholder="enter children count..." />
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-3">
                                <input class="form-control" type="text" id="textboxtitheAndOffering" name="name" value="" placeholder="enter offering..." />
                            </div>
                            <div class="col-sm-4">
                                <input class="form-control" type="text" id="textboxHolySpiritBaptised" name="name" value="" placeholder="no. Holy spirit baptised..." />
                            </div>
                            <div class="col-sm-3">
                                <input class="form-control" type="text" id="textboxsoulswon" name="name" value="" placeholder="enter souls won..." />
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
    <section class="footer3 cid-qBsMjkH4VA" id="footer3-r" data-rv-view="183">


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
                        <a href="#" class="text-black">M</a>embers list<br>
                        Account&nbsp;<br>
                        <a href="#" class="text-black">P</a>resbyters
                        <br>
                        <a href="#" class="text-black">P</a>reaching plan<br>
                        <a href="#" class="text-black">M</a>onthly planner
                    </p>
                </div>
                <div class="col-md-3 col-sm-4">
                    <p class="mb-4 mbr-fonts-style foot-title display-7">
                        Ministeries
                    </p>
                    <p class="mbr-text mbr-fonts-style mbr-links-column display-7">
                        <a href="#" class="text-black">E</a>vangelism
                        <br>
                        Men<br>
                        <a href="#" class="text-black">W</a>omen
                        <br>
                        <a href="#" class="text-black">Y</a>outh
                        <br>
                        <a href="#" class="text-black">C</a>hildren
                    </p>
                </div>
                <div class="col-md-4 col-sm-12">
                    <p class="mb-4 mbr-fonts-style foot-title display-7">
                        What next?
                    </p>
                    <p class="mbr-text form-text mbr-fonts-style display-7">
                        Get monthly updates and free resources.
                    </p>
                    <div class="media-container-column" data-form-type="formoid">
                        <div data-form-alert="" hidden="" class="align-center">
                            Thanks for filling out the form!
                        </div>
                        <form class="form-inline" action="#/" method="post" data-form-title="Mobirise Form">
                            <input type="hidden" value="z91riD8F2qrxwTJBJTRhFpLhRH1Wi/fhixvYIXqb5NHZsSvl62Iz6X3zsezZ8PGYK5V3Aj5gtTrC7oYSaQB6qe0QYsq2sEPriJ2bUHtO2sjK1KE8Hyf8ToXNN1c99QEn" data-form-email="true">
                            <div class="form-group">
                                <input type="email" class="form-control input-sm input-inverse my-2" name="email" required="" data-form-field="Email" placeholder="Email" id="email-footer3-r">
                            </div>
                            <div class="input-group-btn m-2">
                                <button href="" class="form-control display-4" type="submit" role="button">Subscribe</button>
                            </div>
                        </form>
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
                        <p class="mbr-text mbr-fonts-style display-7">
                            
                        </p>
                    </div>
                    <div class="col-md-6">
                        <div class="social-list align-right">
                            <div class="soc-item">
                                <a href="#" target="_blank">
                                    <span class="socicon-twitter socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                </a>
                            </div>
                            <div class="soc-item">
                                <a href="#" target="_blank">
                                    <span class="socicon-facebook socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                </a>
                            </div>
                            <div class="soc-item">
                                <a href="#" target="_blank">
                                    <span class="socicon-youtube socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                </a>
                            </div>
                            <div class="soc-item">
                                <a href="#" target="_blank">
                                    <span class="socicon-instagram socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                </a>
                            </div>
                            <div class="soc-item">
                                <a href="#" target="_blank">
                                    <span class="socicon-googleplus socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
                                </a>
                            </div>
                            <div class="soc-item">
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
    <style>
        tr:nth-child(2n) {
            background-color: #293955;
            color: white;
        }

        tr:nth-child(2n+1) {
            background-color: #d6dbe9;
            color: black;
        }

        tr, button, input[type=button] {
            cursor: pointer;
        }
    </style>
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
    <script>
        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                    panel.style.display = "none";
                } else {
                    panel.style.display = "block";
                }
            });
        }
    </script>

    <style>
        .accordion {
            background-color: #eee;
            color: #444;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
            transition: 0.4s;
        }

            .active, .accordion:hover {
                background-color: #ccc;
            }

        .panel {
            padding: 0 18px;
            display: none;
            background-color: white;
            overflow: hidden;
        }
    </style>
</body>
</html>
