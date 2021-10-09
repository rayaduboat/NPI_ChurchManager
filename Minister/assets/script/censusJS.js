
var $rab = $rab || {};
$rab.Initialise = $rab.Initialise || {};
$rab.Login = $rab.Login || {};
$rab.HomePage = "../../default.aspx";
$rab.Utilities = $rab.Utilities || {};
$rab.Report = $rab.Report || {};
$rab.Server = $rab.Server || {};
$rab.Church = $rab.Church || {};
$rab.Church.Minister = "Overseer Elvis Nague";
$rab.Login.User = "";
$rab.Census = $rab.Census || {};
$rab.Exception = function (message) { this.message = message; }
$rab.Report.ConventionAndConference = function () {
    this.Submit = function () {
        try {
            // read contents of controls and validate and send data to 
            // database

            var data = new $rab.Report.ConConferenceClass();
            //alert(JSON.stringify(data));
            $.ajax({
                type: 'POST',
                url: 'WeeklyActivities.aspx/PostConventionAndConference',
                data: JSON.stringify(data),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    alert(response.d);
                },
                error: function (e) {
                    alert(e.responseText);
                }

            });


        } catch (e) {
            alert(e.message);
        }
    }
}
$rab.Report.ConConferenceClass = function () {
    this.name = $("#textboxEventName").val();
    this.date = $("#textboxDate").val();
    this.speaker = $("#textboxSpeaker").val();
    this.title = $("#textboxTitle").val();
    this.malecount = $("#textboxAdultmalecount").val();
    this.femalecount = $("#textboxfemaleCount").val();
    this.children = $("#textboxchildrenCount").val();
    this.spectacularevent = $("#textboxspectacularEvent").val();
    this.specialOccurence = $("#textboxspecialOccurence").val();
    this.SoulsWon = $("#textboxSoulsWon").val();
    this.convertsWaterBaptised = $("#textboxConvertsWaterBaptised").val();
    this.membersWaterBaptised = $("#textboxMembersWaterBaptised").val();
    this.holySpiritBaptised = $("#textboxHolySpiritBaptised").val();
    this.titheAndOffering = $("#textboxTitheAndOffering").val();
    this.otherOffering = $("#textboxOtherOffering").val();
    this.authorisedExpenditure = $("#textboxAuthorisedExpenditure").val();
    this.generalAssessment = $("#textboxGeneralAssessment").val();
    this.certificationMinister = $("#textboxStartDate").val();
    this.officiatingMinister = $("#textboxEventEndDate").val();
}
$rab.Membership = $rab.Membership || {};
$rab.Accounts = $rab.Accounts || {};
$(function () {
    try {
        $rab.Church.LoadBranches("selectBranchNames");
        setTimeout(new $rab.AuditTrail().PageVisited("Census"), 1000)

    } catch (e) {

    }
   
})
$rab.Login.Credentials = function () {
    this.TempEmailAddress = "temp@piwc.com";
    this.TempPassword = "password123";
    this.Validate = function () {
        try {
            // check entered email address and password
            var isCredentialsValid = false;

            var email = $("#textboxEmail").val();
            var pwd = $("#textboxPassword").val();
            //pass data to server to validate credentials

            //if validation fails and credentials are temporary
            if (!isCredentialsValid && email == this.TempEmailAddress && pwd == this.TempPassword) {
                $("#loginContainer").css("display", "none");
                //enable menu and hide login
                $("#dropdown-menu-2btn-0").css("display", "block");
                //set login credentials to allow pages navigation
                $rab.Login.User = { Email: this.TempEmailAddress, LogInDate: new Date().toLocaleDateString(), LogInTime: new Date().getTime() };
                $("#h2loggeduser").html(this.TempEmailAddress);
                localStorage.setItem("user", JSON.stringify($rab.Login.User));

            }


        } catch (e) {

        }
    }
};
$rab.Initialise.Menus = function () {
    this.Logout = function () {
        try {
            //wire logout control
            //remove local storage
            localStorage.removeItem("user");
            location.assign($rab.HomePage);

        } catch (e) {

        }
    }

};
$rab.Membership.GetMembers = function (branchName) {
    try {
        if (branchName.trim().length == 0 || branchName == "Please select branch")
            throw new $rab.Exception("Please select a branch name")
        $.ajax({
            type: "POST",
            url: 'MembershipList.aspx/GetMembers',
            data: JSON.stringify({ branchName: branchName }),
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                var message = "Invalid credentials or member not known";
                new $rab.Membership.Table(data.d).Build();//build the table
            },
            error: function (response) {
                alert(response.responseText);
            }
        });
    } catch (e) {
        alert(e.message);
    }
}
$rab.Membership.GetMembersList = function (branchName, handler) {
    try {
        if (branchName.trim().length == 0 || branchName == "Please select branch") throw new $rab.Exception("Please select a branch name")
        if (typeof handler !== "function") throw new $rab.Exception("invalid function handle passed")

        $.ajax({
            type: "POST",
            url: 'MembershipList.aspx/GetMembers',
            data: JSON.stringify({ branchName: branchName }),
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                var message = "Invalid credentials or member not known";
                handler(data.d);//build the table
            },
            error: function (response) {
                alert(response.responseText);
            }
        });
    } catch (e) {
        alert(e.message);
    }
}
$rab.Membership.Table = function (jsondata) {

    this.Build = function () {
        try {
            var members = JSON.parse(jsondata);
            //alert(JSON.stringify(jsondata));
            $("#tbodyMembers").empty();
            var table = document.getElementById("tbodyMembers");
            for (var i = 0; i < members.length; i++) {
                // add member records 
                var tr = document.createElement("tr");
                var tdFirstName = document.createElement("td"); tdFirstName.className = "body-item mbr-fonts-style display-7"; tdFirstName.innerHTML = members[i].FirstName;
                var tdLastName = document.createElement("td"); tdLastName.className = "body-item mbr-fonts-style display-7"; tdLastName.innerHTML = members[i].LastName;
                var tdTelephone = document.createElement("td"); tdTelephone.className = "body-item mbr-fonts-style display-7"; tdTelephone.innerHTML = members[i].Telephone;
                var tdEmail = document.createElement("td"); tdEmail.className = "body-item mbr-fonts-style display-7"; tdEmail.innerHTML = members[i].Email;
                var tdMembershipType = document.createElement("td"); tdMembershipType.className = "body-item mbr-fonts-style display-7"; tdMembershipType.innerHTML = members[i].MembershipType;
                var tdEdit = document.createElement("td"); tdEdit.className = "body-item mbr-fonts-style display-7";//
                var button = document.createElement("span"); button.innerHTML = "Edit";
                button.Record = members[i];
                button.onclick = function () {
                    document.getElementById("memberID").value = this.Record.MemberID;
                    document.getElementById("textboxFirstName").value = this.Record.FirstName;
                    document.getElementById("textboxLastName").value = this.Record.LastName;
                    document.getElementById("textboxTelephone").value = this.Record.Telephone;
                    document.getElementById("textboxEmail").value = this.Record.Email;
                    document.getElementById("selectMemType").value = this.Record.MembershipType == 'Non' ? 'Non-Member' : 'Member';
                    document.getElementById("buttonDialog").click();
                }


                //var spanEmail = document.createElement("i");// spanEmail.innerText="email"// button.type = "button"; button.value = "Send email";
                //spanEmail.MemberRecord = members[i];
                //spanEmail.onclick = function () {
                //    //$("#textareaEmailComment").empty()
                //    //document.getElementById("buttonSendEmailModal").click();
                //    //document.getElementById("textboxEmail").value = this.MemberRecord.Email;

                //}
                button.className = "form-control";
                //spanEmail.className = "fa fa-envelope fa-lg";

                tdEdit.appendChild(button);
                //tdEdit.appendChild(spanEmail);
                tr.appendChild(tdFirstName);
                tr.appendChild(tdLastName);
                tr.appendChild(tdTelephone);
                tr.appendChild(tdEmail);
                tr.appendChild(tdMembershipType);
                tr.appendChild(tdEdit);
                table.appendChild(tr);
            }

        } catch (e) {
            alert(e.message);
        }
    }
    this.Update = function () {
        // alert("got here okay");
        try {
            var url = "MembershipList.aspx/UpdateMemberDetails"
            var obj = { memberID: document.getElementById("memberID").value, firstName: $("#textboxFirstName").val(), lastName: $("#textboxLastName").val(), telephone: $("#textboxTelephone").val(), email: $("#textboxEmail").val(), membershipType: $("#selectMemType").val() }
            var handler = function (serverdata) {
                if (serverdata == 'Failed updating data') {
                    alert('failed updating date');
                } else if (serverdata == 'update successful') {
                    alert('Update successful');
                    // reload 

                    $("#closeButton").click();
                    $("#buttonSearch").click();
                    //location.reload();
                }
            };
            new $rab.Server.Method().BeginInvoke(url, obj, handler);
        } catch (e) {

        }
    };
}
$rab.Server.Method = function () {
    this.BeginInvoke = function (url, obj, handler) {
        //url: webpage where webmethod lives
        //obj: object to pass to server method as a parameter
        //handler: method to invoke after successful return
        $.ajax({
            type: "POST",
            url: url,
            data: JSON.stringify(obj),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                // Do something interesting here.
                handler(msg.d);

            },
            error: function (e) {
                alert(e.responseText);
            }
        });
    }
}
$rab.Church.LoadBranches = function (dropdown) {
    //loads church branches into dropdown control supplied
    try {
        var url, obj, handler;
        url = "Events.aspx/LoadBranches";
        obj = {};
        handler = function (jsonData) {
            if (jsonData == "Failed loading branches") throw new $rab.Exception(jsonData);
            var parsed = JSON.parse(jsonData);
            for (var i = 0; i < parsed.length; i++) {
                var option = document.createElement("option");
                option.value = parsed[i].BranchName;
                option.text = parsed[i].BranchName;
                option.innerHTML = parsed[i].BranchName;
                option.BranchID = parsed[i].BranchID;
                document.getElementById(dropdown).appendChild(option);
            }
        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
}

$rab.Census.Add=function () {
    try {
 var url = 'Census.aspx/PostRecord';
    obj = new collectCensusData();
    handler = function (jsondata) {
        try {
            // when added empty entry and then say thanks 
            if (jsondata != "successfully registered") throw new $rab.Exception(jsondata);
            $("select, input[type=textbox]").val("");
            alert("Thanks " + obj.FirstName +" "+ obj.Surname +" for registering, your details have\n been saved and will not be shared with anyone.\nYou will not be targetted for advertisement nor have your records sold.\nIf you are unclear about what or how your data is going to be used, contact census administrator");
            window.close();
        } catch (e) {
            alert(e.message);
        }
    }
    //validate entry before posting to database
    if (obj.AssemblyName == "Select branch") throw new $rab.Exception("Please select branch");
    if (obj.Title.trim().length == 0) throw new $rab.Exception("enter Title");
    if (obj.FirstName.trim().length == 0) throw new $rab.Exception("enter First Name");
    if (obj.Surname.trim().length == 0) throw new $rab.Exception("enter Last Name");
    if (obj.Telephone.trim().length == 0) throw new $rab.Exception("enter Telephone");
    if (obj.MobileNumber.trim().length == 0) throw new $rab.Exception("enter Mobile Number");
    if (obj.MaritalStatus == "Select marital status") throw new $rab.Exception("enter Marital Status");

    if (obj.HasBornAgain.trim().length == 0) throw new $rab.Exception("Please are your born again");

    if (obj.HasBornAgain.trim().length == 0 || obj.HasBornAgain=="Select item") throw new $rab.Exception("Please are your born again");
    if (obj.HasWaterBaptised.trim().length == 0 || obj.HasWaterBaptised == "Select item") throw new $rab.Exception("Please are you  water baptised");
    if (obj.HasHolyGhostBaptised.trim().length == 0 || obj.HasHolyGhostBaptised == "Select item") throw new $rab.Exception("Please are your Holy Spirit");
    if (obj.ChurchContactPerson.trim().length == 0) throw new $rab.Exception("Please enter emergency contact number");
  
    new $rab.Server.Method().BeginInvoke(url, obj, handler);

    } catch (e) {
        alert(e.message);
    }
   
}

function collectCensusData() {
    this.Email = $("#textBoxEmail").val();
    this.DateOfBirth = $("#textBoxDOB").val();
    this.AssemblyName = $('#selectBranchNames').val();
    this.Title = $('#textBoxTitle').val();
    this.FirstName = $('#textBoxFirstName').val();
    this.Surname = $('#textBoxSurname').val();
    this.MiddleName = $('#textBoxMiddleName').val();
    this.Telephone = $('#textBoxTelephone').val();
    this.MobileNumber = $('#textBoxMobileNumber').val();
    this.MaritalStatus = $('#textBoxMaritalStatus').val();
    this.ContactPerson = $('#textBoxContactPerson').val();
    this.Profession = $('#textBoxProfession').val();
    this.ActiveArea = $('#textBoxActiveArea').val();
    this.Occupation = $('#textBoxOccupation').val();
    this.HasBornAgain = $('#textBoxHasBornAgain').val();
    this.DateBornAgain = $('#textBoxDateBornAgain').val();
    this.HasWaterBaptised = $('#textBoxHasWaterBaptised').val();
    this.DateWaterBaptised = $('#textBoxDateWaterBaptised').val();
    this.HasHolyGhostBaptised = $('#textBoxHasHolyGhostBaptised').val();
    this.DateHolyGhostBaptised = $('#textBoxDateHolyGhostBaptised').val();
    this.PreviousChurch = $('#textBoxPreviousChurch').val();
    this.DateFirstVisit = $('#textBoxDateFirstVisit').val();
    this.ChurchContactPerson = $('#textBoxChurchContactPerson').val();
    this.UrgentPrayerRequest = $('#textBoxUrgentPrayerRequest').val();
    this.PrayerRequestDetails = $('#textBoxPrayerRequestDetails').val();
}