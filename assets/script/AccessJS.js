var $rab = $rab || {};
$rab.Initialise = $rab.Initialise || {};
$rab.Login = $rab.Login || {};
$rab.Utilities = $rab.Utilities || {};
$rab.Report = $rab.Report || {};
$rab.Server = $rab.Server || {};
$rab.Accounts = $rab.Accounts | {};
$rab.Login.User = "";
$rab.Login.Attempts = 0;
$rab.Login.Attempts = 0;

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
    this.name                  = $("#textboxEventName").val();
    this.date                  = $("#textboxDate").val();
    this.speaker               = $("#textboxSpeaker").val();
    this.title                 = $("#textboxTitle").val();
    this.malecount             = $("#textboxAdultmalecount").val();
    this.femalecount           = $("#textboxfemaleCount").val();
    this.children              = $("#textboxchildrenCount").val();
    this.spectacularevent      = $("#textboxspectacularEvent").val();
    this.specialOccurence      = $("#textboxspecialOccurence").val();
    this.SoulsWon              = $("#textboxSoulsWon").val();
    this.convertsWaterBaptised = $("#textboxConvertsWaterBaptised").val();
    this.membersWaterBaptised  = $("#textboxMembersWaterBaptised").val();
    this.holySpiritBaptised    = $("#textboxHolySpiritBaptised").val();
    this.titheAndOffering      = $("#textboxTitheAndOffering").val();
    this.otherOffering         = $("#textboxOtherOffering").val();
    this.authorisedExpenditure = $("#textboxAuthorisedExpenditure").val();
    this.generalAssessment     = $("#textboxGeneralAssessment").val();
    this.certificationMinister = $("#textboxStartDate").val();
    this.officiatingMinister   = $("#textboxEventEndDate").val();
}
$rab.Membership = $rab.Membership || {};

$(function () {
     /*check if user is validated before loading
       step one the menu, if not return to index.html to login
       
    */ 
    try {
        // check if credentials is registered
        //alert(localStorage.getItem("user"));
        if (localStorage.getItem("user") ===null) {
            //disable menu and return user to index.html
            $("#dropdown-menu-2btn-0").css("display", "none")
           
            //if page is not homepage then navigate to homepage
            if (location.href!="http://presbytery.piwcnorthampton.com") { location.assign("Default.aspx"); }
        }
        $rab.Initialise.Menus();
    } catch (e) {

    }
});
$rab.Login.Credentials = function () {
    this.TempEmailAddress = "temp@piwc.com";
    this.TempPassword = "password123";
    this.Validate = function () {
        try {
            // check entered email address and password
            var isCredentialsValid = false;

            var email = $("#textboxEmail").val();
            var pwd   = $("#textboxPassword").val();
            //pass data to server to validate credentials

            //if validation fails and credentials are temporary
            if (!isCredentialsValid && email == this.TempEmailAddress && pwd == this.TempPassword)
            {
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
            location.assign("Default.aspx");

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
                url: '/Membership.aspx/GetMembers',
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
$rab.Membership.Table = function (jsondata) {

    this.Build = function () {
        try {
            var members = JSON.parse(jsondata);
            $("#tbodyMembers").empty();
            var table = document.getElementById("tbodyMembers");
            for (var i = 0; i < members.length; i++) {
                // add member records 
                var tr = document.createElement("tr");
                var tdFirstName = document.createElement("td");tdFirstName.className="body-item mbr-fonts-style display-7";tdFirstName.innerHTML=members[i].FirstName;
                var tdLastName  = document.createElement("td");tdLastName .className="body-item mbr-fonts-style display-7";tdLastName .innerHTML=members[i].LastName ;
                var tdTelephone = document.createElement("td");tdTelephone.className="body-item mbr-fonts-style display-7";tdTelephone.innerHTML=members[i].Telephone;
                var tdEmail     = document.createElement("td");tdEmail    .className="body-item mbr-fonts-style display-7";   tdEmail.innerHTML =   members[i].Email;
                var tdEdit = document.createElement("td"); tdEdit.className = "body-item mbr-fonts-style display-7";//
                var button = document.createElement("input"); button.type = "button"; button.value = "Edit";
                button.className = "form-control text-center";
                button.onclick=function(){};
                tdEdit.appendChild(button);
                tr.appendChild(tdFirstName);
                tr.appendChild(tdLastName);
                tr.appendChild(tdTelephone);
                tr.appendChild(tdEmail);
                tr.appendChild(tdEdit);
                table.appendChild(tr);
            }

        } catch (e) {
            alert(e.message);
        }
    }
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
$rab.Login = function () {
    this.Validate = function () {
        try {

        } catch (e) {

        }
    }
}