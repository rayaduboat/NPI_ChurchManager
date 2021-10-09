$rab.GiftAid = $rab.GiftAid || {};
var Permissionset = ["SuperUser", "Gift Aid"]
$rab.GiftAid.Initialise = function () {
    // Get the modaldonation

};
$(function () {
    try {
        //$rab.GiftAid.Initialise();
        new $rab.Security.LockDown().PagePermission(Permissionset)
        $rab.Security.Church.LoadBranches("selectBranchNames");
        setTimeout(new $rab.AuditTrail().PageVisited("Gift Aid"), 1000)
        var modaldonation = document.getElementById('myModal');

        // Get the <span> element that modaldonationcloses the modaldonation
        var span = document.getElementsByClassName("modaldonationclose")[0];



        // When the user clicks on <span> (x), modaldonationclose the modaldonation
        span.onclick = function () {
            modaldonation.style.display = "none";
        }

        // When the user clicks anywhere outside of the modaldonation, modaldonationclose it
        window.onclick = function (event) {
            try {
                if (event.target == modaldonation) {
                    modaldonation.style.display = "none";
                    new $rab.GiftAid().LoadGiftAiders();
                }
            } catch (e) {

            }
           
        }
    } catch (e) {
        alert(e.message);
    }


});
$rab.GiftAid = function () {
    this.obj = {
        ID: 0,
        BranchID: new $rab.Branch().BranchInfo.BranchID,
        MemberID: $("#selectGiftMemberID").val(),
        GIftAidId: $("#textboxGIftAidId").val(),
        DateRegistered: $("#textboxDateRegistered").val().split("/")[2] + $("#textboxDateRegistered").val().split("/")[1] + $("#textboxDateRegistered").val().split("/")[0],
        NINumber: $("#textboxNINumber").val(),
        CreatedOn: 00000,
        CreatedBy: $rab.Login.User.MemberID,

    }
    this.Add = function () {

        if (!this.IsInputValid()) return;
        var url = "Giving.aspx/AddGiftAid";
        new $rab.Server.Method().BeginInvoke(url, { user: this.obj }, function (jsondata) {
            try {
                if (jsondata == "Member already registered") { alert("Member already registered"); return; }
                if (jsondata == "Failed updating data") { alert("Failed adding member"); return; }
                document.getElementsByClassName("modaldonationclose")[0].click();
                new $rab.GiftAid().LoadGiftAiders();
                //$rab.GiftAid.LoadGiftAiders(JSON.parse(jsondata));
            } catch (e) {
                alert(e.message);
            }


        });


    }
    this.IsInputValid = function () {
        var displaydate = $("#textboxDateRegistered").val();
        var selectGiftMemberID = $("#selectGiftMemberID").val();
        
        if (selectGiftMemberID=="Select member"||this.obj.MemberID == null || this.obj.MemberID.toString().length == 0 || parseInt(this.obj.MemberID) <= 0) { alert('failed to get member id'); return false; }
        if (this.obj.BranchID == null || this.obj.BranchID.toString().length == 0 || parseInt(this.obj.BranchID) <= 0) { alert('failed to get branch id'); return false; }
        //if (this.obj.GIftAidId == null || this.obj.GIftAidId.toString().length == 0) { alert('invalid gift aid id'); return false; }
        //if (displaydate == null || displaydate.toString().length != 10 || new Date(displaydate).toLocaleDateString() == "Invalid Date") { alert('invalid date'); return false; }
        if (this.obj.GIftAidId == null) this.obj.GIftAidId = "Not supplied";
        return true;
    }
    this.Update = function () {
        var url = "Giving.aspx/UpdateGiftAid";
        new $rab.Server.Method().BeginInvoke(url, { user: this.obj }, function (jsondata) {
            try {

            } catch (e) {

            }
        })
    }
    this.Delete = function () {
        var url = "Giving.aspx/DeleteGiftAid";
        new $rab.Server.Method().BeginInvoke(url, { user: this.obj }, function (jsondata) {
            try {

            } catch (e) {

            }
        })
    }
    this.LoadGiftAiders = function () {

        try {
            //CHECK IF BRANCH HAS BEEN SELECTED
            $("#tbodyTotalContribution").empty();
            if (new $rab.Branch().BranchInfo.BranchName == "Select branch") {
                 
                return;
            } //throw new $rab.Exception("Please select branch");
            var url = "Giving.aspx/GetGiftAiders";
            new $rab.Server.Method().BeginInvoke(url, { userid: new $rab.Branch().BranchInfo.BranchID }, function (jsondata) {
                try {
                    if (jsondata == "Member already registered") { alert("Member already registered"); return; }
                    if (jsondata == "Failed updating data") { alert("Failed adding member"); return; }

                    $rab.GiftAid.LoadGiftAiders(JSON.parse(jsondata));
                } catch (e) {
                    alert(e.message);
                }


            });

        } catch (e) {
            alert(e.message);
        }


    }
    this.ClearInputs = function () {
        try {
            $('#tbodyTotalContribution').empty();
            $(".modal-dialog-1 input[type=text]").val("");
            $(".modal-dialog-1 select").each(function (val) {
                //$(this).empty();
                //$rab.Utilities.FillOptions(["Select member"], "selectGiftMemberID");
                this.selectedIndex = 0;
            });
        } catch (e) {

        }
    }
}
$rab.GiftAid.DisplayForm = function (section) {
    //section: which section of modal to display
    //check if branch is selected and reject modal display  if not
    if (new $rab.Branch().BranchInfo.BranchName == "Select branch") { alert("please select branch"); return; }
    try {
        //alert("message");
        if (section == "addGiftAid") {
            var modaldonation = document.getElementById('myModal');
            modaldonation.style.display = "block";
            //  hide member contribitution
            $("#sectionBreakdown").hide();
            $("#sectionGiftAid").show();
            $("#sectionStatistics").hide();
        }
        else if (section == "addgiving") {
            var modaldonation = document.getElementById('myModal');
            modaldonation.style.display = "block";
            //   hide member contribitution
            $("#sectionBreakdown").show();
            $("#sectionGiftAid").hide();
            $("#sectionStatistics").hide();
        }
        else if (section == "statistics") {
            var modaldonation = document.getElementById('myModal');
            modaldonation.style.display = "block";
            //   hide member contribitution
            $("#sectionBreakdown").hide();
            $("#sectionGiftAid").hide();
            $("#sectionStatistics").show();
        }

    } catch (e) {
        alert(e.message);
    }
}
$rab.GiftAid.LoadMemberNames = function (jsondata) {
    try {


        if (jsondata === null) return false;
        var parsed = JSON.parse(jsondata);
        var array = [];
        var elements = ["selectGiftMemberID", "selectedMemberNames"];

        for (var j = 0; j < elements.length; j++) {
            var element = elements[j];
            $("#" + element).empty();
            for (var i = 0; i < parsed.length; i++) {
                var option = document.createElement("option");

                option.value = parsed[i].MemberID;
                option.innerHTML = parsed[i].LastName + " " + parsed[i].FirstName;
                document.getElementById(element).appendChild(option);


            }
        }

    } catch (e) {

    }
}

