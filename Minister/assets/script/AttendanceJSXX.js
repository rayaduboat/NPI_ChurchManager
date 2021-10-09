$rab.Attendance = $rab.Attendance || {};
$rab.Attendance.Permissionset = ["All", "SuperUser", "Attendance"];
$rab.Attendance.LoadedView = [];
$rab.overall = { children: [], youth: [], youngadult: [], above35: [] };
$rab.percentage = { children: [], youth: [], youngadult: [], above35: [] };
$rab.Attendance.MenuSet = ["SuperUser", "FinanceAdmin", "FinanceController"]
$rab.Attendance.Add = function (button) {
    try {
        //load all activities from the database to dropdown list
        var mem = document.getElementById("buttonMarkAttendance").MemberInfo;
        var clickedButton = document.getElementById("buttonMarkAttendance").Button;
        var url, obj, handler;
        url = "Attendance.aspx/MarkAttendance";
        obj = { memberID: mem.MemberID, branchID: mem.BranchID, activityName: $("#selectActivityNames").val() };
        handler = function (jsonmessage) {
            try {
                if (jsonmessage == "failed marking attendance") throw new $rab.Exception(jsonmessage);
                // successfully marked , remove button from collection
                $(clickedButton).remove();
                // update new state of data
                $rab.Attendance.LoadedView = $rab.Attendance.LoadedView.filter(function (mem) {
                    //remove marked member from collection;
                    return mem.MemberID != obj.memberID;
                });
                // close the dialog form
                $("#buttonCloseModal").click();
                statistics(jsonmessage);
                //alert(jsonmessage); dont show pop up to say attendance has been marked
                //reload members
                //new $rab.Attendance.LoadMembers().handler(jsonmessage);
            } catch (e) {
                alert(e.message);
            }
        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
    function statistics(jsondata) {
        try {

            // if successfull load all returned activities into dropdown list
            if (jsondata == "failed getting membership list") throw new $rab.Exception(jsondata);
            //$("#divAttendanceButtonContainer").empty();
            var parsed = JSON.parse(jsondata);


            $("#tdTotal").html(parsed.Total);
            $("#tdMale").html(parsed.Male);
            $("#tdFemale").html(parsed.Female);
            $("#tdChildren").html(parsed.Children);
            $("#tdTeenage").html(parsed.Teenage);
            $("#tdYoungAdult").html(parsed.YoungAdult);
            $("#tdAbove35").html(parsed.Above35);

            // append a table down the bottom
            $("#tbodymarked").empty();
            for (var i = 0; i < parsed.data.length; i++) {
                try {
                    // 

                    var tr = document.createElement("tr");
                    var td = document.createElement("td");
                    var tdID = document.createElement("td");
                    var button = document.createElement("button");
                    button.innerHTML = "unmark";
                    button.record = parsed.data[i];
                    button.tr = tr;
                    button.onclick = function () {
                        try {
                            var fullname = this.record.Fullname;
                            var id = this.record.AttendanceID;
                            new $rab.Server.Method().BeginInvoke("Attendance.aspx/UnmarkAttendees", { attendanceID: id }, function (jsondata) {
                                try {
                                    //show success alert
                                    //load statistics and load members
                                    $rab.Attendance.GetMarked();
                                    new $rab.Attendance.LoadMembers(new $rab.Branch().BranchInfo.BranchName).InBranch();
                                    //alert("removed " + fullname);

                                } catch (e) {

                                }

                            });
                            $(this.tr).remove();
                        } catch (e) {
                            alert(e.message);
                        }

                    }
                    td.innerHTML = parsed.data[i].Fullname;
                    tdID.appendChild(button);
                    tr.appendChild(td);
                    tr.appendChild(tdID);
                    $("#tbodymarked").append(tr);
                } catch (e) {

                }

            }
            //update view status;
            // $rab.Attendance.LoadedView = JSON.parse(parsed.Unmarked);

        } catch (e) {
            alert(e.message);
        }
    }
}
$rab.Attendance.LoadActivities = function (dropdown) {
    try {
        //load all activities from the database to dropdown list

        var url, obj, handler;
        url = "Attendance.aspx/GetActivities";
        obj = {};
        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list
                if (jsondata == "Failed getting activities") throw new $rab.Exception(jsondata);
                // $("#"+dropdown).empty();
                var parsed = JSON.parse(jsondata);

                var selects = ["selectactivityprofile", "selectActivity", "selectActivityNames", "selectstatsActivityName"];
                for (var j = 0; j < selects.length; j++) {
                    for (var i = 0; i < parsed.length; i++) {
                        var option = document.createElement("option");
                        option.value = parsed[i].activityName;
                        option.text = parsed[i].activityName;
                        option.innerText = parsed[i].activityName
                        option.ActivityID = parsed[i].ID;
                        document.getElementById(selects[j]).appendChild(option);
                    }
                }

            } catch (e) {
                alert(e.message);
            }

        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
}
$rab.Attendance.LoadActivityDates = function (dropdown, activity) {
    try {
        //load all activities from the database to dropdown list
        new $rab.Attendance.Statistics().emptyContainers();
        var url, obj, handler;
        if (typeof activity.ActivityID == 'undefined') return false;
        url = "Attendance.aspx/GetActivitiesDates";
        obj = { activityID: activity.ActivityID };
        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list
                if (jsondata == "failed getting activity dates") throw new $rab.Exception(jsondata);
                $("#" + dropdown).empty();
                var parsed = JSON.parse(jsondata);
                for (var i = 0; i < parsed.length; i++) {
                    var option = document.createElement("option");
                    option.value = parsed[i];
                    option.text = parsed[i];
                    option.innerText = parsed[i]

                    document.getElementById(dropdown).appendChild(option);
                }
            } catch (e) {
                alert(e.message);
            }

        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
}
$rab.Attendance.LoadMembers = function (branchName) {

    this.InBranch = function () {
        try {
            //load all activities from the database to dropdown list
            var activity = $("#selectActivityNames").val();
            if (activity == 'Select activity name') return;
            $("#divAttendanceButtonContainer").empty();
            var url, obj, handler;
            url = "Attendance.aspx/GetMembersByBranch";
            obj = { branchName: branchName, activityName: $("#selectActivityNames").val() };

            new $rab.Server.Method().BeginInvoke(url, obj, this.handler);
        } catch (e) {
            alert(e.message);
        }
    }

    this.handler = function (jsondata) {
        try {
            //load all the members of the branch
            // if successfull load all returned activities into dropdown list
            if (jsondata == "failed getting membership list") throw new $rab.Exception(jsondata);
            //$("#divAttendanceButtonContainer").empty();
            var parsed = JSON.parse(jsondata);
            //store loaded view in global variable to be filtered
            $rab.Attendance.LoadedView = parsed;
            //load all members
            this.buildTable(parsed); return;

        } catch (e) {
            //alert(e.message);
        }
    }
    this.buildTable = function (parsed) {
        $("#divAttendanceButtonContainer").empty();
        for (var i = 0; i < parsed.length; i++) {
            try {
                var button = document.createElement("button");


                button.innerHTML = parsed[i].FullName + (typeof parsed[i].BranchName == 'undefined' ? "" : " <span class='text-info'>...[" + parsed[i].BranchName + "]</span>");
                button.MemberID = parsed[i].MemberID;
                button.FullName = parsed[i].FullName;
                button.MemberInfo = parsed[i];

                button.className = "buttonStyle form-control mb-4";
                button.onclick = function () {
                    try {
                        // check if activity name selected is the right name
                        var activity = $("#selectActivityNames").val();
                        if (activity == 'Select activity name') throw new $rab.Exception("Please select a valid activity name");

                        $("#buttonModal").click();
                        $("#modalContent").html("Mark <b>" + activity + "</b> attendance for <kbd>" + this.FullName + "</kbd>, click Mark to mark or Close to cancel");
                        document.getElementById("buttonMarkAttendance").MemberInfo = this.MemberInfo;
                        document.getElementById("buttonMarkAttendance").Button = this;
                        $rab.Attendance.GetMarked();//build statistics table
                    } catch (e) {
                        alert(e.message);
                    }
                }
                document.getElementById("divAttendanceButtonContainer").appendChild(button);
            } catch (e) {

            }

        }
    }
}
$rab.Attendance.Menu = function () {
    this.LockDown = function () {
        try {
            if ($rab.Attendance.MenuSet.indexOf($rab.Login.User.LoginType) == -1) {
                //if user is not a superuser, financeadmin, financecontroller
                // hide report dropdown menu
                $("#buttonReportMenu").hide();
            }
            this.DisplayTabPanel();
        } catch (e) {

        }
    }
    this.DisplayTabPanel = function (evt, cityName) {
        try {

            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent1");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks1");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";



        } catch (e) {

        }
    }
}
$(function () {
    try {
        new $rab.Security.LockDown().PagePermission($rab.Attendance.Permissionset)
        $rab.Attendance.LoadActivities();
        $rab.Security.Church.LoadBranches("selectBranchNames");
        //add a master branch for loading all members in the district
        //if ($rab.Login.User.LoginType == "SuperUser")
           new $rab.MasterBranch().LoadBranch("selectBranchNames");
        $rab.Attendance.LoadMembers($('#selectBranchNames').val());

        //If user loginType is  finance admin, finance controller, superuser
        // allow user to view report dropdown menu
        new $rab.Attendance.Menu().LockDown();
        setTimeout(new $rab.AuditTrail().PageVisited("Attendance"), 1000)
        // Get the element with id="defaultOpen" and click on it

        document.getElementById("defaultOpen1").click();
        document.getElementById("defaultOpen").click();

    } catch (e) {

    }

})
$rab.Attendance.GetMarkedProfile = function () {

}
$rab.Attendance.GetMarked = function () {
    try {
        //load all activities from the database to dropdown list
        var activityID = document.getElementById("selectActivityNames").options[document.getElementById("selectActivityNames").selectedIndex].ActivityID
        var branchName = new $rab.Branch().BranchInfo.BranchName;
        if (branchName == "Select branch") throw new $rab.Exception("Select branch name");
        if (activityID == "Select activity name" || activityID == null) throw new $rab.Exception(" Select activity name");
        //$("#divAttendanceButtonContainer").empty();
        var url, obj, handler;
        url = "Attendance.aspx/GetActivityAttendees";
        if (branchName == "Master") {
            url = "Attendance.aspx/GetMasterActivityAttendees";
        }
        obj = { branchName: branchName, activityID: activityID };
        handler = function (jsondata) {
            try {

                // if successfull load all returned activities into dropdown list
                if (jsondata == "failed getting membership list") throw new $rab.Exception(jsondata);
                //$("#divAttendanceButtonContainer").empty();
                var parsed = JSON.parse(jsondata);


                $("#tdTotal").html(parsed.Total);
                $("#tdMale").html(parsed.Male);
                $("#tdFemale").html(parsed.Female);
                $("#tdChildren").html(parsed.Children);
                $("#tdTeenage").html(parsed.Teenage);
                $("#tdYoungAdult").html(parsed.YoungAdult);
                $("#tdAbove35").html(parsed.Above35);

                // append a table down the bottom
                $("#tbodymarked").empty();
                var tbody = document.getElementById("tbodymarked");
                for (var i = 0; i < parsed.data.length; i++) {
                    try {
                        // 
                        tbody.insertRow(i);
                        tbody.rows[i].insertCell(0).innerHTML = parsed.data[i].Fullname;

                        var tdID = tbody.rows[i].insertCell(1)
                        tdID.appendChild(button);
                        tbody.rows[i].insertCell(2).innerHTML = (typeof parsed.data[i].BranchName == 'undefined' ? "" : parsed.data[i].BranchName);
                        //var tr = document.createElement("tr");
                        //var td = document.createElement("td");
                        //var tdID = document.createElement("td");
                        //var button = document.createElement("button");
                        button.innerHTML = "unmark";
                        button.record = parsed.data[i];
                        button.tr = tr;
                        button.onclick = function () {
                            try {
                                var fullname = this.record.Fullname;
                                var id = this.record.AttendanceID;
                                new $rab.Server.Method().BeginInvoke("Attendance.aspx/UnmarkAttendees", { attendanceID: id }, function (jsondata) {
                                    try {
                                        //show success alert
                                        //load statistics and load members
                                        $rab.Attendance.GetMarked();
                                        new $rab.Attendance.LoadMembers(new $rab.Branch().BranchInfo.BranchName).InBranch();
                                        //alert("removed " + fullname);

                                    } catch (e) {

                                    }

                                });
                                $(this.tr).remove();
                            } catch (e) {
                                alert(e.message);
                            }

                        }
                        //td.innerHTML = parsed.data[i].Fullname;


                        //tr.appendChild(td);
                        //tr.appendChild(tdID);
                        //$("#tbodymarked").append(tr);
                    } catch (e) {

                    }

                }
            } catch (e) {
                alert(e.message);
            }
        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {
        alert(e.message);
    }
}
$rab.Attendance.OpenPanel = function (evt, cityName) {

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
$rab.Attendance.Activity = function () {
    //adds a new activity to be marked
    this.GetDictionary = function () {

        try {
            var url = "Attendance.aspx/GetAttendanceDictionary";
            new $rab.Server.Method().BeginInvoke(url, {}, function (jsondata) {
                try {
                    $("#selectActivityNames").empty();
                    if (jsondata != "failed to get dictionary") {
                        var parsed = JSON.parse(jsondata);
                        $rab.Utilities.FillOptions(["Select event"], "selectActivityNames");
                        $rab.Utilities.FillOptions(parsed, "selectActivityNames");

                    };
                } catch (e) {
                    alert(e.message);
                }
            });
        } catch (e) {

        }
    }
    this.AddDictionary = function (arraystring) {
        //arraystring: an array string seperated by comma's e.g Sunday service, Wednesday prayer, 
        try {
            if (arraystring == null || arraystring.length == 0 || typeof arraystring != "string") {
                alert("Invalid activity entered, please enter a valid comma seperated activity names");
                ; return;
            }
            //check if any of the activity entered doesnt already exist
            var options = document.getElementById("selectActivityNames").options
            for (var i = 0; i < options.length; i++) {
                if (arraystring.toLocaleLowerCase().indexOf(options[i].value.toLocaleLowerCase()) != -1) {
                    //activity already added stop further processing
                    try {
                        alert(options[i].value + " is already added");
                        return;
                    } catch (e) {

                    }
                }
            }
            var url = "Attendance.aspx/AddToDictionary";
            new $rab.Server.Method().BeginInvoke(url, { arraystring: arraystring }, function (jsondata) {
                try {

                    if (jsondata != "failed to add to dictionary") {
                        var array = arraystring.split(",");
                        //empty activity name selection
                        $("#selectActivityNames").empty();
                        $("#textboxActivityNames").val("");
                        $("#close-attendance-panel").click();
                        $rab.Utilities.FillOptions(["Select activity name"], "selectActivityNames");
                        $rab.Attendance.LoadActivities("selectActivityNames");

                        alert("success");
                    }

                } catch (e) {
                    alert(e.message);
                }
            });
        } catch (e) {

        }
    }
}
$rab.Attendance.Initialise = function () {

}
$rab.Attendance.StartUp = function (query) {
    try {
        $("#tbodyAbsentees,#tbodyActivitiestats").empty();
        if ($("#selectBranchNames").val() == "Please select branch") { throw new $rab.Exception("Select branch"); }
        if ($("#selectActivityDate").val() == "Select date") { throw new $rab.Exception("Select date"); }
        if ($("#selectActivity").val() == "Select activity") { throw new $rab.Exception("Select activity"); }

        $rab.Attendance.GetActivityAbsenteesDates(query);
        //$rab.Attendance.GetActivityAbsenteesStatistics(query);
    } catch (e) {
        alert(e.message);
    }
}
$rab.Attendance.GetActivityAbsenteesDates = function (query) {
    try {
        var url, obj, handler;
        //check modal header to query abseentees or attendees
        var title = query;
        $("#titleLoaded").html(title);
        if (title == "Attendees") {
            //get attendees
            url = "Attendance.aspx/GetActivityAttendeesStats";
        } else {
            //get abseentees
            url = "Attendance.aspx/GetActivityAbsenteesDatesStats";

        }
        //load all activities from the database to dropdown list


        var activity = document.getElementById('selectActivity').options[document.getElementById('selectActivity').selectedIndex];
        var date = $('#selectActivityDate').val();
        obj = { branchName: $("#selectBranchNames").val(), activityID: activity.ActivityID, date: date };


        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list
                if (jsondata == "failed getting activity dates") throw new $rab.Exception(jsondata);
                $("#tbodyAbsentees,#tbodyActivitiestats").empty();
                var tbody = document.getElementById("tbodyAbsentees");
                var tbodystats = document.getElementById("tbodyActivitiestats");

                var parsed = JSON.parse(jsondata);
                for (var i = 0; i < parsed.attendees.length; i++) {
                    tbody.insertRow(i);
                    tbody.rows[i].insertCell(0).innerHTML = parsed.attendees[i].Index + 1;
                    tbody.rows[i].insertCell(1).innerHTML = parsed.attendees[i].FullName;
                    var unmarkbutton = document.createElement("button");
                    var markbutton = document.createElement("button");
                    unmarkbutton.innerHTML = "unmark";

                    markbutton.innerHTML = "mark";

                    markbutton.Record = parsed.attendees[i];
                    unmarkbutton.Record = parsed.attendees[i];
                    unmarkbutton.tr = tbody.rows[i];
                    markbutton.tr = tbody.rows[i];
                    unmarkbutton.onclick = function () {
                        try {
                            var fullname = this.Record.FullName;
                            //var id = this.Record.AttendanceID;
                            var tablerow = this.tr;
                            new $rab.Server.Method().BeginInvoke("Attendance.aspx/UnmarkHistoryAttendees", {
                                branchID: this.Record.branchID,
                                activityID: this.Record.activityID,
                                MemberID: this.Record.MemberID,
                                date: this.Record.date
                            }, function (jsondata) {
                                try {
                                    $(tablerow).remove();

                                } catch (e) {

                                }

                            });
                            $(this.tr).remove();
                        } catch (e) {
                            alert(e.message);
                        }

                    };
                    markbutton.onclick = function () {
                        try {
                            //var fullname = this.Record.FullName;
                            //var id = this.Record.AttendanceID;
                            var tablerow = this.tr;
                            new $rab.Server.Method().BeginInvoke("Attendance.aspx/MarkHistoricAttendance", {
                                branchID: this.Record.branchID,
                                activityID: this.Record.activityID,
                                MemberID: this.Record.MemberID,
                                date: this.Record.date
                            }, function (jsondata) {
                                try {
                                    if (jsondata == 'success') { $(tablerow).remove(); }
                                    else {
                                        alert(jsondata);
                                    }
                                } catch (e) {

                                }

                            });
                            $(this.tr).remove();
                        } catch (e) {
                            alert(e.message);
                        }
                    };
                    if (title == "Attendees") {
                        tbody.rows[i].insertCell(2).appendChild(unmarkbutton);//.innerHTML = parsed.attendees[i].Email;

                    } else {
                        tbody.rows[i].insertCell(2).appendChild(markbutton);//.innerHTML = parsed.attendees[i].Telephone;

                    }
                }
                //for (var i = 0; i < parsed.stats.length; i++) {
                tbodystats.insertRow(0);
                tbodystats.rows[0].insertCell(0).innerHTML = parsed.stats.Children_0_to_12 + parsed.stats.Teenage_13_to_19 + parsed.stats.YoungAdult_20_to_35 + parsed.stats.AgeAbove35;
                tbodystats.rows[0].insertCell(1).innerHTML = parsed.stats.Children_0_to_12;
                tbodystats.rows[0].insertCell(2).innerHTML = parsed.stats.Teenage_13_to_19;
                tbodystats.rows[0].insertCell(3).innerHTML = parsed.stats.YoungAdult_20_to_35;
                tbodystats.rows[0].insertCell(4).innerHTML = parsed.stats.AgeAbove35;

                // }

            } catch (e) {
                alert(e.message);
            }

        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
}
$rab.Attendance.GetActivityAbsenteesStatistics = function (query) {
    try {
        // if ($("#selectBranchName").val() == "Select branch") { throw new $rab.Exception("Select branch"); }
        //load all activities from the database to dropdown list
        var url, obj, handler;
        var title = query;
        if (title == "Attendees") {
            //get attendees
            url = "Attendance.aspx/GetActivityAttendeesStats";
        } else if (title == 'Absentees') {
            //get abseentees
            url = "Attendance.aspx/GetActivityAbsenteesStatsEx";

        }

        var activity = document.getElementById('selectActivity').options[document.getElementById('selectActivity').selectedIndex];
        var date = $('#selectActivityDate').val();
        obj = { branchName: $("#selectBranchNames").val(), activityID: activity.ActivityID, date: date };
        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list
                if (jsondata == "failed getting activity dates") throw new $rab.Exception(jsondata);
                $("#tbodyAttendeestats").empty();
                var parsed = JSON.parse(jsondata);

                var tr = document.createElement("tr");
                var tdAgeCategory = document.createElement("td"); tdAgeCategory.innerHTML = "AgeCategory";
                var tdAgeAbove35 = document.createElement("td"); tdAgeAbove35.innerHTML = parsed.AgeAbove35;
                var tdChildren_0_to_12 = document.createElement("td");; tdChildren_0_to_12.innerHTML = parsed.Children_0_to_12;
                var tdTeenage_13_to_19 = document.createElement("td");; tdTeenage_13_to_19.innerHTML = parsed.Teenage_13_to_19;
                var tdYoungAdult_20_to_35 = document.createElement("td");; tdYoungAdult_20_to_35.innerHTML = parsed.YoungAdult_20_to_35;

                tr.appendChild(tdAgeCategory);
                tr.appendChild(tdChildren_0_to_12); tr.appendChild(tdTeenage_13_to_19);
                tr.appendChild(tdYoungAdult_20_to_35); tr.appendChild(tdAgeAbove35);
                document.getElementById("tbodyAttendeestats").appendChild(tr);

            } catch (e) {
                alert(e.message);
            }

        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
}
$rab.Attendance.GetActivityProfile = function () {
    try {
        //get selected activity and then return historic stats of all attended events
        //$("#tbodyAbsentees,#tbodyActivitiestats").empty();
        if ($("#selectactivityprofile").val() == "Select activity") { throw new Error("Select activity name"); }
        if ($("#selectBranchNames").val() == "Please select branch") { throw new Error("Select branch"); }
        var activityID = document.getElementById("selectactivityprofile").ActivityID;
        var url, obj, handler;
        url = "Attendance.aspx/GetActivityProfileStatistics";
        obj = { branchID: new $rab.Branch().BranchInfo.BranchID, activityName: $("#selectactivityprofile").val() }
        handler = function (jsondata) {
            try {
                var parsed = JSON.parse(jsondata);
                if (parsed.message == "success") {
                    var tbody = document.getElementById("tbodyactivityprofile");
                    $("#tbodyactivityprofile").empty();
                    for (var i = 0; i < parsed.result.length; i++) {
                        try {
                            tbody.insertRow(i);
                            tbody.rows[i].insertCell(0).innerHTML = parsed.result[i].Date;
                            tbody.rows[i].insertCell(1).innerHTML = parsed.result[i].Children;
                            tbody.rows[i].insertCell(2).innerHTML = parsed.result[i].Teenage;
                            tbody.rows[i].insertCell(3).innerHTML = parsed.result[i].YoungAdult;
                            tbody.rows[i].insertCell(4).innerHTML = parsed.result[i].Above35;
                            tbody.rows[i].insertCell(5).innerHTML = parsed.result[i].MaleTotal;
                            tbody.rows[i].insertCell(6).innerHTML = parsed.result[i].FemaleTotal;
                            tbody.rows[i].insertCell(7).innerHTML = parsed.result[i].Total;
                            //tbody.rows[i].insertCell(8).innerHTML = parsed.result[i].TotalMembers;
                            //tbody.rows[i].insertCell(9).innerHTML = parsed.result[i].TotalNonMembers;

                        } catch (e) {

                        }

                    }
                } else {
                    alert(parsed.message);
                }
            } catch (e) {

            }
        };
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {
        alert(e.message);
    }
}
$rab.Attendance.Refresh = function () {
    this.Data = function () {
        try {
            $("#divAttendanceButtonContainer").empty();
            var activityID = document.getElementById("selectActivityNames").options[document.getElementById("selectActivityNames").selectedIndex].ActivityID;                                    
            var activityName = $("#selectActivityNames").val();
            var branchName = new $rab.Branch().BranchInfo.BranchName;
            var branchID = new $rab.Branch().BranchInfo.BranchID;
            if (branchName == "Please select branch") {

                throw new $rab.Exception("Select branch name");

            }
            // if user has selected to Master filter, display panel for user
            // to select option of interest

            if (activityID == "Select activity name" || activityID == null || typeof activityID == 'undefined') {

                throw new $rab.Exception(" Select activity name");

            }
            if (branchName == 'Master') {
                $('#displayModalMaster').click(); return;
            }
            var handler = this.handler;
            //refresh statistics and members
            new $rab.Server.Method().BeginInvoke("Attendance.aspx/RefreshStatisticAndMembers",
                { branchID: branchID, activityID: activityID, branchName: branchName, activityName: activityName }, function (jsondata) {

                    try {


                        if (jsondata != null) {
                            var parsed = JSON.parse(jsondata);
                            if (parsed.message == "success") {
                                //Load member names
                                new $rab.Attendance.LoadMembers(branchName).handler(parsed.members);
                                //load statistics
                                handler(parsed.stats);
                            }
                        }
                    } catch (e) {

                    }

                });
        } catch (e) {

        }
    }
    this.handler = function (jsondata) {
        try {

            // if successfull load all returned activities into dropdown list
            if (jsondata == "failed getting membership list") throw new $rab.Exception(jsondata);
            //$("#divAttendanceButtonContainer").empty();
            var parsed = JSON.parse(jsondata);


            $("#tdTotal").html(parsed.Total);
            $("#tdMale").html(parsed.Male);
            $("#tdFemale").html(parsed.Female);
            $("#tdChildren").html(parsed.Children);
            $("#tdTeenage").html(parsed.Teenage);
            $("#tdYoungAdult").html(parsed.YoungAdult);
            $("#tdAbove35").html(parsed.Above35);

            // append a table down the bottom
            $("#tbodymarked").empty();
            for (var i = 0; i < parsed.data.length; i++) {
                try {
                    // 

                    var tr = document.createElement("tr");
                    var td = document.createElement("td");
                    var tdID = document.createElement("td");
                    var button = document.createElement("button");
                    button.innerHTML = "unmark";
                    button.record = parsed.data[i];
                    button.tr = tr;
                    button.onclick = function () {
                        try {
                            var fullname = this.record.Fullname;
                            var id = this.record.AttendanceID;
                            new $rab.Server.Method().BeginInvoke("Attendance.aspx/UnmarkAttendees", { attendanceID: id }, function (jsondata) {
                                try {
                                    //show success alert
                                    //load statistics and load members
                                    $rab.Attendance.GetMarked();
                                    new $rab.Attendance.LoadMembers(new $rab.Branch().BranchInfo.BranchName).InBranch();
                                    //alert("removed " + fullname);

                                } catch (e) {

                                }

                            });
                            $(this.tr).remove();
                        } catch (e) {
                            alert(e.message);
                        }

                    }
                    td.innerHTML = parsed.data[i].Fullname;
                    tdID.appendChild(button);
                    tr.appendChild(td);
                    tr.appendChild(tdID);
                    $("#tbodymarked").append(tr);
                } catch (e) {

                }

            }
        } catch (e) {
            alert(e.message);
        }
    }
    this.Adult = function () {
        try {
            $("#divAttendanceButtonContainer").empty();
            // refresh list before continuing
            // this.Data();
            //check if view is loaded
            if ($rab.Attendance.LoadedView.length == 0) { alert("No members loaded, please load members and try again"); return; }
            //filter list for age category 'Above 35' and 'Young adults'
            var result = $rab.Attendance.LoadedView.filter(function (val) {
                return (val.AgeCategory == 'Above 35' || val.AgeCategory == 'Young Adults(20-35)')

            });
            if (result.length > 0) {
                new $rab.Attendance.LoadMembers().buildTable(result);
            }
            //
        } catch (e) {

        }
    }
    this.Children = function (jsondata) {
        try {
            $("#divAttendanceButtonContainer").empty();
            //this.Data();
            //check if view is loaded
            if ($rab.Attendance.LoadedView.length == 0) { alert("No members loaded, please load members and try again"); return; }
            //filter list for age category 'Above 35' and 'Young adults'
            var result = $rab.Attendance.LoadedView.filter(function (val) {
                return (val.AgeCategory == 'Children (0-12)')

            });
            if (result.length > 0) {
                new $rab.Attendance.LoadMembers().buildTable(result);
            }
            //
        } catch (e) {

        }
    }
    this.Youth = function (jsondata) {
        try {
            $("#divAttendanceButtonContainer").empty();
            //this.Data();
            //check if view is loaded
            if ($rab.Attendance.LoadedView.length == 0) { alert("No members loaded, please load members and try again"); return; }
            //filter list for age category 'Above 35' and 'Young adults'
            var result = $rab.Attendance.LoadedView.filter(function (val) {
                return (val.AgeCategory == 'Teenage(13-19)')

            });
            if (result.length > 0) {
                new $rab.Attendance.LoadMembers().buildTable(result);
            }
            //
        } catch (e) {

        }
    }
}
$rab.Attendance.Statistics = function () {
    this.obj = {
        branchID: new $rab.Branch().BranchInfo.BranchID,
        activityName: $('#selectstatsActivityName').val(),
        date: $('#selectstatsActivityDate').val(),
    }
    this.emptyContainers = function () {
        $("#divAttendanceButtonContainer,#columnchart_childrenPercentage,#columnchart_material,#columnchart_youthPercentage,#columnchart_youth,#columnchart_youngadultPercentage,#columnchart_youngadult,#columnchart_above35,#columnchart_above35Percentage").empty();

    }
    this.url = "Attendance.aspx/GetAttendanceStatistics";
    this.getStatistics = function () {
        $('#divAttendanceButtonContainer,#columnchart_material').empty();
        if (this.obj.activityName == 'Select activity name') return;
        if (typeof this.obj.branchID == 'undefined') return;
        if (typeof this.obj.date == 'undefined') return;
        new $rab.Server.Method().BeginInvoke(this.url, { obj: this.obj }, this.handler);
    }
    this.handler = function (jsondata) {
        try {
            var parsed = JSON.parse(jsondata);
            $('#divAttendanceButtonContainer').empty();
            var container = document.getElementById('divAttendanceButtonContainer');
            var tab = new $rab.CreateTable([
                "Branch",
                "ChildrenAttendanceCount",
                "YouthAttendanceCount",
                "YoungAdultAttendanceCount",
                "Above35AttendanceCount",
                "ChildrenTotal",
                "YouthTotal",
                "YoungAdultsTotal",
                "Above35Total",
                "TotalMembership",
                "OverallAttendance %",
            ]);
            var tabpercentage = new $rab.CreateTable([
                "Branch",
                "Children%",
                "Youth%",
                "Young Adult%",
                "Adult 35 %",
            ]);
            var h22 = document.createElement('h2');
            h22.innerHTML = 'Branches attendance age category breakdown';
            container.appendChild(h22);
            container.appendChild(tab.table);
            $rab.overall.children = [];
            $rab.overall.youth = [];
            $rab.overall.youngadult = [];
            $rab.overall.above35 = [];
            for (var i = 0; i < parsed.result.attendance.length; i++) {
                try {
                    tab.tbody.insertRow(i);
                    tab.tbody.rows[i].insertCell(0).innerHTML = parsed.result.attendance[i].Branch
                    tab.tbody.rows[i].insertCell(1).innerHTML = parsed.result.attendance[i].ChildrenAttendanceCount
                    tab.tbody.rows[i].insertCell(2).innerHTML = parsed.result.attendance[i].YouthAttendanceCount
                    tab.tbody.rows[i].insertCell(3).innerHTML = parsed.result.attendance[i].YoungAdultAttendanceCount
                    tab.tbody.rows[i].insertCell(4).innerHTML = parsed.result.attendance[i].Abouve35AttendanceCount
                    tab.tbody.rows[i].insertCell(5).innerHTML = parsed.result.attendance[i].ChildrenTotal
                    tab.tbody.rows[i].insertCell(6).innerHTML = parsed.result.attendance[i].YouthTotal
                    tab.tbody.rows[i].insertCell(7).innerHTML = parsed.result.attendance[i].YoungAdultsTotal
                    tab.tbody.rows[i].insertCell(8).innerHTML = parsed.result.attendance[i].Above35Total
                    tab.tbody.rows[i].insertCell(9).innerHTML = parsed.result.attendance[i].TotalMembership
                    tab.tbody.rows[i].insertCell(10).innerHTML = parsed.result.attendance[i].OverallPercentageAttendance.toString() + '%'

                    $rab.overall.children.push([parsed.result.attendance[i].Branch, parsed.result.attendance[i].ChildrenAttendanceCount, parsed.result.attendance[i].ChildrenTotal]);
                    $rab.overall.youth.push([parsed.result.attendance[i].Branch, parsed.result.attendance[i].YouthAttendanceCount, parsed.result.attendance[i].YouthTotal]);
                    $rab.overall.youngadult.push([parsed.result.attendance[i].Branch, parsed.result.attendance[i].YoungAdultAttendanceCount, parsed.result.attendance[i].YoungAdultsTotal]);
                    $rab.overall.above35.push([parsed.result.attendance[i].Branch, parsed.result.attendance[i].Abouve35AttendanceCount, parsed.result.attendance[i].Above35Total]);

                } catch (e) {

                }

            }
            //create a seperation of tables
            var hr = document.createElement('hr');
            var h2 = document.createElement('h2');
            h2.innerHTML = 'Branches percentage attendance by age category';
            container.appendChild(hr);
            container.appendChild(h2);
            container.appendChild(tabpercentage.table);
            $rab.percentage.children = [];
            $rab.percentage.youth = [];
            $rab.percentage.youngadult = [];
            $rab.percentage.above35 = [];
            for (var i = 0; i < parsed.result.percentage.length; i++) {
                try {
                    tabpercentage.tbody.insertRow(i);
                    tabpercentage.tbody.rows[i].insertCell(0).innerHTML = parsed.result.percentage[i].Branch.toString()
                    tabpercentage.tbody.rows[i].insertCell(1).innerHTML = parsed.result.percentage[i].children.toString() + '%'
                    tabpercentage.tbody.rows[i].insertCell(2).innerHTML = parsed.result.percentage[i].youth.toString() + '%'
                    tabpercentage.tbody.rows[i].insertCell(3).innerHTML = parsed.result.percentage[i].youngAdult.toString() + '%'
                    tabpercentage.tbody.rows[i].insertCell(4).innerHTML = parsed.result.percentage[i].Adult35.toString() + '%'

                    $rab.percentage.children.push([parsed.result.percentage[i].Branch, parsed.result.percentage[i].children]);
                    $rab.percentage.youth.push([parsed.result.percentage[i].Branch, parsed.result.percentage[i].youth]);
                    $rab.percentage.youngadult.push([parsed.result.percentage[i].Branch, parsed.result.percentage[i].youngAdult]);
                    $rab.percentage.above35.push([parsed.result.percentage[i].Branch, parsed.result.percentage[i].Adult35]);
                } catch (e) {

                }

            }

            new $rab.Attendance.Statistics().plotchildrenOverall();
            new $rab.Attendance.Statistics().plotchildrenPercentage();

            new $rab.Attendance.Statistics().plotyouthOverall();
            new $rab.Attendance.Statistics().plotyouthPercentage();

            new $rab.Attendance.Statistics().plotyoungadultOverall();
            new $rab.Attendance.Statistics().plotyoungadultPercentage();

            new $rab.Attendance.Statistics().plotabove35Overall();
            new $rab.Attendance.Statistics().plotabove35Percentage();




        } catch (e) {

        }
    }
    this.plotchildrenOverall = function () {
        $('#columnchart_material').empty();
        var div = document.createElement('div');
        //div.style.width = '500px';
        div.style.height = '500px';
        div.id = 'tempchart1';
        $('#columnchart_material').append(div);
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            $rab.overall.children.splice(0, 0, ["Branch", "Attendance Count", "Total Children"])
            var data = google.visualization.arrayToDataTable($rab.overall.children);

            var options = {
                chart: {
                    title: 'Children attendance distribution',
                    subtitle: 'Branch, attendance count, total membership',
                }
            };

            var chart = new google.charts.Bar(document.getElementById('tempchart1'));

            chart.draw(data, google.charts.Bar.convertOptions(options));
        }
    }
    this.plotchildrenPercentage = function () {
        $('#columnchart_childrenPercentage').empty();
        var div = document.createElement('div');
        //div.style.width = '500px';
        div.style.height = '500px';
        div.id = 'tempchart2';
        $('#columnchart_childrenPercentage').append(div);
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            $rab.percentage.children.splice(0, 0, ["Branch", "Percentage"])
            var data = google.visualization.arrayToDataTable($rab.percentage.children);

            var options = {
                chart: {
                    title: 'Children attendance percentage distribution',
                    subtitle: 'Branch, percentage attendance',
                }
            };

            var chart = new google.charts.Bar(document.getElementById('tempchart2'));

            chart.draw(data, google.charts.Bar.convertOptions(options));
        }
    }

    this.plotyouthOverall = function () {
        $('#columnchart_youth').empty();
        var div = document.createElement('div');
        //div.style.width = '500px';
        div.style.height = '500px';
        div.id = 'tempchart3';
        $('#columnchart_youth').append(div);
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            $rab.overall.youth.splice(0, 0, ["Branch", "Attendance Count", "Total Youth"])
            var data = google.visualization.arrayToDataTable($rab.overall.youth);

            var options = {
                chart: {
                    title: 'Youth attendance distribution',
                    subtitle: 'Branch, attendance count, total membership',
                }
            };

            var chart = new google.charts.Bar(document.getElementById('tempchart3'));

            chart.draw(data, google.charts.Bar.convertOptions(options));
        }
    }
    this.plotyouthPercentage = function () {
        $('#columnchart_youthPercentage').empty();
        var div = document.createElement('div');
        //div.style.width = '500px';
        div.style.height = '500px';
        div.id = 'tempchart4';
        $('#columnchart_youthPercentage').append(div);
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            $rab.percentage.youth.splice(0, 0, ["Branch", "Percentage"])
            var data = google.visualization.arrayToDataTable($rab.percentage.youth);

            var options = {
                chart: {
                    title: 'Youth attendance percentage distribution',
                    subtitle: 'Branch, percentage attendance',
                }
            };

            var chart = new google.charts.Bar(document.getElementById('tempchart4'));

            chart.draw(data, google.charts.Bar.convertOptions(options));
        }
    }

    this.plotyoungadultOverall = function () {
        $('#columnchart_youngadult').empty();
        var div = document.createElement('div');
        //div.style.width = '500px';
        div.style.height = '500px';
        div.id = 'tempchart5';
        $('#columnchart_youngadult').append(div);
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            $rab.overall.youngadult.splice(0, 0, ["Branch", "Attendance Count", "Total Young adult"])
            var data = google.visualization.arrayToDataTable($rab.overall.youngadult);

            var options = {
                chart: {
                    title: 'Young adult attendance distribution',
                    subtitle: 'Branch, attendance count, total membership',
                }
            };

            var chart = new google.charts.Bar(document.getElementById('tempchart5'));

            chart.draw(data, google.charts.Bar.convertOptions(options));
        }
    }
    this.plotyoungadultPercentage = function () {
        $('#columnchart_youngadultPercentage').empty();
        var div = document.createElement('div');
        //div.style.width = '500px';
        div.style.height = '500px';
        div.id = 'tempchart6';
        $('#columnchart_youngadultPercentage').append(div);
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            $rab.percentage.youngadult.splice(0, 0, ["Branch", "Percentage"])
            var data = google.visualization.arrayToDataTable($rab.percentage.youngadult);

            var options = {
                chart: {
                    title: 'Young adult attendance percentage distribution',
                    subtitle: 'Branch, percentage attendance',
                }
            };

            var chart = new google.charts.Bar(document.getElementById('tempchart6'));

            chart.draw(data, google.charts.Bar.convertOptions(options));
        }
    }

    this.plotabove35Overall = function () {
        $('#columnchart_above35').empty();
        var div = document.createElement('div');
        //div.style.width = '500px';
        div.style.height = '500px';
        div.id = 'tempchart7';
        $('#columnchart_above35').append(div);
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            $rab.overall.above35.splice(0, 0, ["Branch", "Attendance Count", "Total Young adult"])
            var data = google.visualization.arrayToDataTable($rab.overall.above35);

            var options = {
                chart: {
                    title: 'Above 35 attendance distribution',
                    subtitle: 'Branch, attendance count, total membership',
                }
            };

            var chart = new google.charts.Bar(document.getElementById('tempchart7'));

            chart.draw(data, google.charts.Bar.convertOptions(options));
        }
    }
    this.plotabove35Percentage = function () {
        $('#columnchart_above35Percentage').empty();
        var div = document.createElement('div');
        //div.style.width = '500px';
        div.style.height = '500px';
        div.id = 'tempchart8';
        $('#columnchart_above35Percentage').append(div);
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            $rab.percentage.above35.splice(0, 0, ["Branch", "Percentage"])
            var data = google.visualization.arrayToDataTable($rab.percentage.above35);

            var options = {
                chart: {
                    title: 'Above 35 attendance percentage distribution',
                    subtitle: 'Branch, percentage attendance',
                }
            };

            var chart = new google.charts.Bar(document.getElementById('tempchart8'));

            chart.draw(data, google.charts.Bar.convertOptions(options));
        }
    }

}
$rab.MasterFilter = function () {
    this.activityID = document.getElementById("selectActivityNames").options[document.getElementById("selectActivityNames").selectedIndex].ActivityID;
    this.activityName = $("#selectActivityNames").val();

    this.LoadCouncillors = function () {
        var func = new $rab.Server.Dispatcher();
        func.obj = $rab.Login.User.AssignedBranches;
        func.url = "Attendance.aspx/LoadCouncillors";
        func.handler = this.BuildTable;
        func.invoke();
    }
    this.LoadOfficers = function () {
        var func = new $rab.Server.Dispatcher();
        func.obj = {
            loadFilter: $rab.Login.User.AssignedBranchGroups,
            activityID: this.activityID,
            activityName:this.activityName
        }
        //if loadfilter is empty or null return
        if (func.obj.loadFilter == null || typeof func.obj.loadFilter == 'undefined') return;
        if (func.obj.loadFilter.length == 0) {
            func.obj.loadFilter.push({ BranchID: $rab.Login.User.BranchID, BranchName: $rab.Login.User.BranchName });
        }
        func.url = "Attendance.aspx/LoadOfficers";
        func.handler = this.BuildTable;
        func.invoke();
    }
    this.GetGroupNames = function () {
        var func = new $rab.Server.Dispatcher();
        func.obj = {
            loadFilter: $rab.Login.User.AssignedBranchGroups,
            activityID: this.activityID,
            activityName: this.activityName
        }
        //if loadfilter is empty or null return
        if (func.obj.loadFilter == null || typeof func.obj.loadFilter == 'undefined') return;
        if (func.obj.loadFilter.length == 0) {
            func.obj.loadFilter.push({ BranchID: $rab.Login.User.BranchID, BranchName: $rab.Login.User.BranchName });
        }
        func.url = "Attendance.aspx/GetGroupNames";
        func.handler = function (data) {
            
            if (JSON.parse(data).message == 'success' && JSON.parse(data).result.length>0) {
                //$rab.Utilities.FillOptions(JSON.parse(data).result.GroupName, 'selectGetGroupNames');
                var parsed = JSON.parse(data).result;
                var select = document.getElementById('selectGetGroupNames');
                $(select).empty();
                var option = document.createElement('option');
                    option.innerHTML = "Select group name";
                    option.value     = "Select group name";
                select.appendChild(option);

                select.record = parsed;
                var uniquenames = parsed.map(function (val) { return val.Groupname }).unique();
                for (var i = 0; i < uniquenames.length; i++) {
                    try {
                        var option = document.createElement('option');
                        option.innerHTML = uniquenames[i] ;
                        option.value = uniquenames[i] ;
                        option.record;
                        option.onclick = function () {
                            
                        }
                        select.appendChild(option);
                    } catch (e) {

                    }
                }
            }
        };
        func.invoke();
    }
    this.LoadGroups = function (groupname) {
        var select = document.getElementById('selectGetGroupNames');
        var record = select.record.filter(function (val) { return val.Groupname==groupname});
        new $rab.Attendance.LoadMembers().buildTable(record);
        $('#displayModalMaster').click();
    }
    this.BuildTable = function (jsondata) {
        try {


            if (jsondata != null) {
                var parsed = JSON.parse(jsondata);
                if (parsed.message == "success") {
                    //Load member names
                    new $rab.Attendance.LoadMembers().buildTable(parsed.members);
                    $('#displayModalMaster').click();
                    //load statistics
                    //handler(parsed.stats);
                }
            }
        } catch (e) {

        }
    }
}