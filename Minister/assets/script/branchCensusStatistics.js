$rab.Census = $rab.Census || {};
$rab.Census.Permissionset=["All","SuperUser","Census"]
$rab.Census.Statistics = $rab.Census.Statistics || {};
$rab.Census.CensusYear = function (censusYear) {
    try {
        $("#tbodyCensusStatistics, #tbodyRegisteredCensusStatistics").empty();

        obj = { branchName: $("#selectBranchNames").val(), censusYear: censusYear };
        if (censusYear == "All") {
            url = "Census.aspx/LoadCensusDataset";
        }
        else {
            url = "Census.aspx/LoadCensusDatasetByYear";
        }
        handler = function (jsonData) {
            try {
                if (jsonData == "failed getting census data") throw new $rab.Exception("");
                // build a table with statisics
                var parsed = JSON.parse(jsonData).CensusStatistics;
                for (var i = 0; i < parsed.length; i++) {
                    var tr = document.createElement("tr");
                    var tdBranchName = document.createElement("td"); tdBranchName.innerHTML = parsed[i].BranchName;
                    var tdCensusYear = document.createElement("td"); tdCensusYear.innerHTML = parsed[i].CensusYear;
                    var tdTotalRegistered = document.createElement("td"); tdTotalRegistered.innerHTML = parsed[i].TotalRegistered;
                    var tdTotalHolySpiritBaptised = document.createElement("td"); tdTotalHolySpiritBaptised.innerHTML = parsed[i].TotalHolySpiritBaptised;
                    var tdTotalWaterBaptised = document.createElement("td"); tdTotalWaterBaptised.innerHTML = parsed[i].TotalWaterBaptised;
                    var tdTotalBornAgain = document.createElement("td"); tdTotalBornAgain.innerHTML = parsed[i].TotalBornAgain;
                    tr.appendChild(tdBranchName)
                    tr.appendChild(tdCensusYear)
                    tr.appendChild(tdTotalRegistered)
                    tr.appendChild(tdTotalHolySpiritBaptised)
                    tr.appendChild(tdTotalWaterBaptised)
                    tr.appendChild(tdTotalBornAgain)

                    document.getElementById("tbodyCensusStatistics").appendChild(tr);

                }
                var census = JSON.parse(jsonData).CensusData;
                for (var i = 0; i < census.length; i++) {
                    try {
                        var tr = document.createElement("tr");
                        var td1 = document.createElement("td"); td1.innerHTML = census[i].LastName;
                        var td2 = document.createElement("td"); td2.innerHTML = census[i].FirstName;
                        var td3 = document.createElement("td"); td3.innerHTML = census[i].Telephone;
                        var td4 = document.createElement("td"); td4.innerHTML = census[i].IsHolySpiritBaptised;
                        var td5 = document.createElement("td"); td5.innerHTML = census[i].IsBornAgain;
                        var td6 = document.createElement("td"); td6.innerHTML = census[i].IsWaterBaptised;
                        tr.appendChild(td1)
                        tr.appendChild(td2)
                        tr.appendChild(td3)
                        tr.appendChild(td4)
                        tr.appendChild(td5)
                        tr.appendChild(td6)

                        document.getElementById("tbodyRegisteredCensusStatistics").appendChild(tr);
                    } catch (e) {

                    }
                }
            } catch (e) {

            }
        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
}
$rab.Census.Dataset = "";
$(function () {
    try {
       
        new $rab.Security.LockDown().PagePermission($rab.Census.Permissionset) 
        $rab.Security.Church.LoadBranches("selectBranchNames");
        setTimeout(new $rab.AuditTrail().PageVisited("Census"), 1000);
        
    } catch (e) {
       // alert(e.message);
    }
});
 $rab.Census.Refresh=function() {
    var url1, obj1, handler1;
    url1 = "Events.aspx/LoadBranches"
    obj1 = {};
    handler1 = function (jsondata) {
        try {

        
        if(jsondata=="failed getting branches") throw new $rab.Exception(jsondata);
        //check what user is coming from and lock dropdown queries for that branch
        $("#tbodyCensusStatistics, #tbodyRegisteredCensusStatistics").empty();
        //var user = JSON.parse(localStorage.getItem("user"));
        //var select = document.getElementById("selectBranchNames");
        //var branchparse = JSON.parse(jsondata);

        //var branch = branchparse.filter(function (val) { return val.BranchID == user.BranchId })[0].BranchName;
        //var option = document.createElement("option");
        //option.value = branch;
        //option.innerHTML = branch;
        //document.getElementById("selectBranchNames").appendChild(option);
        //$("#selectBranchNames").val(branch);
        var url, obj, handler;
        url = "Census.aspx/LoadCensusDataset"
        obj = { branchName: $("#selectBranchNames").val() };
        handler = function (jsonData) {
            try {

                if (jsonData == "failed getting census data") throw new $rab.Exception("");
                // build a table with statisics
                var parsed = JSON.parse(jsonData).CensusStatistics;
                var census = JSON.parse(jsonData).CensusData;
                var censusYears = JSON.parse(jsonData).UniqueCensusYears;
                //Load census year dropdown list
                if (censusYears.constructor === Array) {
                    $("#selectCensusYear").empty();
                    for (var i = 0; i < censusYears.length; i++) {
                        var option = document.createElement("option");
                        //if index i=0 then add an option to select all
                        if (i == 0) {
                            var all = document.createElement("option");
                            all.value = "All";
                            all.innerHTML = "All";
                            document.getElementById("selectCensusYear").appendChild(all)
                        }
                        option.value = censusYears[i];
                        option.innerHTML = censusYears[i];
                        document.getElementById("selectCensusYear").appendChild(option)
                    }
                }
                for (var i = 0; i < parsed.length; i++) {
                    var tr = document.createElement("tr");
                    var tdBranchName = document.createElement("td"); tdBranchName.innerHTML = parsed[i].BranchName;
                    var tdCensusYear = document.createElement("td"); tdCensusYear.innerHTML = parsed[i].CensusYear;
                    var tdTotalRegistered = document.createElement("td"); tdTotalRegistered.innerHTML = parsed[i].TotalRegistered;
                    var tdTotalHolySpiritBaptised = document.createElement("td"); tdTotalHolySpiritBaptised.innerHTML = parsed[i].TotalHolySpiritBaptised;
                    var tdTotalWaterBaptised = document.createElement("td"); tdTotalWaterBaptised.innerHTML = parsed[i].TotalWaterBaptised;
                    var tdTotalBornAgain = document.createElement("td"); tdTotalBornAgain.innerHTML = parsed[i].TotalBornAgain;
                    tr.appendChild(tdBranchName)
                    tr.appendChild(tdCensusYear)
                    tr.appendChild(tdTotalRegistered)
                    tr.appendChild(tdTotalHolySpiritBaptised)
                    tr.appendChild(tdTotalWaterBaptised)
                    tr.appendChild(tdTotalBornAgain)

                    document.getElementById("tbodyCensusStatistics").appendChild(tr);

                }

                for (var i = 0; i < census.length; i++) {
                    try {
                        var tr = document.createElement("tr");
                        var td1 = document.createElement("td"); td1.innerHTML = census[i].LastName;
                        var td2 = document.createElement("td"); td2.innerHTML = census[i].FirstName;
                        var td3 = document.createElement("td"); td3.innerHTML = census[i].Telephone;
                        var td4 = document.createElement("td"); td4.innerHTML = census[i].IsHolySpiritBaptised;
                        var td5 = document.createElement("td"); td5.innerHTML = census[i].IsBornAgain;
                        var td6 = document.createElement("td"); td6.innerHTML = census[i].IsWaterBaptised;
                        tr.appendChild(td1)
                        tr.appendChild(td2)
                        tr.appendChild(td3)
                        tr.appendChild(td4)
                        tr.appendChild(td5)
                        tr.appendChild(td6)

                        document.getElementById("tbodyRegisteredCensusStatistics").appendChild(tr);
                    } catch (e) {

                    }
                }
            } catch (e) {

            }
        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
        } catch (e) {

        }
    }
    new $rab.Server.Method().BeginInvoke(url1, obj1, handler1);
    // load census statistics
    //
}