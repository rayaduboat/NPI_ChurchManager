$rab.Followup = $rab.Followup || {};
$rab.Followup.Permissionset = ["SuperUser", "All", "Follow-up"];
$rab.Followup.LoadActivities = function (dropdown) {
    try {
        //load all activities from the database to dropdown list
        var url, obj, handler;
        url = "Attendance.aspx/GetActivities";
        obj = {};
        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list
                if (jsondata == "Failed getting activities") throw new $rab.Exception(jsondata);
                // $("#" + dropdown).empty();
                var parsed = JSON.parse(jsondata);
                for (var i = 0; i < parsed.length; i++) {
                    var option = document.createElement("option");
                    option.value = parsed[i].activityName;
                    option.text = parsed[i].activityName;
                    option.innerText = parsed[i].activityName
                    option.ActivityID = parsed[i].ID;
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
$rab.Followup.LoadActivityDates = function (dropdown, activity) {
    try {
        //load all activities from the database to dropdown list
        var url, obj, handler;
        if (activity.ActivityID === undefined) return false;
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
$rab.Followup.GetActivityAbsenteesDates = function () {
    try {
        var url, obj, handler;
        //check modal header to query abseentees or attendees
        var title = document.getElementById("roleCallModal").innerHTML;
        if (title == "Programme attendees dialog window"){
            //get attendees
            url = "Attendance.aspx/GetActivityAttendeesAndDates";
        } else {
            //get abseentees
            url = "Attendance.aspx/GetActivityAbsenteesDates";
        }
        //load all activities from the database to dropdown list
        
        
        var activity = document.getElementById('selectActivity').options[document.getElementById('selectActivity').selectedIndex];
        var date = $('#selectActivityDate').val();
        obj = { branchName: $("#selectBranchNames").val(), activityID: activity.ActivityID, date: date };


        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list
                if (jsondata == "failed getting activity dates") throw new $rab.Exception(jsondata);
                $("#tbodyAbsentees").empty();
                var parsed = JSON.parse(jsondata);
                for (var i = 0; i < parsed.length; i++) {
                    try {
                        var tr = document.createElement("tr");
                        tr.onclick = function () {
                            if (this.style.backgroundColor !== "red") {
                                this.style.backgroundColor = "red";
                                this.checkBoxControl.checked = true;
                            }
                            else {
                                this.style.backgroundColor = "";
                                this.checkBoxControl.checked = false;
                            }
                        }
                        var tdIndex = document.createElement("td"); tdIndex.innerHTML = parsed[i].Index;
                        var checkBoxtdIndex = document.createElement("input"); checkBoxtdIndex.type = "checkbox";
                        tdIndex.appendChild(checkBoxtdIndex);
                        checkBoxtdIndex.Record = parsed[i];
                        checkBoxtdIndex.RecordRow = tr;
                        checkBoxtdIndex.onchange = function () {

                            try {
                                //if checked then highlight row if not remove background color
                                if (this.checked) {
                                    this.RecordRow.style.backgroundColor = "red!important";
                                    this.RecordRow.style.color = "white";
                                } else {

                                    this.RecordRow.style.backgroundColor = "";
                                    this.RecordRow.style.color = "";
                                }
                            } catch (e) {

                            }
                        }
                        tr.checkBoxControl = checkBoxtdIndex;
                        tr.Record = parsed[i];
                        var tdfullname = document.createElement("td"); tdfullname.innerHTML = parsed[i].FullName;
                        var tdtelephone = document.createElement("td");; tdtelephone.innerHTML = parsed[i].Telephone;
                        var tdemail = document.createElement("td");; tdemail.innerHTML = parsed[i].Email;
                        tr.appendChild(tdIndex); tr.appendChild(tdfullname); tr.appendChild(tdtelephone); tr.appendChild(tdemail);
                        document.getElementById("tbodyAbsentees").appendChild(tr);
                    } catch (e) {

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
$rab.Followup.GetActivityAbsenteesStatistics = function () {
    try {
        return;
        // if ($("#selectBranchName").val() == "Select branch") { throw new $rab.Exception("Select branch"); }
        //load all activities from the database to dropdown list
        var url, obj, handler;
        url = "Attendance.aspx/GetActivityAbsenteesStats";
        var activity = document.getElementById('selectActivity').options[document.getElementById('selectActivity').selectedIndex];
        var date = $('#selectActivityDate').val();
        obj = { branchName: $("#selectBranchNames").val(), activityID: activity.ActivityID, date: date };
        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list
                if (jsondata == "failed getting activity dates") throw new $rab.Exception(jsondata);
                $("#tbodystats").empty();
                var parsed = JSON.parse(jsondata);
                for (var i = 0; i < parsed.length; i++) {
                    var tr = document.createElement("tr");
                    var tdAgeCategory = document.createElement("td"); tdAgeCategory.innerHTML = parsed[i].AgeCategory;
                    var tdAgeAbove35 = document.createElement("td"); tdAgeAbove35.innerHTML = parsed[i].AgeAbove35;
                    var tdChildren_0_to_12 = document.createElement("td");; tdChildren_0_to_12.innerHTML = parsed[i].Children_0_to_12;
                    var tdTeenage_13_to_19 = document.createElement("td");; tdTeenage_13_to_19.innerHTML = parsed[i].Teenage_13_to_19;
                    var tdYoungAdult_20_to_35 = document.createElement("td");; tdYoungAdult_20_to_35.innerHTML = parsed[i].YoungAdult_20_to_35;

                    tr.appendChild(tdAgeCategory);
                    tr.appendChild(tdChildren_0_to_12); tr.appendChild(tdTeenage_13_to_19);
                    tr.appendChild(tdYoungAdult_20_to_35); tr.appendChild(tdAgeAbove35);
                    document.getElementById("tbodystats").appendChild(tr);
                }
            } catch (e) {
                alert(e.message);
            }

        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
}
$rab.Followup.StartUp = function () {
    try {

        if ($("#selectBranchNames").val() == "Please select branch") { throw new $rab.Exception("Select branch"); }
        if ($("#selectActivityDate").val() == "Select date") { throw new $rab.Exception("Select date"); }
        if ($("#selectActivity").val() == "Select activity") { throw new $rab.Exception("Select activity"); }

        $rab.Followup.GetActivityAbsenteesDates();
        $rab.Followup.GetActivityAbsenteesStatistics();
    } catch (e) {
        //alert(e.message);
    }
}
$rab.Followup.CommentModal = function () {

    try {
        //show modal
        // $(".modal-body>input[type=text]").val("");
        var table = document.getElementById("tableAbsentees");
        var fullnames = [];
        for (var i = 0; i < table.rows.length; i++) {
            //check if  back color is red and and get the user full name and email addres
            // var table = document.createElement("table");
            if (table.rows[i].style.backgroundColor == "red") {
                //selection is made
                fullnames.push(table.rows[i].Record.FullName);
            }
        }
        if (fullnames.length > 0) {
            $("#textboxMemberName").empty();
            $("#textboxMemberName").val(fullnames.join(" ; "));//
            var user = JSON.parse(localStorage.getItem("user"));
            $("#textboxFollowedUpBy").val(user.FirstName + " " + user.LastName);//
            $("#textboxActivityName").val($("#selectActivity").val());
            $("#textboxActivityDate").val($("#selectActivityDate").val());
            $("#textboxActivityName,#textboxActivityDate").attr("disabled", true);
            $rab.Followup.Modal(false);
        } else {
            alert("No selection made, please select member record to record feedback");
        }
    } catch (e) {
        alert(e.message);
    }
}
$rab.Followup.Submit = function () {
    try {
        // adds a record to follow up
        //load all activities from the database to dropdown list
        var url, obj, handler;
        url = "Followup.aspx/FollowUpSubmission";
        obj = {
            branchName: $("#selectBranchNames").val(),
            activityName: $("#selectActivity").val(),
            activityDate: $("#selectActivityDate").val(),
            memberNames: $("#textboxMemberName").val(),
            purpose: $("#selectPurposeOfContact").val(),
            mode: $("#selectModeOfContact").val(),
            contactDate: $("#textboxfollowupDate").val(),
            concerns: $("#textboxConcerns").val(),
            isMinisterInformed: $("#selectMinisterInformed").val(),
            supportOffered: $rab.Followup.GetSupportReasons(),// $("#selectSupportOffered").val(),
            followedUpBy: $("#textboxFollowedUpBy").val(),
            comment: $("#textboxFollowupComment").val(),
            CreatedBy:$rab.Login.User.MemberID
        };
        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list
                if (jsondata != "Update successful") throw new $rab.Exception(jsondata);
                if (jsondata == "Update successful") {

                    try {
                        //close the modal window
                        document.getElementById("buttonDocumentationClose").click();
                        $rab.Followup.LoadFollowedUpByBranch($("#selectBranchNames").val()); return false;
                        //for (var i = 0; i < parsed.length; i++) {
                        //var tr = document.createElement("tr");
                        //var tdIndex = document.createElement("td"); tdIndex.innerHTML = 1;
                        //var tdMember = document.createElement("td"); tdMember.innerHTML = obj.memberNames;
                        //var tdPurpose = document.createElement("td"); tdPurpose.innerHTML = obj.purpose;
                        //var tdMode = document.createElement("td");; tdMode.innerHTML = obj.mode;
                        //var tdcontactDate = document.createElement("td");; tdcontactDate.innerHTML = obj.contactDate;
                        //var tdconcerns = document.createElement("td");; tdconcerns.innerHTML = obj.concerns;
                        //var tdisMinisterInformed = document.createElement("td");; tdisMinisterInformed.innerHTML = obj.isMinisterInformed;
                        //var tdsupportOffered = document.createElement("td");; tdsupportOffered.innerHTML = obj.supportOffered;
                        //var tdfollowedUpBy = document.createElement("td"); tdfollowedUpBy.innerHTML = obj.followedUpBy;
                        //var tdcomment = document.createElement("td");; tdcomment.innerHTML = obj.comment;

                        //tr.appendChild(tdIndex);
                        //tr.appendChild(tdMember);
                        //tr.appendChild(tdPurpose); tr.appendChild(tdMode);
                        //tr.appendChild(tdcontactDate); tr.appendChild(tdconcerns);

                        //tr.appendChild(tdisMinisterInformed); tr.appendChild(tdsupportOffered);
                        //tr.appendChild(tdfollowedUpBy); tr.appendChild(tdcomment);

                        //document.getElementById("tbodyLoggedFollowups").appendChild(tr);
                        // }
                        //add entry into report view
                        //append row to tbody follow upd
                        //
                    } catch (e) {

                    }
                }
                alert(jsondata);
            } catch (e) {
                alert(e.message);
            }

        }
        if (obj.branchName.trim().length == 0 || obj.branchName == "Select branch") throw new $rab.Exception("Invalid branch Name         ");
        if (obj.activityName.trim().length == 0 || obj.activityName == "Select activity") throw new $rab.Exception("Invalid activity Name       ");
        if (obj.memberNames.trim().length == 0) throw new $rab.Exception("Invalid member Name(s)        ");
        //if (obj.purpose.trim().length == 0) throw new $rab.Exception("Invalid purpose            ");
        //if (obj.mode.trim().length == 0) throw new $rab.Exception("Invalid mode               ");
        //if (obj.contactDate.trim().length == 0) throw new $rab.Exception("Invalid contact date        ");
        //if (obj.concerns.trim().length == 0) throw new $rab.Exception("Invalid concerns           ");
        //if (obj.isMinisterInformed.trim().length == 0) throw new $rab.Exception("is minister informed ");
        //if (obj.supportOffered.trim().length == 0) throw new $rab.Exception("Invalid support offered     ");
        //if (obj.followedUpBy.trim().length == 0) throw new $rab.Exception("enter person who followed up     ");
        //if (obj.comment.trim().length == 0) throw new $rab.Exception("enter a valid comment");

        new $rab.Server.Method().BeginInvoke(url, { fc: obj }, handler);
    } catch (e) {
        alert(e.message);
    }
    function GetSupportReasons() {
        var reason = [];
        var checkboxes = document.getElementsByClassName("form-check-input");
        if (checkboxes.length != 0) {

            for (var i = 0; i < checkboxes.length; i++) {
                //check if checkbox is checked
                if (checkboxes[i].checked) {
                    reason.push(checkboxes[i].dataset.support)
                }
                
            }
            
        }
       
        
        if (reason.length != 0) return reason.join(",");
        else{ return "Other"}
    }
}
$rab.Followup.LoadFollowedUp = function () {
    try {
        // adds a record to follow up
        //load all activities from the database to dropdown list
        $("#tbodyLoggedFollowups").empty();
        var url, obj, handler;
        url = "Followup.aspx/LoadFollowedUp";
        obj = {

        };
        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list
                if (jsondata == "failed loading follow up") throw new $rab.Exception(jsondata);


                try {
                    //close the modal window
                    var parsed = JSON.parse(jsondata);

                    var tbody = document.getElementById('tbodyLoggedFollowups');

                    for (var i = 0; i < parsed.length; i++) {
                        
                        var tr = document.createElement("tr");
                        var tdIndex = document.createElement("td"); tdIndex.innerHTML = i + 1;
                        var tdMember = document.createElement("td"); tdMember.innerHTML = parsed[i].MemberNames;
                        var tdPurpose = document.createElement("td"); tdPurpose.innerHTML = parsed[i].Purpose;
                        var tdMode = document.createElement("td");; tdMode.innerHTML = parsed[i].Mode;
                        var tdcontactDate = document.createElement("td");; tdcontactDate.innerHTML = parsed[i].ContactDate;
                        var tdconcerns = document.createElement("td");; tdconcerns.innerHTML = parsed[i].Concerns;
                        var tdisMinisterInformed = document.createElement("td"); tdisMinisterInformed.innerHTML = parsed[i].IsMinisterInformed;
                        var tdsupportOffered = document.createElement("td");; tdsupportOffered.innerHTML = parsed[i].SupportOffered;
                        var tdfollowedUpBy = document.createElement("td"); tdfollowedUpBy.innerHTML = parsed[i].FollowedUpBy;
                        var tdcomment = document.createElement("td");; tdcomment.innerHTML = parsed[i].Comment;

                        tr.appendChild(tdIndex);
                        tr.appendChild(tdMember);


                        tr.appendChild(tdPurpose);
                        tr.appendChild(tdMode);
                        tr.appendChild(tdcontactDate);
                        tr.appendChild(tdconcerns);

                        tr.appendChild(tdisMinisterInformed);
                        tr.appendChild(tdsupportOffered);
                        tr.appendChild(tdfollowedUpBy);
                        tr.appendChild(tdcomment);

                        document.getElementById("tbodyLoggedFollowups").appendChild(tr);
                    }
                    //add entry into report view
                    $rab.Followup.LoadFollowedUpStaticstics();
                    //append row to tbody follow upd
                    //
                } catch (e) {

                }

                //alert(jsondata);
            } catch (e) {
                alert(e.message);
            }

        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
}
$rab.Followup.LoadFollowedUpByBranch = function (branchName) {
    try {
        // adds a record to follow up
        //load all activities from the database to dropdown list
        $("#tbodyLoggedFollowups").empty();
        var url, obj, handler;
        url = "Followup.aspx/LoadFollowedUpByBranch";
        obj = {
            branchName: branchName
        };
        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list
                if (jsondata == "failed loading follow up") throw new $rab.Exception(jsondata);

                var user = JSON.parse(localStorage.getItem("user"));
                var fullname = (user.FirstName + " " + user.LastName);//
                try {
                    //close the modal window
                    var parsed = JSON.parse(jsondata);
                    var tbody = document.getElementById('tbodyLoggedFollowups');
                    for (var i = 0; i < parsed.length; i++) {
                        //var tr = document.createElement("tr");
                        //var tdIndex = document.createElement("td"); //tdIndex.innerHTML = parsed[i].Index;
                        var button = document.createElement("button"); button.innerHTML = "Edit";
                        //enable and disable edit button based on who made the record
                        if (parsed[i].FollowedUpBy.trim() != fullname.trim()) {
                            button.disabled = true;
                            button.title = "You are not allowed to edit this record. " +
                                "Only " + parsed[i].FollowedUpBy + " is allowed to edit this record";
                        }
                        else {
                            button.disabled = false;
                            button.title = "Click to edit record";
                        }
                        button.Record = parsed[i];
                        button.onclick = function () {
                            try {
                                $("input[type=text],select").val("");
                               // $("#textboxMemberName").attr("disabled", false);
                                // if the user trying to edit is not the one who documented account
                                // disable the edit button


                                var fullname =
                                    document.getElementById("buttonfeedbackUpdate").RecordIndex = this.Record.Index;
                                    $("#selectBranchNames").val(this.Record.BranchName),
                                    $("#selectActivity,#textboxActivityName").val(this.Record.ActivityName),
                                    $("#textboxActivityDate").val(this.Record.ActivityDate),
                                    $("#textboxMemberName").val(this.Record.MemberNames),
                                    $("#selectPurposeOfContact").val(this.Record.Purpose),
                                    $("#selectModeOfContact").val(this.Record.Mode),
                                    $("#textboxfollowupDate").val(this.Record.ContactDate),
                                    $("#textboxConcerns").val(this.Record.Concerns),
                                    $("#selectMinisterInformed").val(this.Record.IsMinisterInformed),
                                    $("#selectSupportOffered").val(this.Record.SupportOffered),
                                    $("#textboxFollowedUpBy").val(this.Record.FollowedUpBy),
                                    $("#textboxFollowupComment").val(this.Record.Comment)

                                $rab.Followup.Modal(true);

                                // $rab.Followup.CommentModal()
                            } catch (e) {

                            }
                        }
                        //tdIndex.appendChild(button);
                        tbody.insertRow(i);
                        tbody.rows[i].insertCell(0);
                        tbody.rows[i].insertCell(1) .innerText = parsed[i].MemberNames;
                        tbody.rows[i].insertCell(2) .innerText = parsed[i].ActivityName;
                        tbody.rows[i].insertCell(3) .innerText = parsed[i].ActivityDate;
                        tbody.rows[i].insertCell(4) .innerText = parsed[i].Purpose;
                        tbody.rows[i].insertCell(5) .innerText = parsed[i].Mode;
                        tbody.rows[i].insertCell(6) .innerText = parsed[i].ContactDate;
                        tbody.rows[i].insertCell(7) .innerText = parsed[i].Concerns;
                        tbody.rows[i].insertCell(8) .innerText = parsed[i].IsMinisterInformed;
                        tbody.rows[i].insertCell(9) .innerText = parsed[i].SupportOffered;
                        tbody.rows[i].insertCell(10).innerText = parsed[i].FollowedUpBy;
                        tbody.rows[i].insertCell(11).innerText = parsed[i].Comment;
                        tbody.rows[i].cells[0].appendChild(button);


                     }
                    //add entry into report view
                    //$rab.Followup.LoadFollowedUpStaticstics();
                    $rab.Followup.LoadFollowedUpStaticsticsByBranch(obj.branchName);
                    //append row to tbody follow upd
                    //
                } catch (e) {

                }

                //alert(jsondata);
            } catch (e) {
                alert(e.message);
            }

        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
}
$rab.Followup.LoadFollowedUpStaticsticsByBranch = function (branchName) {
    try {
        // adds a record to follow up
        //load all activities from the database to dropdown list
        $("#tbodyPurposeStatistics").empty();
        var url, obj, handler;
        url = "Followup.aspx/FollowedUpPurposeStatisticsByBranch";
        obj = {
            branchName: branchName
        };
        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list
                if (jsondata == "failed loading follow up") throw new $rab.Exception(jsondata);


                try {
                    //close the modal window
                    var parsed = JSON.parse(jsondata);
                    var tbody = document.getElementById('tbodyPurposeStatistics');
                    tbody.insertRow(0);
                    tbody.rows[0].insertCell(0).innerHTML = parsed.Purpose            ;
                    tbody.rows[0].insertCell(1).innerHTML = parsed.Absent1week        ;
                    tbody.rows[0].insertCell(2).innerHTML = parsed.Absent2weeks       ;
                    tbody.rows[0].insertCell(3).innerHTML = parsed.Backslider         ;
                    tbody.rows[0].insertCell(4).innerHTML = parsed.HealthProgressCheck;
                    tbody.rows[0].insertCell(5).innerHTML = parsed.Other              ;
                    return;
                    for (var i = 0; i < parsed.length; i++) {
                        var tr = document.createElement("tr");
                        var tdabsent2weeks = document.createElement("td"); tdabsent2weeks.innerHTML = parsed[i].Absent2weeks;
                        var tdbackslider = document.createElement("td"); tdbackslider.innerHTML = parsed[i].Backslider;
                        var tdHealthprogresscheck = document.createElement("td"); tdHealthprogresscheck.innerHTML = parsed[i].HealthProgressCheck;
                        var tdOther = document.createElement("td"); tdOther.innerHTML = parsed[i].Other;
                        var tdPurpose = document.createElement("td"); tdPurpose.innerHTML = parsed[i].Purpose;
                        tr.appendChild(tdPurpose);
                        tr.appendChild(tdabsent2weeks);

                        tr.appendChild(tdbackslider); tr.appendChild(tdHealthprogresscheck);
                        tr.appendChild(tdOther);

                        document.getElementById("tbodyPurposeStatistics").appendChild(tr);
                    }
                    //add entry into report view
                    //append row to tbody follow upd
                    //
                } catch (e) {

                }

                //alert(jsondata);
            } catch (e) {
                alert(e.message);
            }

        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
}
$(function () {

    try {

        new $rab.Security.LockDown().PagePermission($rab.Followup.Permissionset)

        $rab.Security.Church.LoadBranches("selectBranchNames");
        setTimeout($rab.Followup.LoadActivities("selectActivity"), 500);
        setTimeout(new $rab.AuditTrail().PageVisited("Follow-up"), 1000)


    } catch (e) {

    }
});
$rab.Followup.Modal = function (bool) {
    if (bool) {
        $("#tbodyAbsentees").empty();
        //show update button and hide add new member button
        document.getElementById("buttonfeedbackUpdate").style.display = "block";
        document.getElementById("buttonfeedbackAdd").style.display = 'none';
        document.getElementById("buttonActivityAbsentees").click();
        document.getElementById("spanModalAbsentee").click();
        return false
    } else {
        //hide update button and show new member button
        document.getElementById("buttonfeedbackUpdate").style.display = "none";
        document.getElementById("buttonfeedbackAdd").style.display = 'block';


        document.getElementById("textboxfollowupDate").value = "";
        document.getElementById("textboxConcerns").value = "";
        document.getElementById("textboxFollowupComment").value = "";

        document.getElementById("selectPurposeOfContact").selectedIndex = 0;
        document.getElementById("selectModeOfContact").selectedIndex = 0;
        document.getElementById("selectMinisterInformed").selectedIndex = 0;
        //document.getElementById("selectSupportOffered").selectedIndex = 0;

        document.getElementById("spanModalAbsentee").click();
        return false;
    }

}
$rab.Followup.Update = function () {
    try {
        // adds a record to follow up
        //load all activities from the database to dropdown list
        var url, obj, handler;
        url = "Followup.aspx/FollowUpUpdate";
        obj = {
            recordIndex: document.getElementById("buttonfeedbackUpdate").RecordIndex,
            branchName: $("#selectBranchNames").val(),
            activityName: $("#selectActivity").val(),
            memberNames: $("#textboxMemberName").val(),
            purpose: $("#selectPurposeOfContact").val(),
            mode: $("#selectModeOfContact").val(),
            contactDate: $("#textboxfollowupDate").val(),
            concerns: $("#textboxConcerns").val(),
            isMinisterInformed: $("#selectMinisterInformed").val(),
            supportOffered: $rab.Followup.GetSupportReasons(),// $("#selectSupportOffered").val(),
            followedUpBy: $("#textboxFollowedUpBy").val(),
            comment: $("#textboxFollowupComment").val()

        };
        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list

                //alert(jsondata);
                $("button[data-dismiss='modal']").click();
                $rab.Followup.LoadFollowedUpByBranch($("#selectBranchNames").val());
            } catch (e) {
                alert(e.message);
            }

        }
        if (obj.branchName.trim().length == 0) throw new $rab.Exception("Invalid branch Name         ");
        //if (obj.activityName.trim().length == 0) throw new $rab.Exception("Invalid activity Name       ");
        //if (obj.memberNames.trim().length == 0) throw new $rab.Exception("Invalid member Name(s)        ");
        //if (obj.purpose.trim().length == 0) throw new $rab.Exception("Invalid purpose            ");
        //if (obj.mode.trim().length == 0) throw new $rab.Exception("Invalid mode               ");
        //if (obj.contactDate.trim().length == 0) throw new $rab.Exception("Invalid contact date        ");
        //if (obj.concerns.trim().length == 0) throw new $rab.Exception("Invalid concerns           ");
        //if (obj.isMinisterInformed.trim().length == 0) throw new $rab.Exception("is minister informed ");
        //if (obj.supportOffered.trim().length == 0) throw new $rab.Exception("Invalid support offered     ");
        //if (obj.followedUpBy.trim().length == 0) throw new $rab.Exception("enter person who followed up     ");
        //if (obj.comment.trim().length == 0) throw new $rab.Exception("enter a valid comment");

        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
}
$rab.Followup.AddVisitation = function () {
    try {
        var obj = {
            memberid: document.getElementById("selectMemberNames").options[document.getElementById("selectMemberNames").selectedIndex].MemberID,
            visitdate: $("#TextBoxDateOfVisit").val(),
            visitingofficers: $("#TextBoxVisitingOfficers").val(),
            purpose: $("#TextBoxPurpose").val(),
            supportoffered: $("#TextBoxSupportOffered").val(),
            comment: $("#textboxcomment").val(),
            createdBy: $rab.Login.User.MemberID
        }
        //validate controls
        if (isNaN(obj.memberid)) { alert("Invalid member names"); $("#selectBranchNames").focus(); return; }
        if (obj.visitdate.trim().length == 0) { alert("invalid visit  date:       "); $("#selectBranchNames").focus(); return; }
        if (obj.visitingofficers.trim().length == 0) { alert("invalid visiting officers:"); $("#selectBranchNames").focus(); return; }
        if (obj.purpose.trim().length == 0) { alert("invalid purpose         "); $("#selectBranchNames").focus(); return; }
        if (obj.supportoffered.trim().length == 0) { alert("invalid supportoffered  "); $("#selectBranchNames").focus(); return; }
        if (obj.comment.trim().length == 0) { alert("invalid comment         "); $("#selectBranchNames").focus(); return; }

        new $rab.Server.Method().BeginInvoke("Followup.aspx/AddVisitation", obj

            , function (jsondata) {
                if (jsondata == "Adding visitation failed") throw new $rab.Exception("Adding visitation failed");
                var parsed = JSON.parse(jsondata);
                if (parsed.message == "Visitation added") {
                    document.getElementsByClassName("modalvisionclose")[0].click();
                    $("#myModalVisitation input[type=text] , #myModalVisitation textarea").val("");
                    $("#myModalVisitation select").each(function (val) {
                        this.selectedIndex = 0;
                    });
                    alert(parsed.message); return;

                    // dont run code below if successful
                    //kill modal and then append to visitation table below
                    var table = document.createElement("table");
                    table.className = "table table-striped table-responsive table-hover";

                    for (var i = 0; i < parsed.records.length; i++) {
                        var tr = document.createElement("tr");
                        var tdmember = document.createElement("td"); tdmember.innerHTML = parsed.records[i].MemberID;
                        var tdvisitdate = document.createElement("td"); tdvisitdate.innerHTML = parsed.records[i].DateVisited;
                        var tdvisitingofficers = document.createElement("td"); tdvisitingofficers.innerHTML = parsed.records[i].Purpose;
                        var tdpurpose = document.createElement("td"); tdpurpose.innerHTML = parsed.records[i].SupportAndDonation;
                        var tdsupportoffered = document.createElement("td"); tdsupportoffered.innerHTML = parsed.records[i].Comment;
                        var tdcomment = document.createElement("td"); tdcomment.innerHTML = parsed.records[i].VisitingOfficers;

                        tr.appendChild(tdmember)
                        tr.appendChild(tdvisitdate)
                        tr.appendChild(tdvisitingofficers)
                        tr.appendChild(tdpurpose)
                        tr.appendChild(tdsupportoffered)
                        tr.appendChild(tdcomment)
                        // tr.appendChild(td)

                        table.appendChild(tr);
                    }
                    $("#visitationReport").empty();
                    document.getElementById("visitationReport").appendChild(table);
                    alert(parsed.message);
                    document.getElementsByClassName("modalvisionclose")[0].click();
                    $("#myModalVisitation input[type=text]").val("");
                    $("#myModalVisitation select").each(function (val) {
                        this.selectedIndex = 0;
                    });
                };

            });


    } catch (e) {
        alert(e.message);
    }
}
$rab.Followup.Report = function () {
    try {

        if ($("#selectBranchNames").val() == "Select branch") throw new $rab.Exception("Please select branch");
        new $rab.Server.Method().BeginInvoke("Followup.aspx/GetVisitation", { branchName: $("#selectBranchNames").val() }

            , function (jsondata) {
                if (jsondata == "Adding visitation failed") throw new $rab.Exception("failed getting visitation");
                var parsed = JSON.parse(jsondata);
                if (parsed.message == "successfully loaded visitation") {
                    //kill modal and then append to visitation table below
                    var table = document.createElement("table");
                    table.className = "table table-striped table-responsive table-hover";
                    //create table header
                    var tr = document.createElement("tr"); tr.style.backgroundColor = "black"; tr.style.color = "white";
                    var tdmember = document.createElement("td"); tdmember.innerHTML = "MemberID";
                    var tdvisitdate = document.createElement("td"); tdvisitdate.innerHTML = "Date visited";
                    var tdvisitingofficers = document.createElement("td"); tdvisitingofficers.innerHTML = "Purpose";
                    var tdpurpose = document.createElement("td"); tdpurpose.innerHTML = "SupportOffered";
                    var tdsupportoffered = document.createElement("td"); tdsupportoffered.innerHTML = "Comment";
                    var tdcreatedby = document.createElement("td"); tdcreatedby.innerHTML = "CreatedBy";
                    var tdcomment = document.createElement("td"); tdcomment.innerHTML = "Visiting officers";
                    tr.appendChild(tdmember)
                    tr.appendChild(tdvisitdate)
                    tr.appendChild(tdvisitingofficers)
                    tr.appendChild(tdpurpose)
                    tr.appendChild(tdsupportoffered)
                    tr.appendChild(tdcomment)
                    tr.appendChild(tdcreatedby)
                    table.appendChild(tr);

                    for (var i = 0; i < parsed.records.length; i++) {
                        var tr = document.createElement("tr");
                        var tdMemberID = document.createElement("td"); tdMemberID.innerHTML = parsed.records[i].MemberID;
                        var tdDateVisited = document.createElement("td"); tdDateVisited.innerHTML = parsed.records[i].DateVisited;
                        var tdPurpose = document.createElement("td"); tdPurpose.innerHTML = parsed.records[i].Purpose;
                        var tdSupportAndDonation = document.createElement("td"); tdSupportAndDonation.innerHTML = parsed.records[i].SupportAndDonation;
                        var tdComment = document.createElement("td"); tdComment.innerHTML = parsed.records[i].Comment;
                        var tdVisitingOfficers = document.createElement("td"); tdVisitingOfficers.innerHTML = parsed.records[i].VisitingOfficers;
                        var tdCreatedBy = document.createElement("td"); tdCreatedBy.innerHTML = parsed.records[i].CreatedBy;

                        tr.appendChild(tdMemberID)
                        tr.appendChild(tdDateVisited)
                        tr.appendChild(tdPurpose)
                        tr.appendChild(tdSupportAndDonation)
                        tr.appendChild(tdComment)
                        tr.appendChild(tdVisitingOfficers)
                        tr.appendChild(tdCreatedBy)
                        table.appendChild(tr);
                    }
                    $rab.Followup.ShowDialog("visitationReport");
                    $("#visitationReport").empty();
                    document.getElementById("visitationReport").innerHTML = "<br/><h1>Visitation Actioned</h2><hr/>";
                    document.getElementById("visitationReport").appendChild(table);
                    //alert(parsed.message);
                    // document.getElementsByClassName("modalvisionclose")[0].click();
                    // $("#myModalVisitation input[type=text]").val("");
                    //$("#myModalVisitation select").each(function (val) {
                    //   this.selectedIndex = 0;
                    //});
                };

            });


        //document.getElementById('myModalVisitation').style.display = "block";
    } catch (e) {
        alert(e.message);
    }
}
$rab.Followup.Concerns = function () {
    try {
        if ($("#selectBranchNames").val() == "Select branch") throw new $rab.Exception("Please select branch");
        new $rab.Server.Method().BeginInvoke("Followup.aspx/GetFollowupConcerns", { branchName: $("#selectBranchNames").val() }, function (jsondata) {

            try {
                if (jsondata == "failed getting followup concerns") throw new $rab.Exception(jsondata);
                var parsed = JSON.parse(jsondata);
                $("#followupconcerns").empty();
                $rab.Followup.ShowDialog("followupconcerns");
                //show followup concerns and hide log report and adding visitation

                var table = document.createElement("table");
                table.className = "table table-striped table-responsive table-hover";
                //create table header
                var tr = document.createElement("tr"); tr.style.backgroundColor = "black"; tr.style.color = "white";
                var tdmember = document.createElement("td"); tdmember.innerHTML = "Member Name(s)";
                var tdfollowupcount = document.createElement("td"); tdfollowupcount.innerHTML = "Followuped count";
                var tdVisitationActioned = document.createElement("td"); tdVisitationActioned.innerHTML = "Followup visit count";
                
                tr.appendChild(tdmember)
                tr.appendChild(tdfollowupcount)
                tr.appendChild(tdVisitationActioned)
                table.appendChild(tr);
                for (var i = 0; i < parsed.concernMembers.length; i++) {
                    var tr = document.createElement("tr");
                    var tdMemberID = document.createElement("td"); tdMemberID.innerHTML = parsed.concernMembers[i].Members;
                    var tdfollowupcount = document.createElement("td"); tdfollowupcount.innerHTML = parsed.concernMembers[i].FollowupCount;
                    var tdVisitationActioned = document.createElement("td"); tdVisitationActioned.innerHTML = parsed.concernMembers[i].VisitationCount;


                    tr.appendChild(tdMemberID)
                    tr.appendChild(tdfollowupcount)
                    tr.appendChild(tdVisitationActioned)
                    table.appendChild(tr);
                }

                
                document.getElementById("followupconcerns").innerHTML="<br/><h1>Follow up top 20 Concerns</h2><hr/>";
                document.getElementById("followupconcerns").appendChild(table);
               // document.getElementById('myModalVisitation').style.display = "block";

                // presbyters who followup
                (function () {
                    var table2 = document.createElement("table");
                    table2.className = "table table-striped table-responsive table-hover";
                    //create table2 header
                    var tr2 = document.createElement("tr"); tr2.style.backgroundColor = "black"; tr2.style.color = "white";
                    var tdpresbyter = document.createElement("td"); tdpresbyter.innerHTML = "Presbyter Name";
                    var tdfollowupcount2 = document.createElement("td"); tdfollowupcount2.innerHTML = "Followuped count";
                    var tdVisitationActioned2 = document.createElement("td"); tdVisitationActioned2.innerHTML = "Followup visit count";

                    tr2.appendChild(tdpresbyter)
                    tr2.appendChild(tdfollowupcount2)
                    tr2.appendChild(tdVisitationActioned2)
                    table2.appendChild(tr2);
                    for (var i = 0; i < parsed.workingPresbyters.length; i++) {
                        var tr = document.createElement("tr");
                        var tdPresbyter = document.createElement("td"); tdPresbyter.innerHTML = parsed.workingPresbyters[i].Presbyter;
                        var tdfollowupcount = document.createElement("td"); tdfollowupcount.innerHTML = parsed.workingPresbyters[i].FollowupCount;
                        var tdVisitationActioned = document.createElement("td"); tdVisitationActioned.innerHTML = parsed.workingPresbyters[i].VisitationCount;


                        tr.appendChild(tdPresbyter)
                        tr.appendChild(tdfollowupcount)
                        tr.appendChild(tdVisitationActioned)
                        table2.appendChild(tr);
                    }

                    var h1 = document.createElement("h1");
                    h1.innerHTML = "<br/><h1>Presbyters who followed up</h2><hr/>";
                    document.getElementById("followupconcerns").appendChild(h1);
                    document.getElementById("followupconcerns").appendChild(table2);
                    
                })();
            } catch (e) {

            }
        });
    } catch (e) {
        alert(e.message);
    }
}
window.onload = function myfunction() {


    // Get the modalvision
    var modalvision = document.getElementById('myModalVisitation');

    // Get the button that opens the modalvision
    var btn = document.getElementById("myBtn");
    var buttonVisitationReport = document.getElementById("buttonVisitationReport");
    buttonVisitationReport.onclick = function () {
        try {
            //modalvision.style.display = "block";
            //SHOW LOG PART OF MODAL AND HIDE REPORT
            $rab.Followup.ShowDialog("visitationReport");
            //$("#followupconcerns").show();
            //$("#visitationReport").show();
            //$("#visitationLog").show();
            //load the contents of report for view and editing
            $rab.Followup.Report();
        } catch (e) {

        }
    }
    // Get the <span> element that closes the modalvision
    var span = document.getElementsByClassName("modalvisionclose")[0];

    // When the user clicks the button, open the modalvision 
    btn.onclick = function () {

        //load all members of the branch into select controls
        var branchName = $("#selectBranchNames").val();
        if (branchName == "Select branch") { alert("Select branch name"); $("#selectBranchNames").focus(); return; }


        $.ajax({
            type: "POST",
            url: 'MembershipList.aspx/GetMembers',
            data: JSON.stringify({ branchName: branchName }),
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                //IF NOT ERROR FILL SELECT CONTROL WITH DATA
                if (data.d == "failed getting membership list ") throw $rab.Exception("failed getting membership list ");
                var filter = JSON.parse(data.d);
                $("#selectMemberNames").empty();
                $rab.Utilities.FillOptions(["Select member name"], "selectMemberNames");
                for (var i = 0; i < filter.length; i++) {
                    var option = document.createElement("option");

                    option.value = filter[i].LastName + " " + filter[i].FirstName;
                    option.innerHTML = filter[i].LastName + " " + filter[i].FirstName;
                    option.MemberID = filter[i].MemberID;
                    document.getElementById("selectMemberNames").appendChild(option);
                    //array.push(filter[i]);

                }
                $("#buttonVisitationReport").click();
                $rab.Followup.ShowDialog("visitationLog");
            },
            error: function (response) {
                alert(response.responseText);
            }
        });
       // modalvision.style.display = "block";
        //SHOW LOG PART OF MODAL AND HIDE REPORT
        //$("#visitationLog").show();
       // $("#visitationReport").show();
         $rab.Followup.ShowDialog("visitationLog");
        
        
    }

    // When the user clicks on <span> (x), close the modalvision
    span.onclick = function () {
        modalvision.style.display = "none";
    }

    // When the user clicks anywhere outside of the modalvision, close it
    window.onclick = function (event) {
        if (event.target == modalvision) {
            modalvision.style.display = "none";
        }
    }
}
$rab.Followup.ShowDialog = function (name) {
    $("#followupconcerns").show();
    $("#visitationReport").show();
    $("#visitationLog").show();
    return;
    try {
        switch (name) {
            case "followupconcerns":
                $("#followupconcerns").show();
                $("#visitationReport").show();
                $("#visitationLog").show();
                break;
            case "visitationReport":
                $("#followupconcerns").hide();
                $("#visitationReport").show();
                $("#visitationLog").hide();
                break;
            case "visitationLog":
                $("#followupconcerns").hide();
                $("#visitationReport").hide();
                $("#visitationLog").show();
                break;
            default:
                break;
        }
        
    } catch (e) {

    }
}
$rab.Followup.GetSupportReasons = function () {
    var reason = [];
    var checkboxes = document.getElementsByClassName("form-check-input");
    if (checkboxes!=null && checkboxes.length != 0) {

        for (var i = 0; i < checkboxes.length; i++) {
            //check if checkbox is checked
            if (checkboxes[i].checked) {
                reason.push(checkboxes[i].dataset.support)
            }

        }

    }


    if (reason.length != 0) return reason.join(",");
    else { return "Other" }
}