$rab.GiftAid.LoadGiftAiders = function (user) {
    try {
        // user: list of gift aider givings

        //var columns=["ID","LastName","FirstName","Amount","GiftAid","Donation","LastUpdated"]
        var tbody = $("#tbodyTotalContribution");
        $("#tbodyTotalContribution").empty();
        //if (user.givers.length == 0) alert("No gift aiders to load");
        for (var i = 0; i < user.givers.length; i++) {
            try {
                var tr = document.createElement("tr");
                var tdID = document.createElement("td"); tdID.innerHTML = user.givers[i].ID;
                var tdLastName = document.createElement("td"); tdLastName.innerHTML = user.givers[i].LastName;
                var tdFirstName = document.createElement("td"); tdFirstName.innerHTML = user.givers[i].FirstName;
                var tdAmount = document.createElement("td"); tdAmount.innerHTML = user.givers[i].Amount;
                var tdGiftAid = document.createElement("td"); tdGiftAid.innerHTML = user.givers[i].GiftAidAmount;
                var tdDonation = document.createElement("td");//tdDonation     .innerHTML =0;

                var btnsave = document.createElement("button");
                btnsave.innerHTML = "Add";
                btnsave.Giver = user.givers[i];
                btnsave.onclick = function () {
                    try {
                        $("#tbodyMembersdata").empty();
                        //display modal with member contributions
                        $("#spanGiftAider").val("");
                        $("#spanGiftAiderID").val("");
                        $rab.GiftAid.DisplayForm("addgiving");
                        //set the donor name

                        $("#spanGiftAider").html(this.Giver.LastName + " " + this.Giver.FirstName)
                        $("#spanGiftAiderID").html(this.Giver.GiftAidID)
                        document.getElementById("spanGiftAiderID").Giver = this.Giver;
                        //get member givings
                        var memid = this.Giver.MemberID;
                        new $rab.Server.Method().BeginInvoke("Giving.aspx/GetMemberGiving", { memberId: memid }, function (data) {
                            $rab.GiftAid.LoadGivings(data);
                        })

                    } catch (e) {

                    }
                }
                var date = user.givers[i].LastUpdated;
                if (date.toString().length == 8) {
                    var yyyy = date.toString().substring(0, 4);
                    var mm = date.toString().substring(4, 6);
                    var dd = date.toString().substring(6, 8);
                    date = dd + "/" + mm + "/" + yyyy;
                } else {
                    //do nothing
                }

                var tdLastUpdated = document.createElement("td"); tdLastUpdated.innerHTML = date;
                //
                tdDonation.appendChild(btnsave);
                tr.appendChild(tdID);
                tr.appendChild(tdLastName);
                tr.appendChild(tdFirstName);
                tr.appendChild(tdAmount);
                tr.appendChild(tdGiftAid);
                tr.appendChild(tdDonation);
                tr.appendChild(tdLastUpdated);
                tbody.append(tr);
            } catch (e) {

            }
            

        }


    } catch (e) {
        alert(e.message);
    }
}
$rab.GiftAid.ShowAddInputs = function (trtoggleInput) {
    try {
        document.getElementsByClassName("modaldonationclose")[0].click();
        new $rab.GiftAid().LoadGiftAiders();

        //  $("#tbodyMembers input[type=text]").val("");
        //  $("#tbodyMembers select").each(function (val) { this.selectedIndex = 0 });
        //  if (trtoggleInput.style.display == "none") trtoggleInput.style.display = "block";

    } catch (e) {

    }
}
$rab.GiftAid.LoadGivings = function (data) {
    //data : data is an array
    $("#tbodyMembersdata").empty();
    try {
        if (data == "failed to add giving") {
            alert(data); return;
        }


        var data = JSON.parse(data);
        for (var i = 0; i < data.result.length; i++) {


            var tr = document.createElement("tr");
            var tdindex = document.createElement("td"); tdindex.innerHTML = data.result[i].ID;


            var tddate = document.createElement("td"); tddate.innerHTML = data.result[i].Date;
            var tdfund = document.createElement("td"); tdfund.innerHTML = data.result[i].Fund;
            var tdmethod = document.createElement("td"); tdmethod.innerHTML = data.result[i].Method;
            var tdamount = document.createElement("td"); tdamount.innerHTML = data.result[i].Amount;
            var tdgiftaid = document.createElement("td"); tdgiftaid.innerHTML = data.result[i].GiftAid;

            var tdstatus = document.createElement("td"); tdstatus.innerHTML = data.result[i].Status;
            var tdedit = document.createElement("td");   //tdtdedit  .innerHTML = data.result[i].GiftAid;
            var button = document.createElement("button");
            button.innerHTML = "edit";
            button.Record = data.result[i];
            button.tr = tr;
            //when button is clicked load information into input controls and then
            button.onclick = function () {

                $("#labelgivingID").html(this.Record.ID),
                    $("#textboxDonationDate").val(this.Record.Date.toString().substring(6, 8) + "/" + this.Record.Date.toString().substring(4, 6) + "/" + this.Record.Date.toString().substring(0, 4)),
                    $("#selectFund").val(this.Record.Fund),
                    $("#selectMethod").val(this.Record.Method),
                    $("#txtDonatedAmount").val(this.Record.Amount),
                    document.getElementById("buttonsavegiving").Record = this.Record;
                document.getElementById("buttonsavegiving").innerHTML = "Update";
                document.getElementById("buttonsavegiving").style.backgroundColor = "red";
                document.getElementById("buttonsavegiving").style.color = "white";
                $(this.tr).remove();
                $("html, body").animate({ scrollTop: 0 }, "slow");
            };
            tdedit.appendChild(button);

            var tdcreatedon = document.createElement("td"); tdcreatedon.innerHTML = data.result[i].CreatedOn;
            var tdcreatedby = document.createElement("td"); tdcreatedby.innerHTML = data.result[i].CreatedBy;

            tr.appendChild(tdindex);
            tr.appendChild(tddate)
            tr.appendChild(tdfund)
            tr.appendChild(tdmethod)
            tr.appendChild(tdamount);
            tr.appendChild(tdgiftaid)

            tr.appendChild(tdstatus);
            tr.appendChild(tdedit);

            tr.appendChild(tdcreatedon)
            tr.appendChild(tdcreatedby)




            document.getElementById("tbodyMembersdata").appendChild(tr);
        }
        //reset controls
        $("#tbodyMembers input[type=text]").val("");
        $("#tbodyMembers label").html("");
        $("#tbodyMembers select").each(function (val) { this.selectedIndex = 0 });
        $("#buttonsavegiving").css({ color: "black", backgroundColor: "green" });
        $("#buttonsavegiving").html("save")
    } catch (e) {

    }
}
$rab.GiftAid.Statistics = function () {

    try {

        $rab.GiftAid.DisplayForm("statistics");
        var url = "Giving.aspx/Statistics";
        var data = { branchid: new $rab.Branch().BranchInfo.BranchID };
        if (new $rab.Branch().BranchInfo.BranchName == "Select branch" || parseInt(data.branchid) == 0) {
              return;
        }
        new $rab.Server.Method().BeginInvoke(url, data, function (data) {
            $("#tbodystatistics").empty();
            try {
                if (data == "failed to statistics") {
                    alert(data); return;
                }


                var data = JSON.parse(data);
                for (var i = 0; i < data.result.length; i++) {


                    var tr = document.createElement("tr");
                    // var tdindex   = document.createElement("td"); tdindex  .innerHTML = data.result[i].ID        ;
                    var tdMonth = document.createElement("td"); tdMonth.innerHTML = data.result[i].Month;
                    var tdYear = document.createElement("td"); tdYear.innerHTML = data.result[i].Year;
                    var tdAmount = document.createElement("td"); tdAmount.innerHTML = data.result[i].Amount;
                    var tdGiftAid = document.createElement("td"); tdGiftAid.innerHTML = data.result[i].GiftAid;

                    // tr.appendChild(tdindex);
                    tr.appendChild(tdMonth)
                    tr.appendChild(tdYear)
                    tr.appendChild(tdAmount)
                    tr.appendChild(tdGiftAid)

                    document.getElementById("tbodystatistics").appendChild(tr);
                }

            } catch (e) { }

            //
        });
    } catch (e) {

    }
}
