$rab.StandardReport = $rab.StandardReport || {};
$rab.StandardReport.Permissionset = ["All", "SuperUser", "Standard Reports"]
$rab.StandardReport.Data = new Array();
$rab.StandardReport.Initialise = function () {
    try {

        // Close the dropdown if the user clicks outside of it
        new $rab.Security.LockDown().PagePermission($rab.StandardReport.Permissionset);
        setTimeout(new $rab.AuditTrail().PageVisited("Standard Reports"), 1000);
        $rab.Utilities.FillOptions(["All"], "selectBranchNames");
        $rab.Security.Church.LoadBranches("selectBranchNames");


        $("#selectBranchNames").on("change", function (event) {
            //assign selected branchname to server branchname
            try {
                $("#serverBranchName").val(this.options[this.selectedIndex].BranchID);
                event.preventDefault();
            } catch (e) {

            }

        });

    } catch (e) {

    }
}
$rab.StandardReport.WireUp = function () {
    document.getElementById("myDropdown").classList.toggle("show");
}
$(function () {
    $rab.StandardReport.Initialise();
});
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */

$rab.Exception = function (e) { this.message = e; }
$rab.StandardReport.GetMembershipBaptism = function () {


    try {
        var id = $("#selectBranchNames").val();
        if (id == "Select branch") {
            alert("Please select branch"); return;
        };
       
        $("#curve_chart").empty();
        $("#customCharts").empty();
        $rab.StandardReport.Data = [];


        if (id != "All") {


            var branchid = document.getElementById("selectBranchNames").options[document.getElementById("selectBranchNames").selectedIndex].BranchID
            new $rab.Server.Method().BeginInvoke("Standard.aspx/MembershipBaptism", { branchid: branchid.toString() }, function (jsondata) {
                try {
                    if (jsondata == "failed getting membership bastism") throw new $rab.Exception(jsondata);
                    var parsed = JSON.parse(jsondata);
                    $rab.StandardReport.Data = parsed;
                    var createtableHeader = function () {
                        var table = document.createElement("table");
                        table.className = "table table-stripped table-responsive";

                        var thead = document.createElement("thead");
                        var tbody = document.createElement("tbody");
                        tbody.id = "tablebodyexport";
                        table.id = 'tableexport'
                        var tr = document.createElement("tr");
                        var tdBranchName = document.createElement("td"); tdBranchName.innerHTML = "BranchName";
                        var tdTotal = document.createElement("td"); tdTotal.innerHTML = "Total";
                        var tdMen = document.createElement("td"); tdMen.innerHTML = "Men";
                        var tdWomen = document.createElement("td"); tdWomen.innerHTML = "Women";
                        var tdWaterBaptised = document.createElement("td"); tdWaterBaptised.innerHTML = "WaterBaptised";
                        var tdHolySpiritBaptised = document.createElement("td"); tdHolySpiritBaptised.innerHTML = "HolySpiritBaptised";
                        var tdAge35 = document.createElement("td"); tdAge35.innerHTML = "Age35Total";
                        var tdChildren_0_to_12 = document.createElement("td"); tdChildren_0_to_12.innerHTML = "Children(0-12)";
                        var tdTeenage_13_to_19 = document.createElement("td"); tdTeenage_13_to_19.innerHTML = "Teenage(13-19)";
                        var tdYoungAdult_20_to_35 = document.createElement("td"); tdYoungAdult_20_to_35.innerHTML = "YoungAdult(20-35)";

                        tr.appendChild(tdBranchName);
                        tr.appendChild(tdAge35);
                        tr.appendChild(tdChildren_0_to_12);
                        tr.appendChild(tdTeenage_13_to_19);
                        tr.appendChild(tdYoungAdult_20_to_35);
                        tr.appendChild(tdMen);
                        tr.appendChild(tdWomen);
                        tr.appendChild(tdWaterBaptised);
                        tr.appendChild(tdHolySpiritBaptised);
                        tr.appendChild(tdTotal);
                        thead.appendChild(tr);

                        table.appendChild(thead);
                        table.appendChild(tbody);

                        document.getElementById("customCharts").appendChild(table);

                        return table
                    };


                    var table = createtableHeader();


                    var tr = document.createElement("tr");
                    var tdBranchName = document.createElement("td"); tdBranchName.innerHTML = parsed[0].BranchName;
                    var tdTotal = document.createElement("td"); tdTotal.innerHTML = parsed[0].Total;
                    var tdMen = document.createElement("td"); tdMen.innerHTML = parsed[0].MenTotal;
                    var tdWomen = document.createElement("td"); tdWomen.innerHTML = parsed[0].WomenTotal;
                    var tdWaterBaptised = document.createElement("td"); tdWaterBaptised.innerHTML = parsed[0].WaterBaptisedTotal;
                    var tdHolySpiritBaptised = document.createElement("td"); tdHolySpiritBaptised.innerHTML = parsed[0].HolySpiritBaptisedTotal;
                    var tdAge35 = document.createElement("td"); tdAge35.innerHTML = parsed[0].Age35Total;
                    var tdChildren_0_to_12 = document.createElement("td"); tdChildren_0_to_12.innerHTML = parsed[0].Children_0_to_12Total;
                    var tdTeenage_13_to_19 = document.createElement("td"); tdTeenage_13_to_19.innerHTML = parsed[0].Teenage_13_to_19Total;
                    var tdYoungAdult_20_to_35 = document.createElement("td"); tdYoungAdult_20_to_35.innerHTML = parsed[0].YoungAdult_20_to_35Total;

                    tr.appendChild(tdBranchName);
                    tr.appendChild(tdAge35);
                    tr.appendChild(tdChildren_0_to_12);
                    tr.appendChild(tdTeenage_13_to_19);
                    tr.appendChild(tdYoungAdult_20_to_35);
                    tr.appendChild(tdMen);
                    tr.appendChild(tdWomen);
                    tr.appendChild(tdWaterBaptised);
                    tr.appendChild(tdHolySpiritBaptised);
                    tr.appendChild(tdTotal);
                    //table.tbody.appendChild(tr);
                    //table.appendChild(tr);
                    document.getElementById("tablebodyexport").appendChild(tr);//append to table body
                    document.getElementById("customCharts").appendChild(table);//append table to container
                    initialise('tableexport');
                    getLibrary();
                } catch (e) {

                }


            })
        } else if (id == "All") {
            var createtableHeader = function () {
                var table = document.createElement("table");
                table.className = "table table-stripped table-responsive";

                var thead = document.createElement("thead");
                var tbody = document.createElement("tbody");
                tbody.id = "tablebodyexport";
                table.id = 'tableexport'
                var tr = document.createElement("tr");
                var tdBranchName = document.createElement("td"); tdBranchName.innerHTML = "BranchName";
                var tdTotal = document.createElement("td"); tdTotal.innerHTML = "Total";
                var tdMenTotal = document.createElement("td"); tdMenTotal.innerHTML = "MenTotal";
                var tdWomenTotal = document.createElement("td"); tdWomenTotal.innerHTML = "WomenTotal";
                var tdWaterBaptisedTotal = document.createElement("td"); tdWaterBaptisedTotal.innerHTML = "WaterBaptisedTotal";
                var tdHolySpiritBaptisedTotal = document.createElement("td"); tdHolySpiritBaptisedTotal.innerHTML = "HolySpiritBaptisedTotal";
                var tdAge35Total = document.createElement("td"); tdAge35Total.innerHTML = "Age35Total";
                var tdChildren_0_to_12Total = document.createElement("td"); tdChildren_0_to_12Total.innerHTML = "Children_0_to_12Total";
                var tdTeenage_13_to_19Total = document.createElement("td"); tdTeenage_13_to_19Total.innerHTML = "Teenage_13_to_19Total";
                var tdYoungAdult_20_to_35Total = document.createElement("td"); tdYoungAdult_20_to_35Total.innerHTML = "YoungAdult_20_to_35Total";

                var tdGhanaianMembership            = document.createElement("td");tdGhanaianMembership              .innerHTML="GhanaianMembership";//tdGhanaianMembership.className="rotate";
                var tdNoOfNationalsIndigenes        = document.createElement("td");tdNoOfNationalsIndigenes          .innerHTML="NoOfNationalsIndigenes"
                var tdNoOfOtherNationals            = document.createElement("td");tdNoOfOtherNationals              .innerHTML="NoOfOtherNationals"
                var tdElders                        = document.createElement("td");tdElders                          .innerHTML="Elders"
                var tdDeacons                       = document.createElement("td");tdDeacons                         .innerHTML="Deacons"
                var tdDeaconessess                  = document.createElement("td");tdDeaconessess                    .innerHTML="Deaconessess"
                var tdChildrenDedicated             = document.createElement("td");tdChildrenDedicated               .innerHTML="ChildrenDedicated"
                var tdRalliesHeld                   = document.createElement("td");tdRalliesHeld                     .innerHTML="RalliesHeld"
                var tdAdultsSoulsWon                = document.createElement("td");tdAdultsSoulsWon                  .innerHTML="AdultsSoulsWon"
                var tdOldMembersHolySpiritBaptised  = document.createElement("td");tdOldMembersHolySpiritBaptised    .innerHTML="OldMembersHolySpiritBaptised "
                var tdNewConvertsWaterBaptised      = document.createElement("td");tdNewConvertsWaterBaptised        .innerHTML="NewConvertsWaterBaptised"
                var tdNewConvertsHolySpiritBaptised = document.createElement("td");tdNewConvertsHolySpiritBaptised   .innerHTML="NewConvertsHolySpiritBaptised"
                var tdTransferIn_0_to_19            = document.createElement("td");tdTransferIn_0_to_19              .innerHTML="TransferIn_0_to_19"
                var tdTransferIn_19_to_Above        = document.createElement("td");tdTransferIn_19_to_Above          .innerHTML="TransferIn_19_to_Above"
                var tdTransferInTotal               = document.createElement("td");tdTransferInTotal                 .innerHTML="TransferInTotal"
                var tdTransferOut_0_to_19           = document.createElement("td");tdTransferOut_0_to_19             .innerHTML="TransferOut_0_to_19"
                var tdTransferOut_19_to_Above       = document.createElement("td");tdTransferOut_19_to_Above         .innerHTML="TransferOut_19_to_Above"
                var tdTransferOutTotal              = document.createElement("td");tdTransferOutTotal                .innerHTML="TransferOutTotal"
                var tdBackSlidersWonBack            = document.createElement("td");tdBackSlidersWonBack              .innerHTML="BackSlidersWonBack"
                var tdBackSlidersBeingFollowed      = document.createElement("td");tdBackSlidersBeingFollowed        .innerHTML="BackSlidersBeingFollowed"
                var tdNumberOfHomeCells             = document.createElement("td");tdNumberOfHomeCells               .innerHTML="NumberOfHomeCells"
                var tdAdultDeath                    = document.createElement("td");tdAdultDeath                      .innerHTML="AdultDeath"
                var tdBirth                         = document.createElement("td");tdBirth                           .innerHTML="Birth"
                var tdDeathAdultsAndChildren        = document.createElement("td");tdDeathAdultsAndChildren          .innerHTML="DeathAdultsAndChildren"
                var tdMarriagesBlessed              = document.createElement("td");tdMarriagesBlessed                .innerHTML="MarriagesBlessed"



                tr.appendChild(tdBranchName);
                tr.appendChild(tdAge35Total);
                tr.appendChild(tdChildren_0_to_12Total);
                tr.appendChild(tdTeenage_13_to_19Total);
                tr.appendChild(tdYoungAdult_20_to_35Total);
                tr.appendChild(tdMenTotal);
                tr.appendChild(tdWomenTotal);
                tr.appendChild(tdWaterBaptisedTotal);
                tr.appendChild(tdHolySpiritBaptisedTotal);
                tr.appendChild(tdTotal);
                tr.appendChild(tdGhanaianMembership);
                tr.appendChild(tdNoOfNationalsIndigenes);
                tr.appendChild(tdNoOfOtherNationals);
                tr.appendChild(tdElders);
                tr.appendChild(tdDeacons);
                tr.appendChild(tdDeaconessess);
                tr.appendChild(tdChildrenDedicated);
                tr.appendChild(tdRalliesHeld);
                tr.appendChild(tdAdultsSoulsWon);
                tr.appendChild(tdOldMembersHolySpiritBaptised);
                tr.appendChild(tdNewConvertsWaterBaptised);
                tr.appendChild(tdNewConvertsHolySpiritBaptised);
                tr.appendChild(tdTransferIn_0_to_19);
                tr.appendChild(tdTransferIn_19_to_Above);
                tr.appendChild(tdTransferInTotal);
                tr.appendChild(tdTransferOut_0_to_19);
                tr.appendChild(tdTransferOut_19_to_Above);
                tr.appendChild(tdTransferOutTotal);
                tr.appendChild(tdBackSlidersWonBack);
                tr.appendChild(tdBackSlidersBeingFollowed);
                tr.appendChild(tdNumberOfHomeCells);
                tr.appendChild(tdAdultDeath);
                tr.appendChild(tdBirth);
                tr.appendChild(tdDeathAdultsAndChildren);
                tr.appendChild(tdMarriagesBlessed);
                thead.appendChild(tr);

                table.appendChild(thead);
                table.appendChild(tbody);
                document.getElementById("customCharts").appendChild(table);//append table to container
                //document.getElementById("customCharts").appendChild(table);

                return table
            };
            var table = createtableHeader();
            var handler = function (allbranches) {
                var isend = false;
                for (var i = 0; i < allbranches.length; i++) {
                    try {
                        if (i == allbranches.length - 1) {
                            isend = true;
                        }
                        $rab.StandardReport.GetAllMembershipBaptism(allbranches[i].BranchID, table, isend);
                    } catch (e) {

                    }

                }

            }
            $rab.Church.GetAllBranches(handler);
        }
    }

    catch (e) {
        alert(e.message);
    }

}
$rab.StandardReport.GetAllMembershipBaptism = function (BranchID, table, isend) {
    var branchid = BranchID;//document.getElementById("selectBranchNames").options[document.getElementById("selectBranchNames").selectedIndex].BranchID


    new $rab.Server.Method().BeginInvoke("Standard.aspx/MembershipBaptism", { branchid: branchid.toString() }, function (jsondata) {
        try {
            if (jsondata == "failed getting membership bastism") throw new $rab.Exception(jsondata);
            var parsed = JSON.parse(jsondata);

            $rab.StandardReport.Data.push(parsed);

            if (parsed.length == 0) return;



            var tr = document.createElement("tr");
            var tdBranchName = document.createElement("td"); tdBranchName.innerHTML = parsed[0].BranchName;
            var tdTotal = document.createElement("td"); tdTotal.innerHTML = parsed[0].Total;
            var tdMen = document.createElement("td"); tdMen.innerHTML = parsed[0].MenTotal;
            var tdWomen = document.createElement("td"); tdWomen.innerHTML = parsed[0].WomenTotal;
            var tdWaterBaptised = document.createElement("td"); tdWaterBaptised.innerHTML = parsed[0].WaterBaptisedTotal;
            var tdHolySpiritBaptised = document.createElement("td"); tdHolySpiritBaptised.innerHTML = parsed[0].HolySpiritBaptisedTotal;
            var tdAge35 = document.createElement("td"); tdAge35.innerHTML = parsed[0].Age35Total;
            var tdChildren_0_to_12 = document.createElement("td"); tdChildren_0_to_12.innerHTML = parsed[0].Children_0_to_12Total;
            var tdTeenage_13_to_19 = document.createElement("td"); tdTeenage_13_to_19.innerHTML = parsed[0].Teenage_13_to_19Total;
            var tdYoungAdult_20_to_35 = document.createElement("td"); tdYoungAdult_20_to_35.innerHTML = parsed[0].YoungAdult_20_to_35Total;
            var tdGhanaianMembership            = document.createElement("td");tdGhanaianMembership              .innerHTML=parsed[0].GhanaianMembership           
            var tdNoOfNationalsIndigenes        = document.createElement("td");tdNoOfNationalsIndigenes          .innerHTML=parsed[0].NoOfNationalsIndigenes       
            var tdNoOfOtherNationals            = document.createElement("td");tdNoOfOtherNationals              .innerHTML=parsed[0].NoOfOtherNationals           
            var tdElders                        = document.createElement("td");tdElders                          .innerHTML=parsed[0].Elders                       
            var tdDeacons                       = document.createElement("td");tdDeacons                         .innerHTML=parsed[0].Deacons                      
            var tdDeaconessess                  = document.createElement("td");tdDeaconessess                    .innerHTML=parsed[0].Deaconessess                 
            var tdChildrenDedicated             = document.createElement("td");tdChildrenDedicated               .innerHTML=parsed[0].ChildrenDedicated            
            var tdRalliesHeld                   = document.createElement("td");tdRalliesHeld                     .innerHTML=parsed[0].RalliesHeld                  
            var tdAdultsSoulsWon                = document.createElement("td");tdAdultsSoulsWon                  .innerHTML=parsed[0].AdultsSoulsWon               
            var tdOldMembersHolySpiritBaptised  = document.createElement("td");tdOldMembersHolySpiritBaptised    .innerHTML=parsed[0].OldMembersHolySpiritBaptised 
            var tdNewConvertsWaterBaptised      = document.createElement("td");tdNewConvertsWaterBaptised        .innerHTML=parsed[0].NewConvertsWaterBaptised     
            var tdNewConvertsHolySpiritBaptised = document.createElement("td");tdNewConvertsHolySpiritBaptised   .innerHTML=parsed[0].NewConvertsHolySpiritBaptised
            var tdTransferIn_0_to_19            = document.createElement("td");tdTransferIn_0_to_19              .innerHTML=parsed[0].TransferIn_0_to_19           
            var tdTransferIn_19_to_Above        = document.createElement("td");tdTransferIn_19_to_Above          .innerHTML=parsed[0].TransferIn_19_to_Above       
            var tdTransferInTotal               = document.createElement("td");tdTransferInTotal                 .innerHTML=parsed[0].TransferInTotal              
            var tdTransferOut_0_to_19           = document.createElement("td");tdTransferOut_0_to_19             .innerHTML=parsed[0].TransferOut_0_to_19          
            var tdTransferOut_19_to_Above       = document.createElement("td");tdTransferOut_19_to_Above         .innerHTML=parsed[0].TransferOut_19_to_Above      
            var tdTransferOutTotal              = document.createElement("td");tdTransferOutTotal                .innerHTML=parsed[0].TransferOutTotal             
            var tdBackSlidersWonBack            = document.createElement("td");tdBackSlidersWonBack              .innerHTML=parsed[0].BackSlidersWonBack           
            var tdBackSlidersBeingFollowed      = document.createElement("td");tdBackSlidersBeingFollowed        .innerHTML=parsed[0].BackSlidersBeingFollowed     
            var tdNumberOfHomeCells             = document.createElement("td");tdNumberOfHomeCells               .innerHTML=parsed[0].NumberOfHomeCells            
            var tdAdultDeath                    = document.createElement("td");tdAdultDeath                      .innerHTML=parsed[0].AdultDeath                   
            var tdBirth                         = document.createElement("td");tdBirth                           .innerHTML=parsed[0].Birth                        
            var tdDeathAdultsAndChildren        = document.createElement("td");tdDeathAdultsAndChildren          .innerHTML=parsed[0].DeathAdultsAndChildren       
            var tdMarriagesBlessed              = document.createElement("td");tdMarriagesBlessed                .innerHTML=parsed[0].MarriagesBlessed             


            tr.appendChild(tdBranchName);
            tr.appendChild(tdAge35);
            tr.appendChild(tdChildren_0_to_12);
            tr.appendChild(tdTeenage_13_to_19);
            tr.appendChild(tdYoungAdult_20_to_35);
            tr.appendChild(tdMen);
            tr.appendChild(tdWomen);
            tr.appendChild(tdWaterBaptised);
            tr.appendChild(tdHolySpiritBaptised);
            tr.appendChild(tdTotal);
            tr.appendChild(tdGhanaianMembership           );
            tr.appendChild(tdNoOfNationalsIndigenes       );
            tr.appendChild(tdNoOfOtherNationals           );
            tr.appendChild(tdElders                       );
            tr.appendChild(tdDeacons                      );
            tr.appendChild(tdDeaconessess                 );
            tr.appendChild(tdChildrenDedicated            );
            tr.appendChild(tdRalliesHeld                  );
            tr.appendChild(tdAdultsSoulsWon               );
            tr.appendChild(tdOldMembersHolySpiritBaptised );
            tr.appendChild(tdNewConvertsWaterBaptised     );
            tr.appendChild(tdNewConvertsHolySpiritBaptised);
            tr.appendChild(tdTransferIn_0_to_19           );
            tr.appendChild(tdTransferIn_19_to_Above       );
            tr.appendChild(tdTransferInTotal              );
            tr.appendChild(tdTransferOut_0_to_19          );
            tr.appendChild(tdTransferOut_19_to_Above      );
            tr.appendChild(tdTransferOutTotal             );
            tr.appendChild(tdBackSlidersWonBack           );
            tr.appendChild(tdBackSlidersBeingFollowed     );
            tr.appendChild(tdNumberOfHomeCells            );
            tr.appendChild(tdAdultDeath                   );
            tr.appendChild(tdBirth                        );
            tr.appendChild(tdDeathAdultsAndChildren       );
            tr.appendChild(tdMarriagesBlessed             );

            //ADDITIONAL COLUMNS

            document.getElementById("tablebodyexport").appendChild(tr);//append to table body
            if (isend) {
                initialise('tableexport');
                getLibrary();
            }

        } catch (e) {

        }


    })
}
$rab.StandardReport.ExportToExcel = function () {
    try {
        //$rab.StandardReport.Data.push(parsed);
        if ($rab.StandardReport.Data.length == 0) { alert("No data to export"); return; }
        new $rab.Export().ToExcel($rab.StandardReport.Data);;
    } catch (e) {
        alert(e.message);
    }
}
$rab.StandardReport.AllAttendanceProfile = function () {
    this.obj = {
        BranchName: $("#selectBranchNames").val(),
        BranchID: document.getElementById("selectBranchNames").options[document.getElementById("selectBranchNames").selectedIndex].BranchID
    }
    this.Invoke = function () {
        try {
            $("#curve_chart").empty();
            $("#customCharts").empty();

            if (this.obj.BranchName == "Select branch") throw new $rab.Exception("Oops please select branch");
            new $rab.Server.Method().BeginInvoke("Standard.aspx/AttendanceBranchProfile", { brn: this.obj }, function (jsondata) {
                try {
                    var res = JSON.parse(jsondata);

                    google.charts.load('current', { 'packages': ['corechart'] });
                    google.charts.setOnLoadCallback(drawChart);
                    var array = new Array(["Count", "Date"])
                    function drawChart() {
                        for (var i = 0; i < res.length; i++) {
                            array.push([res[i].DateFormatted, res[i].Count])
                        }
                        var data = google.visualization.arrayToDataTable(array);

                        var options = {
                            title: 'Sunday service attendance profile for ' + res[0].BranchName,
                            curveType: 'function',
                            legend: { position: 'bottom' }
                        };

                        var chartholder = document.createElement("div");
                        chartholder.style.width = 1200;
                        chartholder.style.height = "500px";
                        chartholder.style.marginBottom = "50px";


                        var parent = document.getElementById('curve_chart');
                        parent.appendChild(chartholder);
                        var height = parseInt(parent.style.height.split("px")[0]) + 500;
                        parent.style.height = height + "px";
                        var chart = new google.visualization.LineChart(chartholder);
                        chart.draw(data, options);

                    }

                } catch (e) {
                    alert(E.message);
                }
            })
        } catch (e) {
            alert(e.message);
        }
    }


}
$rab.StandardReport.WeeklyServiceReport = function () {
    try {
        $("#customCharts").empty();
        $("#curve_chart").empty();
        var brninfo = new $rab.Branch().BranchInfo;
        if (brninfo.BranchName == 'Select branch') throw new $rab.Exception("Please select branch")
        new $rab.Server
            .Method()
            .BeginInvoke("Statistics.aspx/WeeklyServiceReport", { branchinfo: brninfo }, function (jsondata) {
                try {
                    if (jsondata == "failed to get weekly service report") throw new $rab.Exception(jsondata);
                    var parsed = JSON.parse(jsondata);
                    var createtableHeader = function () {
                        var table = document.createElement("table");
                        table.className = "table table-stripped table-responsive";

                        var thead = document.createElement("thead");
                        var tbody = document.createElement("tbody");
                        tbody.id = "tablebodyexport";
                        table.id = 'tableexport'
                        var tr = document.createElement("tr");
                        var tdBranchName = document.createElement("td"); tdBranchName.innerHTML = "BranchName";
                        var tdDate = document.createElement("td"); tdDate.innerHTML = "Date";
                        var tdTithes = document.createElement("td"); tdTithes.innerHTML = "Tithes";
                        var tdMissionaryOffering = document.createElement("td"); tdMissionaryOffering.innerHTML = "MissionaryOffering";
                        var tdOther = document.createElement("td"); tdOther.innerHTML = "Other";

                        tr.appendChild(tdBranchName);
                        tr.appendChild(tdDate);
                        tr.appendChild(tdTithes);
                        tr.appendChild(tdMissionaryOffering);
                        tr.appendChild(tdOther);

                        thead.appendChild(tr);
                        table.appendChild(thead);
                        table.appendChild(tbody);

                        document.getElementById("customCharts").appendChild(table);

                        return table
                    };
                    var table = createtableHeader();

                    for (var i = 0; i < parsed.result.length; i++) {
                        try {
                            var tr = document.createElement("tr");
                            var tdBranchName         = document.createElement("td"); tdBranchName.innerHTML         = brninfo.BranchName
                            var tdDate               = document.createElement("td"); tdDate.innerHTML               = parsed.result[i].Date
                            var tdTithes             = document.createElement("td"); tdTithes.innerHTML             = parsed.result[i].Tithes
                            var tdMissionaryOffering = document.createElement("td"); tdMissionaryOffering.innerHTML = parsed.result[i].MissionaryOffering
                            var tdOther              = document.createElement("td"); tdOther.innerHTML              = parsed.result[i].Other

                            tr.appendChild(tdBranchName);
                            tr.appendChild(tdDate);
                            tr.appendChild(tdTithes);
                            tr.appendChild(tdMissionaryOffering);
                            tr.appendChild(tdOther);
                            document.getElementById("tablebodyexport").appendChild(tr);//append to table body
                        } catch (e) {

                        }

                    }

                    document.getElementById("customCharts").appendChild(table);//append table to container

                    initialise('tableexport');
                    getLibrary();
                    var res = parsed.result;
                    google.charts.load('current', { 'packages': ['corechart'] });
                    google.charts.setOnLoadCallback(drawChart);
                    var array = new Array(["Count", "Tithes", "MissionaryOffering", "Other"])
                    //var array = new Array(["Count", "Tithes"])
                    function drawChart() {
                        for (var i = 0; i < res.length; i++) {
                            try {
                                array.push([res[i].Date, parseInt(res[i].Tithes), parseInt(res[i].MissionaryOffering), parseInt(res[i].Other)])
                            } catch (e) {

                            }
                            
                        }
                        var data = google.visualization.arrayToDataTable(array);

                        var options = {
                            title: 'Weekly service income for' + brninfo.BranchName,
                            curveType: 'function',
                            legend: { position: 'bottom' }
                        };

                        var chartholder = document.createElement("div");
                        chartholder.style.width = 1200;
                        chartholder.style.height = "500px";
                        chartholder.style.marginBottom = "50px";


                        var parent = document.getElementById('curve_chart');
                        parent.appendChild(chartholder);
                        var height = parseInt(parent.style.height.split("px")[0]) + 500;
                        parent.style.height = height + "px";
                        var chart = new google.visualization.LineChart(chartholder);
                        chart.draw(data, options);

                    }

                } catch (e) {
                    alert(e.message);
                }

            })
    } catch (e) {
        alert(e.message);
    }
}
$rab.StandardReport.Events = function () {
    try {
        $("#customCharts").empty();
        $("#curve_chart").empty();
        var brninfo = new $rab.Branch().BranchInfo;
        if (brninfo.BranchName == 'Select branch') throw new $rab.Exception("Please select branch")
        new $rab.Server.Method().BeginInvoke("Standard.aspx/EventsReport", { branchinfo: brninfo }, function (jsondata) {

            try {
                //alert(jsondata);
                if (jsondata == "failed to get events report") { alert(jsondata); return false; }
                if (jsondata == "about to serialize result") { alert(jsondata); return false; }
                var parsed = JSON.parse(jsondata);
                var tabletbody = $rab.CreateTable(["BranchName", "Year", "Month", "EventName", "Number of events"]);
                table = tabletbody.tbody;

                table.id = 'tableexport';
                document.getElementById("customCharts").appendChild(tabletbody.table);
                for (var i = 0; i < parsed.length; i++) {
                    
                        
                        for (var j = 0; j < parsed[i].EventTypeAgg.length; j++) {
                          var tr = document.createElement("tr");
                          var tdBranchName = document.createElement("td");tdBranchName.innerHTML=parsed[i].branchName
                          var tdYear = document.createElement("td"); tdYear.innerHTML = parsed[i].Year;//.substring(6,10);
                          var tdMonth = document.createElement("td"); tdMonth.innerHTML = parsed[i].Month;//ng(3,5);
                          var tdEventName  = document.createElement("td");tdEventName .innerHTML=parsed[i].EventTypeAgg[j].Name;
                          var tdCount      = document.createElement("td");tdCount     .innerHTML=parsed[i].EventTypeAgg[j].Count;
                          tr.appendChild(tdBranchName);
                          tr.appendChild(tdYear      );
                          tr.appendChild(tdMonth     );
                          tr.appendChild(tdEventName );
                          tr.appendChild(tdCount     );
                          table.appendChild(tr);
                        }
                       
                }
                
                initialise('tableexport');
                getLibrary();
            }
             catch (e) {
                alert(e.message);
            }

        });
    } catch (e) {
        alert(e.message);
    }
}