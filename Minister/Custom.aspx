<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Custom.aspx.cs" Inherits="Minister_Events" %>

<!DOCTYPE html>

<!DOCTYPE html>

<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="Accounts">
    <title>Standard Reports</title>
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
    <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-1.12.4.js">
    </script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js">
    </script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js">
    </script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js">
    </script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js">
    </script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js">
    </script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js">
    </script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
    <form runat="server">
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

                        <li class="nav-item dropdown open">
                            <a class="nav-link link text-white dropdown-toggle display-4" href="ManagementList.aspx" data-toggle="dropdown-submenu" aria-expanded="true">
                                <span class="mbri-home mbr-iconfont mbr-iconfont-btn"></span>&nbsp;Management
                            </a>
                            <div class="dropdown-menu">
                                <div class="dropdown">
                                    <a class="text-white dropdown-item dropdown-toggle display-4" href="ManagementList.aspx" data-toggle="dropdown-submenu" aria-expanded="false">Branch</a>
                                    <div class="dropdown-menu dropdown-submenu">

                                        <a class="text-white dropdown-item display-4" href="MembershipList.aspx">Membership List</a>

                                        <a class="text-white dropdown-item display-4" href="Attendance.aspx">Attendance</a>
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
            <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Custom Reports</h2>
            <h3 class="mbr-section-subtitle mbr-fonts-style align-center pb-5 mbr-light display-5">View standard reports 
            </h3>
            <div class="container p-4">
                <div class="row">
                    <div class="col-sm-3">
                        
                        <asp:DropDownList ID="dropdownBranches" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select branch" Selected="True" />
                            
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-2">
                        <div class="dropdown">
                            <button type="button" class="form-control dropdown-toggle text-center" style="text-align: center; background-color: #a11414; color: white;" data-toggle="dropdown">
                                Reports
                            </button>
                            <div class="dropdown-menu">


                                <%--<asp:Button ID="ButtonAttendace" runat="server" Text="Attendance" CssClass="dropdown-item" onclick="ButtonAttendace_Click" />--%>
                                <a class="dropdown-item" href="#" onclick="{new $rab.StandardReport.AllAttendanceProfile().Invoke();}">Attendance</a>
                                <a class="dropdown-item" href="#" onclick="{$rab.StandardReport.Events();}">Events</a>
                                <a class="dropdown-item" href="#" onclick="{$rab.StandardReport.GetMembershipBaptism();}">Membership</a>
                                <a class="dropdown-item" href="#" onclick="{$rab.StandardReport.WeeklyServiceReport();}">Weekly service report</a>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <button type="button" onclick="{curve_chart.innerHTML='';servercustomCharts.innerHTML='';customCharts.innerHTML='';}" class="form-control  text-center" style="text-align: center; background-color: #a11414; color: white;">
                            Clear reports
                        </button>

                    </div>
                    <div class="col-sm-2">
                    </div>
                    <div class="col-sm-2">
                        <!-- <button type="button" class="form-control dropdown-toggle text-center" style="text-align: center; background-color: #a11414; color: white;" data-toggle="dropdown">
                            Export
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#" onclick="{$rab.StandardReport.ExportToExcel()}">Excel</a>
                            <a class="dropdown-item" href="#">Word</a>
                            <a class="dropdown-item" href="#">PDF</a>


                        </div> -->
                    </div>
                </div>
            </div>
            <div class="container">
                <!-- dynamic tables are placed here -->

                <div class="row" id="servercustomCharts" runat="server">
                    <asp:ScriptManager runat="server" />
                    <asp:UpdatePanel runat="server" ID="updatepanel">
                        <ContentTemplate>
                            <asp:Button ID="textboxMembership" Text="Membership" runat="server" OnClick="textboxMembership_Click" />
                            <asp:Button ID="textboxAttendance" Text="Attendance" runat="server" OnClick="textboxAttendance_Click" />
                            <asp:Button ID="textboxEvents" Text="Events" runat="server" />
                            <asp:Button ID="textboxWeeklyServiceReport" Text="Weekly service report" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
                <div class="row" id="customCharts"></div>
                <div id="curve_chart" style="width: 1200px; height: 500px"></div>
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
        <%-- <script src="assets/web/assets/jquery/jquery.min.js"></script>--%>
        <script src="assets/popper/popper.min.js"></script>
        <script src="assets/tether/tether.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/smooth-scroll/smooth-scroll.js"></script>
        <script src="assets/dropdown/js/script.min.js"></script>
        <script src="assets/touch-swipe/jquery.touch-swipe.min.js"></script>
        <script src="assets/theme/js/script.js"></script>
        <script src="assets/formoid/formoid.min.js"></script>
        <script src="assets/script/AccessJS.js"></script>
        <script src="assets/script/standardReportJS.js"></script>
        <script src="assets/script/exportJS.js"></script>
        <style>
            tr:nth-child(2n) {
                background-color: #293955;
                color: white;
            }

            tr:nth-child(2n+1) {
                background-color: #d6dbe9;
                color: black;
            }

            tr, input[type=button] {
                cursor: pointer;
            }

                tr:hover {
                    background-color: #070000;
                    color: white;
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



    </form>
    <%--<asp:Chart ID="Chart1" runat="server">
        <Series>
            <asp:Series Name="Series1"></asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
        </ChartAreas>
    </asp:Chart>--%>
</body>
</html>

