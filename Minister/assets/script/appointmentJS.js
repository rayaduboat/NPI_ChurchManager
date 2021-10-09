$rab.Appointment = $rab.Appointment || {};
$rab.Appointment.Permissionset = ["All", "SuperUser", "Appointment"];
$(function () {
    try {
        new $rab.Security.LockDown().PagePermission(["All", "SuperUser", "Appointment"])
        $rab.Security.Church.LoadBranches("selectBranchNames");
        setTimeout(new $rab.AuditTrail().PageVisited("Appointment"), 1000)
        $rab.Appointment.Initialise();
        // Get the element with id="defaultOpen" and click on it
        document.getElementById("defaultOpen").click();
    } catch (e) {
        alert(e.message);
    }
})


$rab.Appointment = function () {
    this.obj = {

        memberid: $("#selectAppMemberID").val(),
        branchid: new $rab.Branch().BranchInfo.BranchID,
        role: $("#selectAppRoleID").val(),
        alertNoticeDays: 0,// $("#selectAppAlertPeriod").val(),
        authorisingOfficer: $("#textboxauthorisingofficial").val(),
        location: $("#textboxLocation").val(),
        createdBy: $rab.Login.User.MemberID,
        createdOn: 0,
        comment: $("#textboxApptComment").val(),
    }

    this.Add = function () {

        this.obj.dateOfAppointment = new $rab.Utilities.Common().yyyymmdd($("#textboxDateApptStart").val());
        this.obj.endDateOfAppointment = new $rab.Utilities.Common().yyyymmdd($("#textboxDateApptEnd").val());
        // var handler = this.ViewAddedAppointments;
        if (!this.ValidateInputs()) return;
        var handler = this.ViewAddedAppointments;
        new $rab.Server.Method().BeginInvoke("Appointment.aspx/AddAppointment", { user: this.obj },
            function (jsondata) {
                try {
                    //
                    if (jsondata == "failed adding appointment") {
                        //make call to build table
                        alert("failed adding appointment");
                    } else {
                        alert("success");
                        document.getElementById("closenewappointmentmodal").click();
                        $(".modal-dialog-1 input[type=text],textarea").val("");
                        $(".modal-dialog-1 select").each(function () { this.selectedIndex = 0; })
                        handler(jsondata);
                    }
                } catch (e) {

                }
                //result

            });
    }
    this.Update = function () {

    }
    this.ValidateInputs = function () {
        if ($("#selectAppMemberID").html() == "Select member name") { alert('failed to get member id'); return false; }
        if (this.obj.branchid == null || this.obj.branchid.toString().length == 0 || parseInt(this.obj.branchid) <= 0) { alert('failed to get branch id'); return false; }
        if ($("#selectAppRoleID").val() == "Select role") { alert("Please select role"); return false; }
        return true;
    }
    this.Delete = function () {

    }
    this.LoadBranchMembers = function () {
        try {
            $("#selectMemberNames").empty();
            var url, obj, handler
            url = 'Appointment.aspx/GetMembers';
            obj = { branchID: new $rab.Branch().BranchInfo.BranchID };
            if (obj.branchID == "Select branch" || obj.branchID == null) { alert("Select branch"); return false; }
            handler = this.LoadDropDownList
            new $rab.Server.Method().BeginInvoke(url, obj, handler);
        } catch (e) {
            alert(e.message);
        }

    }
    this.LoadDropDownList = function (jsondata) {
        try {

            // update select member name with names supplied from server
            if (jsondata === undefined || jsondata.length == 0) throw new $rab.Exception("No member record found");



            $("#selectAppMemberID").empty();
            var members = JSON.parse(jsondata).members;
            var roles = JSON.parse(jsondata).roles;

            var option = document.createElement("option");
            option.value = "Select member name";
            option.innerText = "Select member name";
            document.getElementById("selectAppMemberID").appendChild(option);
            //add member names
            var rolesArray = [];
            for (var i = 0; i < members.length; i++) {
                try {


                    var option = document.createElement("option");
                    option.className = "form-control";
                    option.value = members[i].MemberID;
                    option.innerText = members[i].LastName + " " + members[i].FirstName;
                    option.MemberID = members[i].MemberID;
                    option.Email = members[i].Email;
                    document.getElementById("selectAppMemberID").appendChild(option);


                } catch (e) {

                }


            }
            //add member roles
            $("#selectAppRoleID").empty();
            var option1 = document.createElement("option");
            option1.value = "Select role";
            option1.innerText = "Select role";
            document.getElementById("selectAppRoleID").appendChild(option1);
            for (var i = 0; i < roles.length; i++) {
                try {
                    if (rolesArray.indexOf(roles[i].name) == -1) {
                        rolesArray.push(roles[i].name);
                        var option = document.createElement("option");
                        option.className = "form-control";
                        option.value = roles[i].ID;
                        option.innerText = roles[i].name;
                    }

                    document.getElementById("selectAppRoleID").appendChild(option);
                } catch (e) {

                }

            }
        } catch (e) {
            alert(e.message);
        }
    }
    this.LoadAppointments = function () {
        $("#tbodyAppointees").empty();
        if ($("#selectBranchNames").val() == "Select branch") {
            alert("select branch");
            return;
        }
        new $rab.Server.Method().BeginInvoke("Appointment.aspx/GetRoleAppointees",
            { branchID: this.obj.branchid },
            function (jsondata) {
                try {
                    //
                    if (jsondata != "[]") {
                        //make call to build table
                        var parsed = JSON.parse(jsondata);
                        if (parsed.length == 0) { alert("oops no records to load"); return; }
                        var tbody = document.getElementById("tbodyAppointees");
                        $(tbody).empty();
                        for (var i = 0; i < parsed.length; i++) {
                            try {

                                tbody.insertRow(i);
                                tbody.rows[i].insertCell(0)//.innerHTML = parsed[i].ID;
                                tbody.rows[i].insertCell(1).innerHTML = parsed[i].LastName;
                                tbody.rows[i].insertCell(2).innerHTML = parsed[i].FirstName;
                                tbody.rows[i].insertCell(3).innerHTML = parsed[i].NumberOfRoles;
                                tbody.rows[i].insertCell(4).innerHTML = parsed[i].DaysToExpiry;

                                var tdFlag = tbody.rows[i].insertCell(5);
                                tdFlag.innerHTML = new $rab.Appointment.Roles().Flag(parsed[i].DaysToExpiry);
                                //tdFlag.title=""

                                tbody.rows[i].insertCell(6).innerHTML = parsed[i].ReviewRole;
                                tbody.rows[i].insertCell(7).innerHTML = parsed[i].CreatedOn;
                                tbody.rows[i].insertCell(8).innerHTML = parsed[i].CreatedBy;
                                //ADD review button inside row
                                var tdreview = tbody.rows[i].cells[6];
                                var tdedit = tbody.rows[i].cells[0];
                                var buttonReview = document.createElement("button"); buttonReview.innerHTML = "View";
                                var buttonEdit = document.createElement("button"); buttonEdit.innerHTML = "Add";
                                buttonReview.Record = parsed[i];
                                buttonEdit.Record = parsed[i];
                                buttonReview.onclick = $rab.Appointment.Review;

                                buttonEdit.onclick = function () {
                                    try {
                                        //fill the modal with member information 
                                        new $rab.Appointment().LoadBranchMembers();
                                        var firstname = this.Record.LastName;
                                        var lastname = this.Record.FirstName;
                                        var id = this.Record.ID;
                                        setTimeout(function () {
                                            var option = document.createElement("option");
                                            option.value = id;
                                            option.innerHTML = firstname + " " + lastname;
                                            document.getElementById("selectAppMemberID").appendChild(option);// = firstname + " " + lastname;;
                                            var items = document.getElementById("selectAppMemberID").options;
                                            for (var i = 0; i < items.length; i++) {
                                                if (items[i].innerHTML == firstname + " " + lastname) {
                                                    document.getElementById("selectAppMemberID").selectedIndex = i; break;
                                                }
                                            }
                                            $('#buttonNewAppointment').click();
                                            //document.getElementById("buttonAddNewAppointee").click();
                                        }, 1000);
                                        //display the modal

                                    } catch (e) {

                                    }
                                }
                                tdreview.appendChild(buttonReview);
                                tdedit.appendChild(buttonEdit);
                            } catch (e) {

                            }
                        }

                    } else {
                        alert("oops failed loading data or there are no data to load");
                    }
                } catch (e) {

                }
                //result

            });

    }
    this.ViewAddedAppointments = function (jsondata) {
        var tbody = document.getElementById("tbodyAppointees");
        $(tbody).empty();
        try {
            //
            if (jsondata != "[]") {
                //make call to build table
                var parsed = JSON.parse(jsondata);
                parsed = parsed.result;
                if (parsed.length == 0) { alert("oops no records to load"); return; }

                for (var i = 0; i < parsed.length; i++) {
                    try {

                        tbody.insertRow(i);
                        tbody.rows[i].insertCell(0).innerHTML = parsed[i].ID;
                        tbody.rows[i].insertCell(1).innerHTML = parsed[i].LastName;
                        tbody.rows[i].insertCell(2).innerHTML = parsed[i].FirstName;
                        tbody.rows[i].insertCell(3).innerHTML = parsed[i].NumberOfRoles;
                        tbody.rows[i].insertCell(4).innerHTML = parsed[i].DaysToExpiry;

                        var tdFlag = tbody.rows[i].insertCell(5);
                        tdFlag.innerHTML = new $rab.Appointment.Roles().Flag(parsed[i].DaysToExpiry);
                        //tdFlag.title=""

                        tbody.rows[i].insertCell(6).innerHTML = parsed[i].ReviewRole;
                        tbody.rows[i].insertCell(7).innerHTML = parsed[i].CreatedOn;
                        tbody.rows[i].insertCell(8).innerHTML = parsed[i].CreatedBy;
                        //ADD review button inside row
                        var tdreview = tbody.rows[i].cells[6];
                        var tdedit = tbody.rows[i].cells[0];
                        var buttonReview = document.createElement("button"); buttonReview.innerHTML = "View";
                        var buttonEdit = document.createElement("button"); buttonEdit.innerHTML = "Add";
                        buttonReview.Record = parsed[i];
                        buttonEdit.Record = parsed[i];
                        buttonReview.onclick = $rab.Appointment.Review;

                        buttonEdit.onclick = function () {
                            try {
                                //fill the modal with member information 
                                new $rab.Appointment().LoadBranchMembers();
                                var firstname = this.Record.LastName;
                                var lastname = this.Record.FirstName;
                                var id = this.Record.ID;
                                setTimeout(function () {
                                    var option = document.createElement("option");
                                    option.value = id;
                                    option.innerHTML = firstname + " " + lastname;
                                    document.getElementById("selectAppMemberID").appendChild(option);// = firstname + " " + lastname;;
                                    var items = document.getElementById("selectAppMemberID").options;
                                    for (var i = 0; i < items.length; i++) {
                                        if (items[i].innerHTML == firstname + " " + lastname) {
                                            document.getElementById("selectAppMemberID").selectedIndex = i; break;
                                        }
                                    }

                                    document.getElementById("buttonAddNewAppointee").click();
                                }, 1000);
                                //display the modal

                            } catch (e) {

                            }
                        }
                        tdreview.appendChild(buttonReview);
                        tdedit.appendChild(buttonEdit);
                    } catch (e) {

                    }
                }

            } else {
                alert("oops failed loading data or there are no data to load");
            }
        } catch (e) {

        }
        //result

    };
}
$rab.Appointment.Roles = function () {
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
    this.Delete = function (id) {
        var handler = this.BuildRoleTable;
        new $rab.Server.Method()
            .BeginInvoke("Appointment.aspx/DeleteRole", { roleid: id }, function (jsondata) {

                handler(jsondata);
            })
    }
    this.AddDictionary = function (arraystring) {
        //arraystring: an array string seperated by comma's e.g Sunday service, Wednesday prayer, 
        try {
            if (arraystring == null || arraystring.length == 0 || typeof arraystring != "string") {
                alert("Invalid role entered, please enter a valid comma seperated activity names");
                ; return;
            }
            var url = "Appointment.aspx/AddToDictionary";
            new $rab.Server.Method().BeginInvoke(url, { arraystring: arraystring,branchid:new $rab.Branch().BranchInfo.BranchID }, function (jsondata) {
                try {

                    if (jsondata != "failed to add to dictionary") {
                        $(".modal-dialog-2 input[type=text]").empty();
                        $("#close-appointment-panel").click();
                        alert("success");
                    }

                } catch (e) {
                    alert(e.message);
                }
            });
        } catch (e) {

        }
    }
    this.Flag = function (daystoexpiry) {
        //check if is a number
        if (isNaN(daystoexpiry)) return;
        //0 to 90 red
        if (daystoexpiry < 90) return "<span style='display: block; padding: 8px; background-color: red'></span>";
        //90 to 180 is orange
        if (daystoexpiry >= 90 && daystoexpiry < 180) return "<span style='display: block; padding: 8px; background-color: orange'></span>";
        //180 > green
        if (daystoexpiry >= 180) return "<span style='display: block; padding: 8px; background-color: green'></span>";
    }
    this.GetRoles = function () {
        try {
            var url = "Appointment.aspx/GetDictionary";
            var handler = this.BuildRoleTable;
            new $rab.Server.Method().BeginInvoke(url, {}, function (jsondata) {
                try {

                    handler(jsondata);

                } catch (e) {
                    alert(e.message);
                }
            });
        } catch (e) {

        }
    }
    this.BuildRoleTable = function (jsondata) {
        $('#tbodyRoles').empty();
        var tbody = document.getElementById('tbodyRoles');
        var parsed = JSON.parse(jsondata);
        for (var i = 0; i < parsed.length; i++) {
            tbody.insertRow(i);
            tbody.rows[i].insertCell(0).innerHTML = parsed[i].ID;
            tbody.rows[i].insertCell(1).innerHTML = parsed[i].Value;
            tbody.rows[i].insertCell(2).appendChild(document.createElement('button'));
            tbody.rows[i].cells[2].firstChild.innerHTML = "delete"
            tbody.rows[i].cells[2].firstChild.record = parsed[i];
            tbody.rows[i].cells[2].firstChild.onclick = function () {
                new $rab.Appointment.Roles().Delete(this.record.ID);
            }
        }
    }
}
$rab.Appointment.Review = function () {
    try {
        var url = "Appointment.aspx/GetMemberRoles";

        var record = this.Record;
        if (record == null) return;
        //clear review controls;
        //change review modal caption
        var fullname = record.LastName + " " + record.FirstName;
        document.getElementById("assigned-roles-modal-header").innerHTML = "Assigned roles for: " + fullname;
        document.getElementById("assigned-roles-modal-header").Tag = record;
        //Change the modal header and clear any existing reports
        $("#tabContentHeaderReviewRole,#container-roles-reviewed").empty();
        //load all logged reviews
        new $rab.Appointment.ReviewAction().LoadReport(record.ID);
        document.getElementById("defaultOpen").click();
        new $rab.Appointment.ReviewAction().ClearControls();//clears input controls for adding roles review
        $("#ReviewRole select").each(function () { this.selectedIndex = 0; });

        new $rab.Server.Method().BeginInvoke(url, { MemberID: this.Record.ID }, function (jsondata) {

            try {
                //build a table with all details
                if (jsondata == null || jsondata == "failed getting member roles") { alert("failed getting member roles"); return; }
                var parsed = JSON.parse(jsondata);
                if (parsed.length == 0) { alert("no roles assigned to member"); return; }
                var tbody = document.getElementById("tbodyMemberRoles");
                $(tbody).empty();//empty contents

                for (var i = 0; i < parsed.length; i++) {
                    tbody.insertRow(i);
                    tbody.rows[i].insertCell(0).innerHTML = parsed[i].BranchID;

                    var tdreview = tbody.rows[i].insertCell(1);
                    tbody.rows[i].insertCell(2).innerHTML = parsed[i].Role;
                    tbody.rows[i].insertCell(3).innerHTML = new $rab.Utilities.Common().UKdate(parsed[i].DateOfAppointment.toString());
                    tbody.rows[i].insertCell(4).innerHTML = new $rab.Utilities.Common().UKdate(parsed[i].EndDateOfAppointment.toString());
                    tbody.rows[i].insertCell(5).innerHTML = parsed[i].DaysToExpire;
                    tbody.rows[i].insertCell(6).innerHTML = parsed[i].Location;
                    tbody.rows[i].insertCell(7).innerHTML = parsed[i].AuthorisingOfficer;
                    tbody.rows[i].insertCell(8).innerHTML = parsed[i].Comment;
                    //insert a review  button
                    var buttonReview = document.createElement("button");
                    buttonReview.innerHTML = "review";
                    buttonReview.MetaData = { member: record, role: parsed[i] };
                    buttonReview.onclick = function () {
                        //clear review controls;
                        $("#tabContentHeaderReviewRole").empty();
                        new $rab.Appointment.ReviewAction().ClearControls();
                        $("#ReviewRole select").each(function () { this.selectedIndex = 0; });

                        document.getElementById("buttontabReviewRole").click();
                        //Put comment in review role;
                        $("#tabContentHeaderReviewRole").empty();
                        $("#tabContentHeaderReviewRole").html("<kbd class='mt-3'>Review role for: " + this.MetaData.member.LastName + " " + this.MetaData.member.FirstName + "</kbd>");

                        document.getElementById("textboxReviewRole").value = this.MetaData.role.Role;
                        document.getElementById("textboxReviewRoleFrom").value = new $rab.Utilities.Common().UKdate(this.MetaData.role.DateOfAppointment.toString());
                        document.getElementById("textboxReviewRoleTo").value = new $rab.Utilities.Common().UKdate(this.MetaData.role.EndDateOfAppointment.toString());

                        //make action role submit button aware of the role that is being reviewed
                        document.getElementById("buttonSubmitReviewAction").ActionedRoled = this.MetaData;


                    }
                    tdreview.appendChild(buttonReview);
                }
                document.getElementById('reviewModal').style.display = "block";


            } catch (e) {

            }
        })
    } catch (e) {

    }
}
$rab.Appointment.Initialise = function () {

    // Get the modalReview
    var modalReview = document.getElementById('reviewModal');

    // Get the button that opens the modalReview
    var btn = document.getElementById("buttonOpenReviewModal");

    // Get the <span> element that closes the modalReview
    var span = document.getElementsByClassName("closereview")[0];

    // When the user clicks the button, open the modalReview 
    btn.onclick = function () {
        modalReview.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modalReview
    span.onclick = function () {
        modalReview.style.display = "none";
    }

    // When the user clicks anywhere outside of the modalReview, close it
    window.onclick = function (event) {
        if (event.target == modalReview) {
            modalReview.style.display = "none";
        }
    }
}
$rab.TabPanel = function (evt, cityName) {

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
$rab.Appointment.ReviewAction = function () {
    this.obj = {
        AppointmentID: 0,
        MemberID: 0,
        BranchID: new $rab.Branch().BranchInfo.BranchID,
        ReviewRole: $("#textboxReviewRole").val(),
        ReviewRoleFrom: $("#textboxReviewRoleFrom").val(),
        ReviewRoleTo: $("#textboxReviewRoleTo").val(),
        ReviewRoleStrengths: $("#textboxReviewRoleStrengths").val(),
        ReviewRoleWeakness: $("#textboxReviewRoleWeakness").val(),
        ReviewRoleSupport: $("#textboxReviewRoleSupport").val(),
        ReviewComment: $("#textboxReviewComment").val(),
        RoleAction: $("#selectReviewRoleAction").val(),
        CreatedOn: 0,
        CreatedBy: $rab.Login.User.MemberID,
        ReviewDate: $("#textboxReviewDate").val(),
    }
    this.Add = function () {
        //where action is the actioned role
        var action = document.getElementById("buttonSubmitReviewAction").ActionedRoled
        try {
            if (!this.Validate()) return;
            this.obj.MemberID = action.role.MemberID;
            this.obj.AppointmentID = action.role.AppointmentID;
            this.obj.BranchID = action.role.BranchID;
            var url = "Appointment.aspx/AddRoleReview";
            new $rab.Server.Method().BeginInvoke(url, { role: this.obj }, function (jsondata) {
                try {
                    //clear review controls;
                    $("#tabContentHeaderReviewRole").empty();
                    //reset controls
                    $(".modal-dialog-3 select").each(function () { this.selectedIndex = 0; });
                    var review = new $rab.Appointment.ReviewAction();
                    //load report contents
                    review.LoadReviewAction(jsondata)
                    //clear input controls
                    review.ClearControls();
                    //select report tab
                    document.getElementById("buttonRolesReviewReport").click();
                } catch (e) {
                    alert(e.message);
                }

            });
        } catch (e) {
            alert(e.message);
        }

    }
    this.Update = function () {

    }
    this.Validate = function () {
        var isvalid = false;
        try {
            if (this.obj.AppointmentID.toString().trim().length == 0 || this.obj.AppointmentID == null) { alert("invalid entry made for AppointmentID       "); return false; }
            if (this.obj.MemberID.toString().trim().length == 0 || this.obj.MemberID == null) { alert("invalid entry made for MemberID            "); return false; }
            if (this.obj.BranchID.toString().trim().length == 0 || this.obj.BranchID == null) { alert("invalid entry made for BranchID            "); return false; }
            if (this.obj.ReviewRole.trim().length == 0 || this.obj.ReviewRole == null) { alert("invalid entry made for ReviewRole          "); return false; }
            if (this.obj.ReviewRoleFrom.trim().length == 0 || this.obj.ReviewRoleFrom == null) { alert("invalid entry made for ReviewRoleFrom      "); return false; }
            if (this.obj.ReviewRoleTo.trim().length == 0 || this.obj.ReviewRoleTo == null) { alert("invalid entry made for ReviewRoleTo        "); return false; }
            if (this.obj.ReviewRoleStrengths.trim().length == 0 || this.obj.ReviewRoleStrengths == null) { alert("invalid entry made for ReviewRoleStrengths "); return false; }
            if (this.obj.ReviewRoleWeakness.trim().length == 0 || this.obj.ReviewRoleWeakness == null) { alert("invalid entry made for ReviewRoleWeakness  "); return false; }
            if (this.obj.ReviewRoleSupport.trim().length == 0 || this.obj.ReviewRoleSupport == null) { alert("invalid entry made for ReviewRoleSupport   "); return false; }
            if (this.obj.ReviewComment.trim().length == 0 || this.obj.ReviewComment == null) { alert("invalid entry made for ReviewComment       "); return false; }
            if (this.obj.RoleAction.trim().length == 0 || this.obj.RoleAction == null) { alert("invalid entry made for RoleAction          "); return false; }
            if (this.obj.CreatedOn.toString().trim().length == 0 || this.obj.CreatedOn == null) { alert("invalid entry made for CreatedOn           "); return false; }
            if (this.obj.CreatedBy.toString().trim().length == 0 || this.obj.CreatedBy == null) { alert("invalid entry made for CreatedBy           "); return false; }
            if (this.obj.ReviewDate.toString().trim().length == 0 || this.obj.CreatedBy == null || new Date(this.obj.ReviewDate).toLocaleDateString() == "Invalid Date") { alert("invalid date entered "); return false; }


            isvalid = true;
        } catch (e) {

        }
        return isvalid;
    }
    this.LoadReviewAction = function (jsondata) {
        //return all reviewed roles for individual
        var parsed = JSON.parse(jsondata);
        if (parsed.message == "success") {
            //user was able to add and load into review GUI
            $("#container-roles-reviewed").empty();
            var table = document.createElement("table");
            table.className = "table table-stripped table-responsive";
            var thead = document.createElement("thead");
            var tbody = document.createElement("tbody");
            document.getElementById("container-roles-reviewed").appendChild(table);
            table.appendChild(thead);
            table.appendChild(tbody);
            thead.insertRow(0);
            thead.rows[0].insertCell(0).innerHTML = "RolesReviewID";
            //thead.rows[0].insertCell(1).innerHTML = "AppointmentID";
            //thead.rows[0].insertCell(2).innerHTML = "MemberID";
            //thead.rows[0].insertCell(3).innerHTML = "BranchID";
            thead.rows[0].insertCell(1).innerHTML = "Role";
            thead.rows[0].insertCell(2).innerHTML = "RoleFrom";
            thead.rows[0].insertCell(3).innerHTML = "RoleTo";
            thead.rows[0].insertCell(4).innerHTML = "Review Date";
            thead.rows[0].insertCell(5).innerHTML = "RoleStrengths";
            thead.rows[0].insertCell(6).innerHTML = "RoleWeakness";
            thead.rows[0].insertCell(7).innerHTML = "RoleSupport";
            thead.rows[0].insertCell(8).innerHTML = "Comment";
            thead.rows[0].insertCell(9).innerHTML = "RoleAction";
            thead.rows[0].insertCell(10).innerHTML = "CreatedOn";
            thead.rows[0].insertCell(11).innerHTML = "CreatedBy";
            try {
                for (var i = 0; i < parsed.result.length; i++) {

                    tbody.insertRow(i);
                    tbody.rows[i].insertCell(0).innerHTML = parsed.result[i].RolesReviewID;
                    //tbody.rows[i].insertCell(1).innerHTML = parsed.result[i].AppointmentID;
                    //tbody.rows[i].insertCell(2).innerHTML = parsed.result[i].MemberID;
                    //tbody.rows[i].insertCell(3).innerHTML = parsed.result[i].BranchID;
                    tbody.rows[i].insertCell(1).innerHTML = parsed.result[i].ReviewRole;
                    tbody.rows[i].insertCell(2).innerHTML = parsed.result[i].ReviewRoleFrom;
                    tbody.rows[i].insertCell(3).innerHTML = parsed.result[i].ReviewRoleTo;
                    tbody.rows[i].insertCell(4).innerHTML = new $rab.Utilities.Common().UKdate(parsed.result[i].ReviewDate.toString());
                    tbody.rows[i].insertCell(5).innerHTML = parsed.result[i].ReviewRoleStrengths;
                    tbody.rows[i].insertCell(6).innerHTML = parsed.result[i].ReviewRoleWeakness;
                    tbody.rows[i].insertCell(7).innerHTML = parsed.result[i].ReviewRoleSupport;
                    tbody.rows[i].insertCell(8).innerHTML = parsed.result[i].ReviewComment;
                    tbody.rows[i].insertCell(9).innerHTML = parsed.result[i].RoleAction;
                    tbody.rows[i].insertCell(10).innerHTML = new $rab.Utilities.Common().UKdate(parsed.result[i].CreatedOn.toString());
                    tbody.rows[i].insertCell(11).innerHTML = parsed.result[i].CreatedBy;

                }
            } catch (e) {
                alert(e.message);
            }
        }


    }
    this.ClearControls = function () {
        document.getElementById("textboxReviewRole").value = "";
        document.getElementById("textboxReviewRoleFrom").value = "";
        document.getElementById("textboxReviewRoleTo").value = "";
        document.getElementById("textboxReviewDate").value = "";
        document.getElementById("textboxReviewRoleStrengths").value = "";
        document.getElementById("textboxReviewRoleWeakness").value = "";
        document.getElementById("textboxReviewRoleSupport").value = "";
        document.getElementById("textboxReviewComment").value = "";
        document.getElementById("selectReviewRoleAction").value = "";
    }
    this.LoadReport = function () {
        try {
            var url = "Appointment.aspx/GetRolesReviewed";
            //member details is stored in modal header
            var memberRecord = document.getElementById("assigned-roles-modal-header").Tag
            var obj = { MemberID: memberRecord.ID };
            var handler = function (jsondata) {
                new $rab.Appointment.ReviewAction().LoadReviewAction(jsondata);
            }
            new $rab.Server.Method().BeginInvoke(url, obj, handler);
        } catch (e) {

        }
    }
}