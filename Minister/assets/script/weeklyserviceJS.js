$rab.Branch = $rab.Branch || {};
$rab.WeeklyService = $rab.WeeklyService || {};
$rab.Branch.WeeklyService = $rab.Branch.WeeklyService || {};
$rab.WeeklyService.PermissionSet = ["SuperUser", "All", "Weekly service report"];

$rab.Branch.WeeklyService.LoadStatistics = function () {
    try {

    } catch (e) {

    }
}
$rab.Branch.WeeklyService.DisplayAddWindow = function () {
    try {

        document.getElementById("buttonAddEventDialog").click();
    } catch (e) {

    }
}
$rab.Branch.LoadWeeklyService = function (branchName) {
    try {
        // adds a record to follow up
        //load all activities from the database to dropdown list
        $("#tbodyWeeklyService").empty();
        var url, obj, handler;
        url = 'WeeklyServiceReport.aspx/LoadWeeklyServiceReport';
        obj = {
            branchName: new $rab.Branch().BranchInfo.BranchID
        };
        handler = function (jsondata) {
            try {
                // if successfull load all returned activities into dropdown list
                if (jsondata == "failed loading weekly service report") throw new $rab.Exception(jsondata);


                try {
                    //close the modal window
                    var truncateText = function (txt) {
                        var txt = txt.toString();
                        return txt.substring(0, 20) + "...";
                    }
                    var parsed = JSON.parse(jsondata);
                    var tbody = document.getElementById('tbodyWeeklyService');
                    $(tbody).empty();
                    // thServiceName
                    if (parsed == null || parsed.length == 0) { alert('No records found'); }
                    var serviceNames = parsed.map(function (values) { return values.ServiceName; }).unique();
                    var select = new $rab.Utilities.Common().selectOptions(serviceNames, 'Index');
                    select.style.padding = '5px'; select.options[0].innerHTML = 'Select Service';
                    select.onchange = new $rab.Branch.Filter().selectService;
                    select.selectedIndex = 0;
                    $('#thServiceName').empty();
                    $('#thServiceName').append(select);
                    //append select elemt in Service name header
                    for (var i = 0; i < parsed.length; i++) {
                        //var tr = document.createElement("tr");
                        //ServiceID
                        //var tdServiceID = document.createElement("td"); tdServiceID.innerHTML = parsed[i].ServiceID;
                        // add an edit button to edit the record
                        var button = document.createElement("button"); button.value = 'edit  '; button.innerHTML = 'edit  ';
                        var butndelete = document.createElement("button"); butndelete.value = 'delete'; butndelete.innerHTML = 'delete';
                        butndelete.style.backgroundColor = "red";
                        butndelete.style.color = "white"
                        button.Record = parsed[i];
                        butndelete.Record = parsed[i];
                        button.onclick = function () {
                            try {
                                document.getElementById("buttonSubmitUpdate").ServiceID = this.Record.ServiceID
                                //$("#RecordId")               .val(this.Record.ServiceID);                
                                $("#textboxDate").val(this.Record.ActivityDate);
                                $('#selectBranchNames').val(this.Record.SelectBranchName);
                                $('#textBoxMenCount').val(this.Record.MenCount);
                                $('#textBoxWomenCount').val(this.Record.WomenCount);
                                $('#textBoxChildrenCount').val(this.Record.ChildrenCount);
                                $('#textBoxSermonSpeaker').val(this.Record.SermonSpeaker);
                                $('#textBoxBibleStudyTopic').val(this.Record.BibleStudyTopic);
                                $('#textBoxKeyInformation').val(this.Record.KeyInformation);
                                $('#textBoxMidWeek').val(this.Record.MidWeek);
                                $('#textBoxMissionaryOffering').val(this.Record.MissionaryOffering);
                                $('#textBoxNewMembers').val(this.Record.NewMembers);
                                $('#textBoxOther').val(this.Record.Other);
                                $('#textBoxSermonSummary').val(this.Record.SermonSummary);
                                $('#textBoxSermonTitle').val(this.Record.SermonTitle);
                                $('#textBoxSpecify').val(this.Record.Specify);
                                $('#textBoxTithes').val(this.Record.Tithes);
                                $('#textBoxAbsentTwoWeeks').val(this.Record.AbsentTwoWeeks);
                                $('#textBoxServiceName').val(this.Record.ServiceName);
                                $('#textBoxSoulsWon').val(this.Record.SoulsWon);
                                $('#textBoxHolySpiritBaptised').val(this.Record.WaterBaptised);
                                $('#textBoxWaterBaptised').val(this.Record.HolySpiritBaptised);
                                $('#textBoxVisitation').val(this.Record.Visitation);
                                $('#labelCreatedBy').html(this.Record.CreatedBy);
                                $('#labelCreatedOn').html(this.Record.CreatedOn);

                                $rab.Branch.Modal(true);
                            } catch (e) {

                            }
                        };
                        butndelete.onclick = function () {
                            try {
                                if (confirm("Click to Ok to confirm delete, Cancel to stop")) {


                                    //delete record and remove entry
                                    var url = "WeeklyServiceReport.aspx/Delete"
                                    var obj = { id: this.Record.ServiceID };
                                    var tr = this.tr;//this selected row
                                    new $rab.Server.Method().BeginInvoke(url, obj, function (jsondata) {
                                        try {
                                            $(tr).remove();
                                        } catch (e) {

                                        }
                                    })
                                }
                            } catch (e) {

                            }
                        }
                        tbody.insertRow(i); butndelete.tr = tbody.rows[i];

                        tbody.rows[i].insertCell(0).appendChild(button);


                        tbody.rows[i].insertCell(1) .innerHTML = parsed[i].SelectBranchName;
                        tbody.rows[i].insertCell(2) .innerHTML = parsed[i].ActivityDate;
                        tbody.rows[i].insertCell(3) .innerHTML = parsed[i].ServiceName;
                        tbody.rows[i].insertCell(4) .innerHTML = parsed[i].SermonTitle;
                        tbody.rows[i].insertCell(5) .innerHTML = parsed[i].SermonSpeaker;
                        tbody.rows[i].insertCell(6) .innerHTML = truncateText(parsed[i].SermonSummary);
                        tbody.rows[i].insertCell(7) .innerHTML = parsed[i].SoulsWon;
                        tbody.rows[i].insertCell(8) .innerHTML = parsed[i].HolySpiritBaptised;
                        tbody.rows[i].insertCell(9) .innerHTML = parsed[i].WaterBaptised;
                        tbody.rows[i].insertCell(10).innerHTML = parsed[i].MissionaryOffering;
                        tbody.rows[i].insertCell(11).innerHTML = parsed[i].Other;
                        tbody.rows[i].insertCell(12).innerHTML = parsed[i].Tithes;
                        tbody.rows[i].insertCell(13).innerHTML = parsed[i].ChildrenCount;
                        tbody.rows[i].insertCell(14).innerHTML = parsed[i].WomenCount;
                        tbody.rows[i].insertCell(15).innerHTML = parsed[i].MenCount;
                        tbody.rows[i].insertCell(16).innerHTML = parsed[i].Visitation;
                        tbody.rows[i].insertCell(17);//.innerHTML = parsed[i].CreatedOn              ; 

                        tbody.rows[i].cells[17].appendChild(butndelete);

                        tbody.rows[i].cells[6].title = "Click on edit button to view full sermon summary";
                        tbody.rows[i].style.cursor = "hand";
                        tbody.rows[i].ondblclick = function () {
                            try {

                                this.cells[0].firstChild.click();//when row is click show sermon summary
                            } catch (e) {

                            }

                        }
                    }
                    //add entry into report view
                    //$rab.Followup.LoadFollowedUpStaticstics();
                    // initialise('tableEventListing');
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
        new $rab.Server.Method().BeginInvoke(url, { branchID: obj.branchName }, handler);
    } catch (e) {

    }
};
$rab.Branch.Filter = function () {
    this.selectService = function () {
        try {
            //go through primary table rows and show only rows with service name
            //selected
            var tbody = document.getElementById('tbodyWeeklyService');
            var rows = tbody.rows;
            //loop through rows to hide rows that dont match
            for (var i = 0; i < rows.length; i++) {
                if (this.options[this.selectedIndex].value=='Select item') {
                    $(rows[i]).show();
                } else {
                    if (rows[i].cells[3].innerHTML != this.options[this.selectedIndex].value) {
                        $(rows[i]).hide();
                    } else {
                        $(rows[i]).show();
                    }   
                }
               
               
            }
        } catch (e) {

        }
    }
}
$rab.Branch.WeeklyService = function () {
    this.lblDate = $("#textboxDate").val();
    this.BranchID = new $rab.Branch().BranchInfo.BranchID;
    this.textBoxMenCount = $('#textBoxMenCount').val();
    this.textBoxWomenCount = $('#textBoxWomenCount').val();
    this.textBoxChildrenCount = $('#textBoxChildrenCount').val();
    this.textBoxSermonSpeaker = $('#textBoxSermonSpeaker').val();
    this.textBoxBibleStudyTopic = $('#textBoxBibleStudyTopic').val();
    this.textBoxKeyInformation = $('#textBoxKeyInformation').val();
    this.textBoxMidWeek = $('#textBoxMidWeek').val();
    this.textBoxMissionaryOffering = $('#textBoxMissionaryOffering').val();
    this.textBoxNewMembers = $('#textBoxNewMembers').val();
    this.textBoxOther = $('#textBoxOther').val();
    this.textBoxSermonSummary = $('#textBoxSermonSummary').val();
    this.textBoxSermonTitle = $('#textBoxSermonTitle').val();
    this.textBoxSpecify = $('#textBoxSpecify').val();
    this.textBoxTithes = $('#textBoxTithes').val();

    this.textBoxAbsentTwoWeeks = $('#textBoxAbsentTwoWeeks').val();

    this.textBoxServiceName = $('#textBoxServiceName').val();
    this.textBoxSoulsWon = $('#textBoxSoulsWon').val();
    this.textBoxHolySpiritBaptised = $('#textBoxHolySpiritBaptised').val();
    this.textBoxWaterBaptised = $('#textBoxWaterBaptised').val();
    this.textBoxVisitation = $('#textBoxVisitation').val();
    this.RecordId = 0;
    this.ID = 0;
    this.CreatedBy = $rab.Login.User.MemberID;
    this.Add = function () {
        try {
            if (this.selectBranchName == "Select branch") throw new $rab.Exception("select your branch first");
            if (this.lblDate.trim().length == 0) throw new $rab.Exception("enter service date");
            //if (this.textBoxWomenCount.trim().length == 0) throw new $rab.Exception("enter woment count");
            //if (this.textBoxMenCount.trim().length == 0) throw new $rab.Exception("enter men count");
            //if (this.textBoxSermonTitle.trim().length == 0) throw new $rab.Exception("enter sermon title");
            //if (this.textBoxSermonSummary.trim().length == 0) throw new $rab.Exception("enter sermon summary");
            if (this.textBoxWomenCount.trim().length == 0) this.textBoxWomenCount = 0;
            if (this.textBoxMenCount.trim().length == 0) this.textBoxMenCount = 0;
            if (this.textBoxChildrenCount.trim().length == 0) this.textBoxChildrenCount = 0;

            if (this.textBoxMissionaryOffering.trim().length == 0) this.textBoxMissionaryOffering = 0;
            if (this.textBoxTithes.trim().length == 0) this.textBoxTithes = 0;
            if (this.textBoxOther.trim().length == 0) this.textBoxOther = 0;

            if (this.textBoxSoulsWon.trim().length == 0) this.textBoxSoulsWon = 0;
            if (this.textBoxHolySpiritBaptised.trim().length == 0) this.textBoxHolySpiritBaptised = 0;
            if (this.textBoxWaterBaptised.trim().length == 0) this.textBoxWaterBaptised = 0;
            if (this.textBoxVisitation.trim().length == 0) this.textBoxVisitation = 0;
            var post = { ws: this };
            $.ajax({
                type: 'POST',
                url: 'WeeklyServiceReport.aspx/PostWeeklyActivities',
                data: JSON.stringify(post),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    alert(response.d);
                    $("#buttonClose").click();
                    branchName = $("#selectBranchNames").val();

                    $rab.Branch.LoadWeeklyService(branchName)
                },
                error: function (e) {
                    alert(e.responseText);
                }

            });
        } catch (e) {
            alert(e.message);
        }

    }
    this.Update = function () {
        try {
            var url, obj, handler
            url = "WeeklyServiceReport.aspx/UpdatetWeeklyActivities";
            this.ID = document.getElementById("buttonSubmitUpdate").ServiceID;
            obj = { ws: this };
            handler = function (jsondata) {
                try {
                    if (jsondata == "failed to update weekly service report") throw $rab.Exception(jsondata);
                    if (jsondata == "updated data successfully") {
                        //update successful; close modal,update record
                        $("#buttonClose").click();
                        branchName = $("#selectBranchNames").val();
                        //alert(jsondata);
                        $rab.Branch.LoadWeeklyService(branchName);
                    }
                } catch (e) {

                }
            }
            new $rab.Server.Method().BeginInvoke(url, obj, handler)
        } catch (e) {

        }
    }
}
$(function () {
    try {
        try {
            new $rab.Security.LockDown().PagePermission($rab.WeeklyService.PermissionSet)
            setTimeout(new $rab.AuditTrail().PageVisited("Weekly service report"), 1000);
            $rab.WeeklyService.StatsWindow();

            $rab.Utilities.FillOptions(['All'], 'selectBranch')

            if ($rab.Login.User.LoginType == 'SuperUser') {

                $rab.Church.LoadBranches("selectBranchNames");
                $rab.Church.LoadBranches("selectBranch");
                //$rab.Security.Church.LoadBranches("selectBranch");
                //$rab.Church.LoadBranches("selectBranchNames-1");
            } else {
                $rab.Security.Church.LoadBranches("selectBranchNames");
                $rab.Security.Church.LoadBranches("selectBranch");
               
            }
            // load plots
            //$rab.Finance.LoadStatisticsWindow();

        } catch (e) {
            alert(e.message);
        }
    } catch (e) {

    }
});
$rab.Branch.Modal = function (bool) {
    //check if branch is selected
    if ($('#selectBranchNames').val() == "Select branch") { alert('Oops select branch'); return; }
    if (bool) {
        //show update button and hide add new member button
        document.getElementById("buttonSubmitUpdate").style.display = "block";
        document.getElementById("buttonSubmitAdd").style.display = 'none';
        $("#buttonmodalpopup").click();
        return false
    } else {
        //hide update button and show new member button
        document.getElementById("buttonSubmitUpdate").style.display = "none";
        document.getElementById("buttonSubmitAdd").style.display = 'block';
        //empty all inputs
        // $(".modal-section-1 input[type=text], .modal-section-1 select, .modal-section-1 textarea").val("");
        var selectAll = document.getElementsByTagName("select");
        //for (var i = 0; i < selectAll.length; i++) {
        //    selectAll[i].selectedIndex = 0;
        //}
        document.getElementById("buttonmodalpopup").click();
        return false;
    }

}
$rab.WeeklyService.Statistics = function () {
    try {
        $("#tablecontainer").empty();
        var url = "WeeklyServiceReport.aspx/Statistics";
        var obj = new $rab.Branch().BranchInfo;
        if (obj.BranchName == 'Select branch') throw new $rab.Exception("Please select branch")
        new $rab.Server.Method().BeginInvoke(url, { branchName: obj }, function (jsondata) {

            try {
                if (obj.BranchName == 'failed getting statistics') throw new $rab.Exception(jsondata);
                var parsed = JSON.parse(jsondata);
                var createtableHeader = function () {
                    var table = document.createElement("table");
                    table.className = "table table-stripped table-responsive";

                    var thead = document.createElement("thead");
                    var tbody = document.createElement("tbody");
                    tbody.id = "tablebodyexport";
                    table.id = 'tableexport'
                    var tr = document.createElement("tr");
                    var tdBranch = document.createElement("td"); tdBranch.innerHTML = "BranchName";
                    var tdYear = document.createElement("td"); tdYear.innerHTML = "Year";
                    var tdTithes = document.createElement("td"); tdTithes.innerHTML = "Tithes(£)";
                    var tdOther = document.createElement("td"); tdOther.innerHTML = "Other(£)";
                    var tdMissionaryOffering = document.createElement("td"); tdMissionaryOffering.innerHTML = "Missionary Offering(£)";

                    tr.appendChild(tdBranch);
                    tr.appendChild(tdYear);
                    tr.appendChild(tdTithes);
                    tr.appendChild(tdOther);
                    tr.appendChild(tdMissionaryOffering);

                    thead.appendChild(tr);
                    table.appendChild(thead);
                    table.appendChild(tbody);

                    //document.getElementById("customCharts").appendChild(table);

                    return table
                };
                var table = createtableHeader();
                for (var i = 0; i < parsed.result.length; i++) {
                    try {
                        var tr = document.createElement("tr");
                        var tdBranch = document.createElement("td"); tdBranch.innerHTML = parsed.result[i].Branch;
                        var tdYear = document.createElement("td"); tdYear.innerHTML = parsed.result[i].Year;
                        var tdTithes = document.createElement("td"); tdTithes.innerHTML = parsed.result[i].Tithes;
                        var tdOther = document.createElement("td"); tdOther.innerHTML = parsed.result[i].Other;
                        var tdMissionaryOffering = document.createElement("td"); tdMissionaryOffering.innerHTML = parsed.result[i].MissionaryOffering;

                        tr.appendChild(tdBranch);
                        tr.appendChild(tdYear);
                        tr.appendChild(tdTithes);
                        tr.appendChild(tdOther);
                        tr.appendChild(tdMissionaryOffering);

                        table.appendChild(tr);
                    } catch (e) {

                    }
                }
                document.getElementById("tablecontainer").appendChild(table);
                document.getElementById('mymodalWeeklyService').style.display = "block";

            } catch (e) {
                alert(e.message);
            }
        });
    } catch (e) {
        alert(e.message);
    }
}
$rab.WeeklyService.StatsWindow = function () {

    // Get the modalWeeklyService
    var modalWeeklyService = document.getElementById('mymodalWeeklyService');

    // Get the button that opens the modalWeeklyService
    // var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modalWeeklyService
    var span = document.getElementsByClassName("modalWeeklyServiceclose")[0];

    // When the user clicks the button, open the modalWeeklyService
    //btn.onclick = function () {
    //    modalWeeklyService.style.display = "block";
    //}

    // When the user clicks on <span> (x), close the modalWeeklyService
    span.onclick = function () {
        modalWeeklyService.style.display = "none";
    }

    // When the user clicks anywhere outside of the modalWeeklyService, close it
    window.onclick = function (event) {
        if (event.target == modalWeeklyService) {
            modalWeeklyService.style.display = "none";
        }
    }

}
$rab.AddSearch = function () {
    this.obj = {
        month: $('#selectMonth').val(),
        year: $('#selectYear').val(),
        selectedBranch: $('#selectBranch').val(),
        assignedBranches: $rab.Login.User.AssignedBranchGroups
    }
    this.search = function () {
        if (this.obj.month == "0") { alert('Invalid month'); return; }
        if (this.obj.year == "0") { alert('Invalid year'); return; }
        if (this.obj.selectedBranch == "Select branch") { alert('Select branch'); return; }
        var dispatcher = new $rab.Server.Dispatcher();
        dispatcher.obj = { obj: this.obj }
        dispatcher.url = "WeeklyServiceReport.aspx/SearchCriteria";
        dispatcher.handler = this.load

        dispatcher.invoke();
    }
    this.load = function (data) {
        try {
            if (JSON.parse(data).message == "success") {
                var parsed = JSON.parse(data).result;
                var list = JSON.parse(data).statistics;
                var tbody = document.getElementById('tbodyAdvancedReport');
                var tbodystats = document.getElementById('tbodyReportStats');
                $(tbody).empty(); $(tbodystats).empty();
                var truncateText = function (txt) {
                    var txt = txt.toString();
                    return txt.substring(0, 20) + "...";
                }
                for (var i = 0; i < parsed.length; i++) {
                    tbody.insertRow(i);
                    tbody.rows[i].insertCell(0);
                    tbody.rows[i].insertCell(1).innerHTML = parsed[i].BranchName;
                    tbody.rows[i].insertCell(2).innerHTML = parsed[i].ActivityDate;
                    tbody.rows[i].insertCell(3).innerHTML = parsed[i].ServiceName;
                    tbody.rows[i].insertCell(4).innerHTML = parsed[i].SermonTitle;
                    tbody.rows[i].insertCell(5).innerHTML = parsed[i].SermonSpeaker;
                    tbody.rows[i].insertCell(6).innerHTML = truncateText(parsed[i].SermonSummary);
                    tbody.rows[i].insertCell(7).innerHTML = parsed[i].SoulsWon;
                    tbody.rows[i].insertCell(8).innerHTML = parsed[i].HolySpiritBaptised;
                    tbody.rows[i].insertCell(9).innerHTML = parsed[i].WaterBaptised;
                    tbody.rows[i].insertCell(10).innerHTML = parsed[i].MissionaryOffering;
                    tbody.rows[i].insertCell(11).innerHTML = parsed[i].Other;
                    tbody.rows[i].insertCell(12).innerHTML = parsed[i].Tithes;
                    tbody.rows[i].insertCell(13).innerHTML = parsed[i].ChildrenCount;
                    tbody.rows[i].insertCell(14).innerHTML = parsed[i].WomenCount;
                    tbody.rows[i].insertCell(15).innerHTML = parsed[i].MenCount;
                    tbody.rows[i].insertCell(16).innerHTML = parsed[i].Visitation;
                    tbody.rows[i].insertCell(17).innerHTML = parsed[i].CreatedOn;

                }
                //-tbodyReportStats statistics
                for (var i = 0; i < list.length; i++) {
                    tbodystats.insertRow(i);
                    tbodystats.rows[i].insertCell(0);
                    tbodystats.rows[i].insertCell(1).innerHTML = list[i].BranchName
                    tbodystats.rows[i].insertCell(2).innerHTML = list[i].Month;
                    tbodystats.rows[i].insertCell(3).innerHTML = list[i].Year;
                    tbodystats.rows[i].insertCell(4).innerHTML = list[i].MissionaryOffering;
                    tbodystats.rows[i].insertCell(5).innerHTML = list[i].Other;
                    tbodystats.rows[i].insertCell(6).innerHTML = list[i].Tithes;
                    tbodystats.rows[i].insertCell(7).innerHTML = list[i].SoulsWon;
                    tbodystats.rows[i].insertCell(8).innerHTML = list[i].WaterBaptised;
                    tbodystats.rows[i].insertCell(9).innerHTML = list[i].ChildrenCount;
                    tbodystats.rows[i].insertCell(10).innerHTML = list[i].WomenCount;
                    tbodystats.rows[i].insertCell(11).innerHTML = list[i].MenCount;
                    tbodystats.rows[i].insertCell(12).innerHTML = list[i].Visitation;
                    //tbody.rows[i].insertCell(13).innerHTML = list[i].         ;
                    //tbody.rows[i].insertCell(14).innerHTML = list[i].         ;
                    //tbody.rows[i].insertCell(15).innerHTML = list[i].           ;
                    //tbody.rows[i].insertCell(16).innerHTML = list[i].         ;
                    //tbody.rows[i].insertCell(17).innerHTML = list[i].                   ;

                }
            }
            else {
                alert(JSON.parse(data).message );
            }
        } catch (e) {

        }
    }
}