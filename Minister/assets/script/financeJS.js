$rab.Finance = $rab.Finance || {};
$rab.Finance.PermissionSet = ["SuperUser", "All", "Finances"];
$rab.Finance.Filters = "";
$rab.Finance.Transaction = function () {
    try {
        //validate branch
        var branch = $("#selectBranchNames").val();
        if (branch == "Select branch" || branch == "All") {
            alert("Please select branch name"); return
        }
        //load filters from server 
        $rab.Finance.GetFilters();
        //reset all controls
        $("#modal-section-1 input[type=text],textarea").val("");
        $("#modal-section-1 select").each(function () { this.selectedIndex = 0; });
        document.getElementById("buttonAccountAdd").style.display = "block";
        document.getElementById("buttonAccountUpdate").style.display = "none";
        document.getElementById("buttonAddFinanceDialog").click();
    } catch (e) {

    }
}
$rab.Finance.IAccount = function () {
    this.BranchName = "";
    this.Paymode = "";
    this.Date = "";
    this.Amount = "";
    this.BranchID = 0;

}
$rab.Finance.Acount = function () {
    this.memberID = JSON.parse(localStorage.getItem("user")).MemberID
    this.Description = $("#textboxAccountDescription").val();
    this.Source = $("#textboxAccountSource").val();
    this.Name = $("#textboxAccountName").val();
    this.AccountType = $("#selectAccountType").val();
    this.Add = function () {

        try {

            var accountype = this.AccountType
            this.BranchName = $("#selectBranchNames").val();
            this.Paymode = $("#textboxAccountPaymode").val();
            this.Date = $("#textboxAccountDate").val();
            this.Amount = parseFloat($("#textboxAccountAmount").val());
            var inv = new $rab.Server.Dispatcher();
            inv.url = "Finances.aspx/Add";
            inv.obj = this;
            inv.handler = function (jsondata) {
                try {

                    if (jsondata == "failed adding account") new $rab.Exception(jsondata);
                    var parsed = JSON.parse(jsondata);
                    if (parsed.message == "Update successful") {

                        $("#selectAccountTypeNames").val(accountype);
                        $rab.Finance.LoadAccountsSummaryByBranchAccountType(accountype);
                        document.getElementById("buttonClose").click();
                        $("#modal-section-1 input[type=text]").val("");
                        $("#modal-section-1 select").each(function (val) { this.selectedIndex = 0; });
                        return;
                        //deprecated and will be removed
                        ///var tr = document.createElement("tr");
                        ///var tdBranchName = document.createElement("td"); tdBranchName.innerHTML = parsed.Result.BranchName;
                        ///var tdDate = document.createElement("td"); tdDate.innerHTML = parsed.Result.Date;
                        ///var tdFinanceID = document.createElement("td"); tdFinanceID.innerHTML = parsed.Result.FinanceID;
                        ///var tdAcounttype = document.createElement("td"); tdAcounttype.innerHTML = parsed.Result.AccountType;
                        ///var tdName = document.createElement("td"); tdName.innerHTML = parsed.Result.Name;
                        ///var tdDescription = document.createElement("td"); tdDescription.innerHTML = parsed.Result.Description;
                        ///var tdSource = document.createElement("td"); tdSource.innerHTML = parsed.Result.Source;
                        ///var tdPaymode = document.createElement("td"); tdPaymode.innerHTML = parsed.Result.Paymode;
                        ///var tdAmount = document.createElement("td"); tdAmount.innerHTML = parsed.Result.Amount;
                        ///var tdCreatedBy = document.createElement("td"); tdCreatedBy.innerHTML = parsed.Result.CreatedBy;
                        ///var tdCreatedon = document.createElement("td"); tdCreatedon.innerHTML = parsed.Result.CreatedOn;
                        ///
                        ///tr.appendChild(tdFinanceID);
                        ///tr.appendChild(tdBranchName);
                        ///tr.appendChild(tdDate);
                        ///tr.appendChild(tdAcounttype);
                        ///tr.appendChild(tdName);
                        ///tr.appendChild(tdDescription);
                        ///tr.appendChild(tdSource);
                        ///tr.appendChild(tdPaymode);
                        ///tr.appendChild(tdAmount);
                        ///tr.appendChild(tdCreatedBy);
                        ///tr.appendChild(tdCreatedon);
                        ///$("input[type=text]").val("");
                        ///document.getElementById("tbodyFinance").appendChild(tr);
                        ///document.getElementById("buttonClose").click();

                    }
                } catch (e) {
                    alert(e.message);
                }
            };
            if (this.memberID == "") throw new $rab.Exception("Invalid member id");

            if (this.BranchName == "" || this.BranchName == "Select branch" || this.BranchName == "All") throw new $rab.Exception("Invalid branch name");

            if (this.Name == "") throw new $rab.Exception("Invalid Name");
            if (this.AccountType == "" || this.AccountType == "Select account type") throw new $rab.Exception("Invalid account type");
            if (this.Description == null) throw new $rab.Exception("Invalid description");
            if (this.Source == null) throw new $rab.Exception("Invalid source");

            if (this.Paymode == "") throw new $rab.Exception("Invalid paymode");
            if (this.Date == "" || this.Date == "Invalid Date") {
                throw new $rab.Exception("Invalid date")
            } else {
                //correct date supplied transform date into integer
                var str = this.Date;

                var dd = str.substring(0, 2);
                var mm = str.substring(3, 5);
                var yyyy = str.substring(6, 10);
                this.Date = yyyy + mm + dd;
            };
            if (this.Amount == 0) throw new $rab.Exception("Invalid amount");

            inv.invoke();
        } catch (e) {
            alert(e.message);

        }
    }
    this.Update = function () {
        try {
            this.BranchID = new $rab.Branch().BranchInfo.BranchID
            var accountype = this.AccountType
            this.BranchName = $("#selectBranchNames").val();
            this.Paymode = $("#textboxAccountPaymode").val();
            this.Date = $("#textboxAccountDate").val();
            this.Amount = parseFloat($("#textboxAccountAmount").val());
            this.FinanceID = document.getElementById("buttonAccountUpdate").FinanceID;
            var inv = new $rab.Server.Dispatcher();
            inv.url = "Finances.aspx/Update";
            inv.obj = this;
            inv.handler = function (jsondata) {
                try {

                    if (jsondata == "failed adding account") new $rab.Exception(jsondata);

                    if (jsondata == "Update successful") {

                        $("#selectAccountTypeNames").val(accountype);
                        $rab.Finance.LoadAccountsSummaryByBranchAccountType(accountype);
                        document.getElementById("buttonClose").click();
                        $("#modal-section-1 input[type=text]").val("");
                        $("#modal-section-1 select").each(function (val) { this.selectedIndex = 0; });


                    }
                } catch (e) {
                    alert(e.message);
                }
            };
            if (this.memberID == "") throw new $rab.Exception("Invalid member id");

            if (this.BranchName == "" || this.BranchName == "Select branch" || this.BranchName == "All") throw new $rab.Exception("Invalid branch name");

            if (this.Name == "") throw new $rab.Exception("Invalid Name");
            if (this.AccountType == "" || this.AccountType == "Select account type") throw new $rab.Exception("Invalid account type");
            if (this.Description == null) throw new $rab.Exception("Invalid description");
            if (this.Source == null) throw new $rab.Exception("Invalid source");

            if (this.Paymode == "") throw new $rab.Exception("Invalid paymode");
            if (this.Date == "" || this.Date == "Invalid Date") {
                throw new $rab.Exception("Invalid date")
            } else {
                //correct date supplied transform date into integer
                var str = this.Date;

                var dd = str.substring(0, 2);
                var mm = str.substring(3, 5);
                var yyyy = str.substring(6, 10);
                this.Date = yyyy + mm + dd;
            };
            if (this.Amount == 0) throw new $rab.Exception("Invalid amount");

            inv.invoke();
        } catch (e) {
            alert(e.message);

        }
    }

}
$rab.Finance.Acount.prototype = new $rab.Finance.IAccount();
$rab.Finance.BankTransaction = function () {
    this.ID = $("#textboxTransactionID").val();
    this.ReferenceNumber = $("#textboxTransactionReference").val();
    this.TransactionType = $("#textboxTransactionType").val();
    this.AuthourisingPerson = $("#textboxTransactionPerson").val();
    this.MemberID = $rab.Login.User.MemberID;
    this.Add = function () {
        try {
            // 

            //var branch = document.getElementById("selectBranchNames").options[document.getElementById("selectBranchNames").selectedIndex];
            this.BranchName = $("#selectBranchNames").val();
            this.Paymode = $("#textboxTransactionPaymode").val();
            this.Date = $("#textboxTransactionDate").val();
            this.Amount = parseInt($("#textboxTransactionAmount").val());
            //validate all entries
            if (this.ID.trim().length == 0) { throw new $rab.Exception("Please provide transaction ID") };
            if (this.ReferenceNumber.trim().length == 0) { throw new $rab.Exception("Please provide transaction Reference Number") }
            if (this.TransactionType.trim().length == 0) { throw new $rab.Exception("Please provide transaction  Type") }
            if (this.AuthourisingPerson.trim().length == 0) { throw new $rab.Exception("Please provide transaction Authourising Person") }
            if (this.BranchID == 0) { throw new $rab.Exception("Please provide Branch  ID") }

            if (this.Paymode.trim().length == 0) { throw new $rab.Exception("Please provide provide Paymode") }
            if (this.Date.trim().length == 0) { throw new $rab.Exception("Please provide transaction Date") }
            if (this.Amount == 0) { throw new $rab.Exception("Please provide transaction Amount") }
            //if (this.ID.trim().length == 0) { throw new $rab.Exception("Please provide transaction ID") }

            var inv = new $rab.Server.Dispatcher();
            inv.url = "Finances.aspx/AddTransaction";
            inv.obj = this;
            inv.handler = function (jsondata) {
                try {
                    if (jsondata == "failed adding account") new $rab.Exception(jsondata);
                    var parsed = JSON.parse(jsondata);
                    if (parsed.message == "Update successful") {
                        alert(parsed.message);
                        //<th>#</th>
                        //    <th>Branch name</th>
                        //    <th>Date</th>
                        //    <th>Acount type</th>
                        //    <th>Name       </th>
                        //    <th>Description</th>
                        //    <th>Source     </th>
                        //    <th>Pay mode   </th>
                        //    <th>Amount     </th>
                        //    <th>Created By </th>
                        //    <th>Created on </th>
                        //var tr = document.createElement("tr");
                        //var tdBranchName = document.createElement("td"); tdBranchName.innerHTML = parsed.Result.BranchName;
                        //var tdBankTransactionID = document.createElement("td"); tdBankTransactionID.innerHTML = parsed.Result.BankTransactionID;
                        //var tdAcounttype = document.createElement("td"); tdAcounttype.innerHTML = parsed.Result.TransactionType;
                        //var tdName = document.createElement("td"); tdName.innerHTML = parsed.Result.Name;
                        //var tdDescription = document.createElement("td"); tdDescription.innerHTML = parsed.Result.Description;
                        //var tdSource = document.createElement("td"); tdSource.innerHTML = parsed.Result.Source;
                        //var tdPaymode = document.createElement("td"); tdPaymode.innerHTML = parsed.Result.Paymode;
                        //var tdAmount = document.createElement("td"); tdAmount.innerHTML = parsed.Result.Amount;
                        //var tdCreatedBy = document.createElement("td"); tdCreatedBy.innerHTML = parsed.Result.CreatedBy;
                        //var tdCreatedon = document.createElement("td"); tdCreatedon.innerHTML = parsed.Result.CreatedOn;
                        //
                        //tr.appendChild(tdBankTransactionID);
                        //tr.appendChild(tdBranchName);
                        //tr.appendChild(tdAcounttype);
                        //tr.appendChild(tdName);
                        //tr.appendChild(tdDescription);
                        //tr.appendChild(tdSource);
                        //tr.appendChild(tdPaymode);
                        //tr.appendChild(tdAmount);
                        //tr.appendChild(tdCreatedBy);
                        //tr.appendChild(tdCreatedon);
                        //
                        //document.getElementById("tbodyFinance").appendChild(tr);
                        //document.getElementById("buttonClose").click();

                    }
                } catch (e) {
                    alert(e.message);
                }
            };
            inv.invoke();

        } catch (e) {

        }
    }
}
$rab.Finance.BankTransaction.prototype = new $rab.Finance.IAccount();
$rab.Finance.LoadAccountsSummary = function () {
    try {


        $("#tbodyFinance").empty();
        var inv = new $rab.Server.Dispatcher();
        inv.url = "Finances.aspx/GetAccountsSummary";
        inv.obj = { branchName: $("#selectBranchNames").val() };
        inv.handler = function (jsondata) {
            try {

                if (jsondata == "failed adding account") new $rab.Exception(jsondata);
                var parsed = JSON.parse(jsondata);
                $("input[type=text]").empty();
                if (parsed.message == "Update successful") {
                    for (var i = 0; i < parsed.Result.length; i++) {


                        var tr = document.createElement("tr");
                        var tdBranchName = document.createElement("td"); tdBranchName.innerHTML = parsed.Result[i].BranchName;
                        var tdDate = document.createElement("td"); tdDate.innerHTML = parsed.Result[i].Date;
                        var tdFinanceID = document.createElement("td"); tdFinanceID.innerHTML = parsed.Result[i].FinanceID;
                        var tdAcounttype = document.createElement("td"); tdAcounttype.innerHTML = parsed.Result[i].AccountType;
                        var tdName = document.createElement("td"); tdName.innerHTML = parsed.Result[i].Name;
                        var tdDescription = document.createElement("td"); tdDescription.innerHTML = parsed.Result[i].Description;
                        var tdSource = document.createElement("td"); tdSource.innerHTML = parsed.Result[i].Source;
                        var tdPaymode = document.createElement("td"); tdPaymode.innerHTML = parsed.Result[i].Paymode;
                        var tdAmount = document.createElement("td"); tdAmount.innerHTML = parsed.Result[i].Amount;
                        var tdCreatedBy = document.createElement("td"); tdCreatedBy.innerHTML = parsed.Result[i].CreatedBy;
                        var tdCreatedon = document.createElement("td"); tdCreatedon.innerHTML = parsed.Result[i].CreatedOn;

                        tr.appendChild(tdFinanceID);
                        tr.appendChild(tdBranchName);
                        tr.appendChild(tdDate);
                        tr.appendChild(tdAcounttype);
                        tr.appendChild(tdName);
                        tr.appendChild(tdDescription);
                        tr.appendChild(tdSource);
                        tr.appendChild(tdPaymode);
                        tr.appendChild(tdAmount);
                        tr.appendChild(tdCreatedBy);
                        tr.appendChild(tdCreatedon);

                        document.getElementById("tbodyFinance").appendChild(tr);
                        document.getElementById("buttonClose").click();

                    }

                }
            } catch (e) {
                //alert(e.message);
            }
        };
        inv.invoke();
    }
    catch (e) {

    }
}
$rab.Finance.LoadAccountsSummaryByBranchAccountType = function (accounttype) {
    try {

        if (accounttype == null) accounttype = $("#selectAccountTypeNames").val();

        $("#tbodyFinance").empty();
        var inv = new $rab.Server.Dispatcher();
        inv.url = "Finances.aspx/GetAccountsSummaryByBranchAccountType";
        inv.obj = { branchName: $("#selectBranchNames").val(), accountType: accounttype };
        inv.handler = function (jsondata) {
            try {
                var fullname = $rab.Login.User.FirstName + " " + $rab.Login.User.LastName;
                if (jsondata == "failed adding account") new $rab.Exception(jsondata);
                var parsed = JSON.parse(jsondata);
                $("input[type=text]").empty();
                if (parsed.message == "Update successful") {
                    for (var i = 0; i < parsed.Result.length; i++) {


                        var tr = document.createElement("tr");
                        var tdBranchName = document.createElement("td"); tdBranchName.innerHTML = parsed.Result[i].BranchName;
                        var tdDate = document.createElement("td"); tdDate.innerHTML = parsed.Result[i].Date;

                        var tdFinanceID = document.createElement("td"); tdFinanceID.innerHTML = parsed.Result[i].FinanceID;

                        var tdAcounttype = document.createElement("td"); tdAcounttype.innerHTML = parsed.Result[i].AccountType;
                        var tdName = document.createElement("td"); tdName.innerHTML = parsed.Result[i].Name;
                        var tdDescription = document.createElement("td"); tdDescription.innerHTML = parsed.Result[i].Description;
                        var tdSource = document.createElement("td"); tdSource.innerHTML = parsed.Result[i].Source;
                        var tdPaymode = document.createElement("td"); tdPaymode.innerHTML = parsed.Result[i].Paymode;
                        var tdAmount = document.createElement("td"); tdAmount.innerHTML = parsed.Result[i].Amount;
                        var tdCreatedBy = document.createElement("td"); tdCreatedBy.innerHTML = parsed.Result[i].CreatedBy;
                        var tdCreatedon = document.createElement("td"); tdCreatedon.innerHTML = parsed.Result[i].CreatedOn;

                        //allow the ability to edit entered record
                        var buttonEdit = document.createElement("button");
                        buttonEdit.innerHTML = "Edit";
                        buttonEdit.Result = parsed.Result[i];
                        buttonEdit.title = "Click to edit entered record, only the user who entered this record can edit this data";
                        buttonEdit.onclick = function () {

                            //identify transaction ID
                            document.getElementById("buttonAccountUpdate").FinanceID = this.Result.FinanceID
                            var values = {
                                accounttype: this.Result.AccountType,
                                name: this.Result.Name,
                                source: this.Result.Source,
                                branchname: this.Result.BranchName,
                                paymode: this.Result.Paymode,
                                date: this.Result.Date.toString().substring(6, 8) + "/" + this.Result.Date.toString().substring(4, 6) + "/" + this.Result.Date.toString().substring(0, 4),
                                amount: this.Result.Amount,
                                description: this.Result.Description,

                            }
                            try {
                                $rab.Finance.GetEditFilters(
                                    function (jsondata) {
                                        //load account type names
                                        try {
                                            if (jsondata == "failed getting account filters") throw new $rab.Exception(jsondata);
                                            var isloadsuccessful = (JSON.parse(jsondata).message == "load successful");
                                            if (isloadsuccessful) {
                                                $rab.Finance.Filters = JSON.parse(jsondata);
                                                $rab.Finance.LoadAccountTypeNameFilters(values.accounttype);
                                                $rab.Finance.LoadIncomeDescription(values.accounttype, values.name);

                                                $("#selectAccountType").val(values.accounttype);
                                                $("#textboxAccountName").val(values.name);
                                                $("#textboxAccountSource").val(values.source);
                                                $("#textboxAccountDescription").val(values.description);

                                                $("#selectBranchNames").val(values.branchname)
                                                $("#textboxAccountPaymode").val(values.paymode)
                                                $("#textboxAccountDate").val(values.date)
                                                $("#textboxAccountAmount").val(values.amount)
                                                document.getElementById("buttonAccountAdd").style.display = "none";
                                                document.getElementById("buttonAccountUpdate").style.display = "block";

                                                document.getElementById("buttonAddFinanceDialog").click();

                                            }

                                        } catch (e) {
                                            alert(e.message);
                                        }

                                    }

                                );


                            } catch (e) {

                            }
                        };
                        //check if the logged in user is the one who created record and apply lock

                        if (fullname != parsed.Result[i].CreatedBy) buttonEdit.disabled = true;
                        //add data to table
                        tdFinanceID.appendChild(buttonEdit);
                        tr.appendChild(tdFinanceID);
                        tr.appendChild(tdBranchName);
                        tr.appendChild(tdDate);
                        tr.appendChild(tdAcounttype);
                        tr.appendChild(tdName);
                        tr.appendChild(tdDescription);
                        tr.appendChild(tdSource);
                        tr.appendChild(tdPaymode);
                        tr.appendChild(tdAmount);
                        tr.appendChild(tdCreatedBy);
                        tr.appendChild(tdCreatedon);

                        document.getElementById("tbodyFinance").appendChild(tr);
                        document.getElementById("buttonClose").click();

                    }

                }
            } catch (e) {
                //alert(e.message);
            }
        };
        inv.invoke();
    }
    catch (e) {

    }
}
$rab.Finance.LoadAccounts = function () {
    var obj = { branchName: $("#selectBranchNames").val(), accountType: $("#selectAccountTypeNames").val() };


    if (obj.branchName == "Select branch") { alert("Please select branch"); return; }
    if (obj.accountType == "Select account type") { alert("Please select account type"); return; }
    $rab.Finance.LoadAccountsSummaryByBranchAccountType();

    return;
    try {
        if (obj.branchName == "All" && obj.accountType == "All") {
            $rab.Finance.LoadAccountsSummary();
        }
        else if (obj.branchName == "Select branch") {
            throw new $rab.Exception("Please select branch")
        }
        else if ((obj.branchName != "Select branch" && obj.accountType == "Select account type")) {
            throw new $rab.Exception("Please select account type")

        }
        else {
            //do nothing
            $rab.Finance.LoadAccountsSummaryByBranchAccountType();
        }

    } catch (e) {
        alert(e.message);
    }


}
$(function () {

    try {
        // alert(new  $rab.Finance.BankTransaction().Name)
        //$rab.Security.Church.LoadBranches("selectBranchNames");
        //setTimeout($rab.Finance.LoadAccountsSummary, 3000);
        //if user is not a super user or a finance controller 
        // remove the option All from the branches
        //$rab.Finance.LoadStatisticsWindow();
        //hide reports button if user is not a superuser
        new $rab.Security.LockDown().PagePermission($rab.Finance.PermissionSet);
        setTimeout(new $rab.AuditTrail().PageVisited("Finance"), 1000);
        //master query should be displayed only to Super User and Finance Controller
        if (["SuperUser", "FinanceController"].indexOf($rab.Login.User.LoginType) == -1) $("#myBtn").remove();
        setTimeout(new $rab.AuditTrail().PageVisited("Finances"), 1000)

        if ($rab.Login.User.LoginType == "FinanceAdmin") {
            $rab.Security.Church.LoadBranches("selectBranchNames");
            // $rab.Security.Church.LoadBranches("selectBranchNames-1");
        }
        else if ($rab.Login.User.LoginType == "FinanceController" || $rab.Login.User.LoginType == "SuperUser") {
            $rab.Church.LoadBranches("selectBranchNames");
            //$rab.Church.LoadBranches("selectBranchNames-1");
        }
        // load plots
    } catch (e) {
        alert(e.message);
    }
});
$rab.Finance.LoadStatisticsWindow = function () {
    google.charts.load('current', { 'packages': ['corechart'] });
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

        var data = google.visualization.arrayToDataTable([
            ['Account', 'Amount'],
            ['Assets', 145],
            ['Income', 80],
            ['Expenditure', 74],
            ['Liability', 60],
        ]);

        var options = {
            title: 'Monthly Report for Northampton P.I.WC'
        };
        var options1 = {
            title: 'Monthly Report for Kettering Akan'
        };
        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        var chart1 = new google.visualization.PieChart(document.getElementById('piechart2'));
        chart.draw(data, options);
        chart1.draw(data, options1);
    }

}
$rab.Finance.Aggregation = function () {
    this.Compute = function () {
        try {

            var inv = new $rab.Server.Dispatcher();
            inv.url = "Finances.aspx/Aggregation";
            inv.obj = {
                branchName: $("#selectBranchNames").val(),
                fromdate: $("#textboxFromDate").val(),
                todate: $("#textboxToDate").val(),
            };
            var funch = this.BuildTableHeaders;
            inv.handler = function (jsondata) {
                try {
                    if (jsondata == null) { alert('failed to get report'); return false;}
                    if (jsondata == "failed getting aggregation") new $rab.Exception(jsondata);
                    var parsed = JSON.parse(jsondata);
                    //build the table headers

                    parsed.BreakDown = parsed.income;
                    parsed.BreakDownExpense = parsed.expenditure;
                    if (parsed.Message == "Update successful") {
                        $("#tbodyBranchBreakDown,#tbodydeficit,.theaders").empty();
                        $("#tbodyBranchExpenseBreakDown").empty();
                        funch(parsed.Branches);//build the table headers
                        //Income breakdown
                        for (var i = 0; i < parsed.BreakDown.length; i++) {
                            var tr = document.createElement("tr");
                            var tdName = document.createElement("td"); tdName.innerHTML = parsed.BreakDown[i].Name;
                            var tdBranch1015 = document.createElement("td"); tdBranch1015.innerHTML = parsed.BreakDown[i].Branch1015
                            var tdBranch1016 = document.createElement("td"); tdBranch1016.innerHTML = parsed.BreakDown[i].Branch1016
                            var tdBranch1017 = document.createElement("td"); tdBranch1017.innerHTML = parsed.BreakDown[i].Branch1017
                            var tdBranch1018 = document.createElement("td"); tdBranch1018.innerHTML = parsed.BreakDown[i].Branch1018
                            var tdBranch1019 = document.createElement("td"); tdBranch1019.innerHTML = parsed.BreakDown[i].Branch1019
                            //var tdBranch1020 = document.createElement("td"); tdBranch1020.innerHTML = parsed.BreakDown[i].Branch1020
                            //var tdBranch1021 = document.createElement("td"); tdBranch1021.innerHTML = parsed.BreakDown[i].Branch1021
                            //var tdBranch1022 = document.createElement("td"); tdBranch1022.innerHTML = parsed.BreakDown[i].Branch1022
                            //var tdBranch1023 = document.createElement("td"); tdBranch1023.innerHTML = parsed.BreakDown[i].Branch1023
                            //var tdBranch1024 = document.createElement("td"); tdBranch1024.innerHTML = parsed.BreakDown[i].Branch1024
                            //
                            //var tdBranch1025 = document.createElement("td"); tdBranch1025.innerHTML = parsed.BreakDown[i].Branch1025
                            //var tdBranch1026 = document.createElement("td"); tdBranch1026.innerHTML = parsed.BreakDown[i].Branch1026
                            //var tdBranch1027 = document.createElement("td"); tdBranch1027.innerHTML = parsed.BreakDown[i].Branch1027
                            //var tdBranch1028 = document.createElement("td"); tdBranch1028.innerHTML = parsed.BreakDown[i].Branch1028
                            //var tdBranch1029 = document.createElement("td"); tdBranch1029.innerHTML = parsed.BreakDown[i].Branch1029
                            //var tdBranch1030 = document.createElement("td"); tdBranch1030.innerHTML = parsed.BreakDown[i].Branch1030





                            var tdTotal = document.createElement("td"); tdTotal.innerHTML = parsed.BreakDown[i].Total


                            //var tdyear = document.createElement("td"); tdyear.innerHTML = 2018                
                            //var tdmonth = document.createElement("td"); tdmonth.innerHTML = 12  

                            tr.appendChild(tdName);
                            tr.appendChild(tdBranch1015);
                            tr.appendChild(tdBranch1016);
                            tr.appendChild(tdBranch1017);
                            tr.appendChild(tdBranch1018);
                            tr.appendChild(tdBranch1019);
                           // tr.appendChild(tdBranch1020);
                           // tr.appendChild(tdBranch1021);
                           // tr.appendChild(tdBranch1022);
                           // tr.appendChild(tdBranch1023);
                           // tr.appendChild(tdBranch1024);
                           // tr.appendChild(tdBranch1025);
                           // tr.appendChild(tdBranch1026);
                           // tr.appendChild(tdBranch1027);
                           // tr.appendChild(tdBranch1028);
                           // tr.appendChild(tdBranch1029);
                           // tr.appendChild(tdBranch1030);

                            tr.appendChild(tdTotal);
                            //tr.appendChild(tdyear);
                            //tr.appendChild(tdmonth);
                            document.getElementById("tbodyBranchBreakDown").appendChild(tr);
                        }
                        //on completion of income breakdown append each branch total
                        var trbodyIncome = document.getElementById("tbodyBranchBreakDown");
                        var lastrow = parsed.BreakDown.length;
                        trbodyIncome.insertRow(lastrow);
                        trbodyIncome.rows[lastrow].insertCell(0).innerHTML = "<h3>Total</h3>";
                        trbodyIncome.rows[lastrow].insertCell(1).innerHTML = "<h4>" + parsed.branchIncome.Branch1015.toString() + "</h4>";
                        trbodyIncome.rows[lastrow].insertCell(2).innerHTML = "<h4>" + parsed.branchIncome.Branch1016.toString() + "</h4>";
                        trbodyIncome.rows[lastrow].insertCell(3).innerHTML = "<h4>" + parsed.branchIncome.Branch1017.toString() + "</h4>";
                        trbodyIncome.rows[lastrow].insertCell(4).innerHTML = "<h4>" + parsed.branchIncome.Branch1018.toString() + "</h4>";
                        trbodyIncome.rows[lastrow].insertCell(5).innerHTML = "<h4>" + parsed.branchIncome.Branch1019.toString() + "</h4>";
                        //trbodyIncome.rows[lastrow].insertCell(6).innerHTML = "<h4>" + parsed.branchIncome.Branch1020.toString() + "</h4>";
                        //trbodyIncome.rows[lastrow].insertCell(7).innerHTML = "<h4>" + parsed.branchIncome.Branch1021.toString() + "</h4>";
                        //trbodyIncome.rows[lastrow].insertCell(8).innerHTML = "<h4>" + parsed.branchIncome.Branch1022.toString() + "</h4>";
                        //trbodyIncome.rows[lastrow].insertCell(9).innerHTML = "<h4>" + parsed.branchIncome.Branch1023.toString() + "</h4>";
                        //
                        //trbodyIncome.rows[lastrow].insertCell(10).innerHTML = "<h4>" + parsed.branchIncome.Branch1024.toString() + "</h4>";
                        //trbodyIncome.rows[lastrow].insertCell(11).innerHTML = "<h4>" + parsed.branchIncome.Branch1025.toString() + "</h4>";
                        //trbodyIncome.rows[lastrow].insertCell(12).innerHTML = "<h4>" + parsed.branchIncome.Branch1026.toString() + "</h4>";
                        //trbodyIncome.rows[lastrow].insertCell(13).innerHTML = "<h4>" + parsed.branchIncome.Branch1027.toString() + "</h4>";
                        //trbodyIncome.rows[lastrow].insertCell(14).innerHTML = "<h4>" + parsed.branchIncome.Branch1028.toString() + "</h4>";
                        //trbodyIncome.rows[lastrow].insertCell(15).innerHTML = "<h4>" + parsed.branchIncome.Branch1029.toString() + "</h4>";
                        //trbodyIncome.rows[lastrow].insertCell(16).innerHTML = "<h4>" + parsed.branchIncome.Branch1030.toString() + "</h4>";


                        trbodyIncome.rows[lastrow].insertCell(17).innerHTML = "<h4>" + parsed.branchIncome.Total.toString() + "</h4>";


                        //Expenditure breakdown
                        for (var i = 0; i < parsed.BreakDownExpense.length; i++) {
                            var tr = document.createElement("tr");
                            var tdName = document.createElement("td"); tdName.innerHTML = parsed.BreakDownExpense[i].Name;
                            var tdBranch1015 = document.createElement("td"); tdBranch1015.innerHTML = parsed.BreakDownExpense[i].Branch1015
                            var tdBranch1016 = document.createElement("td"); tdBranch1016.innerHTML = parsed.BreakDownExpense[i].Branch1016
                            var tdBranch1017 = document.createElement("td"); tdBranch1017.innerHTML = parsed.BreakDownExpense[i].Branch1017
                            var tdBranch1018 = document.createElement("td"); tdBranch1018.innerHTML = parsed.BreakDownExpense[i].Branch1018
                            var tdBranch1019 = document.createElement("td"); tdBranch1019.innerHTML = parsed.BreakDownExpense[i].Branch1019
                            //var tdBranch1020 = document.createElement("td"); tdBranch1020.innerHTML = parsed.BreakDownExpense[i].Branch1020
                            //var tdBranch1021 = document.createElement("td"); tdBranch1021.innerHTML = parsed.BreakDownExpense[i].Branch1021
                            //var tdBranch1022 = document.createElement("td"); tdBranch1022.innerHTML = parsed.BreakDownExpense[i].Branch1022
                            //var tdBranch1023 = document.createElement("td"); tdBranch1023.innerHTML = parsed.BreakDownExpense[i].Branch1023
                            //var tdBranch1024 = document.createElement("td"); tdBranch1024.innerHTML = parsed.BreakDownExpense[i].Branch1024
                            //
                            //var tdBranch1025 = document.createElement("td"); tdBranch1025.innerHTML = parsed.BreakDown[i].Branch1025
                            //var tdBranch1026 = document.createElement("td"); tdBranch1026.innerHTML = parsed.BreakDown[i].Branch1026
                            //var tdBranch1027 = document.createElement("td"); tdBranch1027.innerHTML = parsed.BreakDown[i].Branch1027
                            //var tdBranch1028 = document.createElement("td"); tdBranch1028.innerHTML = parsed.BreakDown[i].Branch1028
                            //var tdBranch1029 = document.createElement("td"); tdBranch1029.innerHTML = parsed.BreakDown[i].Branch1029
                            //var tdBranch1030 = document.createElement("td"); tdBranch1030.innerHTML = parsed.BreakDown[i].Branch1030






                            var tdTotal = document.createElement("td"); tdTotal.innerHTML = parsed.BreakDownExpense[i].Total

                            //var tdyear = document.createElement("td"); tdyear.innerHTML = 2018                
                            //var tdmonth = document.createElement("td"); tdmonth.innerHTML = 12  

                            tr.appendChild(tdName);
                            tr.appendChild(tdBranch1015);
                            tr.appendChild(tdBranch1016);
                            tr.appendChild(tdBranch1017);
                            tr.appendChild(tdBranch1018);
                            tr.appendChild(tdBranch1019);
                            //tr.appendChild(tdBranch1020);
                            //tr.appendChild(tdBranch1021);
                            //tr.appendChild(tdBranch1022);
                            //tr.appendChild(tdBranch1023);
                            //tr.appendChild(tdBranch1024);
                            //tr.appendChild(tdBranch1025);
                            //tr.appendChild(tdBranch1026);
                            //tr.appendChild(tdBranch1027);
                            //tr.appendChild(tdBranch1028);
                            //tr.appendChild(tdBranch1029);
                            //tr.appendChild(tdBranch1030);
                            tr.appendChild(tdTotal);
                            //tr.appendChild(tdyear);
                            //tr.appendChild(tdmonth);
                            document.getElementById("tbodyBranchExpenseBreakDown").appendChild(tr);
                        }
                        //append expenditure total to bottom of table
                        //on completion of income breakdown append each branch total
                        var trbodyExpenditure = document.getElementById("tbodyBranchExpenseBreakDown");
                        var lastrow = parsed.BreakDownExpense.length;
                        trbodyExpenditure.insertRow(lastrow);
                        trbodyExpenditure.rows[lastrow].insertCell(0).innerHTML = "<h3>Total</h3>";
                        trbodyExpenditure.rows[lastrow].insertCell(1).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1015.toString() + "</h4>";
                        trbodyExpenditure.rows[lastrow].insertCell(2).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1016.toString() + "</h4>";
                        trbodyExpenditure.rows[lastrow].insertCell(3).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1017.toString() + "</h4>";
                        trbodyExpenditure.rows[lastrow].insertCell(4).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1018.toString() + "</h4>";
                        //trbodyExpenditure.rows[lastrow].insertCell(5).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1019.toString() + "</h4>";
                        //trbodyExpenditure.rows[lastrow].insertCell(6).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1020.toString() + "</h4>";
                        //trbodyExpenditure.rows[lastrow].insertCell(7).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1021.toString() + "</h4>";
                        //trbodyExpenditure.rows[lastrow].insertCell(8).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1022.toString() + "</h4>";
                        //trbodyExpenditure.rows[lastrow].insertCell(9).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1023.toString() + "</h4>";
                        //trbodyExpenditure.rows[lastrow].insertCell(10).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1024.toString() + "</h4>";
                        //
                        //trbodyExpenditure.rows[lastrow].insertCell(11).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1025.toString() + "</h4>";
                        //trbodyExpenditure.rows[lastrow].insertCell(12).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1026.toString() + "</h4>";
                        //trbodyExpenditure.rows[lastrow].insertCell(13).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1027.toString() + "</h4>";
                        //trbodyExpenditure.rows[lastrow].insertCell(14).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1028.toString() + "</h4>";
                        //trbodyExpenditure.rows[lastrow].insertCell(15).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1029.toString() + "</h4>";
                        //trbodyExpenditure.rows[lastrow].insertCell(16).innerHTML = "<h4>" + parsed.branchExpenditure.Branch1030.toString() + "</h4>";







                        trbodyExpenditure.rows[lastrow].insertCell(17).innerHTML = "<h4>" + parsed.branchExpenditure.Total.toString() + "</h4>";

                        //var table = document.createElement("table"); table.className="table table-hover table-responsive"
                        //var tbody = document.createElement("tbody");
                        var tbody = document.getElementById("tbodydeficit");
                        //table.appendChild(tbody);
                        tbody.insertRow(0);
                        tbody.rows[0].insertCell(0).innerHTML = "Deficit/Surplus"
                        tbody.rows[0].insertCell(1).innerHTML = parsed.deficitOrSurplus.Branch1015.toString()
                        tbody.rows[0].insertCell(2).innerHTML = parsed.deficitOrSurplus.Branch1016.toString()
                        tbody.rows[0].insertCell(3).innerHTML = parsed.deficitOrSurplus.Branch1017.toString()
                        tbody.rows[0].insertCell(4).innerHTML = parsed.deficitOrSurplus.Branch1018.toString()
                        tbody.rows[0].insertCell(5).innerHTML = parsed.deficitOrSurplus.Branch1019.toString()
                        //tbody.rows[0].insertCell(6).innerHTML = parsed.deficitOrSurplus.Branch1020.toString()
                        //tbody.rows[0].insertCell(7).innerHTML = parsed.deficitOrSurplus.Branch1021.toString()
                        //tbody.rows[0].insertCell(8).innerHTML = parsed.deficitOrSurplus.Branch1022.toString()
                        //tbody.rows[0].insertCell(9).innerHTML = parsed.deficitOrSurplus.Branch1023.toString()
                        //tbody.rows[0].insertCell(10).innerHTML = parsed.deficitOrSurplus.Branch1024.toString()
                        //
                        //tbody.rows[0].insertCell(11).innerHTML = parsed.deficitOrSurplus.Branch1025.toString()
                        //tbody.rows[0].insertCell(12).innerHTML = parsed.deficitOrSurplus.Branch1026.toString()
                        //tbody.rows[0].insertCell(13).innerHTML = parsed.deficitOrSurplus.Branch1027.toString()
                        //tbody.rows[0].insertCell(14).innerHTML = parsed.deficitOrSurplus.Branch1028.toString()
                        //tbody.rows[0].insertCell(15).innerHTML = parsed.deficitOrSurplus.Branch1029.toString()
                        //tbody.rows[0].insertCell(16).innerHTML = parsed.deficitOrSurplus.Branch1030.toString()


                        $("#myModal tr")
                            .each(function (th) {



                                for (var i = this.cells.length-1; i > 0; i--) {

                                    if (i > parsed.Branches.length-1) $(this.cells[i]).remove();


                                }
                            

                        });








                    }
                } catch (e) {
                    alert(e.message);
                }
            };
            if (inv.obj.branchName == "Select branch") { throw new $rab.Exception("Select branch") }
            if (inv.obj.fromdate.trim().length < 10 )
            { throw new $rab.Exception("Invalid date, enter from date in the format dd/mm/yyyy") }
            if (inv.obj.todate.trim().length < 10 )
            { throw new $rab.Exception("Invalid date, enter to date in the format dd/mm/yyyy") }
            var res = new Date(inv.obj.fromdate);
            inv.invoke();
        } catch (e) {
            alert(e.message);
        }
    }
    this.BuildTableHeaders = function (branches) {
        try {
            //build table headers dynamically
            //branches: array of branches
            if (branches == null || branches.length == 0) alert("no branches currently present");
            $(".theaders").each(function (val) {
                try {
                    this.insertRow(0);
                    for (var i = 0; i < branches.length; i++) {
                        if (i == 0) {
                            //this is where column one goes with title
                            if (this.dataset.account == "income") this.rows[0].insertCell(i).innerHTML = "Income";
                            else if (this.dataset.account == "expenditure") this.rows[0].insertCell(i).innerHTML = "Expenditure";
                            else if (this.dataset.account == "deficitOrsurplus") this.rows[0].insertCell(i).innerHTML = "Deficit/Surplus";

                        } else {
                            // every other column goes here
                            this.rows[0].insertCell(i).innerHTML = branches[i - 1];
                        }


                    }

                } catch (e) {

                }

            });

        } catch (e) {
            alert(e.message);
        }
    }
}
$rab.Finance.LoadAccountTypeNameFilters = function (accountName) {
    //load account filters based on account type selected
    try {
        //reject unwanted selection
        if (accountName == "Select account type") {
            $("#textboxAccountName").empty();
            $("#textboxAccountPaymode").empty();
            $("#textboxAccountDescription").empty();
            return false;
        }
        //call for appropriate
        $("#textboxAccountName").empty();
        $("#textboxAccountPaymode").empty();
        $("#textboxAccountDescription").empty();
        fillOptions($rab.Finance.Filters.Paymode.map(function (val) { return val.Name; }).sort(), "textboxAccountPaymode");
        switch (accountName) {
            case "Income":
                fillOptions(["Select account name"], "textboxAccountName");
                fillOptions($rab.Finance.Filters.IncomeItem.map(function (val) { return val.Name; }), "textboxAccountName");

                break;
            case "Expenditure":
                fillOptions(["Select account name"], "textboxAccountName");
                fillOptions($rab.Finance.Filters.ExpenditureItem.map(function (val) { return val.Name; }), "textboxAccountName")
                break;
            case "Liability":
                //fillOptions($rab.Finance.Filters.IncomeItem.map(function (val) { return val.Name; }))
                break;
            case "Assets":
                //fillOptions($rab.Finance.Filters.IncomeItem.map(function (val) { return val.Name; }))
                break;
            default:
        }
    } catch (e) {
        // alert(e.message);
    }
    function fillOptions(filter, element) {
        //filter: array of strings
        //element: select element to populate
        if (filter === null) return false;
        var array = [];
        for (var i = 0; i < filter.length; i++) {
            var option = document.createElement("option");
            if (array.indexOf(filter[i]) == -1) {
                option.value = filter[i];
                option.innerHTML = filter[i];
                document.getElementById(element).appendChild(option);
                array.push(filter[i]);
            }
        }

    };
}
$rab.Finance.GetFilters = function () {
    //load account filters based on account type selected
    try {
        //reject unwanted selection
        if ($("#selectBranchNames").val() == "Select branch") return false;
        //call for appropriate
        var inv = new $rab.Server.Dispatcher();
        inv.url = "Finances.aspx/AccountFilters";
        inv.obj = { branchName: $("#selectBranchNames").val() };
        inv.handler = function (jsondata) {
            //load account type names
            try {
                if (jsondata == "failed getting account filters") throw new $rab.Exception(jsondata);
                var isloadsuccessful = (JSON.parse(jsondata).message == "load successful");
                if (isloadsuccessful) {
                    $rab.Finance.Filters = JSON.parse(jsondata);
                }

            } catch (e) {
                alert(e.message);
            }

        }
        inv.invoke();
    } catch (e) {
        // alert(e.message);
    }
}
$rab.Finance.GetEditFilters = function (handler) {
    //load account filters based on account type selected
    try {
        //reject unwanted selection
        if ($("#selectBranchNames").val() == "Select branch") return false;
        //call for appropriate
        var inv = new $rab.Server.Dispatcher();
        inv.url = "Finances.aspx/AccountFilters";
        inv.obj = { branchName: $("#selectBranchNames").val() };
        inv.handler = handler;

        inv.invoke();
    } catch (e) {
        // alert(e.message);
    }
}
$rab.Finance.LoadIncomeDescription = function (accountType, incomeName) {
    try {
        if ($rab.Finance.Filters == "") return false;
        //load income description into textboxincome descripton
        $("#textboxAccountDescription").empty();
        //search for selected income name and return all the description
        //var accountType = $("#selectAccountType").val();
        if (accountType == "Select account type") { alert("Please select account type"); return false }
        switch (accountType) {
            case "Income":
                var des = $rab.Finance.Filters.IncomeItem.filter(function (val) { return val.Name == incomeName; });
                if (des != null && des.length != 0) {
                    var searchmatch = des.map(function (val) { return val.Description })
                    $rab.Utilities.FillOptions(["Select income description"], "textboxAccountDescription");
                    $rab.Utilities.FillOptions(searchmatch.sort(), "textboxAccountDescription");
                }


                break;
            case "Expenditure":
                var des = $rab.Finance.Filters.ExpenditureItem.filter(function (val) { return val.Name == incomeName; });
                if (des != null && des.length != 0) {
                    var searchmatch = des.map(function (val) { return val.Description })
                    $rab.Utilities.FillOptions(["Select income description"], "textboxAccountDescription");
                    $rab.Utilities.FillOptions(searchmatch.sort(), "textboxAccountDescription");
                }

                break;
            case "Liability":
                break;
            case "Assets":
                break;
            default:
                break;
        }

    } catch (e) {

    }
}
$rab.Finance.AccountFilters = function () {
    this.Add = function () {


        try {


            var inv = new $rab.Server.Dispatcher();
            inv.url = "Finances.aspx/AddAccountFilters";
            inv.obj = {
                accountName: $("#selectAccountTypeFilter").val(),
                name: $("#textboxfilterName").val(),
                description: $("#textboxfilterDescription").val(),
                branchName: $("#selectBranchNames").val(),
                source: $("#textboxfilterSourceDescription").val(),
            };
            inv.handler = function (jsondata) {
                try {
                    if (jsondata == "failed adding filter") new $rab.Exception(jsondata);
                    var parsed = JSON.parse(jsondata);
                    if (parsed.message == "load successful") {
                        $rab.Finance.Filters = parsed;
                        document.getElementById("selectAccountType").selectedIndex = 0;
                        alert("success");
                        $("#textboxfilterName, #textboxfilterDescription, #textboxfilterSourceDescription").val("");
                        $("#BankTransactionsFilter input[type=text]").val("");


                        $("#BankTransactionsFilter select").each(function () { this.selectedIndex = 0 });
                    }
                } catch (e) {
                    alert(e.message);
                }
            };
            if (inv.obj.branchName == "Select branch") { throw new $rab.Exception("Select branch") }
            if (inv.obj.accountName == "Select account type") { throw new $rab.Exception("Select account type") }
            if (inv.obj.name.trim().length == 0) { throw new $rab.Exception("enter name of filter") }
            if (inv.obj.description.trim().length == 0) { throw new $rab.Exception("enter description") }
            inv.invoke();
        } catch (e) {
            alert(e.message);
        }
    }
}