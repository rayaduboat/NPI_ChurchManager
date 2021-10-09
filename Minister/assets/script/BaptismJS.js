$rab.Baptism = $rab.Baptism || {};
$rab.Baptism.BaptisedMembers = "";
$rab.Baptism.Permissionset = ["All", "SuperUser", "Baptism"];
$rab.MassUpdateMatrix = new Array();
$rab.Membership.BuildMemberBaptism = function (jsondata) {


    try {

        var members = JSON.parse(jsondata);
        // get all baptised members and ids from server
        // for each enable create button if there is no record
        // disable create button if there is a record

        $("#tbodyMembers").empty();
        var table = document.getElementById("tbodyMembers");
        for (var i = 0; i < members.length; i++) {
            // add member records 
            var tr = document.createElement("tr");
            tr.Record = members[i];
            var tdFirstName = document.createElement("td"); tdFirstName.className = "body-item mbr-fonts-style display-7"; tdFirstName.innerHTML = members[i].FirstName;
            var tdLastName = document.createElement("td"); tdLastName.className = "body-item mbr-fonts-style display-7"; tdLastName.innerHTML = members[i].LastName;
            var tdTelephone = document.createElement("td"); tdTelephone.className = "body-item mbr-fonts-style display-7"; tdTelephone.innerHTML = members[i].Telephone;
            var tdEmail = document.createElement("td"); tdEmail.className = "body-item mbr-fonts-style display-7"; tdEmail.innerHTML = members[i].Email;
            //var tdMembershipType = document.createElement("td"); tdMembershipType.className = "body-item mbr-fonts-style display-7"; tdMembershipType.innerHTML = members[i].MembershipType;
            var tdEdit = document.createElement("td"); tdEdit.className = "body-item mbr-fonts-style display-7";//
            var button = document.createElement("span"); button.innerHTML = "Edit";
            button.Record = members[i];
            button.onclick = function () {
                $rab.Baptism.GetBaptised();//reload data just incase a previous update has been made
                //populate the input controls
                $("input[type=text]").val("");//clear alll inputs

                document.getElementById("textboxMemberID").value = this.Record.MemberID;
                document.getElementById("textboxBaptismID").value = this.Record.BaptismID;
                //document.getElementById("textboxDateBaptised").value = new Date().toLocaleDateString();
                document.getElementById("divModaltitle").innerHTML = "Edit member baptism details for: <kbd>" + this.Record.FirstName + " " + this.Record.LastName + "</kbd>";
                //  document.getElementById("textboxOfficiatingMinister").value = $rab.Church.Minister;
                //check if member has baptism record and then disable or enable create button
                var memID = this.Record.MemberID;
                var searchRes = $rab.Baptism.BaptisedMembers.filter(function (val) { return val.MemberID == memID });
                if (searchRes.length > 0) {

                    //member record already exist disable create button and enable update button
                    try {
                        $("#buttonAdd").css("display", "none");
                        $("#buttonUpdate").attr("disabled", false);
                        $("#buttonUpdate").css("display", "block");
                        //populate inputs with existing records from the database
                        //textboxMemberID 

                        // fill water baptism
                        document.getElementById("textboxBaptismID").value = searchRes[0].BaptismID;
                        document.getElementById("textboxDateBaptised").value = searchRes[0].DateofBaptism;
                        document.getElementById("textboxLocation").value = searchRes[0].PlaceOfBaptism;
                        document.getElementById("textboxCertificationDate").value = searchRes[0].CertifiedDate;


                        // fillin right hand of fellowship
                        document.getElementById("textboxRHFElderMinister").value = searchRes[0].RHFOfficer;
                        document.getElementById("textboxRHDFellowshipDate").value = searchRes[0].RHFDate;
                        // fill in Holy Spirit baptism
                        document.getElementById("SelectIsHolySpiritBaptised").value = searchRes[0].IsHolySpiritBaptised;
                        document.getElementById("textboxDateHolySpiritBaptised").value = searchRes[0].HolySpiritBaptisedDate;
                        document.getElementById("textboxOfficiatingMinister").value = searchRes[0].OfficiatingMinister;
                        //, textboxLocation, textboxDateBaptised, 
                        //textboxOfficiatingMinister

                    } catch (e) {
                        alert(e.message);
                    }

                } else {
                    try {
                        $("#buttonAdd").attr("disabled", false);
                        $("#buttonAdd").css("display", "block");
                        $("#buttonUpdate").css("display", "none");
                    } catch (e) {
                        alert(e.message);
                    }
                }
                document.getElementById("buttonDialog").click();
            }
            button.className = "form-control text-center";
            tdEdit.appendChild(button);
            //tdEdit.appendChild(spanEmail);
            tr.appendChild(tdFirstName);
            tr.appendChild(tdLastName);
            tr.appendChild(tdTelephone);
            tr.appendChild(tdEmail);
            //tr.appendChild(tdMembershipType);
            tr.appendChild(tdEdit);
            table.appendChild(tr);
        }


    } catch (e) {

    }


}
$rab.Baptism.GetBaptised = function () {
    try {
        var url, obj, handler;
        url = "Baptism.aspx/GetBaptisedMembers";
        obj = { branchName: $("#selectBranchNames").val() };

        handler = function (retVal) {
            "option strict"
            try {
                $rab.Baptism.BaptisedMembers = JSON.parse(retVal);
            } catch (e) {
                alert(e.message);
            }


        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {
        alert(e.message);
    }
}
$rab.Baptism.Add = function (jsondata) {
    try {
        // validate required inputs
        var url, obj, handler;
        url = "Baptism.aspx/AddBaptism";
        //textboxMemberID textboxRHFElderMinister 
        //textboxRHDFellowshipDate, textboxLocation, textboxDateBaptised, 
        //textboxOfficiatingMinister
        //if ($("#textboxBaptismID").val().trim().length == 0) throw new $rab.Exception("Invalid baptism ID");
        if ($("#textboxOfficiatingMinister").val().trim().length == 0) throw new $rab.Exception("Please enter water baptism officiating minister");
        if ($("#textboxDateBaptised").val().trim().length == 0) throw new $rab.Exception("Please enter date of water baptism");
        if ($("#textboxLocation").val().trim().length == 0) throw new $rab.Exception("Enter location where water baptism took place");
        obj = {
            memberID: $("#textboxMemberID").val(),
            officiatingMinister: $("#textboxOfficiatingMinister").val(),
            dateOfBaptism: $("#textboxDateBaptised").val(),
            baptismLocation: $("#textboxLocation").val(),
            certificationDate: $("#textboxCertificationDate").val(),
            rhfDate: $("#textboxRHDFellowshipDate").val(),
            rhfOfficer: $("#textboxRHFElderMinister").val(),
            isHolySpiritBaptised: $("#SelectIsHolySpiritBaptised").val(),
            holySpiritBaptisedDate: $("#textboxDateHolySpiritBaptised").val(),
            branchid: new $rab.Branch().BranchInfo.BranchID,
            isnewConvertWaterBaptised: $("#selectIsNewConvertWaterBaptised").val(),
            isoldMemberHolySpiritBaptised: $("#selectIsOldMemberHolySpiritBaptised").val(),
        };
        handler = function (retVal) {
            "option strict"
            //check output from server if adding data was successful
            try {
                if (retVal != "Update successful") throw new $rab.Exception(retVal);
                alert(retVal);
                // kill the dialog
                $("#buttonCloseModal").click();
            } catch (e) {
                alert(e.message);
            }
        }
        new $rab.Server.Method().BeginInvoke(url, { mem: obj }, handler);
    } catch (e) {
        alert(e.message);
    }
}
$rab.Baptism.Update = function (jsondata) {
    try {
        // validate required inputs
        var urlupdate, urladd, obj, handler;


        var record = document.getElementById("buttonUpdate").Record;
        if (record == null) { alert("oops getting baptism details failed"); return }

        if (isNaN(record.BaptismID) || record.BaptismID == 0) {
            //if baptism ID doesnt exist create
            url = "Baptism.aspx/AddBaptism";
        }
        else {
            //if baptism ID  exists update
            url = "Baptism.aspx/UpdateBaptism";
        }


        obj = {
            BaptismID: record.BaptismID,
            MemberID: record.MemberID,
            IsBornagain: $("#selectIsBornAgain").val(),
            DateBornagain: $("#textboxDateBornAgain").val(),
            IsWaterBaptised: $("#selectIsWaterBaptised").val(),
            OfficiatingMinister: $("#textboxOfficiatingMinister").val(),
            DateofBaptism: $("#textboxDateBaptised").val(),
            PlaceOfBaptism: $("#textboxLocation").val(),
            CertificationDate: $("#textboxCertificationDate").val(),
            RHFDate: $("#textboxRHDFellowshipDate").val(),
            RHFOfficer: $("#textboxRHFElderMinister").val(),
            IsHolySpiritBaptised: $("#SelectIsHolySpiritBaptised").val(),
            HolySpiritBaptisedDate: $("#textboxDateHolySpiritBaptised").val(),
            CreatedOn: 0,
            CreatedBy: $rab.Login.User.MemberID,
            BranchID: new $rab.Branch().BranchInfo.BranchID,
            IsNewConvertWaterBaptised: $("#selectIsNewConvertWaterBaptised").val(),
            IsOldMemberHolySpiritBaptised: $("#selectIsOldMemberHolySpiritBaptised").val(),
            IsCommunicant: $("#selectIsCommunicant").val(),

        };
        //handler = function (retVal) {
        //    //check output from server if adding data was successful
        //    try {
        //        //message = sz.Serialize(new { message = "Update successful", result=GetBaptisedMembers(mem.BranchID) });
        //        if (retVal == "Failed updating data") throw new $rab.Exception(retVal);
        //        $("#buttonCloseModal").click();
        //        $rab.Baptism.LoadBaptism();
        //        alert(retVal);
        //    } catch (e) {
        //        alert(e.message);
        //    }
        //}
        handler = function (jsondata) {

            try {
                $("#buttonCloseModal").click();
                $rab.Baptism.LoadBaptism(); return;
                //if (jsondata == "Failed getting baptism record") return;
                //var parsed = JSON.parse(jsondata);
                //$("#tbodyMembers").empty();
                //var tbody = document.getElementById("tbodyMembers");
                //for (var i = 0; i < parsed.result.length; i++) {
                //    try {
                //        tbody.insertRow(i);
                //        tbody.rows[i].insertCell(0).innerHTML = parsed.result[i].FirstName;
                //        tbody.rows[i].insertCell(1).innerHTML = parsed.result[i].LastName;
                //        tbody.rows[i].insertCell(2).innerHTML = parsed.result[i].IsBornAgain;
                //        tbody.rows[i].insertCell(3).innerHTML = parsed.result[i].IsWaterBaptised;
                //        tbody.rows[i].insertCell(4).innerHTML = parsed.result[i].IsCommunicant;
                //        tbody.rows[i].insertCell(5).innerHTML = parsed.result[i].IsHolySpiritBaptised;
                //        tbody.rows[i].insertCell(6).innerHTML = parsed.result[i].CreatedOn;
                //        tbody.rows[i].insertCell(7).innerHTML = parsed.result[i].CreatedBy;
                //        var tdEdit = tbody.rows[i].insertCell(8);



                //        var button = document.createElement("input");
                //        button.type = "button"; button.value = "update";
                //        button.Record = parsed.result[i];
                //        button.onclick = function () {
                //            try {
                //                $("#myModal input[type=text]").val("");
                //                $("#myModal select").each(function () { this.selectedIndex = 0; });
                //                //display header
                //                var header = document.getElementById("divModaltitle");
                //                header.innerHTML = "Edit baptism information for:<kbd" + this.Record.LastName + " " + this.Record.FirstName + "</kbd>";
                //                //display dialog
                //                document.getElementById("buttonDialog").click();
                //                //load all read data from the server                               


                //                $("#selectIsBornAgain").val(this.Record.IsBornagain == null ? "" : this.Record.IsBornagain);
                //                $("#textboxDateBornAgain").val(this.Record.DateBornagain == null ? "" : this.Record.DateBornagain);
                //                $("#selectIsWaterBaptised").val(this.Record.IsWaterBaptised == null ? "" : this.Record.IsWaterBaptised);
                //                $("#textboxOfficiatingMinister").val(this.Record.OfficiatingMinister == null ? "" : this.Record.OfficiatingMinister);
                //                $("#textboxDateBaptised").val(this.Record.DateofBaptism == null ? "" : this.Record.DateofBaptism);
                //                $("#textboxLocation").val(this.Record.PlaceOfBaptism == null ? "" : this.Record.PlaceOfBaptism);
                //                $("#textboxCertificationDate").val(this.Record.CertificationDate == null ? "" : this.Record.CertificationDate);
                //                $("#textboxRHDFellowshipDate").val(this.Record.RHFDate == null ? "" : this.Record.RHFDate);
                //                $("#textboxRHFElderMinister").val(this.Record.RHFOfficer == null ? "" : this.Record.RHFOfficer);
                //                $("#SelectIsHolySpiritBaptised").val(this.Record.IsHolySpiritBaptised == null ? "" : this.Record.IsHolySpiritBaptised);
                //                $("#textboxDateHolySpiritBaptised").val(this.Record.HolySpiritBaptisedDate == null ? "" : this.Record.HolySpiritBaptisedDate);

                //                $("#textboxIsNewConvertWaterBaptised").val(this.Record.IsNewConvertWaterBaptised == null ? "" : this.Record.IsNewConvertWaterBaptised);
                //                $("#selectIsOldMemberHolySpiritBaptised").val(this.Record.IsOldMemberHolySpiritBaptised == null ? "" : this.Record.IsOldMemberHolySpiritBaptised);

                //                $("#selectIsCommunicant").val(this.Record.IsCommunicant == null ? "" : this.Record.IsCommunicant);
                //                document.getElementById("buttonUpdate").Record = this.Record;

                //            } catch (e) {

                //            }
                //        }
                //        tdEdit.appendChild(button)
                //    } catch (e) {

                //    }
                //}

            } catch (e) {
                alert(e.message);
            }


        }
        new $rab.Server.Method().BeginInvoke(url, { mem: obj }, handler);
    } catch (e) {
        alert(e.message);
    }
}
$(function () {
    try {
        new $rab.Security.LockDown().PagePermission($rab.Baptism.Permissionset);
        $rab.Security.Church.LoadBranches("selectBranchNames");

        $('[data-toggle="popover"]').popover();
        setTimeout(new $rab.AuditTrail().PageVisited("Baptism"), 1000);



        $("#textboxsearchstring").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#tbodyMembers tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });


    } catch (e) {

    }
});
$rab.Baptism.GetBaptisedStatistics = function () {
    var obj = {
        BranchName: $("#selectBranchNames").val(),
        BranchID: document.getElementById("selectBranchNames").options[document.getElementById("selectBranchNames").selectedIndex].BranchID
    }
    try {
        $("#tdTotal").html("");
        $("#tdMenTotal").html("");
        $("#tdMenWaterBaptised").html("");
        $("#tdMenHolySpiritBaptised ").html("");
        $("#tdWomenTotal").html("");
        $("#tdWomenWaterBaptised").html("");
        $("#tdWomenHolySpiritBaptised").html("");
        $("#tdWaterBaptisedTotal").html("");
        $("#tdHolySpiritBaptisedTotal").html("");
        var info = obj;
        if (info.BranchName == "Please select branch") throw new $rab.Exception("Invalid branch selected");

        new $rab.Server.Method().BeginInvoke("Baptism.aspx/GetBaptisedStatistics", { brnInfo: obj }, function (jsondata) {
            try {
                if (jsondata == "failed getting membership bastism statistics") throw new $rab.Exception(jsondata);
                var parsed = JSON.parse(jsondata);
                //$("#tdBranchName").val(parsed[0].BranchName             );
                // $("#tdTotal").html(parsed[0].Total                  );
                // $("#tdMenTotal").html(parsed[0].MenTotal               );
                $("#tdMenWaterBaptised").html(parsed[0].MenWaterBaptised);
                $("#tdMenHolySpiritBaptised ").html(parsed[0].MenHolySpiritBaptised);
                // $("#tdWomenTotal").html(parsed[0].WomenTotal             );
                $("#tdWomenWaterBaptised").html(parsed[0].WomenWaterBaptised);
                $("#tdWomenHolySpiritBaptised").html(parsed[0].WomenHolySpiritBaptised);
                $("#tdWaterBaptisedTotal").html(parsed[0].WaterBaptisedTotal);
                $("#tdHolySpiritBaptisedTotal").html(parsed[0].HolySpiritBaptisedTotal);

                // $("#tdWaterBaptisedTotal").html(parsed[0].MenWaterBaptised + parsed[0].WomenWaterBaptised);
                // $("#tdWaterBaptisedTotal").html(parsed[0].MenWaterBaptised + parsed[0].WomenWaterBaptised);

            } catch (e) {

            }


        })
    } catch (e) {

    }
}
$rab.Baptism.LoadBaptism = function () {
    try {


        var url, obj, handler;
        url = "Baptism.aspx/GetBaptisedMembers";
        obj = { branchID: new $rab.Branch().BranchInfo.BranchID };
        if (new $rab.Branch().BranchInfo.BranchName == "Please select branch") { return }
        $("#tbodyMembers").empty();
        handler = function (jsondata) {
            "option strict"
            try {
                //$rab.Membership.BuildMemberBaptism(jsondata)
                if (jsondata == "Failed getting baptism record") { alert(jsondata);; return; }
                var parsed = JSON.parse(jsondata);

                var tbody = document.getElementById("tbodyMembers");
                for (var i = 0; i < parsed.result.length; i++) {
                    try {
                        tbody.insertRow(i);
                        var tdEdit = tbody.rows[i].insertCell(0);
                        tbody.rows[i].insertCell(1).innerHTML = parsed.result[i].FirstName;
                        tbody.rows[i].insertCell(2).innerHTML = parsed.result[i].LastName;
                        tbody.rows[i].insertCell(3).innerHTML = parsed.result[i].IsBornAgain;
                        tbody.rows[i].insertCell(4).innerHTML = parsed.result[i].IsWaterBaptised;
                        tbody.rows[i].insertCell(5).innerHTML = parsed.result[i].IsCommunicant;
                        tbody.rows[i].insertCell(6).innerHTML = parsed.result[i].IsHolySpiritBaptised;
                        tbody.rows[i].insertCell(7).innerHTML = parsed.result[i].DateBornagain;
                        tbody.rows[i].insertCell(8).innerHTML = parsed.result[i].OfficiatingMinister;
                        tbody.rows[i].insertCell(9).innerHTML = parsed.result[i].DateofBaptism;
                        tbody.rows[i].insertCell(10).innerHTML = parsed.result[i].PlaceOfBaptism;
                        tbody.rows[i].insertCell(11).innerHTML = parsed.result[i].CertificationDate;
                        tbody.rows[i].insertCell(12).innerHTML = parsed.result[i].RHFDate;
                        tbody.rows[i].insertCell(13).innerHTML = parsed.result[i].RHFOfficer;
                        tbody.rows[i].insertCell(14).innerHTML = parsed.result[i].HolySpiritBaptisedDate;
                        tbody.rows[i].insertCell(15).innerHTML = parsed.result[i].IsNewConvertWaterBaptised;
                        tbody.rows[i].insertCell(16).innerHTML = parsed.result[i].IsOldMemberHolySpiritBaptised;






                        var button = document.createElement("input");
                        button.type = "button"; button.value = "update";
                        button.Record = parsed.result[i];
                        button.onclick = function () {
                            try {
                                var header = document.getElementById("divModaltitle");
                                header.innerHTML = "Edit baptism information for:<kbd>" + this.Record.LastName + " " + this.Record.FirstName + "</kbd>";

                                //display header
                                //var header = document.getElementById("divModaltitle");
                                //header.innerHTML = "Edit baptism information for:<kbd"+this.Record.LastName+ " "+this.Record.FirstName +"</kbd>"; 
                                //display dialog
                                document.getElementById("buttonDialog").click();
                                //load all read data from the server                               

                                $("#selectIsBornAgain").val(this.Record.IsBornagain == null ? "" : this.Record.IsBornagain);
                                $("#textboxDateBornAgain").val(this.Record.DateBornagain == null ? "" : this.Record.DateBornagain);
                                $("#selectIsWaterBaptised").val(this.Record.IsWaterBaptised == null ? "" : this.Record.IsWaterBaptised);
                                $("#textboxOfficiatingMinister").val(this.Record.OfficiatingMinister == null ? "" : this.Record.OfficiatingMinister);
                                $("#textboxDateBaptised").val(this.Record.DateofBaptism == null ? "" : this.Record.DateofBaptism);
                                $("#textboxLocation").val(this.Record.PlaceOfBaptism == null ? "" : this.Record.PlaceOfBaptism);
                                $("#textboxCertificationDate").val(this.Record.CertificationDate == null ? "" : this.Record.CertificationDate);
                                $("#textboxRHDFellowshipDate").val(this.Record.RHFDate == null ? "" : this.Record.RHFDate);
                                $("#textboxRHFElderMinister").val(this.Record.RHFOfficer == null ? "" : this.Record.RHFOfficer);
                                $("#SelectIsHolySpiritBaptised").val(this.Record.IsHolySpiritBaptised == null ? "" : this.Record.IsHolySpiritBaptised);
                                $("#textboxDateHolySpiritBaptised").val(this.Record.HolySpiritBaptisedDate == null ? "" : this.Record.HolySpiritBaptisedDate);
                                $("#textboxIsNewConvertWaterBaptised").val(this.Record.IsNewConvertWaterBaptised == null ? "" : this.Record.IsNewConvertWaterBaptised);
                                $("#textboxIsOldMemberHolySpiritBaptised").val(this.Record.IsOldMemberHolySpiritBaptised == null ? "" : this.Record.IsOldMemberHolySpiritBaptised);
                                $("#selectIsCommunicant").val(this.Record.IsCommunicant == null ? "" : this.Record.IsCommunicant);
                                document.getElementById("buttonUpdate").Record = this.Record;

                            } catch (e) {

                            }
                        }
                        tdEdit.appendChild(button)
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
$rab.Baptism.Initialise = function () {

    this.tabs = function (evt, tabName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
    }
}
$rab.Baptism.MassUpdate = function () {
    this.buildTable = function () {
        try {

            $rab.MassUpdateMatrix = [];
            var url, obj, handler;
            url = "Baptism.aspx/GetBaptisedMembers";
            obj = { branchID: new $rab.Branch().BranchInfo.BranchID };
            if (new $rab.Branch().BranchInfo.BranchName == "Please select branch") { return }
            $("#tbodyMassUpdate").empty();
            handler = function (jsondata) {
                "option strict"
                try {
                    //$rab.Membership.BuildMemberBaptism(jsondata)
                    if (jsondata == "Failed getting baptism record") { alert(jsondata);; return; }
                    var parsed = JSON.parse(jsondata);

                    var tbody = document.getElementById("tbodyMassUpdate");
                    for (var i = 0; i < parsed.result.length; i++) {
                        try {
                            tbody.insertRow(i);
                            var tdEdit = tbody.rows[i].insertCell(0);
                            tbody.rows[i].insertCell(1).innerHTML = parsed.result[i].FirstName;
                            tbody.rows[i].insertCell(2).innerHTML = parsed.result[i].LastName;
                            tbody.rows[i].insertCell(3).appendChild(new $rab.Utilities.Common().selectOptions(["Yes", "No"], parsed.result[i].IsBornagain))
                            tbody.rows[i].insertCell(4).appendChild(new $rab.Utilities.Common().selectOptions(["Yes", "No"], parsed.result[i].IsWaterBaptised))
                            tbody.rows[i].insertCell(5).appendChild(new $rab.Utilities.Common().selectOptions(["Yes", "No"], parsed.result[i].IsHolySpiritBaptised))
                            tbody.rows[i].insertCell(6).appendChild(new $rab.Utilities.Common().selectOptions(["Yes", "No"], parsed.result[i].IsNewConvertWaterBaptised))
                            tbody.rows[i].insertCell(7).appendChild(new $rab.Utilities.Common().selectOptions(["Yes", "No"], parsed.result[i].IsOldMemberHolySpiritBaptised))
                            tbody.rows[i].insertCell(8).appendChild(new $rab.Utilities.Common().selectOptions(["Yes", "No"], parsed.result[i].IsCommunicant))
                            tbody.rows[i].insertCell(9).appendChild(new $rab.Utilities.Common().createTextBoxWithLength(parsed.result[i].DateBornagain, 20));
                            tbody.rows[i].insertCell(10).appendChild(new $rab.Utilities.Common().createTextBoxWithLength(parsed.result[i].OfficiatingMinister, 20));
                            tbody.rows[i].insertCell(11).appendChild(new $rab.Utilities.Common().createTextBoxWithLength(parsed.result[i].DateofBaptism, 20));
                            tbody.rows[i].insertCell(12).appendChild(new $rab.Utilities.Common().createTextBoxWithLength(parsed.result[i].PlaceOfBaptism, 50));
                            tbody.rows[i].insertCell(13).appendChild(new $rab.Utilities.Common().createTextBoxWithLength(parsed.result[i].CertificationDate, 20));
                            tbody.rows[i].insertCell(14).appendChild(new $rab.Utilities.Common().createTextBoxWithLength(parsed.result[i].CertificateNumber, 20));
                            tbody.rows[i].insertCell(15).appendChild(new $rab.Utilities.Common().createTextBoxWithLength(parsed.result[i].RHFDate, 20));
                            tbody.rows[i].insertCell(16).appendChild(new $rab.Utilities.Common().createTextBoxWithLength(parsed.result[i].RHFOfficer, 20));
                            tbody.rows[i].insertCell(17).appendChild(new $rab.Utilities.Common().createTextBoxWithLength(parsed.result[i].HolySpiritBaptisedDate, 20));
                            var img = document.createElement("img");
                            //button.type = "button"; button.value = "update";
                            img.Record = parsed.result[i];
                            img.src = "assets/images/pencil.png";
                            img.style.width = "25px";
                            img.style.height = "25px";
                            img.title = 'click to update'
                            img.bapData = {
                                BaptismID: parsed.result[i].BaptismID,
                                MemberID: parsed.result[i].MemberID,
                                FirstName: parsed.result[i].FirstName,
                                LastName: parsed.result[i].LastName,
                                IsBornagain: tbody.rows[i].cells[3].firstChild,
                                IsWaterBaptised: tbody.rows[i].cells[4].firstChild,
                                IsHolySpiritBaptised: tbody.rows[i].cells[5].firstChild,
                                IsNewConvertWaterBaptised: tbody.rows[i].cells[6].firstChild,
                                IsOldMemberHolySpiritBaptised: tbody.rows[i].cells[7].firstChild,
                                IsCommunicant: tbody.rows[i].cells[8].firstChild,
                                DateBornagain: tbody.rows[i].cells[9].firstChild,
                                OfficiatingMinister: tbody.rows[i].cells[10].firstChild,
                                DateofBaptism: tbody.rows[i].cells[11].firstChild,
                                PlaceOfBaptism: tbody.rows[i].cells[12].firstChild,
                                CertificateDate: tbody.rows[i].cells[13].firstChild,
                                CertificateNumber: tbody.rows[i].cells[14].firstChild,
                                RHFDate: tbody.rows[i].cells[15].firstChild,
                                RHFOfficer: tbody.rows[i].cells[16].firstChild,
                                HolySpiritBaptisedDate: tbody.rows[i].cells[17].firstChild,
                                CreatedOn: 0,
                                CreatedBy: $rab.Login.User.MemberID,
                                BranchID: new $rab.Branch().BranchInfo.BranchID,
                                image: img
                            }

                            $rab.MassUpdateMatrix.push(img.bapData);
                            img.onclick = function () {

                                try {
                                    new $rab.Baptism.MassUpdate().update(this.bapData)
                                    this.src = "assets/images/approve.png"
                                    this.title = 'updated';
                                } catch (e) {

                                }
                            }
                            tdEdit.appendChild(img)
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
    this.update = function (obj) {
        try {
            // validate required inputs

            if (typeof obj == 'undefined') throw new Error('Invalid baptism object');
            if (isNaN(obj.BaptismID) || obj.BaptismID == 0) {
                //if baptism ID doesnt exist create
                url = "Baptism.aspx/AddBaptism";
            }
            else {
                //if baptism ID  exists update
                url = "Baptism.aspx/UpdateBaptism";
            }


            var newobj = {
                BaptismID: obj.BaptismID,
                MemberID: obj.MemberID,
                IsBornagain: $(obj.IsBornagain).val(),
                DateBornagain: $(obj.DateBornagain).val(),
                IsWaterBaptised: $(obj.IsWaterBaptised).val(),
                OfficiatingMinister: $(obj.OfficiatingMinister).val(),
                DateofBaptism: $(obj.DateofBaptism).val(),
                PlaceOfBaptism: $(obj.PlaceOfBaptism).val(),
                CertificationDate: $(obj.CertificateDate).val(),
                RHFDate: $(obj.RHFDate).val(),
                RHFOfficer: $(obj.RHFOfficer).val(),
                IsHolySpiritBaptised: $(obj.IsHolySpiritBaptised).val(),
                HolySpiritBaptisedDate: $(obj.HolySpiritBaptisedDate).val(),
                CreatedOn: obj.CreatedOn,
                CreatedBy: obj.CreatedBy,
                BranchID: obj.BranchID,
                IsNewConvertWaterBaptised: $(obj.IsNewConvertWaterBaptised).val(),
                IsOldMemberHolySpiritBaptised: $(obj.IsOldMemberHolySpiritBaptised).val(),
                IsCommunicant: $(obj.IsCommunicant).val(),

            };

            handler = function (jsondata) {


                //alert(JSON.parse(jsondata).result);

            }
            new $rab.Server.Method().BeginInvoke(url, { mem: newobj }, handler);
        } catch (e) {
            alert(e.message);
        }
    }
    this.updateAll = function () {


        for (var i = 0; i < $rab.MassUpdateMatrix.length; i++) {
            try {
                this.update($rab.MassUpdateMatrix[i]);
                $rab.MassUpdateMatrix[i].image.src = "assets/images/approve.png"
                $rab.MassUpdateMatrix[i].image.title = 'updated';
            } catch (e) {

            }
        }

    }
}