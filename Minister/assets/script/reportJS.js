$rab.ReportPermissionset = ["Reports", "SuperUser"];
var default_table_headings = ["BranchName", "ReportingPeriod", "ReportYear","MenTotal",
                               "WomenTotal", "Children_0_to_12Total", "Teenage_13_to_19Total",
                               "YoungAdult_20_to_35Total", "GhanaianMembership", "Total",
                               "Elders", "Deacons", "Deaconessess","CreatedOn","CreatedBy"];
var report_headings = [
"ReportingPeriod"                               ,
"Total"                                         ,
"MenTotal"                                      ,
"WomenTotal"                                    ,
"Age35Total"                                    ,
"NoOfOtherNationals"                            ,
"Elders"                                        ,
"Deacons"                                       ,
"Deaconessess"                                  ,
"ChildrenDedicated"                             ,
"AdultsSoulsWon"                                ,
"TransferOutTotal"                              ,
"BackSliderWonBack"                             ,
"NumberOfHomeCells"                             ,
"RalliesHeld"                                   ,
"AdultDeath"                                    ,
"Birth"                                         ,
"MarriagesBlessed"                              ,
"CreatedOn"                                     ,
"ReportYear"                                    ,
"BranchName"                                    ,
"CreatedBy"                                     ,
"TransferInTotal"                               ,
"YoungAdult_20_to_35Total"                      ,
"GhanaianMembership"                            ,
"NoOfNationalsIndigenes"                        ,
"TransferOut_19_to_Above"                       ,
"WaterBaptisedTotal"                            ,
"TransferIn_0_to_19"                            ,
"TransferIn_19_to_Above"                        ,
"TransferOut_0_to_19"                           ,
"Children_0_to_12Total"                         ,
"Teenage_13_to_19Total"                         ,
"DeathAdultsAndChildren"                        ,
"HolySpiritBaptisedTotal"                       ,
"BackSlidersBeingFollowed"                      ,
"NewConvertsWaterBaptised"                      ,
"NewConvertsHolySpiritBaptised"                 ,
"OldMembersHolySpiritBaptised"                  ,
];

var selected_table_headings = [];

