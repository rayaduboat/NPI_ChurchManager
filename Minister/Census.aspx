<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Census.aspx.cs" Inherits="Minister_Census" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <title>Year Census</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        /* Add a gray background color and some padding to the footer */
        footer {
            background-color: #f2f2f2;
            padding: 25px;
        }
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html, body, h1, h2, h3, h4, h5, h6 {
            font-family: "Roboto", sans-serif;
        }
    </style>

</head>
<body class="w3-light-grey">

    <!-- Page Container -->
    <div class="w3-content w3-margin-top" style="max-width: 1400px;">

        <!-- The Grid -->
        <div class="w3-row-padding">

            <!-- Left Column -->


            <!-- Right Column -->
            <div class="container">
                <div class="w3-container w3-card-2 w3-white w3-margin-bottom">
                    <h2 class="w3-text-grey w3-padding-16 text-left"><i class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Census Year</h2>
                    <div class="w3-container">
                        <hr>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Assembly:</label>
                                <div class="col-sm-5">
                                    <select id="selectBranchNames" class="form-control">
                                        <option selected value="Select branch">Select branch</option>

                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Title:</label>
                                <div class="col-sm-5">
                                    <select id="textBoxTitle" class="form-control">
                                        <option value="Select title">Select title</option>
                                        <option value="Mr">Mr</option>
                                        <option value="Mrs">Mrs</option>
                                        <option value="Miss">Miss</option>
                                        <option value="Ms">Master</option>
                                        <option value="Sister">Sister</option>
                                        <option value="Deacon">Deacon</option>
                                        <option value="Deaconess">Deaconess</option>
                                        <option value="Elder">Elder</option>
                                        <option value="Pastor">Pastor</option>
                                        <option value="Brother">Brother</option>

                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">First Name:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="textBoxFirstName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Last Name:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="textBoxSurname">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">MiddleName (optional):</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="textBoxMiddleName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Date Of Birth:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="textBoxDOB" placeholder="dd/mm/yyyy">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Email Address:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="textBoxEmail">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Telephone:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="textBoxTelephone">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Mobile:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="textBoxMobileNumber">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Marital Status:</label>
                                <div class="col-sm-5">
                                    <select id="textBoxMaritalStatus" class="form-control">
                                        <option value="Select marital status">Select marital status</option>
                                        <option value="Single" selected>Single</option>
                                        <option value="Married">Married</option>
                                        <option value="Window">Window</option>
                                        <option value="Windower">Windower</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Contact Person:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="textBoxContactPerson">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Profession:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="textBoxProfession">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Active area in church:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="textBoxActiveArea">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Occupation:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="textBoxOccupation">
                                </div>
                            </div>
                            <div class="form-group">

                                <label class="control-label col-sm-2" for="pwd">Salvation-Born Again?:</label>
                                <div class="col-sm-8">
                                    <div class="row">

                                        <div class="col-sm-3">
                                            Yes/No:<select id="textBoxHasBornAgain" class="form-control">
                                                <option value="Select item">Select item</option>
                                                <option value="Yes">Yes</option>
                                                <option value="No">No</option>
                                            </select>
                                        </div>

                                        <div class="col-sm-5">DateBornAgain<input placeholder="dd/mm/yyyy" type="text" class="form-control" id="textBoxDateBornAgain" value="" /></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">

                                <label class="control-label col-sm-2" for="pwd">Water Baptism?:</label>
                                <div class="col-sm-8">
                                    <div class="row">

                                        <div class="col-sm-3">
                                            Yes/No:<select id="textBoxHasWaterBaptised" class="form-control">
                                                <option value="Select item">Select item</option>
                                                <option value="Yes">Yes</option>
                                                <option value="No">No</option>
                                            </select>
                                        </div>

                                        <div class="col-sm-5">Date Water Baptised?:<input placeholder="dd/mm/yyyy" type="text" class="form-control" id="textBoxDateWaterBaptised" value="" /></div>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group">

                                <label class="control-label col-sm-2" for="pwd">Holy Ghost Baptism:</label>
                                <div class="col-sm-8">
                                    <div class="row">

                                        <div class="col-sm-3">
                                            Yes/No:<select id="textBoxHasHolyGhostBaptised" class="form-control">
                                                <option value="Select item">Select item</option>
                                                <option value="Yes">Yes</option>
                                                <option value="No">No</option>
                                            </select>
                                        </div>

                                        <div class="col-sm-5">Date HolyGhost Baptised?:<input placeholder="dd/mm/yyyy" type="text" class="form-control" id="textBoxDateHolyGhostBaptised" value="" /></div>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Previous church:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="textBoxPreviousChurch">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Date of Visit:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="textBoxDateFirstVisit" placeholder="dd/mm/yyyy">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Church Contact Person:</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="textBoxChurchContactPerson">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Urgent Prayer Request:</label>
                                <div class="col-sm-5">
                                    <select id="textBoxUrgentPrayerRequest" class="form-control">
                                        <option value="Select an Item">Select an Item</option>
                                        <option value="Health">Health</option>
                                        <option value="Marriage">Marriage</option>
                                        <option value="Finance">Finance</option>
                                        <option value="Abuse">Abuse</option>
                                        <option value="Job">Job</option>
                                        <option value="Addiction">Addiction</option>
                                        <option value="Bereavement">Bereavement</option>
                                        <option value="Councelling">Councelling</option>
                                        <option value="Request for Visit">Request for Visit</option>
                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Prayer Request Details:</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" id="textBoxPrayerRequestDetails" rows="6" cols="6"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button onclick="{ $rab.Census.Add()}" id="btnPostCensus" type="submit" class="btn btn-success">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Right Column -->
            </div>

            <!-- End Grid -->
        </div>

        <!-- End Page Container -->
    </div>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="assets/script/censusJS.js"></script>

    <script>
        $(function () {


            // $("#textBoxDateFirstVisit,#textBoxDOB, #textBoxDateHolyGhostBaptised, #textBoxDateWaterBaptised, #textBoxDateBornAgain").datepicker('option', 'minDate', new Date("10,10,1960"));
            //$("#textBoxDateFirstVisit,#textBoxDOB, #textBoxDateHolyGhostBaptised, #textBoxDateWaterBaptised, #textBoxDateBornAgain").datepicker({
            //   .datepicker('option', 'minDate', new Date(startDate));

            //});
        });
    </script>


</body>
</html>
