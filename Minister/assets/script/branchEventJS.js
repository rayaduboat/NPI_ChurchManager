$rab.Branch = $rab.Branch || {};
$rab.Events = $rab.Events || {};
$rab.Events.Permissionset=["All","SuperUser","Events"]
$rab.Branch.Events = $rab.Branch.Events || {};
$(function () {

    try {
        // $rab.Branch.Events.LoadEvents();
        //$rab.Church.LoadBranches("selectBranchNames");
        new $rab.Security.LockDown().PagePermission($rab.Events.Permissionset);
        setTimeout(new $rab.AuditTrail().PageVisited("Events"), 1000);
        var user = JSON.parse(localStorage.getItem("user"));
        $("#selectBranchNames").empty();
        //var option = document.createElement("option");
        //option.value = user.BranchName; option.innerHTML = user.BranchName;
        //document.getElementById("selectBranchNames").appendChild(option);
        $rab.Utilities.FillOptions(["All"], "selectBranchNames");
        $rab.Security.Church.LoadBranches("selectBranchNames");
        //$rab.Branch.Events.LoadEvents(user.BranchName);
    } catch (e) {
        //alert(e.message);
    }
});
$rab.Branch.Events.LoadEvents = function (branchname) {

    try {
        //loads events

        var url, obj, handler;
        url = "Events.aspx/GetEvents";
        obj = { branchName: branchname };

        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list

                if (jsondata == "failed getting events") throw new $rab.Exception(jsondata);

               
                var tbody = document.getElementById("tbodyEvents");
                $(tbody).empty();
                var parsedEvents = JSON.parse(jsondata);
                for (var i = 0; i < parsedEvents.length; i++) {
                    // EVENT RECORDS 
                    var btn = document.createElement("button"); 
                    btn.title = "edit event information";
                    btn.innerHTML = "Edit";
                    //btn.className = "fa fa-info fa-lg";
                    btn.Record = parsedEvents[i];
                    btn.onclick = function () {
                        try {
                            //display modal window and provide the ability to edit record
                            new $rab.Branch.Events.Dictionary().GetDictionary();

                            document.getElementById("errorLabel").innerHTML ="";
                            $("#textboxPurposes").val(this.Record.purpose);
                            
                            $("#textboxName").val(this.Record.name);
                            $("#textboxLocation").val(this.Record.location);
                            $("#textboxDate").val(this.Record.eventDate);
                            $("#textboxPresidingofficer").val(this.Record.presidingOfficer);
                            $("#textboxGuestspeaker").val(this.Record.guestSpeakers);
                            $("#textboxMencount").val(this.Record.menCount);
                            $("#textboxWomencount").val(this.Record.womenCount);
                            $("#textboxChildrencount").val(this.Record.childrenCount);
                            $("#textareaComment").val(this.Record.comment);
                            $("#textboxtitheAndOffering").val(this.Record.titheAndOffering);
                            $("#textboxHolySpiritBaptised").val(this.Record.HolySpiritBaptised);
                            $("#textboxsoulswon").val(this.Record.soulswon)
                            $("#buttonSubmitEvent").hide();
                            $("#buttonUpdateEvent").show();
                            document.getElementById("buttonUpdateEvent").Record = this.Record;
                            document.getElementById("buttonAddEventDialog").click();
                        } catch (e) {

                        }

                    };
                    tbody.insertRow(i);
                    tbody.rows[i].insertCell(0) 
                    tbody.rows[i].insertCell(1).innerHTML  = parsedEvents[i].BranchName ;
                    tbody.rows[i].insertCell(2).innerHTML  = parsedEvents[i].name;
                    tbody.rows[i].insertCell(3).innerHTML  = parsedEvents[i].purpose ;
                    tbody.rows[i].insertCell(4).innerHTML  = parsedEvents[i].eventDate;
                    tbody.rows[i].insertCell(5).innerHTML  = parsedEvents[i].location ;
                    tbody.rows[i].insertCell(6).innerHTML  = parsedEvents[i].guestSpeakers ;
                    tbody.rows[i].insertCell(7).innerHTML  = parsedEvents[i].presidingOfficer ;
                    tbody.rows[i].insertCell(8).innerHTML  = parsedEvents[i].menCount ;
                    tbody.rows[i].insertCell(9).innerHTML  = parsedEvents[i].womenCount ;
                    tbody.rows[i].insertCell(10).innerHTML = parsedEvents[i].childrenCount ;
                    tbody.rows[i].insertCell(11).innerHTML = parsedEvents[i].comment ;
                    tbody.rows[i].insertCell(12).innerHTML = parsedEvents[i].titheAndOffering;
                    tbody.rows[i].insertCell(13).innerHTML = parsedEvents[i].HolySpiritBaptised ;
                    tbody.rows[i].insertCell(14).innerHTML = parsedEvents[i].soulswon ;
                    tbody.rows[i].insertCell(15).innerHTML = parsedEvents[i].CreatedOn ;
                    tbody.rows[i].insertCell(16).innerHTML = parsedEvents[i].CreatedBy ;









                    tbody.rows[i].cells[0].appendChild(btn);
                }
            } catch (e) {
                alert(e.message);
            }

        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
}
$rab.Branch.Events.DisplayAddEventsWindow = function () {
    try {
       
        if ($("#selectBranchNames").val() == "All") throw new $rab.Exception("Invalid branch name selected");
       
        $("#modal-section-1 input[type=text],#modal-section-1 textarea").val("");
        $("#modal-section-1 select").each(function (val) {
            try {
                this.selectedIndex = 0;
            } catch (e) {

            }
        });
        $("#buttonUpdateEvent").hide();
        $("#buttonSubmitEvent").show();
        new $rab.Branch.Events.Dictionary().GetDictionary();
        document.getElementById("buttonAddEventDialog").click();//display modal dialog window
    } catch (e) {
        alert(e.message);
    }
}
$rab.Branch.Events.Statistics = function () {
    try {

    } catch (e) {

    }
}
$rab.Branch.Events.Add = function () {
    try {
       
        var fullName = $rab.Login.User.LastName + " " + $rab.Login.User.FirstName;
        var url, obj, handler;
        url = "Events.aspx/AddEvent";
        obj = {
            branchName: $("#selectBranchNames").val(),
            purpose: document.getElementById("textboxPurposes").value,
            name: $("#textboxName").val(),
            location: $("#textboxLocation").val(),
            eventDate: $("#textboxDate").val(),
            presidingOfficer: $("#textboxPresidingofficer").val(),
            guestSpeakers: $("#textboxGuestspeaker").val(),
            menCount: $("#textboxMencount").val(),
            womenCount: $("#textboxWomencount").val(),
            childrenCount: $("#textboxChildrencount").val(),
            comment: $("#textareaComment").val(),
            titheAndOffering: $("#textboxtitheAndOffering").val(),
            HolySpiritBaptised: $("#textboxHolySpiritBaptised").val(),
            soulswon: $("#textboxsoulswon").val(),
            createdby: fullName
        };
       
        if (obj.branchName.trim().length == 0 || obj.branchName == "Select branch"||obj.branchName =="All") {
            document.getElementById("errorLabel").innerHTML = "invalid entry for branch name"; return false;
        }
        //if (obj.purpose.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for purpose           "); return false }
        if (obj.name.trim().length == 0 || obj.name == "Select event") { alert('Invalid event');; return false }
        //if (obj.location.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for location          "); return false }
        //if (obj.eventDate.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for eventDate         "); return false }
        //if (obj.presidingOfficer.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for presiding Officer  "); return false }
        //if (obj.comment.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for comment           "); return false }
        if (obj.menCount          .trim().length == 0) obj.menCount            =0;
        if (obj.womenCount        .trim().length == 0) obj.womenCount          =0;
        if (obj.childrenCount     .trim().length == 0) obj.childrenCount       =0;
        if (obj.titheAndOffering  .trim().length == 0) obj.titheAndOffering    =0;
        if (obj.HolySpiritBaptised.trim().length == 0) obj.HolySpiritBaptised  =0;
        if (obj.soulswon          .trim().length == 0) obj.soulswon            =0;
        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list

                if (jsondata == "failed adding event") throw new $rab.Exception(jsondata);
                if (jsondata == "Update successful") {
                    $("#modal-section-1 input[type=text],#modal-section-1 textarea,#modal-section-1 select").val("");
                    document.getElementById("buttonClose").click();
                    $rab.Branch.Events.LoadEvents(obj.branchName);
                    
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
$rab.Branch.Events.LoadStatistics = function (branchName) {
    // branchName: name of the branch whose statistics is sought
    //load branch event statistics
    try {
        //var fullName = $rab.Login.User.LastName + " " + $rab.Login.User.FirstName;
        var url, obj, handler;
        url = "Events.aspx/LoadEventStatistics";
        obj = {
            branchName: $("#selectBranchNames").val(),

        };
        if (obj.branchName.trim().length == 0 || obj.branchName == "Select branch") {
            document.getElementById("errorLabel").innerHTML = "invalid entry for branch name"; return false;
        }
        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list

                if (jsondata == "failed event statistics") throw new $rab.Exception(jsondata);
                var parsed = JSON.parse(jsondata);
                if (parsed[0].message == "Loaded successful") {
                    //display statictis     


                }
            } catch (e) {
                alert(e.message);
            }

        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
}
$rab.Branch.Events.Update = function (btn) {
    try {

        var fullName = $rab.Login.User.LastName + " " + $rab.Login.User.FirstName;
        var url, obj, handler;
        url = "Events.aspx/UpdateEvent";
        obj = {
            eventID:btn.Record.EventID,
            branchName: $("#selectBranchNames").val(),
            purpose: $("#textboxPurposes").val(),
            name: $("#textboxName").val(),
            location: $("#textboxLocation").val(),
            eventDate: $("#textboxDate").val(),
            presidingOfficer: $("#textboxPresidingofficer").val(),
            guestSpeakers: $("#textboxGuestspeaker").val(),
            menCount: $("#textboxMencount").val(),
            womenCount: $("#textboxWomencount").val(),
            childrenCount: $("#textboxChildrencount").val(),
            comment: $("#textareaComment").val(),
            titheAndOffering: $("#textboxtitheAndOffering").val(),
            HolySpiritBaptised: $("#textboxHolySpiritBaptised").val(),
            soulswon: $("#textboxsoulswon").val(),
            createdby: fullName
        };
        if (obj.branchName.trim().length == 0 || obj.branchName == "Select branch") {
            document.getElementById("errorLabel").innerHTML = "invalid entry for branch name"; return false;
        }
        if (obj.purpose.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for purpose           "); return false }
        if (obj.name.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for name              "); return false }
        if (obj.location.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for location          "); return false }
        if (obj.eventDate.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for eventDate         "); return false }
        if (obj.presidingOfficer.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for presiding Officer  "); return false }
        if (obj.menCount.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for men Count          "); return false }
        if (obj.womenCount.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for women  Count        "); return false }
        if (obj.childrenCount.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for childrenCount     "); return false }
        if (obj.comment.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for comment           "); return false }
        if (obj.titheAndOffering.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for tithe And Offering  "); return false }
        if (obj.HolySpiritBaptised.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for Holy Spirit Baptised"); return false }
        if (obj.soulswon.trim().length == 0) { document.getElementById("errorLabel").innerHTML = ("invalid entry for souls won          "); return false }
        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list

                if (jsondata == "failed adding event") throw new $rab.Exception(jsondata);
                if (jsondata == "Update successful") {
                    $("input[type=text],textarea").val("");
                    document.getElementById("buttonClose").click();
                    $rab.Branch.Events.LoadEvents(obj.branchName);
                }
            } catch (e) {
                alert(e.message);
            }

        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
}
$rab.Branch.Events.Dictionary = function () {
    this.GetDictionary = function () {

        try {
            var url = "Events.aspx/GetEventDictionary";
            new $rab.Server.Method().BeginInvoke(url, {}, function (jsondata) {
                try {
                    $("#textboxName").empty();
                    if (jsondata != "failed to get dictionary") {
                        var parsed = JSON.parse(jsondata);
                        $rab.Utilities.FillOptions(["Select event"], "textboxName");
                        $rab.Utilities.FillOptions(parsed, "textboxName");
                         
                    };
                } catch (e) {
                    alert(e.message);
                }
            });
        } catch (e) {

        }
    }
    this.AddDictionary = function (arraystring) {

        try {
            var url = "Events.aspx/AddToDictionary";
            new $rab.Server.Method().BeginInvoke(url, { arraystring: arraystring}, function (jsondata) {
                try {
                    alert(jsondata);
                    if (jsondata == "success") {
                        var array = arraystring.split(",");
                        $rab.Utilities.FillOptions(array, "textboxName")
                        $("#textboxeventfilterlist").val("");
                        $("#buttonAddEventFilter").click();
                    }
                   
                } catch (e) {
                    alert(e.message);
                }
            });
        } catch (e) {

        }
    }
}