$rab.reports = function () {
    this.thead = document.getElementById('theadfullreport');
    this.tbody = document.getElementById('tbodyfullreport');
    this.submit = function () {
        var obj = {};
        $(":input").each(function () {
            obj[$(this).attr("id")] = $(this).val();
        });
        obj["CreatedBy"] = $rab.Login.User.MemberID;
        var select = document.getElementById('BranchName');
        obj.BranchName = select.options[select.selectedIndex].BranchID;
        //reject unselected branch 
        if (obj.BranchName == "Select") { alert('Select branch'); return; }
        if (obj.reportingPeriod == "Select") { alert('Select reporting period'); return; }
        if (obj.ReportYear == "Select Reporting year") { alert('Select reporting Year'); return; }
        //
        var client = new $rab.Server.Dispatcher();
        client.url = "Reports.aspx/Add";
        client.obj = { reportEntities: obj };
        
        client.handler = this.load;
        client.invoke();
    }
    this.load = function (data) {
        if (data!=null||data.length!=0) {
            //create table report
            if (data != null && data.length > 0) {
                var dynamic_table_rows = [];
                var properties = Object.keys(data[0]).sort();
                //create dynamic column values
                for (var i = 0; i < data.length; i++) {
                 var dynamic_table = {};
 
                    for (var j = 0; j < properties.length; j++) {
                         dynamic_table[[properties[j]]] = data[i][properties[j]];
                    }
                   dynamic_table_rows.push(dynamic_table)
                }
                //render defaults
                if (selected_table_headings.length>0) {
                    new $rab.reports().load_report_data(dynamic_table_rows, selected_table_headings);
                } else {
                    //no colums are selected, load default
                    new $rab.reports().load_report_data(dynamic_table_rows, default_table_headings);
                }
                $('#buttonfullReport').click();
            }
            //if data is not empty or

            //navigate away from the page
        }
    }
    this.loadfullreport = function () {
        //reject unselected branch
        var obj = {};
        $(":input").each(function () {
            obj[$(this).attr("id")] = $(this).val();
        });
        var select = document.getElementById('BranchName');
        obj.BranchName = select.options[select.selectedIndex].BranchID;

        if (typeof obj.BranchName==='undefined'|| obj.BranchName == "Select") { alert('Select branch'); return; }
        //if (obj.reportingPeriod == "Select") { alert('Select reporting period'); return; }
        var client = new $rab.Server.Dispatcher();
        client.url = "Reports.aspx/Get";
        client.obj = { branchname: obj.BranchName };

        client.handler = this.load;
        client.invoke();
    }
    this.load_report_data = function (column_data,column_headings) {
     $(this.thead).empty();
     $(this.tbody).empty(); 
        //column_data            : array of data to load
        //column_headings: column heading to create
        var thead = this.thead;
        var tbody = this.tbody;
        thead.insertRow(0);
        for (var i = 0; i < column_headings.length; i++) {
            thead.rows[0].insertCell().innerHTML = column_headings[i];
        }
        for (var i = 0; i < column_data.length; i++) {
            tbody.insertRow(i);

            for (var j = 0; j < column_headings.length; j++) {

                tbody.rows[i].insertCell().innerHTML = column_data[i][column_headings[j]];
            }
        }
       // $('#tableFullReport').DataTable();
        //
        //loop through column headings
        //loop through column data

    }
    this.selectColumns = function () {
       
        $('button[data-target="#mydefault"]').click();
    }
    this.render_selectable_columns = function () {
        $('#defaultTitle').html('Select report columns to display');
        //$('#displayColumns');
        $('#availableColumns').empty();
        var table = document.createElement('table');
        var columns = report_headings.sort();
        for (var i = 0; i < columns.length; i++) {
            table.insertRow(i);
            table.rows[i].insertCell(0).innerText = columns[i];
            table.rows[i].columnName = columns[i];
            table.rows[i].onclick = this.selected_column_to_display;
        }
        $('#availableColumns').append(table);
    }
    this.selected_column_to_display = function () {
        if (this.firstChild.style.backgroundColor == 'red')
        {
            this.selected = false;
            this.firstChild.style.backgroundColor = '';
            this.firstChild.style.color = 'black';
        } else if (this.firstChild.style.backgroundColor == '') {
            this.selected = true;
            this.firstChild.style.backgroundColor = 'red';
            this.firstChild.style.color = 'white';
        }
    }
    this.btnSelectItems = function () {
        try {
            //move selection to selected --columnsToDisplay
            var availableColumns = document.getElementById('availableColumns').firstChild;
            var columnsToDisplay = document.getElementById('tbodycolumnsToDisplay');

            var table = availableColumns.firstChild;
            //$('#availableColumns')
            if (availableColumns == null) return;
            var lefttable = availableColumns.firstChild;

            var moveitem = function () {

               for (var i = 0; i < lefttable.rows.length; i++) {
                   if (lefttable.rows[i].selected) {
                       columnsToDisplay.appendChild(lefttable.rows[i]);
                   }
               }
            }
            for (var i = 0; i < default_table_headings.length; i++) {
               moveitem();
            }

        } catch (e) {

        }
    }
    this.btnUnselectItems = function () {
        try {
            //move selection to selected --columnsToDisplay
            var availableColumns = document.getElementById('availableColumns').firstChild;
            var columnsToDisplay = document.getElementById('tbodycolumnsToDisplay');

            //var table = availableColumns.firstChild;
            //$('#availableColumns')
            if (columnsToDisplay == null) return;
            var lefttable = availableColumns.firstChild;

            var moveitem = function () {

                for (var i = 0; i < columnsToDisplay.rows.length; i++) {
                    if (columnsToDisplay.rows[i].selected) {
                        availableColumns.appendChild(columnsToDisplay.rows[i]);
                    }
                }
            }
            for (var i = 0; i < report_headings.length; i++) 
            {
                moveitem();
            }

        } catch (e) {

        }  
    }
    this.load_selectionColumns = function () {
        try {
            //get all rows in table with columns to display
            var tbody = document.getElementById('tbodycolumnsToDisplay');
            var selectedcolumns = [];
            if (tbody == null) return;
            for (var i = 0; i < tbody.rows.length; i++) {
                selectedcolumns.push(tbody.rows[i].columnName)
            }
            selected_table_headings = selectedcolumns;
            $('button[data-dismiss="modal"]').click();
            new $rab.reports().loadfullreport();
            
        } catch (e) {

        }
    }
    this.loadCovidActivities = function (dropdown) {
        try {
            //load all activities from the database to dropdown list

            var url, obj, handler;
            url = "Attendance.aspx/GetActivities";
            obj = {};
            handler = function (jsondata) {
                try {

                    console.log('received data from json')
                    console.log(jsondata);
                    // if successfull load all returned activities into dropdown list
                    if (jsondata == "Failed getting activities") throw new $rab.Exception(jsondata);
                    // $("#"+dropdown).empty();
                    var parsed = JSON.parse(jsondata);
                    new $rab.Utilities.FillOptions(parsed, dropdown);
                } catch (e) {
                    alert(e.message);
                }

            }
            new $rab.Server.Method().BeginInvoke(url, obj, handler);
        } catch (e) {

        }
    }
    this.GetReport = function (checkbox, branchname, activityname, attendanceDate) {
        var url, obj, handler;
        var branchName;
        var activity = document.getElementById(activityname).options[document.getElementById(activityname).selectedIndex];
        var attDate = document.getElementById(attendanceDate).value;
        if (document.getElementById(checkbox).checked) {
            branchName = "ALL";
            if (activity.innerHTML == "--Select your Activity--" || attDate == "") {
                alert("Date and Activity are mandatory");
                return false;
            }
            else {
                obj = { BranchName: branchName, ActivityName: activity.innerHTML, AttendDate: attDate };
            }
        }
        else {
            branchName = document.getElementById(branchname).options[document.getElementById(branchname).selectedIndex];// $('#' + branchname).val();
            if (activity.innerHTML == "--Select your Activity--" || attDate == "" || branchName.innerHTML == "") {
                alert("Branch, Date and Activity are mandatory");
                return false;
            }
            else {
                obj = { BranchName: branchName.innerHTML, ActivityName: activity.innerHTML, AttendDate: attDate };
            }
        }
        url = "Attendance.aspx/GetAttendanceData";
        handler = function (jsondata) {
            $("#attendTableBody").empty();
            try {
                if (jsondata == "failed getting Attendance") throw new $rab.Exception(jsondata);
                //$("#mainTable").empty();
                var parsed = JSON.parse(jsondata);
                for (var i = 0; i < parsed.results.length; i++) {
                    var tr = document.createElement("tr");
                    var tdFirstName = document.createElement("td"); tdFirstName.innerHTML = parsed.results[i].FirstName;
                    var tdLastName = document.createElement("td"); tdLastName.innerHTML = parsed.results[i].LastName;
                    var tdTemperature = document.createElement("td"); tdTemperature.innerHTML = parsed.results[i].Temperature;
                    var tdTelephone = document.createElement("td"); tdTelephone.innerHTML = parsed.results[i].Telephone;
                    var tdActivityName = document.createElement("td"); tdActivityName.innerHTML = parsed.results[i].ActivityName;
                    var tdAttendanceDate = document.createElement("td"); tdAttendanceDate.innerHTML = parsed.results[i].AttendDate;
                    var tdBranchName = document.createElement("td"); tdBranchName.innerHTML = parsed.results[i].BranchName;

                    tr.appendChild(tdFirstName);
                    tr.appendChild(tdLastName);
                    tr.appendChild(tdTemperature);
                    tr.appendChild(tdTelephone);
                    tr.appendChild(tdActivityName);
                    tr.appendChild(tdAttendanceDate);
                    tr.appendChild(tdBranchName);
                    document.getElementById("attendTableBody").appendChild(tr);
                }

                // document.getElementById("attendTableBody").appendChild(tr);
            } catch (e) {

            }
        }
        //getParamToServer(url, obj, handler);
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    }
}
$(function () {
    if (!new $rab.Security.LockDown()
        .user_is_allowed_to_stay_on_page($rab.ReportPermissionset)) {
        location.assign("ManagementList.aspx");
        return;
    }

    
    $rab.Security.Church.LoadBranches("BranchName");
    setTimeout(new $rab.AuditTrail().PageVisited("Reports"), 1000);
    new $rab.reports().render_selectable_columns();
    $("#textboxsearchstring").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("#tablePlanning tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

    
})
   
 

   